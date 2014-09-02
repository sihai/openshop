package com.openteach.openshop.server.biz;

import java.security.interfaces.RSAPublicKey;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Component;

import com.openteach.openshop.server.api.security.RSAUtils;

/**
 * 
 * @author sihai
 *
 */
@Component("securityBO")
public class SecurityBO extends BaseBO {
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	public Map<String, String> allocPublicKey(HttpServletRequest request) {
		RSAPublicKey publicKey = RSAUtils.generateKey(request);
		Map<String, String> data = new HashMap<String, String>();
		data.put("modulus", Base64.encodeBase64String(publicKey.getModulus().toByteArray()));
		data.put("exponent", Base64.encodeBase64String(publicKey.getPublicExponent().toByteArray()));
		return data;
	}
}
