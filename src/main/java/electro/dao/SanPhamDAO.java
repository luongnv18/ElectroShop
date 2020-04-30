package electro.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import electro.entity.SanPham;

@Repository
public class SanPhamDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public List<SanPham> GetListSanPham() {
		Session session = sessionFactory.getCurrentSession();
		String sql = "from SanPham";
		List<SanPham> lstSanPhams = session.createQuery(sql).getResultList();
		return lstSanPhams;
	}

	@Transactional
	public SanPham GetSanPhamById(int Id) {
		Session session = sessionFactory.getCurrentSession();
		SanPham sanPham = (SanPham) session.createQuery("from SanPham sp where sp.IdSanPham=" + Id).getSingleResult();
		return sanPham;
	}

	@Transactional
	public List<Long> DemSPTheoDM() {
		Session session = sessionFactory.getCurrentSession();
		String sql = "select count(sp.IdSanPham) from SanPham sp inner join DanhMuc dm on sp.danhMuc.IdDanhMuc = dm.IdDanhMuc group by sp.danhMuc.IdDanhMuc";
		List<Long> lstSoLuongTheoDM = session.createQuery(sql).getResultList();
		return lstSoLuongTheoDM;
	}

	@Transactional
	public List<Long> DemSPTheoTH() {
		Session session = sessionFactory.getCurrentSession();
		String sql = "select count(sp.IdSanPham) from SanPham sp inner join ThuongHieu th on sp.thuongHieu.IdThuongHieu = th.IdThuongHieu group by sp.thuongHieu.IdThuongHieu";
		List<Long> lstSoLuongTheoTH = session.createQuery(sql).list();
		return lstSoLuongTheoTH;
	}

	@Transactional
	public List<SanPham> TimKiemSanPhamTheoDanhMuc(String key) {
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> resultList;
		String sql = "from SanPham sp where sp.danhMuc.IdDanhMuc IN (" + key + ")";
		resultList = session.createQuery(sql).getResultList();
		return resultList;
	}

	@Transactional
	public List<SanPham> TimKiemSanPhamTheoThuongHieu(String key) {
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> resultList;
		String sql = "from SanPham sp where sp.thuongHieu.IdThuongHieu IN (" + key + ")";
		resultList = session.createQuery(sql).getResultList();
		return resultList;
	}

	@Transactional
	public List<SanPham> TimKiemSanPhamTheoThuongHieuVaDanhMuc(String dm, String th) {
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> resultList;
		String sql = "from SanPham sp where sp.thuongHieu.IdThuongHieu IN (" + th + ") AND sp.danhMuc.IdDanhMuc IN ("
				+ dm + ")";
		resultList = session.createQuery(sql).getResultList();
		return resultList;
	}

	@Transactional
	public List<SanPham> TimKiemSanPhamTheoGia(String from, String to) {
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> resultList;
		String sql = "from SanPham sp where (sp.Gia >= " + from + ") AND (sp.Gia <= " + to + ") ";
		resultList = session.createQuery(sql).getResultList();
		return resultList;
	}

	@Transactional
	public List<SanPham> TimKiemSanPhamTheoTen(String key) {
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> resultList;
		String sql = "from SanPham sp where sp.TenSanPham like :key";
		Query query = session.createQuery(sql);
		query.setParameter("key", "%" + key + "%");
		resultList = query.getResultList();
		return resultList;
	}

	@Transactional
	public List<SanPham> TimKiemSanPhamTheoTenVaDanhMuc(String name, String category) {
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> resultList;
		String sql = "from SanPham sp where sp.TenSanPham like :name AND sp.danhMuc.IdDanhMuc =" + category + "";
		Query query = session.createQuery(sql);
		query.setParameter("name", "%" + name + "%");
		resultList = query.getResultList();
		return resultList;
	}

	@Transactional
	public List<SanPham> SapXepSanPhamTheoNgayNhap() {
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> resultList;
		String sql = "select sp from SanPham sp inner join ChiTietSanPham ct on sp.IdSanPham = ct.sanPham.IdSanPham order by ct.NgayNhap desc";
		Query query = session.createQuery(sql);
		resultList = query.getResultList();
		return resultList;
	}

	@Transactional
	public List<SanPham> SapXepSanPhamTheoGiaTuThapDenCao() {
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> resultList;
		String sql = "select sp from SanPham sp order by sp.Gia";
		Query query = session.createQuery(sql);
		resultList = query.getResultList();
		return resultList;
	}

	@Transactional
	public List<SanPham> SapXepSanPhamTheoGiaTuCaoDenThap() {
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> resultList;
		String sql = "select sp from SanPham sp order by sp.Gia desc";
		Query query = session.createQuery(sql);
		resultList = query.getResultList();
		return resultList;
	}
	
}
