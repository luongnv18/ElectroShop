package electro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import electro.dao.ChiTietHoaDonDAO;
import electro.entity.ChiTietHoaDon;

@Service
public class ChiTietHoaDonService {
	@Autowired
	ChiTietHoaDonDAO chiTietHoaDonDAO;
	public boolean ThemChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
		return chiTietHoaDonDAO.ThemChiTietHoaDon(chiTietHoaDon);
	}
}
