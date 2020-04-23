package electro.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="ThuongHieu")
public class ThuongHieu {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int IdThuongHieu;
	String TenThuongHieu;

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
}
