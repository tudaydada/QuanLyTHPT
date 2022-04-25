package edu.thymeleaf.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.thymeleaf.model.GiaoVien;

@Repository
public interface GiaoVienRepository extends JpaRepository<GiaoVien, Long> {
    List<GiaoVien> findByEmailAndMatKhau(String email, String matKhau);

	List<GiaoVien> findByEmailAndMatKhauAndRole(String email, String matKhau, String role);

	List<GiaoVien> findAllByMaGV(String maGV);

	List<GiaoVien> findAllByEmail(String email);
}