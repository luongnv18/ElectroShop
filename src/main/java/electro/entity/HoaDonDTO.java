package electro.entity;

import java.time.LocalDateTime;
import java.util.Set;

public class HoaDonDTO {
	int IdHoaDon;
	KhachHang User;
	String TenNguoiNhan;
	String SoDTNguoiNhan;
	String GhiChu;
	String DiaChiGiaoHang;
	int TinhTrang;
	LocalDateTime NgayMua;
	Set<ChiTietHoaDon> lstChiTietHoaDon;
	public int getIdHoaDon() {
		return IdHoaDon;
	}
	public void setIdHoaDon(int idHoaDon) {
		IdHoaDon = idHoaDon;
	}
	public KhachHang getUser() {
		return User;
	}
	public void setUser(KhachHang user) {
		User = user;
	}
	public String getTenNguoiNhan() {
		return TenNguoiNhan;
	}
	public void setTenNguoiNhan(String tenNguoiNhan) {
		TenNguoiNhan = tenNguoiNhan;
	}
	public String getSoDTNguoiNhan() {
		return SoDTNguoiNhan;
	}
	public void setSoDTNguoiNhan(String soDTNguoiNhan) {
		SoDTNguoiNhan = soDTNguoiNhan;
	}
	public String getGhiChu() {
		return GhiChu;
	}
	public void setGhiChu(String ghiChu) {
		GhiChu = ghiChu;
	}
	public String getDiaChiGiaoHang() {
		return DiaChiGiaoHang;
	}
	public void setDiaChiGiaoHang(String diaChiGiaoHang) {
		DiaChiGiaoHang = diaChiGiaoHang;
	}
	public int getTinhTrang() {
		return TinhTrang;
	}
	public void setTinhTrang(int tinhTrang) {
		TinhTrang = tinhTrang;
	}
	public LocalDateTime getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(LocalDateTime ngayMua) {
		NgayMua = ngayMua;
	}
	public Set<ChiTietHoaDon> getLstChiTietHoaDon() {
		return lstChiTietHoaDon;
	}
	public void setLstChiTietHoaDon(Set<ChiTietHoaDon> lstChiTietHoaDon) {
		this.lstChiTietHoaDon = lstChiTietHoaDon;
	}
	
}
