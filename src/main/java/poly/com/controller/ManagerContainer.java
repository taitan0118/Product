package poly.com.controller;

import java.util.Optional;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ManagerContainer {
	@RequestMapping("/manager/index")
	public String Manager(Model model) {
		model.addAttribute("view", "manager/MUser.jsp");
		return "manager";
	}
}
