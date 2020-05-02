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
import electro.service.DanhMucSPService;
import electro.service.SanPhamService;

@Controller
@RequestMapping("/")
@SessionAttributes({"user","giohang"})
public class TrangChuController {

	@Autowired
	DanhMucSPService danhMucSPService;
	@Autowired
	SanPhamService sanPhamService;

	@GetMapping
	public String Default(ModelMap modelMap) {
		List<DanhMuc> lstDanhMucs = danhMucSPService.GetListDanhMuc();
		List<SanPham> lstSanPhams = sanPhamService.GetListSanPham();
		modelMap.addAttribute("lstDanhMuc", lstDanhMucs);
		modelMap.addAttribute("lstSanPham", lstSanPhams);
		return "TrangChu";
	}

}
