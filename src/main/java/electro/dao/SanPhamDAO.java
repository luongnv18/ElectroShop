package electro.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import electro.entity.SanPham;

@Repository
public class SanPhamDAO {
	@Autowired
	SessionFactory sessionFactory;
	@Transactional
	public List<SanPham> GetListSanPham(){
		Session session=sessionFactory.getCurrentSession();
		String sql="from SanPham";
		List<SanPham> lstSanPhams= session.createQuery(sql).getResultList();
		return lstSanPhams;
	}
	@Transactional
	public SanPham GetSanPhamById(int Id) {
		Session session=sessionFactory.getCurrentSession();
		SanPham sanPham =(SanPham) session.createQuery("from SanPham sp where sp.IdSanPham="+Id).getSingleResult();
		return sanPham;
	}
}
