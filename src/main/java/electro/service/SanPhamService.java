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
}
