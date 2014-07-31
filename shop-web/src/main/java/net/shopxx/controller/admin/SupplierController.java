/**
 * 
 */
package net.shopxx.controller.admin;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import net.shopxx.Filter;
import net.shopxx.Message;
import net.shopxx.Pageable;
import net.shopxx.entity.Order.OrderStatus;
import net.shopxx.entity.Order.PaymentStatus;
import net.shopxx.entity.Order.ShippingStatus;
import net.shopxx.entity.OrderItem;
import net.shopxx.entity.OrderItem.PlatformPaymentStatus;
import net.shopxx.entity.PlatformPayment;
import net.shopxx.entity.Supplier;
import net.shopxx.entity.Supplier.Level;
import net.shopxx.service.AdminService;
import net.shopxx.service.MessageService;
import net.shopxx.service.OrderItemService;
import net.shopxx.service.PlatformPaymentService;
import net.shopxx.service.ProductService;
import net.shopxx.service.RoleService;
import net.shopxx.service.SupplierService;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 供应商
 * @author sihai
 *
 */
@Controller("adminSupplierController")
@RequestMapping("/admin/supplier")
public class SupplierController extends BaseController {

	@Resource(name="supplierService")
	private SupplierService supplierService;
	@Resource(name = "roleServiceImpl")
	private RoleService roleService;
	@Resource(name = "orderItemServiceImpl")
	private OrderItemService orderItemService;
	@Resource(name = "adminServiceImpl")
	private AdminService adminService;
	@Resource(name = "platformPaymentService")
	private PlatformPaymentService platformPaymentService;
	@Resource(name = "productServiceImpl")
	private ProductService productService;
	@Resource(name = "messageServiceImpl")
	private MessageService messageService;
	
	/**
	 * 检查供应商是否存在
	 */
	@RequestMapping(value = "/check_supplier_name", method = RequestMethod.GET)
	public @ResponseBody
	boolean checkUsername(String name) {
		if (StringUtils.isEmpty(name)) {
			return false;
		}
		if (supplierService.isNameExists(name)) {
			return false;
		} else {
			return true;
		}
	}
	
	/**
	 * 添加
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		model.addAttribute("levels", Level.values());
		return "/admin/supplier/add";
	}
	
	/**
	 * 编辑
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		model.addAttribute("supplier", supplierService.find(id));
		model.addAttribute("levels", Level.values());
		return "/admin/supplier/edit";
	}
	
	/**
	 * 列表
	 * 
	 * @param pageable
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, ModelMap model) {
		model.addAttribute("page", supplierService.findPage(pageable));
		return "/admin/supplier/list";
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Long id, ModelMap model) {
		Supplier supplier = supplierService.find(id);
		model.addAttribute("supplier", supplier);
		model.addAttribute("waitingShippingOrderCount", orderItemService.waitingShippingCount(supplier));
		model.addAttribute("waitingPlatformPaymentOrderCount", orderItemService.waitingPlatformPaymentOrderCount(supplierService.getCurrent()));
		model.addAttribute("marketableProductCount", productService.count(supplier, null, true, null, null, false, null, null));
		model.addAttribute("notMarketableProductCount", productService.count(supplier, null, false, null, null, false, null, null));
		model.addAttribute("stockAlertProductCount", productService.count(supplier, null, null, null, null, false, null, true));
		model.addAttribute("outOfStockProductCount", productService.count(supplier, null, null, null, null, false, true, null));
		model.addAttribute("unreadMessageCount", messageService.count(null, false));
		model.addAttribute("platformPaymentCount", platformPaymentService.count(new Filter[] {new Filter("supplier", Filter.Operator.eq, supplier)}));
		model.addAttribute("income", platformPaymentService.income(supplier));
		model.addAttribute("rebate", platformPaymentService.rebate(supplier));
		return "/admin/supplier/view";
	}
	
	/**
	 * 保存
	 * 
	 * @param supplier
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(Supplier supplier, RedirectAttributes redirectAttributes) {
		// TODO
		if (supplierService.isNameExists(supplier.getName())) {
			return ERROR_VIEW;
		}
		supplier.setIsEnabled(true);
		supplier.setIsLocked(false);
		supplier.setLoginFailureCount(0);
		if (!isValid(supplier)) {
			return ERROR_VIEW;
		}
		supplier.setPassword(DigestUtils.md5Hex(supplier.getPassword()));
		supplierService.save(supplier);
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}
	
	/**
	 * 更新
	 * 
	 * @param supplier
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Supplier supplier, RedirectAttributes redirectAttributes) {
		if (!isValid(supplier)) {
			return ERROR_VIEW;
		}
		
		Supplier old = supplierService.find(supplier.getId());
		if (null == old) {
			return ERROR_VIEW;
		}
		if (StringUtils.isNotEmpty(supplier.getPassword())) {
			supplier.setPassword(DigestUtils.md5Hex(supplier.getPassword()));
		} else {
			supplier.setPassword(old.getPassword());
		}
		if (old.getIsLocked() && !supplier.getIsLocked()) {
			supplier.setLoginFailureCount(0);
			supplier.setLockedDate(null);
		} else {
			supplier.setIsLocked(old.getIsLocked());
			supplier.setLoginFailureCount(old.getLoginFailureCount());
			supplier.setLockedDate(old.getLockedDate());
		}
		
		// TODO
		supplierService.update(supplier, "loginDate", "loginIp", "roles", "products", "orderItems");
		addFlashMessage(redirectAttributes, SUCCESS_MESSAGE);
		return "redirect:list.jhtml";
	}
	
	/**
	 * 删除
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody
	Message delete(Long[] ids) {
		supplierService.delete(ids);
		return SUCCESS_MESSAGE;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value = "/ship_list", method = RequestMethod.GET)
	public String shipList(Long supplierId, PlatformPaymentStatus platformPaymentStatus, ShippingStatus itemShippingStatus, Pageable pageable, ModelMap model) {
		model.addAttribute("platformPaymentStatus", platformPaymentStatus);
		model.addAttribute("itemShippingStatus", itemShippingStatus);
		model.addAttribute("page", orderItemService.findOrderBySupplier(supplierService.find(supplierId), null, new PaymentStatus[] {PaymentStatus.paid}, null, false, null == platformPaymentStatus ? null : new PlatformPaymentStatus[] {platformPaymentStatus}, null == itemShippingStatus ? null : new ShippingStatus[] {itemShippingStatus}, pageable));
		return "/admin/supplier/shipList";
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value = "/bill", method = RequestMethod.GET)
	public String bill(Long[] orderItemIds, Long supplierId, ModelMap model) {
		if(null == supplierId) {
			throw new IllegalArgumentException("supplierId must not be null");
		}
		List<OrderItem> itemList = null;
		Supplier supplier = supplierService.find(supplierId);
		if(null != orderItemIds) {
			itemList = orderItemService.findList(orderItemIds);
			for(OrderItem item : itemList) {
				if(!item.getSupplier().getId().equals(supplierId)) {
					throw new IllegalArgumentException("all order item must be one supplier");
				}
			}
		} else {
			itemList = orderItemService.findOrderBySupplier(supplier, new OrderStatus[] {OrderStatus.completed}, new PaymentStatus[] {PaymentStatus.paid}, null, false, new PlatformPaymentStatus[] {PlatformPaymentStatus.unpaid}, new ShippingStatus[] {ShippingStatus.shipped});
		}
		model.addAttribute("orderItemIds", orderItemIds);
		model.addAttribute("supplier", supplier);
		model.addAttribute("itemList", itemList);
		
		BigDecimal income = new BigDecimal(0);
		BigDecimal rebate = new BigDecimal(0);
		BigDecimal postage = new BigDecimal(0);
		BigDecimal pay = new BigDecimal(0);
		BigDecimal finalIncome = null;
		BigDecimal finalPay = null;
		
		BigDecimal tmp = null;
		for(OrderItem item : itemList) {
			tmp = item.getPrice().multiply(new BigDecimal(item.getQuantity()));
			income = income.add(tmp);
			rebate = rebate.add(item.getRebate());
			//postage += item.get
			pay = pay.add(tmp.subtract(item.getRebate()));
		}
		finalPay = pay.add(postage);
		finalIncome = income.subtract(finalPay);
		
		model.addAttribute("income", income);
		model.addAttribute("rebate", rebate);
		model.addAttribute("postage", postage);
		model.addAttribute("pay", pay);
		model.addAttribute("finalIncome", finalIncome);
		model.addAttribute("finalPay", finalPay);
		
		return "/admin/supplier/bill";
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public String checkout(Long supplierId, Long[] orderItemIds, PlatformPayment platformPayment) {
		// TODO
		platformPayment.setOperator(adminService.getCurrent());
		orderItemService.checkout(supplierService.find(supplierId), orderItemIds, platformPayment);
		return "redirect:bill.jhtml?supplierId=" + supplierId;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value = "/payment_list", method = RequestMethod.GET)
	public String paymentList(Long supplierId, Pageable pageable, ModelMap model) {
		// TODO
		model.addAttribute("page", supplierId);
		model.addAttribute("page", platformPaymentService.findPage(supplierService.find(supplierId), pageable));
		return "/admin/supplier/paymentList";
	}
}
