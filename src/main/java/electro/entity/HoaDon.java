package electro.entity;

import java.time.LocalDateTime;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity(name = "HoaDon")
public class HoaDon {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int IdHoaDon;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="IdUser")
	KhachHang User;
	String TenNguoiNhan;
	String SoDTNguoiNhan;
	String GhiChu;
	String DiaChiGiaoHang;
	Boolean TinhTrang;
	LocalDateTime NgayMua;
	
	@OneToMany(mappedBy = "chiTietHoaDonId.hoaDon",cascade = CascadeType.ALL)
//	@JoinColumns({@JoinColumn(name="IdHoaDon", referencedColumnName = "IdHoaDon"),@JoinColumn(name="")})
//	@JoinColumn(name = "IdHoaDon")
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

	public Boolean getTinhTrang() {
		return TinhTrang;
	}

	public void setTinhTrang(Boolean tinhTrang) {
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
