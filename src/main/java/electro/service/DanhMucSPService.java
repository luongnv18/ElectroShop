package electro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import electro.dao.DanhMucSPDAO;
import electro.entity.DanhMuc;

@Service
public class DanhMucSPService {
	@Autowired
	DanhMucSPDAO danhMucSPDAO;
	public List<DanhMuc> GetListDanhMuc(){
		return danhMucSPDAO.GetListDanhMuc();
	}
}
