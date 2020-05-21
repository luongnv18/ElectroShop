package electro.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import electro.dao.SanPhamDAO;
import electro.entity.SanPham;

@Service
public class SanPhamService {
	@Autowired
	SanPhamDAO sanphamDAO;
	
	public List<SanPham> GetListSanPham(){
		return sanphamDAO.GetListSanPham();
	}
	public List<SanPham> GetListSanPhamLimit(int vitribatdau){
		return sanphamDAO.GetListSanPhamLimit(vitribatdau);
	}
	public Long GetTotalCount() {
		return sanphamDAO.GetTotalCount();
	}
	public SanPham GetSanPhamById(int Id) {
		SanPham sanPham=sanphamDAO.GetSanPhamById(Id);
		return sanPham;
	}
	public List<Long> DemSPTheoDM(){
		return sanphamDAO.DemSPTheoDM();
	}
	public List<Long> DemSPTheoTh(){
		return sanphamDAO.DemSPTheoTH();
	}
	public List<SanPham> TimKiemSanPhamTheoDanhMuc(String key){
		return sanphamDAO.TimKiemSanPhamTheoDanhMuc(key);
	}
	public List<SanPham> TimKiemSanPhamTheoThuongHieu(String key){
		return sanphamDAO.TimKiemSanPhamTheoThuongHieu(key);
	}
	public List<SanPham> TimKiemSanPhamTheoDanhMucVaThuongHieu(String dm, String th){
		return sanphamDAO.TimKiemSanPhamTheoThuongHieuVaDanhMuc(dm, th);
	}
	public List<SanPham> TimKiemSanPhamTheoGia(String from, String to){
		return sanphamDAO.TimKiemSanPhamTheoGia(from, to);
	}
	public List<SanPham> TimKiemSanPhamTheoTen(String name){
		return sanphamDAO.TimKiemSanPhamTheoTen(name);
	}
	public List<SanPham> TimKiemSanPhamTheoTenVaDanhMuc(String name, String category){
		return sanphamDAO.TimKiemSanPhamTheoTenVaDanhMuc(name,category);
	}
	public List<SanPham> SapXepSanPhamTheoNgayNhap(){
		return sanphamDAO.SapXepSanPhamTheoNgayNhap();
	}
	public List<SanPham> SapXepSanPhamTheoGiaTuThapDenCao(){
		return sanphamDAO.SapXepSanPhamTheoGiaTuThapDenCao();
	}
	public List<SanPham> SapXepSanPhamTheoGiaTuCaoDenThap(){
		return sanphamDAO.SapXepSanPhamTheoGiaTuCaoDenThap();
	}
	
	public int ThemSanPham(SanPham sp) {
		return sanphamDAO.ThemSanPham(sp);
	}
	public boolean SuaSanPham(SanPham sp) {
		return sanphamDAO.SuaSanPham(sp);
	}
	public boolean XoaSanPham(int idSP) {
		return sanphamDAO.XoaSanPham(idSP);
	}

}
