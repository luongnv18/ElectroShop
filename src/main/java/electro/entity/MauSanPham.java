package electro.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="MauSanPham")
public class MauSanPham {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int IdMau;
	String Mau;

	public int getIdMau() {
		return IdMau;
	}
	public void setIdMau(int idMau) {
		IdMau = idMau;
	}
	public String getMau() {
		return Mau;
	}
	public void setMau(String mau) {
		Mau = mau;
	}
	
}
