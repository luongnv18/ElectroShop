package electro.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import electro.entity.MauSanPham;

@Repository
public class MauSanPhamDAO {
	@Autowired
	SessionFactory sessionFactory;
	@SuppressWarnings("unchecked")
	@Transactional
	public List<MauSanPham> getAllMauSP() {
		Session session=sessionFactory.getCurrentSession();
		List<MauSanPham> mauSanPhams= session.createQuery("from MauSanPham").getResultList();
		return mauSanPhams;
	}
}
