package electro.entity;

import java.time.LocalDateTime;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;


@Entity(name="KhuyenMai")
public class KhuyenMai {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int IdKhuyenMai;
	String TenKhuyenMai;
	LocalDateTime ThoiGianBD;
	LocalDateTime ThoiGianKT;
	String MoTa;
	String HinhKM;
	int GiamGia;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name="ChiTietKhuyenMai",
			joinColumns = {@JoinColumn(name="IdKhuyenMai",referencedColumnName = "IdKhuyenMai")},
			inverseJoinColumns = {@JoinColumn(name="IdSanPham",referencedColumnName = "IdSanPham")})
	Set<SanPham> lstSanPham;
	
	public Set<SanPham> getLstSanPham() {
		return lstSanPham;
	}
	public void setLstSanPham(Set<SanPham> lstSanPham) {
		this.lstSanPham = lstSanPham;
	}

	public int getIdKhuyenMai() {
		return IdKhuyenMai;
	}
	public void setIdKhuyenMai(int idKhuyenMai) {
		IdKhuyenMai = idKhuyenMai;
	}
	public String getTenKhuyenMai() {
		return TenKhuyenMai;
	}
	public void setTenKhuyenMai(String tenKhuyenMai) {
		TenKhuyenMai = tenKhuyenMai;
	}
	public LocalDateTime getThoiGianBD() {
		return ThoiGianBD;
	}
	public void setThoiGianBD(LocalDateTime thoiGianBD) {
		ThoiGianBD = thoiGianBD;
	}
	public LocalDateTime getThoiGianKT() {
		return ThoiGianKT;
	}
	public void setThoiGianKT(LocalDateTime thoiGianKT) {
		ThoiGianKT = thoiGianKT;
	}
	public String getMoTa() {
		return MoTa;
	}
	public void setMoTa(String moTa) {
		MoTa = moTa;
	}
	public String getHinhKM() {
		return HinhKM;
	}
	public void setHinhKM(String hinhKM) {
		HinhKM = hinhKM;
	}
	public int getGiamGia() {
		return GiamGia;
	}
	public void setGiamGia(int giamGia) {
		GiamGia = giamGia;
	}
	
}
