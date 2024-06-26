package poly.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import poly.com.dao.ProductDAO;

@Controller
public class ReportController {
	
	@Autowired
	ProductDAO proDao;
	
	@GetMapping("/MaN/report")
	public String report(Model model) {
		model.addAttribute("items", proDao.getInventoryByCategory());
		return "MProduct";
	}
}
