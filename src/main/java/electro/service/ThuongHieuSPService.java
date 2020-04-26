package electro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import electro.dao.ThuongHieuSPDAO;
import electro.entity.ThuongHieu;

@Service
public class ThuongHieuSPService {
	@Autowired
	ThuongHieuSPDAO thuongHieuSPDAO;
	public List<ThuongHieu> GetListThuongHieu(){
		return thuongHieuSPDAO.GetListThuongHieu();
	}
}
