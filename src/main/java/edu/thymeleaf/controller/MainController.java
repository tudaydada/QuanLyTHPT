package edu.thymeleaf.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.thymeleaf.model.GiaoVien;
import edu.thymeleaf.service.GiaoVienService;

@Controller
public class MainController {
	@Autowired
	private GiaoVienService giaoVienService;
	@Autowired
	private SubjectTeacherController subjectTeacherController;
	@Autowired
	private AdminController adminController;
	
	@RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("giaoVien", new GiaoVien());
		
		model.addAttribute("message", "");

		return "index";
	}
	
	@RequestMapping(value = { "/login" }, method = RequestMethod.POST)
	public String login(Model model, 
			@ModelAttribute("giaoVien")  GiaoVien giaoVien,
			HttpSession session) {
		
		if (giaoVienService.isValidAccount(giaoVien.getEmail(), giaoVien.getMatKhau(), giaoVien.getRole())) {
			session.setAttribute("userLogin", giaoVienService.getByEmail(giaoVien.getEmail()));
			model.addAttribute("message", "Thông tin đăng nhập không chính xác!");
			
			if ("".equalsIgnoreCase(giaoVien.getRole())) {	
				return subjectTeacherController.home(model, session);
			} else if ("".equalsIgnoreCase(giaoVien.getRole())) {
				return "gvcn/home";
			} else {
				return adminController.home(model, session);
			}	
		} else {
			model.addAttribute("message", "Thông tin đăng nhập không chính xác!");
			
			return "index";
		}

	}
	
	@RequestMapping(value = { "/logout" })
	public String logout(Model model,
			HttpSession session) {
		session.removeAttribute("userLogin");
		
		model.addAttribute("giaoVien", new GiaoVien());
		
		return "index";
	}

}
