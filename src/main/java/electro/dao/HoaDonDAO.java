package electro.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import electro.entity.HoaDon;

@Repository
public class HoaDonDAO {
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public int ThemHoaDon(HoaDon hoaDon) {
		Session session = sessionFactory.getCurrentSession();
		int id= (Integer)session.save(hoaDon);
//		session.persist(hoaDon);
		if(0 < id){
			return id;
		}else{
			return 0;
		}
		
	}
	
}
