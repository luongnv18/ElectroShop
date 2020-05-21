package electro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import electro.entity.DanhMuc;
import electro.entity.MauSanPham;
import electro.entity.SanPham;
import electro.entity.SizeSanPham;
import electro.entity.ThuongHieu;
import electro.service.DanhMucSPService;
import electro.service.MauSanPhamService;
import electro.service.SanPhamService;
import electro.service.SizeSanPhamService;
import electro.service.ThuongHieuSPService;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {
	@Autowired
	SanPhamService sanPhamService;
	@Autowired
	DanhMucSPService danhMucSPService;
	@Autowired
	ThuongHieuSPService thuongHieuSPService;
	@Autowired
	SizeSanPhamService sizeSanPhamService;
	@Autowired
	MauSanPhamService mauSanPhamService;
	
	@GetMapping
	public String Default (ModelMap modelMap) {
		List<SanPham> sanPhams=sanPhamService.GetListSanPhamLimit(0);
		int tongsotrang=(int) Math.ceil(sanPhamService.GetTotalCount()/5.0);
		List<ThuongHieu> thuongHieus=thuongHieuSPService.GetListThuongHieu();
		List<DanhMuc> danhMucs=danhMucSPService.GetListDanhMuc();
		List<SizeSanPham> sizeSanPhams=sizeSanPhamService.getAllSizeSP();
		List<MauSanPham> mauSanPhams=mauSanPhamService.getAllMauSP();
		modelMap.addAttribute("tongsotrang", tongsotrang);
		modelMap.addAttribute("lstSanPham",sanPhams);
		modelMap.addAttribute("lstDanhMuc",danhMucs);
		modelMap.addAttribute("lstThuongHieu",thuongHieus);
		modelMap.addAttribute("lstMau",mauSanPhams);
		modelMap.addAttribute("lstSize",sizeSanPhams);
		return "Dashboard";
	}

}
