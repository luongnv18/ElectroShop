package electro.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import electro.entity.DanhMuc;

@Repository
public class DanhMucSPDAO {
	@Autowired
	SessionFactory sessionFactory;
	@SuppressWarnings("unchecked")
	@Transactional
	public List<DanhMuc> GetListDanhMuc(){
		Session session=sessionFactory.getCurrentSession();
		String sql="from DanhMuc";
		List<DanhMuc> lstDanhMucs= session.createQuery(sql).getResultList();
		return lstDanhMucs;
	}
}
