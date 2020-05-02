package electro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import electro.dao.KhachHangDAO;
import electro.entity.KhachHang;


@Service
public class KhachHangService {
	@Autowired
	KhachHangDAO userDAO;
	public KhachHang KiemTraDangNhap(String username, String pass) {
		return userDAO.KiemTraDangNhap(username, pass);
	}
}
