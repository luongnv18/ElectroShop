package electro.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;


@Entity(name="DanhMuc")
public class DanhMuc {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int IdDanhMuc;
	String TenDanhMuc;
	@OneToMany(mappedBy = "danhMuc")
	List<SanPham> sanPhams;
	public DanhMuc() {
	}
	public DanhMuc(int idDanhMuc) {
		IdDanhMuc = idDanhMuc;
	}
	public DanhMuc(int idDanhMuc, String tenDanhMuc) {
		IdDanhMuc = idDanhMuc;
		TenDanhMuc = tenDanhMuc;
	}
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
