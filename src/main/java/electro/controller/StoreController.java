package electro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import electro.entity.DanhMuc;
import electro.entity.SanPham;
import electro.entity.ThuongHieu;
import electro.service.DanhMucSPService;
import electro.service.SanPhamService;
import electro.service.ThuongHieuSPService;

@Controller
@RequestMapping("/SanPham")
public class StoreController {
	
	@Autowired
	DanhMucSPService danhMucSPService;
	
	@Autowired
	SanPhamService sanPhamService;
	
	@Autowired
	ThuongHieuSPService thuongHieuSPService;
	
	@GetMapping
	public String Default(ModelMap modelMap) {
		List<DanhMuc> lstDanhMucs= danhMucSPService.GetListDanhMuc();
		List<SanPham> lstSanPhams = sanPhamService.GetListSanPham();
		List<ThuongHieu> lstThuongHieus = thuongHieuSPService.GetListThuongHieu();
		List<Long> lstSoLuongTheoDM = sanPhamService.DemSPTheoDM();
		List<Long> lstSoLuongTheoTH = sanPhamService.DemSPTheoTh();
		modelMap.addAttribute("lstDanhMuc",lstDanhMucs);
		modelMap.addAttribute("lstSanPham", lstSanPhams);
		modelMap.addAttribute("lstThuongHieu", lstThuongHieus);
		modelMap.addAttribute("lstSoLuongTheoDM", lstSoLuongTheoDM);
		modelMap.addAttribute("lstSoLuongTheoTH", lstSoLuongTheoTH);
		return "store";
	}
}
	
	