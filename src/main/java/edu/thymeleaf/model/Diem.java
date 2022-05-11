package edu.thymeleaf.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.Table;

@Entity
@Table(name = "diem")
@IdClass(Diem.class)
@NamedStoredProcedureQuery(name = "get_top_3_student_score",procedureName = "get_top_3_student_score",resultClasses = Diem.class)
@NamedStoredProcedureQuery(name = "get_good_student",procedureName = "get_good_student",resultClasses = Diem.class)
@NamedStoredProcedureQuery(name = "statistic_diemHe1",procedureName = "statistic_diemHe1")

public class Diem implements Serializable {
	@Id
	@Column(name = "madiem")
	private String maDiem;
	
	@Column(name = "mahs")
	private String maHS;
	
	@Column(name = "mapc")
	private String maPC;
	
	@Column(name = "diemhe1")
	private float diemHe1;
	
	@Column(name = "diemhe2")
	private float diemHe2;
	
	@Column(name = "diemhe3")
	private float diemHe3;
	
	@Column(name = "ghichu")
	private String ghiChu;

	public Diem(String maHS, String maPC, float diemHe1, float diemHe2, float diemHe3, String ghiChu) {
		super();
		this.maHS = maHS;
		this.maPC = maPC;
		this.diemHe1 = diemHe1;
		this.diemHe2 = diemHe2;
		this.diemHe3 = diemHe3;
		this.ghiChu = ghiChu;
	}

	public Diem() {
		super();
	}

	public String getMaDiem() {
		return maDiem;
	}

	public void setMaDiem(String maDiem) {
		this.maDiem = maDiem;
	}

	public String getMaHS() {
		return maHS;
	}

	public void setMaHS(String maHS) {
		this.maHS = maHS;
	}

	public String getMaPC() {
		return maPC;
	}

	public void setMaPC(String maPC) {
		this.maPC = maPC;
	}

	public float getDiemHe1() {
		return diemHe1;
	}

	public void setDiemHe1(float diemHe1) {
		this.diemHe1 = diemHe1;
	}

	public float getDiemHe2() {
		return diemHe2;
	}

	public void setDiemHe2(float diemHe2) {
		this.diemHe2 = diemHe2;
	}

	public float getDiemHe3() {
		return diemHe3;
	}

	public void setDiemHe3(float diemHe3) {
		this.diemHe3 = diemHe3;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
	
}
