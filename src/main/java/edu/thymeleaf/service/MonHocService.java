package edu.thymeleaf.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.thymeleaf.repository.MonHocRepository;

@Service
public class MonHocService {
	@Autowired
	private MonHocRepository monHocRepository;
	
	public String getTenByMaMH(String maMH) {
		return monHocRepository.findByMaMH(maMH).getTenMH();
	}

}
