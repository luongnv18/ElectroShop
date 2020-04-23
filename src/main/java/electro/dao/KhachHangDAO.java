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
	public boolean KiemTraDangNhap(String username, String pass) {
		Session session=sessionFactory.getCurrentSession();
		String sql="from KhachHang where TenDangNhap='"+username+"' AND MatKhau='"+pass+"'";
		try {
			KhachHang user= (KhachHang)session.createQuery(sql).getSingleResult();
			if(user!=null) {
				return true;
			}
			else return false;
		}catch (Exception e) {
			return false;
		}
	}
}
