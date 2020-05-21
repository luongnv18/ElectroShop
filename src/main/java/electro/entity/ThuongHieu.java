package electro.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity(name="ThuongHieu")
public class ThuongHieu {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int IdThuongHieu;
	String TenThuongHieu;
	@OneToMany(mappedBy = "thuongHieu")
	List<SanPham> sanPhams;
	public int getIdThuongHieu() {
		return IdThuongHieu;
	}
	public void setIdThuongHieu(int idThuongHieu) {
		IdThuongHieu = idThuongHieu;
	}
	public String getTenThuongHieu() {
		return TenThuongHieu;
	}
	public void setTenThuongHieu(String tenThuongHieu) {
		TenThuongHieu = tenThuongHieu;
	}

	public ThuongHieu() {
	}

	public ThuongHieu(int idThuongHieu) {
		IdThuongHieu = idThuongHieu;
	}

	public ThuongHieu(int idThuongHieu, String tenThuongHieu) {
		IdThuongHieu = idThuongHieu;
		TenThuongHieu = tenThuongHieu;
	}
}
