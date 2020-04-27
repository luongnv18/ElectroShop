package electro.dao;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MauSanPhamDAO {
	@Autowired
	SessionFactory sessionFactory;
	@Transactional
	public void GetTenMauById() {
		
	}
}
