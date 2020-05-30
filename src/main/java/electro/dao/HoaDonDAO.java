package electro.dao;

import java.util.List;

import javax.persistence.Query;

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
	@SuppressWarnings("unchecked")
	@Transactional
	public List<HoaDon> getAll() {
		Session session = sessionFactory.getCurrentSession();
		List<HoaDon> hoaDons=session.createQuery("from "+HoaDon.class.getName()).getResultList();	
		return hoaDons;
	}
	@SuppressWarnings("unchecked")
	@Transactional
	public List<HoaDon> getListHoaDonLimit(int vitribatdau) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from HoaDon");
		query.setFirstResult(vitribatdau);
		query.setMaxResults(5);
		List<HoaDon> lstSanPhams = query.getResultList();
		return lstSanPhams;
	}
	@Transactional
	public Long getTotalCount() {
		Session session = sessionFactory.getCurrentSession();
		String sql = "select count(IdHoaDon) from HoaDon";
		Long totalcount = (Long)session.createQuery(sql).uniqueResult();
		return totalcount;
	}
	@Transactional
	public HoaDon findById(int idHoaDon) {
		Session session=sessionFactory.getCurrentSession();
		return session.find(HoaDon.class, idHoaDon);
	}
	@SuppressWarnings("unchecked")
	@Transactional
	public List<HoaDon> findByPhone(String keyword) {
		Session session=sessionFactory.getCurrentSession();
		
//		Criteria ctr = session.createCriteria(HoaDon.class);
//		ctr.add(Restrictions.like("SoDTNguoiNhan", keyword));
		String hql = "from HoaDon where SoDTNguoiNhan like :keyword";
		 
		Query query = session.createQuery(hql);
		query.setParameter("keyword", "%" + keyword + "%");
		return query.getResultList();
	}
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
	@Transactional
	public void updateHoaDon(HoaDon hoaDon) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(hoaDon);
	}
	
}
