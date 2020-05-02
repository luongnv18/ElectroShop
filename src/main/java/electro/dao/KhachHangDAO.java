package electro.dao;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import electro.entity.KhachHang;

@Repository
public class KhachHangDAO {
	@Autowired
	SessionFactory sessionFactory;
	@Transactional
	public KhachHang KiemTraDangNhap(String username, String pass) {
		Session session=sessionFactory.getCurrentSession();
		String sql="from KhachHang where TenDangNhap='"+username+"' AND MatKhau='"+pass+"'";
		KhachHang kh=null;
		try {
			kh= (KhachHang)session.createQuery(sql).getSingleResult();
			return kh;
		} catch (Exception e) {
			System.out.println("dang nhap that bai");
			return kh;
		}
			
	}
}
