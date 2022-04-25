package edu.thymeleaf.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.thymeleaf.model.GiaoVien;
import edu.thymeleaf.model.HocSinh;
import edu.thymeleaf.model.PhanCong;
import edu.thymeleaf.service.HocKyService;
import edu.thymeleaf.service.HocSinhService;
import edu.thymeleaf.service.LopService;
import edu.thymeleaf.service.MonHocService;
import edu.thymeleaf.service.PhanCongService;

@Controller
public class SubjectTeacherController {
	@Autowired
	private PhanCongService phanCongService;
	@Autowired
	private LopService lopService;
	@Autowired
	private MonHocService monHocService;
	@Autowired
	private HocKyService hocKyService;
	@Autowired
	private HocSinhService hocSinhService;
	
	@RequestMapping(value = { "/gvbm/danhsachday" })
	public String index(Model model,
		HttpSession session) {
		GiaoVien giaoVien = (GiaoVien) session.getAttribute("userLogin");
		List<PhanCong> list = phanCongService.listByMaGV(giaoVien.getMaGV());
		
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
			list.get(i).setTenLop(lopService.getTenLHByMaLH(list.get(i).getMaLH()));
			list.get(i).setTenMH(monHocService.getTenByMaMH(list.get(i).getMaMH()));
			list.get(i).setTenHK(hocKyService.getTenLHByMaHK(list.get(i).getMaHK()));
		}
		
		model.addAttribute("list", list);

		return "gvbm/list-subject";
	}
	
	@RequestMapping(value = { "/gvbm/danhsachlop/{id}" })
	public String index(Model model,
		HttpSession session,
		@PathVariable("id") String maLH) {
		System.out.println(maLH);
		List<HocSinh> list = hocSinhService.listByMaLH(maLH);
		
		model.addAttribute("list", list);
		model.addAttribute("tenLH", lopService.getTenLHByMaLH(maLH));

		return "gvbm/list-student";
	}
	
}
