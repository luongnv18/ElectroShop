package electro.entity;

public class GioHang {
	int idSanPham;
	int idMau;
	int idSize;
	int idChiTietSp;
	String tenSanPham;
	int soLuong;
	int giasp;
	String image;
	String tenMau;
	String tenSize;
	
	public int getIdChiTietSp() {
		return idChiTietSp;
	}
	public void setIdChiTietSp(int idChiTietSp) {
		this.idChiTietSp = idChiTietSp;
	}
	public int getIdMau() {
		return idMau;
	}
	public void setIdMau(int idMau) {
		this.idMau = idMau;
	}
	public String getTenMau() {
		return tenMau;
	}
	public void setTenMau(String tenMau) {
		this.tenMau = tenMau;
	}
	public String getTenSize() {
		return tenSize;
	}
	public void setTenSize(String tenSize) {
		this.tenSize = tenSize;
	}
	public int getIdSize() {
		return idSize;
	}
	public void setIdSize(int idSize) {
		this.idSize = idSize;
	}
	public int getIdSanPham() {
		return idSanPham;
	}
	public void setIdSanPham(int idSanPham) {
		this.idSanPham = idSanPham;
	}
	public String getTenSanPham() {
		return tenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public int getGiasp() {
		return giasp;
	}
	public void setGiasp(int giasp) {
		this.giasp = giasp;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	//tra ve mang danh sach cac anh cua san pham
	public String[] GetListImage() {
		String [] arrstr=this.image.split(";");
		return arrstr;
	}
	
}
