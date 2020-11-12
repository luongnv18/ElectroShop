package electro.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import electro.entity.ThuongHieu;

@Repository
public class ThuongHieuSPDAO {
	@Autowired
	SessionFactory sessionFactory;
	@SuppressWarnings("unchecked")
	@Transactional
	public List<ThuongHieu> GetListThuongHieu(){
		Session session=sessionFactory.getCurrentSession();
		String sql="from ThuongHieu";
		List<ThuongHieu> lstThuongHieus= session.createQuery(sql).getResultList();
		return lstThuongHieus;
	}
}
