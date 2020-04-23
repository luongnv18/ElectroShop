package electro.entity;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity(name="ChiTietSanPham")
public class ChiTietSanPham {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int IdChiTietSanPham;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="IdSanPham")
	SanPham sanPham;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="IdMau")
	MauSanPham mauSanPham;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="IdSize")
	SizeSanPham sizeSanPham;
	
	int SoLuong;
	LocalDateTime NgayNhap;

	public int getIdChiTietSanPham() {
		return IdChiTietSanPham;
	}
	public void setIdChiTietSanPham(int idChiTietSanPham) {
		IdChiTietSanPham = idChiTietSanPham;
	}
	public SanPham getSanPham() {
		return sanPham;
	}
	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}
	public MauSanPham getMauSanPham() {
		return mauSanPham;
	}
	public void setMauSanPham(MauSanPham mauSanPham) {
		this.mauSanPham = mauSanPham;
	}
	public SizeSanPham getSizeSanPham() {
		return sizeSanPham;
	}
	public void setSizeSanPham(SizeSanPham sizeSanPham) {
		this.sizeSanPham = sizeSanPham;
	}
	public int getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}
	public LocalDateTime getNgayNhap() {
		return NgayNhap;
	}
	public void setNgayNhap(LocalDateTime ngayNhap) {
		NgayNhap = ngayNhap;
	}
	
}
