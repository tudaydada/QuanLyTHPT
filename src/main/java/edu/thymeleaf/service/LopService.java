package edu.thymeleaf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.thymeleaf.repository.LopRepository;

@Service
public class LopService {
	@Autowired
	private LopRepository lopRepository;

	public String getTenLHByMaLH(String maLH) {
		return lopRepository.findByMaLH(maLH).getTenLH();
	}
	
}
