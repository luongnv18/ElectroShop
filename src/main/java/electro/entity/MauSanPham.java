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
	
	public MauSanPham() {
		
	}
	public MauSanPham(int idMau) {
		IdMau = idMau;
	}
	public MauSanPham(int idMau, String mau) {
		IdMau = idMau;
		Mau = mau;
	}
	
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
