package electro.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

@Entity(name="ChiTietHoaDon")
public class ChiTietHoaDon {
	@EmbeddedId
	ChiTietHoaDonId chiTietHoaDonId;
	
	int SoLuong;
	int GiaTien;
	public ChiTietHoaDonId getChiTietHoaDonId() {
		return chiTietHoaDonId;
	}
	public void setChiTietHoaDonId(ChiTietHoaDonId chiTietHoaDonId) {
		this.chiTietHoaDonId = chiTietHoaDonId;
	}
	public int getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}
	public int getGiaTien() {
		return GiaTien;
	}
	public void setGiaTien(int giaTien) {
		GiaTien = giaTien;
	}
	
	
}
@Embeddable
class ChiTietHoaDonId implements Serializable{
	int IdHoaDon;
	int IdChiTietSanPham;
	public int getIdHoaDon() {
		return IdHoaDon;
	}
	public void setIdHoaDon(int idHoaDon) {
		IdHoaDon = idHoaDon;
	}
	public int getIdChiTietSanPham() {
		return IdChiTietSanPham;
	}
	public void setIdChiTietSanPham(int idChiTietSanPham) {
		IdChiTietSanPham = idChiTietSanPham;
	}
	
}
