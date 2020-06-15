package electro.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity(name="KhachHang")
public class KhachHang {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int IdUser;
	String HoTen;
	String DiaChi;
	boolean GioiTinh;
	String SoDT;
	String Email;
	@OneToOne
	@JoinColumn(name = "IdRole")
	Roles role;
	String TenDangNhap;
	String MatKhau;
	
	public int getIdUser() {
		return IdUser;
	}
	public void setIdUser(int idUser) {
		IdUser = idUser;
	}
	public String getHoTen() {
		return HoTen;
	}
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	public boolean isGioiTinh() {
		return GioiTinh;
	}
	public void setGioiTinh(boolean gioiTinh) {
		GioiTinh = gioiTinh;
	}
	public String getSoDT() {
		return SoDT;
	}
	public void setSoDT(String soDT) {
		SoDT = soDT;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public Roles getRole() {
		return role;
	}
	public void setRole(Roles role) {
		this.role = role;
	}
	public String getTenDangNhap() {
		return TenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		TenDangNhap = tenDangNhap;
	}
	public String getMatKhau() {
		return MatKhau;
	}
	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}
	
}
