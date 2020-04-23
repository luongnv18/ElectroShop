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
	
	String DiaChiGiaoHang;
	Boolean TinhTrang;
	LocalDateTime NgayMua;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "IdHoaDon")
	Set<ChiTietHoaDon> lstChiTietHoaDon;
	
	public Set<ChiTietHoaDon> getLstchiTietHoaDon() {
		return lstChiTietHoaDon;
	}
	public void setLstchiTietHoaDon(Set<ChiTietHoaDon> lstchiTietHoaDon) {
		this.lstChiTietHoaDon = lstchiTietHoaDon;
	}

	public int getIdHoaDon() {
		return IdHoaDon;
	}
	public void setIdHoaDon(int idHoaDon) {
		IdHoaDon = idHoaDon;
	}
	public Set<ChiTietHoaDon> getLstChiTietHoaDon() {
		return lstChiTietHoaDon;
	}
	public void setLstChiTietHoaDon(Set<ChiTietHoaDon> lstChiTietHoaDon) {
		this.lstChiTietHoaDon = lstChiTietHoaDon;
	}

	public KhachHang getUser() {
		return User;
	}
	public void setUser(KhachHang user) {
		User = user;
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
	

}
