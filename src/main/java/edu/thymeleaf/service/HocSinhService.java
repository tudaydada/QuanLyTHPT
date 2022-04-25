package edu.thymeleaf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.thymeleaf.model.HocSinh;
import edu.thymeleaf.repository.HocSinhRepository;

@Service
public class HocSinhService {
	@Autowired
	HocSinhRepository hocSinhRepository;

	public List<HocSinh> listByMaLH(String maLH) {
		return hocSinhRepository.findByMaLH(maLH);
	}

}
