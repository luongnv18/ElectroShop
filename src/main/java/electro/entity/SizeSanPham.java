package electro.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="SizeSanPham")
public class SizeSanPham {
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY )
	int IdSize;
	String Size;

	public SizeSanPham() {
	}
	public SizeSanPham(int idSize) {
		IdSize = idSize;
	}
	public SizeSanPham(int idSize, String size) {
		IdSize = idSize;
		Size = size;
	}
	public int getIdSize() {
		return IdSize;
	}
	public void setIdSize(int idSize) {
		IdSize = idSize;
	}
	public String getSize() {
		return Size;
	}
	public void setSize(String size) {
		Size = size;
	}
	
}
