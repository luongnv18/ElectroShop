package electro.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import electro.entity.GioHang;

@Controller
@RequestMapping("/api")
@SessionAttributes("giohang")
public class AjaxController {
	@GetMapping("/ThemGioHang")
	@ResponseBody
	public String ThemGioHang(@RequestParam int IdSanPham,@RequestParam String tenSanPham, @RequestParam int giasp, 
							@RequestParam int soLuong ,HttpSession httpSession) {
		if(httpSession.getAttribute("giohang")==null) {
			List<GioHang> gioHangs=new ArrayList<GioHang>();
			GioHang gioHang=new GioHang();
			gioHang.setIdSanPham(IdSanPham);
			gioHang.setTenSanPham(tenSanPham);
			gioHang.setGiasp(giasp);
			gioHang.setSoLuong(soLuong);
			gioHangs.add(gioHang);
			httpSession.setAttribute("giohang", gioHangs);
			System.out.println("so luong san pham gio hang: "+gioHangs);
			return gioHangs.size()+"";
		}
		else {
			System.out.println("kiem tra ton tai");
			List<GioHang> gioHangs=(List<GioHang>)httpSession.getAttribute("giohang");
			int vitri=KiemTraSanPhamTonTaiTrongGioHang(IdSanPham, gioHangs);
			if(vitri>=0) {//co ton tai
				System.out.println("ton tai");
				int soluongmoi=gioHangs.get(vitri).getSoLuong()+soLuong;
				gioHangs.get(vitri).setSoLuong(soluongmoi);
			}
			else {//khong ton tai
				System.out.println("khong ton tai");
				GioHang gioHang=new GioHang();
				gioHang.setIdSanPham(IdSanPham);
				gioHang.setTenSanPham(tenSanPham);
				gioHang.setGiasp(giasp);
				gioHang.setSoLuong(soLuong);
				gioHangs.add(gioHang);
			}
			System.out.println("so luong san pham gio hang: "+gioHangs);
			//httpSession.setAttribute("giohang", gioHangs);
			return gioHangs.size()+"";
		}	
	}
	private int KiemTraSanPhamTonTaiTrongGioHang(int IdSanPham, List<GioHang> lstGioHang) {
			for (int i=0;i<lstGioHang.size();i++) {
				if(lstGioHang.get(i).getIdSanPham()==IdSanPham) return i;
			}		
		return -1;
	}

}
