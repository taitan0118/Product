package poly.com.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
import poly.com.dao.CategoryDAO;
import poly.com.dao.ProductDAO;
import poly.com.entity.Account;
import poly.com.entity.Category;
import poly.com.entity.Product;

@Controller
public class MaNProductController {
	@Autowired
	ProductDAO proDao;

	@Autowired
	CategoryDAO caDao;

	@RequestMapping("/Man-Product/index")
	public String Product_index(Model model, @ModelAttribute("p") Product pro, @ModelAttribute("c") Category ca) {
		pro.setDescribe(null);
		pro.setId(null);
		pro.setImage(null);
		pro.setInventory(null);
		pro.setName(null);
		pro.setPrice(null);
		pro.setSale(null);
		pro.setSex(null);
		ca.setName("Áo");
		pro.setCategory(ca);
		model.addAttribute("product", proDao.findAll());
		model.addAttribute("category", caDao.findAll());
		return "MProduct";
	}
	
	@ModelAttribute("listCate")
	public List<Category> getFaculties(){
		List<Category> cate  = new ArrayList<>();
		cate = caDao.findAll();
		return cate;
	}

	@RequestMapping("/Man-Product/create")
	public String Product_create(Model model,
			@Validated @ModelAttribute("p") Product pro, @ModelAttribute("c") Category ca, BindingResult result) {
		
//		model.addAttribute("category", caDao.findAll());
//		Product product = proDao.findById(id).get();
//		Category cate = new Category();
//		cate.setId(product.getCategory().getId());
//		pro.setCategory(cate);
//		System.out.println("aaa " + pro.getCategory().getId());
//		System.out.println(pro);
//		if (!result.hasErrors()) {
//			if (!proDao.findById(pro.getId()).isEmpty())
//				model.addAttribute("error_category", "Id đã tồn tại!");
//			else {
//				proDao.save(pro);
//				model.addAttribute("success_user", "Create success!");
			System.out.println(pro);
			System.out.println(model);
//			}
//		

		return "MProduct";
	}
//	
//	@PostMapping("/admin/update")
//	public String category_update(Model model, @Validated @ModelAttribute("user") Account acc, BindingResult result) {
//		if(!result.hasErrors()) {
//			if(accDao.findById(acc.getUsername()).isEmpty())
//				model.addAttribute("error_user", "Id không tồn tại!");
//			else {
//				accDao.save(acc);
//				model.addAttribute("success_user", "Update success!");
//			}
//		}
//		admin_index(model, acc);
//		model.addAttribute("account", accDao.findAll());
//		return "MUser";
//	}
//	
//	@PostMapping("/admin/delete")
//	public String category_delete(Model model, @ModelAttribute("user")  Account acc) {
//
//			if(accDao.findById(acc.getUsername()).isEmpty())
//				model.addAttribute("error_user", "Id không tồn tại!");
//			else {
//				accDao.deleteById(acc.getUsername());
//				model.addAttribute("success_user", "Delete success!");
//			}
//			admin_index(model, acc);
//		model.addAttribute("account", accDao.findAll());
//		return "MUser";
//	}

	@GetMapping("/Man-Product/edit")
	public String category_edit(Model model, @RequestParam("id") Integer id, @ModelAttribute("p") Product pro) {
		Product product = proDao.findById(id).get();
		pro.setId(product.getId());
		pro.setImage(product.getImage());
		pro.setDescribe(product.getDescribe());
		pro.setName(product.getName());
		pro.setInventory(product.getInventory());
		pro.setSale(product.getSale());
		pro.setPrice(product.getPrice());
		pro.setSex(product.getSex());
		Category cate = new Category();
		cate.setId(product.getCategory().getId());
		cate.setName(product.getCategory().getName());
		pro.setCategory(cate);

//			System.out.println(""+product.getCategory().getName());
//			System.out.println(""+cate);
		model.addAttribute("product", proDao.findAll());
		model.addAttribute("category", caDao.findAll());
		return "MProduct";
	}
//	@GetMapping("/admin/delete")
//	public String category_delete(Model model, @RequestParam("id") String id, @ModelAttribute("user") Account acc) {
////		if(accDao.findById(acc.getUsername()).isEmpty())
////			return "redirect:/category/index";
////		else {
//			accDao.deleteById(id);
//			model.addAttribute("success_user", "Delete success!");
////		}
//		model.addAttribute("account", accDao.findAll());
//		return "MUser";
//	}
}
