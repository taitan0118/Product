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
import org.springframework.web.bind.annotation.RequestParam;

import poly.com.dao.AccountDAO;
import poly.com.entity.Account;
import poly.com.entity.Category;

@Controller
public class UserController {

	@Autowired
	AccountDAO accDao;
	
	@RequestMapping("/admin/index")
	public String admin_index(Model model, @ModelAttribute("user") Account acc) {
		acc.setAdmin(null);
		acc.setEmail(null);
		acc.setFullname(null);
		acc.setPassword(null);
		acc.setUsername(null);
		model.addAttribute("account", accDao.findAll());
		return "MUser";
	}
	@PostMapping("/admin/create")
	public String category_create(Model model, @Validated @ModelAttribute("user") Account acc, BindingResult result) {
		if(!result.hasErrors()) {
			if(!accDao.findById(acc.getUsername()).isEmpty())
				model.addAttribute("error_category", "Id đã tồn tại!");
			else {
				if(acc.getPhoto().equals("")||acc.getPhoto().isEmpty()) {
					acc.setPhoto("user.jpg");	
				}
				accDao.save(acc);
				model.addAttribute("success_user", "Create success!");
			}
		}
		admin_index(model, acc);
		model.addAttribute("account", accDao.findAll());
		return "MUser";
	}
	
	@PostMapping("/admin/update")
	public String category_update(Model model, @Validated @ModelAttribute("user") Account acc, BindingResult result) {
		if(!result.hasErrors()) {
			if(accDao.findById(acc.getUsername()).isEmpty())
				model.addAttribute("error_user", "Id không tồn tại!");
			else {
				accDao.save(acc);
				model.addAttribute("success_user", "Update success!");
			}
		}
		admin_index(model, acc);
		model.addAttribute("account", accDao.findAll());
		return "MUser";
	}
	
	@PostMapping("/admin/delete")
	public String category_delete(Model model, @ModelAttribute("user")  Account acc) {

			if(accDao.findById(acc.getUsername()).isEmpty())
				model.addAttribute("error_user", "Id không tồn tại!");
			else {
				accDao.deleteById(acc.getUsername());
				model.addAttribute("success_user", "Delete success!");
			}
			admin_index(model, acc);
		model.addAttribute("account", accDao.findAll());
		return "MUser";
	}
	
	@GetMapping("/admin/edit")
	public String category_edit(Model model, @RequestParam("id") String id, @ModelAttribute("user") Account acc) {
//		if(accDao.findById(acc.getUsername()).isEmpty()) {
//			return "redirect:/admin/index";}
//		else {
			Account account = accDao.findById(id).get();
			acc.setUsername(account.getUsername());
			acc.setAdmin(account.getAdmin());
			acc.setPassword(account.getPassword());
			acc.setPhoto(account.getPhoto());
			acc.setEmail(account.getEmail());
			acc.setFullname(account.getFullname());

//		}
		
		model.addAttribute("account", accDao.findAll());
		return "MUser";
	}
	@GetMapping("/admin/delete")
	public String category_delete(Model model, @RequestParam("id") String id, @ModelAttribute("user") Account acc) {
//		if(accDao.findById(acc.getUsername()).isEmpty())
//			return "redirect:/category/index";
//		else {
			accDao.deleteById(id);
			model.addAttribute("success_user", "Delete success!");
//		}
		model.addAttribute("account", accDao.findAll());
		return "MUser";
	}
}
