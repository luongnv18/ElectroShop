package electro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import electro.dao.ChiTietSanPhamDAO;
import electro.entity.ChiTietSanPham;

@Service
public class ChiTietSanPhamService {
	@Autowired
	ChiTietSanPhamDAO chiTietSanPhamDAO;
	public List<ChiTietSanPham> LaySizeTheoMau(int masp, int mamau) {
		List<ChiTietSanPham> lstctsp=chiTietSanPhamDAO.LaySizeTheoMau(masp, mamau);
		return lstctsp;
	}
}
