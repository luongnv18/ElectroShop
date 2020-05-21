package electro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import electro.dao.SizeSanPhamDAO;
import electro.entity.SizeSanPham;

@Service
public class SizeSanPhamService {
	@Autowired
	SizeSanPhamDAO sizeSanPhamDAO;
	public List<SizeSanPham> getAllSizeSP() {
		return sizeSanPhamDAO.getAllSizeSP();
	}
}
