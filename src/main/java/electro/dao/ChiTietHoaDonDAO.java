package electro.dao;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import electro.entity.ChiTietHoaDon;
import electro.entity.ChiTietHoaDon.ChiTietHoaDonId;

@Repository
public class ChiTietHoaDonDAO {
	@Autowired
	SessionFactory sessionFactory;
	@Transactional
	public boolean ThemChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
		Session session=sessionFactory.getCurrentSession();
		ChiTietHoaDon.ChiTietHoaDonId chiTietHoaDonId=(ChiTietHoaDonId) session.save(chiTietHoaDon);
		if(chiTietHoaDonId!=null) {
			return true;
		}
		else return false;
	}
}
