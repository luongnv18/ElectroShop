package electro.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import electro.service.SanPhamService;

@Entity(name="DanhMuc")
public class DanhMuc {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int IdDanhMuc;
	String TenDanhMuc;

	public int getIdDanhMuc() {
		return IdDanhMuc;
	}
	public void setIdDanhMuc(int idDanhMuc) {
		IdDanhMuc = idDanhMuc;
	}
	public String getTenDanhMuc() {
		return TenDanhMuc;
	}
	public void setTenDanhMuc(String tenDanhMuc) {
		TenDanhMuc = tenDanhMuc;
	}
}
