package edu.thymeleaf.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.thymeleaf.model.Diem;
import edu.thymeleaf.repository.DiemRepository;

@Service
public class DiemService {
	@Autowired
	DiemRepository diemRepository;
	
	@Autowired
	@PersistenceContext
	private EntityManager em;

	public Diem getDiemByMaHSAndMaPC(String maHS, String maPC) {
		return diemRepository.getDiemByMaHSAndMaPC(maHS, maPC);
	}

	public void updateDiem(String maDiem, float diemHe1, float diemHe2, float diemHe3) {
		diemRepository.updateDiem(maDiem, diemHe1, diemHe2, diemHe3);
	}

	public List<Diem> getListNewByMaGV(String maGV) {
		return diemRepository.getListNewByMaGV(maGV);
	}
	
	public List<Diem> getAll() {
		List<Diem> list = diemRepository.findAll();
		System.out.println("giaoVienRepository.findAll().Size: "+list.size());
		
		return list;
	}
	
	public List<Diem> getTop3StudentScore(){
		@SuppressWarnings("unchecked")
		List<Diem> list =  em.createNamedStoredProcedureQuery("get_top_3_student_score").getResultList();
		
		return list;
	}
	public List<Diem> getGoodStudent(){
		@SuppressWarnings("unchecked")
		List<Diem> list =  em.createNamedStoredProcedureQuery("get_good_student").getResultList();
		
		return list;
	}
	
//	public void statistic_diemHe1() {
//		@SuppressWarnings("unchecked")
//		List<Object[]> list = em.createNamedStoredProcedureQuery("statistic_diemHe1").getResultList();
//	}

}
