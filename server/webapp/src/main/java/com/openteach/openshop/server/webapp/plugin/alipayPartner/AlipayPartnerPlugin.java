/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.webapp.plugin.alipayPartner;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.springframework.stereotype.Component;

import com.openteach.openshop.server.biz.Setting;
import com.openteach.openshop.server.biz.entity.Order;
import com.openteach.openshop.server.biz.entity.Payment;
import com.openteach.openshop.server.biz.entity.PluginConfig;
import com.openteach.openshop.server.biz.plugin.PaymentPlugin;
import com.openteach.openshop.server.biz.util.SettingUtils;

/**
 * Plugin - 支付宝(担保交易)
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Component("alipayPartnerPlugin")
public class AlipayPartnerPlugin extends PaymentPlugin {

	private static Log logger = LogFactory.getLog(AlipayPartnerPlugin.class);
	
	@Override
	public String getName() {
		return "支付宝(担保交易)";
	}

	@Override
	public String getVersion() {
		return "1.0";
	}

	@Override
	public String getAuthor() {
		return "aigechibaole";
	}

	@Override
	public String getSiteUrl() {
		return "http://www.aigechibaole.com";
	}

	@Override
	public String getInstallUrl() {
		return "alipay_partner/install.jhtml";
	}

	@Override
	public String getUninstallUrl() {
		return "alipay_partner/uninstall.jhtml";
	}

	@Override
	public String getSettingUrl() {
		return "alipay_partner/setting.jhtml";
	}

	@Override
	public String getRequestUrl() {
		return "https://mapi.alipay.com/gateway.do";
	}

	@Override
	public RequestMethod getRequestMethod() {
		return RequestMethod.get;
	}

	@Override
	public String getRequestCharset() {
		return "UTF-8";
	}

	@Override
	public Map<String, Object> getParameterMap(String sn, String description, HttpServletRequest request) {
		Setting setting = SettingUtils.get();
		PluginConfig pluginConfig = getPluginConfig();
		Payment payment = getPayment(sn);
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("service", "create_partner_trade_by_buyer");
		parameterMap.put("partner", pluginConfig.getAttribute("partner"));
		parameterMap.put("_input_charset", "utf-8");
		parameterMap.put("sign_type", "MD5");
		parameterMap.put("return_url", getNotifyUrl(sn, NotifyMethod.sync));
		parameterMap.put("notify_url", getNotifyUrl(sn, NotifyMethod.async));
		parameterMap.put("out_trade_no", sn);
		parameterMap.put("subject", StringUtils.abbreviate(description.replaceAll("[^0-9a-zA-Z\\u4e00-\\u9fa5 ]", ""), 60));
		parameterMap.put("body", StringUtils.abbreviate(description.replaceAll("[^0-9a-zA-Z\\u4e00-\\u9fa5 ]", ""), 600));
		parameterMap.put("payment_type", "1");
		parameterMap.put("logistics_type", "EXPRESS");
		parameterMap.put("logistics_fee", "0");
		parameterMap.put("logistics_payment", "SELLER_PAY");
		parameterMap.put("price", payment.getAmount().setScale(2).toString());
		parameterMap.put("quantity", "1");
		parameterMap.put("seller_id", pluginConfig.getAttribute("partner"));
		parameterMap.put("total_fee", payment.getAmount().setScale(2).toString());
		parameterMap.put("show_url", setting.getSiteUrl());
		parameterMap.put("paymethod", "directPay");
		parameterMap.put("exter_invoke_ip", request.getLocalAddr());
		parameterMap.put("extra_common_param", "aigechibaole");
		parameterMap.put("sign", generateSign(parameterMap));
		return parameterMap;
	}
	
	public boolean confirmReceived(Order order, Payment payment) {
		String result = get(getRequestUrl(), getConfirmReceived(order, payment));
		logger.error("alipay return:" + result);
		try {
			Document doc = DocumentHelper.parseText(result);
			return StringUtils.equals("T", doc.getRootElement().element("is_success").getText());
		} catch (DocumentException e) {
			return false;
		}
	}
	
	public Map<String, Object> getConfirmReceived(Order order, Payment payment) {
		PluginConfig pluginConfig = getPluginConfig();
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("service", "send_goods_confirm_by_platform");
		parameterMap.put("partner", pluginConfig.getAttribute("partner"));
		parameterMap.put("_input_charset", "utf-8");
		parameterMap.put("sign_type", "MD5");
		parameterMap.put("trade_no", payment.getTradeNo());
		parameterMap.put("logistics_name", /*order.getShippings().iterator().next().getDeliveryCorpCode()*/"ZJS");
		parameterMap.put("sign", generateSign(parameterMap));
		return parameterMap;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean verifyNotify(String sn, NotifyMethod notifyMethod, HttpServletRequest request) {
		PluginConfig pluginConfig = getPluginConfig();
		Payment payment = getPayment(sn);
		if (generateSign(request.getParameterMap()).equals(request.getParameter("sign")) && pluginConfig.getAttribute("partner").equals(request.getParameter("seller_id")) && sn.equals(request.getParameter("out_trade_no")) && ("WAIT_SELLER_SEND_GOODS".equals(request.getParameter("trade_status")) || "TRADE_FINISHED".equals(request.getParameter("trade_status")))
				&& payment.getAmount().compareTo(new BigDecimal(request.getParameter("total_fee"))) == 0) {
			Map<String, Object> parameterMap = new HashMap<String, Object>();
			parameterMap.put("service", "notify_verify");
			parameterMap.put("partner", pluginConfig.getAttribute("partner"));
			parameterMap.put("notify_id", request.getParameter("notify_id"));
			if ("true".equals(post("https://mapi.alipay.com/gateway.do", parameterMap))) {
				return true;
			}
		}
		return false;
	}

	@Override
	public String getNotifyMessage(String sn, NotifyMethod notifyMethod, HttpServletRequest request) {
		if (notifyMethod == NotifyMethod.async) {
			return "success";
		}
		return null;
	}

	@Override
	public Integer getTimeout() {
		return 21600;
	}

	/**
	 * 生成签名
	 * 
	 * @param parameterMap
	 *            参数
	 * @return 签名
	 */
	private String generateSign(Map<String, ?> parameterMap) {
		PluginConfig pluginConfig = getPluginConfig();
		return DigestUtils.md5Hex(joinKeyValue(new TreeMap<String, Object>(parameterMap), null, pluginConfig.getAttribute("key"), "&", true, "sign_type", "sign"));
	}

}