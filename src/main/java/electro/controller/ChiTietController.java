package electro.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import electro.entity.DanhMuc;
import electro.entity.SanPham;
import electro.service.DanhMucSPService;
import electro.service.SanPhamService;

@Controller
@RequestMapping("/ChiTiet")
@SessionAttributes({"user","giohang"})
public class ChiTietController {
	@Autowired
	SanPhamService sanPhamService;
	
	@Autowired
	DanhMucSPService danhMucSPService;
	@GetMapping
	public String Default() {
		return "ChiTiet";
	}
	
	@GetMapping("/{id}")
	public String Default(@PathVariable int id, ModelMap modelMap,HttpSession httpSession) {
		List<DanhMuc> lstDanhMucs=danhMucSPService.GetListDanhMuc();
		SanPham sanPham= sanPhamService.GetSanPhamById(id);
		modelMap.addAttribute("sanPham",sanPham);
		modelMap.addAttribute("lstDanhMuc",lstDanhMucs);
		
		return "ChiTiet";
	}
}
