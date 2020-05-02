package electro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import electro.entity.KhachHang;
import electro.service.KhachHangService;

@Controller
@RequestMapping("/DangNhap")
@SessionAttributes("user")
public class DangNhapController {
	@GetMapping
	public String Default() {
		return "DangNhap";
	}
	@Autowired
	KhachHangService userService;
	
	@PostMapping
	public String XuLyDangNhap(@RequestParam String username, @RequestParam String pass, ModelMap modelMap) {
		if(userService.KiemTraDangNhap(username, pass)!=null) {
			//dang nhap thanh cong
			KhachHang kh=userService.KiemTraDangNhap(username, pass);
			modelMap.addAttribute("user", kh);
			return "redirect:/";
		}
		else {
			//dang nhap that bai
			return "redirect:DangNhap";
		}
		
	}

}
