package edu.thymeleaf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.thymeleaf.model.Diem;
import edu.thymeleaf.repository.DiemRepository;

@Service
public class DiemService {
	@Autowired
	DiemRepository diemRepository;

	public Diem getDiemByMaHSAndMaPC(String maHS, String maPC) {
		return diemRepository.getDiemByMaHSAndMaPC(maHS, maPC);
	}

	public void updateDiem(String maDiem, float diemHe1, float diemHe2, float diemHe3) {
		diemRepository.updateDiem(maDiem, diemHe1, diemHe2, diemHe3);
	}

}
