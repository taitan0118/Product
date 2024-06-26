package poly.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.com.dao.OrderDetailDAO;
import poly.com.entity.OrderDetail;

@Controller
public class OderDetailsController {
	
	@Autowired
	OrderDetailDAO ODT_Dao;
	
	@RequestMapping("/OderDetails/index")
	public String category_index(Model model, @ModelAttribute("oderdetails") OrderDetail oderdetail) {
	
		model.addAttribute("oderdetails", ODT_Dao.findAll());
		return "MOderDetails";
	}
}
