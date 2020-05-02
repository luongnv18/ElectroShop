package electro.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import electro.entity.ChiTietSanPham;

@Repository
public class ChiTietSanPhamDAO {
	@Autowired
	SessionFactory sessionFactory;
	@Transactional
	public List<ChiTietSanPham> LaySizeTheoMau(int masp, int mamau) {
		Session session=sessionFactory.getCurrentSession();
		List<ChiTietSanPham> lstctsp= session.createQuery("from ChiTietSanPham where IdSanPham="+masp+" AND IdMau="+mamau).list();
		System.out.println(lstctsp);
		return lstctsp;
	}
}
