package electro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import electro.entity.HoaDon;

import electro.dao.HoaDonDAO;

@Service
public class HoaDonService {
	@Autowired
	HoaDonDAO hoaDonDAO;
	public List<HoaDon> getAll() {
		return hoaDonDAO.getAll();
	}
	public List<HoaDon> getListHoaDonLimit(int vitribatdau) {
		return hoaDonDAO.getListHoaDonLimit(vitribatdau);
	}
	public Long getTotalCount() {
		return hoaDonDAO.getTotalCount();
	}
	public HoaDon findById(int idHoaDon) {
		return hoaDonDAO.findById(idHoaDon);
	}
	public List<HoaDon> findByPhone(String keyword) {
		return hoaDonDAO.findByPhone(keyword);
	}
	public int ThemHoaDon(HoaDon hoaDon) {
		return hoaDonDAO.ThemHoaDon(hoaDon);
	}
	public void updateHoaDon(HoaDon hoaDon) {
		hoaDonDAO.updateHoaDon(hoaDon);
	}
}
