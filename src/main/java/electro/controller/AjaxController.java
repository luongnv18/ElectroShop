package electro.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import electro.entity.ChiTietSanPham;
import electro.entity.GioHang;
import electro.service.ChiTietSanPhamService;

@Controller
@RequestMapping("/api")
@SessionAttributes("giohang")
public class AjaxController {
	@GetMapping("/XoaGioHang")
	@ResponseBody
	public String XoaGioHang(@RequestParam int idSanPham,@RequestParam int idMau,@RequestParam int idSize,HttpSession httpSession) {
		if(httpSession.getAttribute("giohang")!=null) {
			System.out.println(idSanPham+"-"+idMau+"-"+idSize);
			List<GioHang> gioHangs=(List<GioHang>) httpSession.getAttribute("giohang");
			int vitri=KiemTraSanPhamTonTaiTrongGioHang(idSanPham, idMau, idSize, gioHangs);
			System.out.println("vitrixoa:"+vitri);
			if(vitri>=0) {
				gioHangs.remove(vitri);
				return "true";
			}
			else return "false";
		}
		return "false";
	}
	@GetMapping("/ThemGioHang")
	@ResponseBody
	public String ThemGioHang(@RequestParam int idSanPham,@RequestParam String tenSanPham, @RequestParam int giasp, 
							@RequestParam int soLuong, @RequestParam String image ,
							@RequestParam int idChiTietSp, @RequestParam int idMau,
							@RequestParam int idSize, @RequestParam String tenSize,
							@RequestParam String tenMau, HttpSession httpSession) {
		if(httpSession.getAttribute("giohang")==null) {
			List<GioHang> gioHangs=new ArrayList<GioHang>();
			GioHang gioHang=new GioHang();
			gioHang.setIdSanPham(idSanPham);
			gioHang.setTenSanPham(tenSanPham);
			gioHang.setGiasp(giasp);
			gioHang.setSoLuong(soLuong);
			gioHang.setImage(image);
			gioHang.setIdChiTietSp(idChiTietSp);
			gioHang.setIdMau(idMau);
			gioHang.setIdSize(idSize);
			gioHang.setTenMau(tenMau);
			gioHang.setTenSize(tenSize);
			gioHangs.add(gioHang);
			httpSession.setAttribute("giohang", gioHangs);
			System.out.println("so luong san pham gio hang: "+gioHangs);
			return gioHangs.size()+"";
		}
		else {
			System.out.println("kiem tra ton tai");
			List<GioHang> gioHangs=(List<GioHang>)httpSession.getAttribute("giohang");
			int vitri=KiemTraSanPhamTonTaiTrongGioHang(idSanPham,idMau,idSize, gioHangs);
			System.out.println(idSanPham+"::"+vitri);
			if(vitri>=0) {//co ton tai
				System.out.println("ton tai");
				int soluongmoi=gioHangs.get(vitri).getSoLuong()+soLuong;
				gioHangs.get(vitri).setSoLuong(soluongmoi);
			}
			else {//khong ton tai
				System.out.println("khong ton tai");
				GioHang gioHang=new GioHang();
				gioHang.setIdSanPham(idSanPham);
				gioHang.setTenSanPham(tenSanPham);
				gioHang.setGiasp(giasp);
				gioHang.setSoLuong(soLuong);
				gioHang.setImage(image);
				gioHang.setIdChiTietSp(idChiTietSp);
				gioHang.setIdMau(idMau);
				gioHang.setIdSize(idSize);
				gioHang.setTenMau(tenMau);
				gioHang.setTenSize(tenSize);
				gioHangs.add(gioHang);
			}
			System.out.println("so luong san pham gio hang: "+gioHangs);
			//httpSession.setAttribute("giohang", gioHangs);
			return gioHangs.size()+"";
		}	
	}
	private int KiemTraSanPhamTonTaiTrongGioHang(int idSanPham,int idMau, int idSize, List<GioHang> lstGioHang) {
			for (int i=0;i<lstGioHang.size();i++) {
				System.out.println("vitri"+i+"-idsanpham:"+lstGioHang.get(i).getIdSanPham()+"-idmau:"+lstGioHang.get(i).getIdMau()+"-idsize"+lstGioHang.get(i).getIdSize());
				if(lstGioHang.get(i).getIdSanPham()==idSanPham && lstGioHang.get(i).getIdMau()==idMau && lstGioHang.get(i).getIdSize()==idSize) return i;
			}		
		return -1;
	}
	@Autowired
	ChiTietSanPhamService chiTietSanPhamService;
	//lay size theo mau
	@GetMapping("/LaySizeTheoMau")
	@ResponseBody
	public String LaySizeTheoMau(HttpSession httpSession, int masp, int mamau ) {
		String kq="";
		List<ChiTietSanPham> lst= chiTietSanPhamService.LaySizeTheoMau(masp, mamau);
		for(ChiTietSanPham ctsp : lst) {
			kq=kq+ctsp.getIdChiTietSanPham()+";"+ctsp.getSizeSanPham().getIdSize()+";";
		}
		System.out.println(kq);
		kq=kq.substring(0,kq.length()-1);
		System.out.println(kq);
		return kq;
	}

}
