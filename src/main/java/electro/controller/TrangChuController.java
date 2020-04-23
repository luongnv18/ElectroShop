package electro.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import electro.entity.KhachHang;

@Controller
@RequestMapping("/")
public class TrangChuController {
	
	@GetMapping
	public String Default() {
		return "TrangChu";
	}
	
	@Autowired
	SessionFactory sessionFactory;
	@PostMapping
	@Transactional
	
	//@ResponseBody	//trả về nội dung text
	public String DangNhap(@RequestParam("username") String username, @RequestParam("pass") String pass){
		Session session=sessionFactory.getCurrentSession();
		String sql="from User where TenDangNhap='"+username.trim()+"' AND MatKhau='"+pass.trim()+"'";
		KhachHang user= (KhachHang)session.createQuery(sql).getSingleResult();
		if (user!=null) {
			return "TrangChu";
		}
		return "DangNhap";
	}
	
}
