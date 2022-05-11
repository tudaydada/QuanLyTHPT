package edu.thymeleaf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.thymeleaf.model.Lop;
import edu.thymeleaf.repository.LopRepository;

@Service
public class LopService {
	@Autowired
	private LopRepository lopRepository;

	public String getTenLHByMaLH(String maLH) {
		return lopRepository.findByMaLH(maLH).getTenLH();
	}
	
	public List<Lop> getAll() {
		List<Lop> list = lopRepository.findAll();
		
		return list;
	}
	
}
