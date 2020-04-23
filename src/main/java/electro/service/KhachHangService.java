package electro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import electro.dao.KhachHangDAO;


@Service
public class KhachHangService {
	@Autowired
	KhachHangDAO userDAO;
	public boolean KiemTraDangNhap(String username, String pass) {
		return userDAO.KiemTraDangNhap(username, pass);
	}
}
