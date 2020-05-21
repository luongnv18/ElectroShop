package electro.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import electro.entity.SizeSanPham;

@Repository
public class SizeSanPhamDAO {
	@Autowired
	SessionFactory sessionFactory;
	@Transactional
	public List<SizeSanPham> getAllSizeSP() {
		Session session=sessionFactory.getCurrentSession();
		List<SizeSanPham> sizeSanPhams= session.createQuery("from SizeSanPham").getResultList();
		return sizeSanPhams;
	}
}
