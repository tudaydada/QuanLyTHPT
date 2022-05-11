package edu.thymeleaf.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.thymeleaf.model.Diem;
import edu.thymeleaf.model.GiaoVien;
import edu.thymeleaf.model.HocSinh;
import edu.thymeleaf.model.Lop;
import edu.thymeleaf.model.PhanCong;
import edu.thymeleaf.service.DiemService;
import edu.thymeleaf.service.GiaoVienService;
import edu.thymeleaf.service.HocKyService;
import edu.thymeleaf.service.HocSinhService;
import edu.thymeleaf.service.LopService;
import edu.thymeleaf.service.MonHocService;
import edu.thymeleaf.service.PhanCongService;

@Controller
public class AdminController {
	@Autowired
	private PhanCongService phanCongService;
	@Autowired
	private LopService lopService;
	@Autowired
	private MonHocService monHocService;
	@Autowired
	private GiaoVienService giaoVienService;
	@Autowired
	private HocKyService hocKyService;
	@Autowired
	private HocSinhService hocSinhService;
	@Autowired
	private DiemService diemService;
	
	@RequestMapping(value = { "/admin/home" })
	public String home(Model model, HttpSession session) {
		List<GiaoVien> dsGV = giaoVienService.getAll();
		List<HocSinh> dsHS = hocSinhService.getAll();
		List<Lop> dsL = lopService.getAll();
		List<PhanCong> dsPC = phanCongService.getAll();
		List<Diem> dsD = diemService.getAll();
		List<Diem> dsDT3 = diemService.getTop3StudentScore();
		List<Diem> dsHSG = diemService.getGoodStudent();
//		diemService.statistic_diemHe1();
		
		model.addAttribute("dsGV", dsGV);
		model.addAttribute("dsHS", dsHS);
		model.addAttribute("dsL", dsL);
		model.addAttribute("dsPC", dsPC);
		model.addAttribute("dsD", dsD);
		model.addAttribute("dsDT3", dsDT3);
		model.addAttribute("dsHSG", dsHSG);
		

		return "admin/home";
	}

}
