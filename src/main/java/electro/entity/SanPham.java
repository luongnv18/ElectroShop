package electro.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

import net.bytebuddy.asm.Advice.This;

@Entity(name="SanPham")
public class SanPham {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int IdSanPham;
	String TenSanPham;
	int Gia;
	String TinhTrang;
	String BaoHanh;
	String MoTa;
	String Image;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="IdThuongHieu")
	ThuongHieu thuongHieu;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="IdDanhMuc")
	DanhMuc danhMuc;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name="ChiTietKhuyenMai",
		joinColumns = {@JoinColumn(name="IdSanPham",referencedColumnName = "IdSanPham")},
		inverseJoinColumns = {@JoinColumn(name="IdKhuyenMai",referencedColumnName = "IdKhuyenMai")})
	Set<KhuyenMai> lstKhuyenMai;
	

	public Set<KhuyenMai> getLstKhuyenMai() {
		return lstKhuyenMai;
	}

	public void setLstKhuyenMai(Set<KhuyenMai> lstKhuyenMai) {
		this.lstKhuyenMai = lstKhuyenMai;
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
	
	//tra ve mang danh sach cac anh cua san pham
	public String[] GetListImage() {
		String [] arrstr=this.Image.split(";");
		return arrstr;
	}
	
}
