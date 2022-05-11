package edu.thymeleaf.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.thymeleaf.model.Diem;
import edu.thymeleaf.model.GiaoVien;
import edu.thymeleaf.model.HocSinh;
import edu.thymeleaf.model.PhanCong;
import edu.thymeleaf.service.DiemService;
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
	@Autowired
	private DiemService diemService;
	
	@RequestMapping(value = { "/gvbm/home" })
	public String home(Model model,
			HttpSession session) {
		GiaoVien giaoVien = (GiaoVien) session.getAttribute("userLogin");
		
		int tongHPPT = phanCongService.countTongHPByMaGV(giaoVien.getMaGV());
		int tongHPDangPT = phanCongService.countTongHPDangPTByMaGV(giaoVien.getMaGV());
		int tongMH = phanCongService.countTongMHByMaGV(giaoVien.getMaGV());
		List<Diem> list = diemService.getListNewByMaGV(giaoVien.getMaGV());
		
		model.addAttribute("tongHPPT", tongHPPT);
		model.addAttribute("tongHPDangPT", tongHPDangPT);
		model.addAttribute("tongMH", tongMH);
		model.addAttribute("list", list);
		
		return "gvbm/home";
	}
	
	@RequestMapping(value = { "/gvbm/danhsachday" })
	public String danhSachMonDay(Model model,
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
	
	@RequestMapping(value = { "gvbm/nhapdiem" })
	public String suaDiem(Model model,
		HttpSession session,
		@RequestParam("mapc") String maPC,
		@RequestParam("malh") String maLH,
		@RequestParam("mamh") String maMH) {
		List<HocSinh> list = hocSinhService.listByMaLH(maLH);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setDiemMH(diemService.getDiemByMaHSAndMaPC(list.get(i).getMaHS(), maPC));
			list.get(i).getDiemMH().getDiemHe1();
		}
		
		model.addAttribute("list", list);
		model.addAttribute("maPC", maPC);
		model.addAttribute("maLH", maLH);
		model.addAttribute("maMH", maMH);
		model.addAttribute("tenLH", lopService.getTenLHByMaLH(maLH));
		model.addAttribute("tenMH", monHocService.getTenByMaMH(maMH));

		return "gvbm/input-scores";
	}
	
	@RequestMapping(value = { "gvbm/suadiemhocsinh" }, method = RequestMethod.POST)
	public String suaDiemHocSinh(Model model,
		HttpSession session,
		@RequestParam("mapc") String maPC,
		@RequestParam("malh") String maLH,
		@RequestParam("mamh") String maMH,
		@RequestParam("mahs") String maHS,
		@RequestParam("diemhe1") String diemHe1,
		@RequestParam("diemhe2") String diemHe2,
		@RequestParam("diemhe3") String diemHe3) {
		
		String maDiem = diemService.getDiemByMaHSAndMaPC(maHS, maPC).getMaDiem();
		
		diemService.updateDiem(maDiem, Float.parseFloat(diemHe1), Float.parseFloat(diemHe2), Float.parseFloat(diemHe3));
		
		List<HocSinh> list = hocSinhService.listByMaLH(maLH);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setDiemMH(diemService.getDiemByMaHSAndMaPC(list.get(i).getMaHS(), maPC));
		}
		
		model.addAttribute("list", list);
		model.addAttribute("maPC", maPC);
		model.addAttribute("maLH", maLH);
		model.addAttribute("maMH", maMH);
		model.addAttribute("tenLH", lopService.getTenLHByMaLH(maLH));
		model.addAttribute("tenMH", monHocService.getTenByMaMH(maMH));

		return "gvbm/input-scores";
	}
	
	@RequestMapping(value = { "/gvbm/thongtincanhan" })
	public String thongTin(Model model) {
		
		return "gvbm/info";
	}
	
	@RequestMapping(value = { "/gvbm/danhsachlop/{id}" })
	public String danhSachLop(Model model,
		HttpSession session,
		@PathVariable("id") String maLH) {
		System.out.println(maLH);
		List<HocSinh> list = hocSinhService.listByMaLH(maLH);
		
		model.addAttribute("list", list);
		model.addAttribute("tenLH", lopService.getTenLHByMaLH(maLH));

		return "gvbm/list-student";
	}
	
}
