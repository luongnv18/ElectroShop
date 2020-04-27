package electro.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String Default(ModelMap modelMap, @RequestParam(required=false,name="category") String category) {
		List<DanhMuc> lstDanhMucs = danhMucSPService.GetListDanhMuc();
		List<SanPham> lstSanPhams = sanPhamService.GetListSanPham();
		List<ThuongHieu> lstThuongHieus = thuongHieuSPService.GetListThuongHieu();
		List<Long> lstSoLuongTheoDM = sanPhamService.DemSPTheoDM();
		List<Long> lstSoLuongTheoTH = sanPhamService.DemSPTheoTh();
		modelMap.addAttribute("lstDanhMuc", lstDanhMucs);
		modelMap.addAttribute("lstSanPham", lstSanPhams);
		modelMap.addAttribute("lstThuongHieu", lstThuongHieus);
		modelMap.addAttribute("lstSoLuongTheoDM", lstSoLuongTheoDM);
		modelMap.addAttribute("lstSoLuongTheoTH", lstSoLuongTheoTH);
		
		List<SanPham> TimKiemTheoDanhMuc = sanPhamService.TimKiemSanPhamTheoDanhMuc(category);
		for (SanPham sanPham : TimKiemTheoDanhMuc) {
			System.out.println(sanPham.getTenSanPham());
		}
		modelMap.addAttribute("lstSPTimKiemTheoDM", TimKiemTheoDanhMuc);
		return "store";
	}

}
