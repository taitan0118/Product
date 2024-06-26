package poly.com.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.com.cart.ShoppingCartService;
import poly.com.dao.CategoryDAO;
import poly.com.dao.ProductDAO;
import poly.com.entity.Product;
import poly.com.service.SessionService;

@Controller
public class ProductsController {
	
	@Autowired
	SessionService session;
	@Autowired
	ShoppingCartService cartService;
	
	@Autowired 
	ProductDAO proDao;
	
	@Autowired
	CategoryDAO cateDAO;
	

	
	@GetMapping("/product/add/{id}")
	public String add(Model model, @PathVariable("id") Integer id, @RequestParam("p") Optional<Integer> p) {
		boolean ct = false;
		Product pr = null ;
		List<Product> lsPro = proDao.findAll();
		for (Product product : lsPro) {
			if(product.getId() == id) {
				pr = product;
				pr.setQuantity(1);
			}
		}
		for(Product item: cartService.getItems()) {
			if(item.getId() == id) {
				cartService.update(id, item.getQuantity()+1);
				ct = true;
				break;
			}
		
		}
		if(!ct)
		
			cartService.add(pr);
		Pageable page = PageRequest.of(p.orElse(0), 8);
		model.addAttribute("products", proDao.findAll(page));
////		model.addAttribute("products", DB.product.values());
		model.addAttribute("cart", cartService.getItems());
		model.addAttribute("tongtien", cartService.getAmount());
		return "SanPham";
	}
	
	@RequestMapping("/product/page")
	public String searchPage_index(Model model,@RequestParam("nam") Optional<Boolean> nam,@RequestParam("nu") Optional<Boolean> nu, @RequestParam("name") Optional<String> name,
			@RequestParam("a") Optional<Double> a, @RequestParam("a2") Optional<Double> a2 ,@RequestParam("p") Optional<Integer> p) {
//		findALL
		Pageable page = PageRequest.of(p.orElse(0), 8);
		model.addAttribute("products", proDao.findAll(page));
		
//		findName
		if(name.isPresent()) {
			String na = name.orElse(session.get("name"));
			model.addAttribute("products", proDao.findAllByNameLike("%"+na+"%", PageRequest.of(p.orElse(0),8)));	
			System.out.println("vck");
			model.addAttribute("name", name.orElse(na));
		}
		
		
//		findGender
		if(nam.isPresent()) {
			model.addAttribute("products", proDao.findAllBySex(Boolean.TRUE, PageRequest.of(p.orElse(0),8)));
			model.addAttribute("nam", nam.orElse(false));
		}
		if(nu.isPresent()) {
			model.addAttribute("products", proDao.findAllBySex(Boolean.FALSE, PageRequest.of(p.orElse(0),8)));
			model.addAttribute("nu", nu.orElse(false));
			
		}
		
//		findPrice
		if(a.isPresent()) {
			model.addAttribute("products",proDao.findBySaleBetween(a.get(), a2.get(),PageRequest.of(p.orElse(0),8)));
			model.addAttribute("a", a.get());
			model.addAttribute("a2", a2.get());
		}
		return "SanPham";
	}

}
