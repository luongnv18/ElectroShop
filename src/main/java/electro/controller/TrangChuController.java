package electro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import electro.entity.DanhMuc;
import electro.service.DanhMucSPService;

@Controller
@RequestMapping("/")
@SessionAttributes("email")
public class TrangChuController {
	
	@Autowired
	DanhMucSPService danhMucSPService;
	
	@GetMapping
	public String Default(ModelMap modelMap) {
		List<DanhMuc> lstDanhMucs= danhMucSPService.GetListDanhMuc();
		modelMap.addAttribute("lstDanhMuc",lstDanhMucs);
		
		return "TrangChu";
	}
	
	
}
