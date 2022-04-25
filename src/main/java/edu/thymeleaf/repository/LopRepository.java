package edu.thymeleaf.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.thymeleaf.model.Lop;

public interface LopRepository extends JpaRepository<Lop, Long> {
	Lop findByMaLH(String maLH);
}
