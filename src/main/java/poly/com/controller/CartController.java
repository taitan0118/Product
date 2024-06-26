package poly.com.controller;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpSession;

import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import poly.com.cart.ShoppingCartService;
import poly.com.dao.ProductDAO;
import poly.com.dao.OrderDAO;
import poly.com.dao.OrderDetailDAO;
import poly.com.entity.Account;
import poly.com.entity.Product;
import poly.com.mail.MailerService;
import poly.com.entity.Order;
import poly.com.entity.OrderDetail;
import poly.com.model.MailInfo;
import poly.com.model.SanPham;
import poly.com.service.SessionService;

@Controller

public class CartController {
	@Autowired 
	ShoppingCartService cartService;
	@Autowired 
	ProductDAO proDao;
	@Autowired 
	OrderDetailDAO oderDTdao;
	@Autowired 
	OrderDAO oderDAO;
	@Autowired
	SessionService session;
	@Autowired
	MailerService mailer;
	 
//	@RequestMapping("/")
//	public String index(Model model) {
//		model.addAttribute("products", proDao.findAll());
//		model.addAttribute("sanpham", DB.sanpham.values());
//		model.addAttribute("cart", cartService.getItems());
//		return "SanPham";
//	}
//	
//	@RequestMapping("/sanpham")
//	public String fillSanPham(Model model) {
//		model.addAttribute("sanpham", DB.sanpham.values());
//		model.addAttribute("cart", cartService.getItems());
//		return "SanPham";
//	}
	@RequestMapping("/cart")
	public String cart(Model model) {
//		model.addAttribute("sanpham", DB.product.values());
		model.addAttribute("cart", cartService.getItems());
		model.addAttribute("tongtien", cartService.getAmount());
		return "Cart";
	}
//	@GetMapping("/sanpham/add/{id}")
//	public String add(Model model, @PathVariable("id") Integer id) {
//		boolean ct = false;
//		for(Product item:cartService.getItems()) {
//			if(item.getId() == id) {
//				cartService.update(id, item.getQuantity()+1);
//				ct = true;
//				break;
//			}
//		}
//		if(!ct)
//			cartService.add(id);
//		model.addAttribute("sanpham", DB.product.values());
//		model.addAttribute("cart", cartService.getItems());
//		model.addAttribute("tongtien", cartService.getAmount());
//		return "SanPham";
//	}
	
	@GetMapping("/cart/update")
	public String update(Model model, @RequestParam("id") Integer id, @RequestParam("sl") int sl) {
		cartService.update(id, sl);
		model.addAttribute("cart", cartService.getItems());
		model.addAttribute("tongtien", cartService.getAmount());
		return "Cart";
	}
	
	@GetMapping("/cart/remove/{id}")
	public String remove(Model model, @PathVariable("id") Integer id) {
		cartService.remove(id);
		model.addAttribute("cart", cartService.getItems());
		model.addAttribute("tongtien", cartService.getAmount());
		return "Cart";
	}
	
	@GetMapping("/cart/clear")
	public String clear(Model model) {
		cartService.clear();
		model.addAttribute("cart", cartService.getItems());
		model.addAttribute("tongtien", cartService.getAmount());
		return "Cart";
	}
	@PostMapping("/cart/paynow")
	public String oder_create(Model model, @Validated
			@ModelAttribute("order") Order oder,
			OrderDetail oderDT,@ModelAttribute("acc") Account acc,
			BindingResult result) {
		Account user = (Account) session.get("user");
		acc.setEmail(user.getEmail());
		acc.setUsername(user.getUsername());
		oder.setAccount(acc);
//		oderDAO.save(oder);
		Order oo = new Order();
		oo.setId(oder.getId());
		
		NumberFormat curyFormat = NumberFormat.getCurrencyInstance(new Locale("vi","VN"));
		MailInfo mail = new MailInfo();
		mail.setFrom("nguyentantai0118@gmail.com");
		mail.setTo(user.getEmail());
		mail.setSubject("Đơn hàng đã được thanh toán thành công!");
		mail.setBody("Cảm ơn "+ user.getFullname()+" Đã đặt đơn hàng:");
		
		Collection<Product> ids = cartService.getItems();
		Product pr = new Product();
		for(Product pro : ids) {
			oderDT = new OrderDetail();
			oderDT.setOrder(oo);
			pr.setId(pro.getId());
			oderDT.setProduct(pr);
			oderDT.setPrice(pro.getSale() * pro.getQuantity());
			oderDT.setQuantity(pro.getQuantity());
//			oderDTdao.save(oderDT);
			System.out.println(oderDT);
			
			String productInfo = "<p>"+"- " + pro.getQuantity() +" "+ pro.getName()+" "+curyFormat.format(oderDT.getPrice())+"</p>" ;
			mail.setBody(mail.getBody() + productInfo);
		}
		
		try {
			mailer.send(mail);
			System.out.println(mail);
		} catch (MessagingException e) {
			// TODO: handle exception
		}
		
		return "Cart";
	}
}
