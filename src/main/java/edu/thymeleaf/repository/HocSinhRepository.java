package edu.thymeleaf.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.thymeleaf.model.HocSinh;

public interface HocSinhRepository extends JpaRepository<HocSinh, Long> {
	List<HocSinh> findByMaLH(String maLH);
}
