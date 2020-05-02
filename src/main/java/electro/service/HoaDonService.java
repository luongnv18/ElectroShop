package electro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import electro.entity.HoaDon;

import electro.dao.HoaDonDAO;

@Service
public class HoaDonService {
	@Autowired
	HoaDonDAO hoaDonDAO;
	public int ThemHoaDon(HoaDon hoaDon) {
		return hoaDonDAO.ThemHoaDon(hoaDon);
	}
}
