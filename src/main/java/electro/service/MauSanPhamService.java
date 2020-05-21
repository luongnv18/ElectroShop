package electro.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import electro.dao.MauSanPhamDAO;
import electro.entity.MauSanPham;

@Service
public class MauSanPhamService {
	@Autowired
	MauSanPhamDAO mauSanPhamDAO;
	public List<MauSanPham> getAllMauSP() {
		return mauSanPhamDAO.getAllMauSP();
	}
}
