package edu.thymeleaf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.thymeleaf.model.PhanCong;
import edu.thymeleaf.repository.PhanCongRepository;

@Service
public class PhanCongService {
	@Autowired
	PhanCongRepository phanCongRepository;

	public List<PhanCong> listByMaGV(String maGV) {
		return phanCongRepository.listDanhSachMon(maGV);
	}
	
}
