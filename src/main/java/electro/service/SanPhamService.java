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
}
