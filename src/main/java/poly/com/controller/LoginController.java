package poly.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.com.dao.AccountDAO;
import poly.com.entity.Account;
import poly.com.service.SessionService;

@Controller
public class LoginController {
	
	@Autowired
	AccountDAO accDao;
	
	@Autowired
	SessionService session;
	
	@GetMapping("/login")
	public String index(@ModelAttribute("account") Account account) {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(Model model, @Validated @ModelAttribute("account") Account account, BindingResult result) {
		if(!result.hasErrors()) {
			Account acc = null;
			try {
				acc = accDao.findById(account.getUsername()).get();
				if(acc.getPassword().equals(account.getPassword())) {
					session.set("user", acc);
					String uri = session.get("security-uri");
					 if(!acc.getAdmin()) {
				            return "redirect:/product/page";
				        }
					if(uri!=null) {
						if(!uri.equals("") && uri.contains("/admin/")) {
							return "redirect:/admin/index";
						}
						return "redirect:/admin/index";
					}
					return "redirect:/admin/index";

				}
				else {
					model.addAttribute("error_loginPass", "Password không đúng!");
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				model.addAttribute("error_loginUsername", "Username không tồn tại!");
			}
			
		}
		System.out.println(model);
		return "login";
		
	}
	@RequestMapping("/sigup")
	public String admin_index(Model model, @ModelAttribute("account") Account acc) {
		return "sigUp";
	}
	@PostMapping("/sigup/create")
	public String category_create(Model model, @Validated @ModelAttribute("account") Account acc, BindingResult result) {
		if(!result.hasErrors()) {
			acc.setPhoto("user.jpg");
			acc.setAdmin(false);
			if(!accDao.findById(acc.getUsername()).isEmpty())
				model.addAttribute("error_category", "Id đã tồn tại!");
			else {
				accDao.save(acc);
				model.addAttribute("success_user", "Create success!");
				return "redirect:/login";
			}
		}
		
		return "redirect:/sigup";
	}
	@GetMapping("/logout")
	public String logoutTT(@ModelAttribute("account") Account account) {
		session.remove("user");
		session.remove("security-uri");
		return "redirect:/product/page";
	}
	@PostMapping("/logout")
	public String logout(@ModelAttribute("account") Account account) {
		session.remove("user");
		session.remove("security-uri");
		return "redirect:/login";
	}
}
