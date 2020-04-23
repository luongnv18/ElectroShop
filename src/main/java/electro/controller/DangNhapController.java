package electro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import electro.service.KhachHangService;

@Controller
@RequestMapping("dangnhap/")
public class DangNhapController {
	@GetMapping
	public String Default() {
		System.out.println("get");
		return "DangNhap";
	}
	@Autowired
	KhachHangService userService;
	@PostMapping
	public String XuLyDangNhap(@RequestParam String username, @RequestParam String pass ) {
		if(userService.KiemTraDangNhap(username, pass)) return "TrangChu";
		else {
			return "DangNhap";
		}
		
	}

}
