package electro.entity;

import java.util.List;
import java.util.Set;


public class SanPhamDTO {
	int IdSanPham;
	String TenSanPham;
	int Gia;
	String TinhTrang;
	String BaoHanh;
	String MoTa;
	String Image;
	
	ThuongHieu thuongHieu;
	
	DanhMuc danhMuc;
	
//	Set<KhuyenMai> lstKhuyenMai;
	
	List<ChiTietSanPham> lstChiTietSanPham;
	
	public ThuongHieu getThuongHieu() {
		return thuongHieu;
	}
	public void setThuongHieu(ThuongHieu thuongHieu) {
		this.thuongHieu = thuongHieu;
	}
	public DanhMuc getDanhMuc() {
		return danhMuc;
	}
	public void setDanhMuc(DanhMuc danhMuc) {
		this.danhMuc = danhMuc;
	}
//	public Set<KhuyenMai> getLstKhuyenMai() {
//		return lstKhuyenMai;
//	}
//	public void setLstKhuyenMai(Set<KhuyenMai> lstKhuyenMai) {
//		this.lstKhuyenMai = lstKhuyenMai;
//	}
	public List<ChiTietSanPham> getLstChiTietSanPham() {
		return lstChiTietSanPham;
	}
	public void setLstChiTietSanPham(List<ChiTietSanPham> lstChiTietSanPham) {
		this.lstChiTietSanPham = lstChiTietSanPham;
	}
	public int getIdSanPham() {
		return IdSanPham;
	}
	public void setIdSanPham(int idSanPham) {
		IdSanPham = idSanPham;
	}
	public String getTenSanPham() {
		return TenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		TenSanPham = tenSanPham;
	}
	public int getGia() {
		return Gia;
	}
	public void setGia(int gia) {
		Gia = gia;
	}
	public String getTinhTrang() {
		return TinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		TinhTrang = tinhTrang;
	}
	public String getBaoHanh() {
		return BaoHanh;
	}
	public void setBaoHanh(String baoHanh) {
		BaoHanh = baoHanh;
	}
	public String getMoTa() {
		return MoTa;
	}
	public void setMoTa(String moTa) {
		MoTa = moTa;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	
}
