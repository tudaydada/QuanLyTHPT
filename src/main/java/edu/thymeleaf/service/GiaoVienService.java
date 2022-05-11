package edu.thymeleaf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.thymeleaf.model.GiaoVien;
import edu.thymeleaf.repository.GiaoVienRepository;

@Service
public class GiaoVienService {
	@Autowired
	private GiaoVienRepository giaoVienRepository;
	
	public boolean isValidAccount(String email, String matKhau, String role) {
		List<GiaoVien> list;
		
		if ("admin".equals(role) || "gvcn".equals(role)) {	
			list = giaoVienRepository.findByEmailAndMatKhauAndRole(email, matKhau, role);
		} else {
			list = giaoVienRepository.findByEmailAndMatKhau(email, matKhau);
		}
		
		if (list != null && list.size() > 0) {
			return true;
		} else {
			return false;
		}
	}

	public GiaoVien getByEmail(String email) {
		List<GiaoVien> list = giaoVienRepository.findAllByEmail(email);
		
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		
		return null;
	}
	
	public List<GiaoVien> getAll() {
		List<GiaoVien> list = giaoVienRepository.findAll();
		
		return list;
	}
}
