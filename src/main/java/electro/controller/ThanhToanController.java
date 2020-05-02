package electro.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import electro.entity.ChiTietHoaDon;
import electro.entity.DanhMuc;
import electro.entity.GioHang;
import electro.entity.HoaDon;
import electro.entity.KhachHang;
import electro.service.ChiTietHoaDonService;
import electro.service.DanhMucSPService;
import electro.service.HoaDonService;

@Controller
@RequestMapping("/thanhtoan")
@SessionAttributes({"user","giohang"})
public class ThanhToanController {
	@Autowired
	DanhMucSPService danhMucSPService;
	@Autowired
	HoaDonService hoaDonService;
	@Autowired
	ChiTietHoaDonService chiTietHoaDonService;
	
	@GetMapping
	public String Default(ModelMap modelMap) {
		List<DanhMuc> lstDanhMucs=danhMucSPService.GetListDanhMuc();
		modelMap.addAttribute("lstDanhMuc",lstDanhMucs);
		return "checkout";
	}
	@GetMapping("/{tenNguoiNhan}/{soDTNguoiNhan}/{diaChiGiaoHang}/{ghiChu}")
	public String ThemHoaDon(HttpSession httpSession, @PathVariable String tenNguoiNhan, @PathVariable String soDTNguoiNhan, @PathVariable String diaChiGiaoHang,@PathVariable String ghiChu, ModelMap modelMap) {
		List<DanhMuc> lstDanhMucs=danhMucSPService.GetListDanhMuc();
		modelMap.addAttribute("lstDanhMuc",lstDanhMucs);
		boolean ketqua=false;
		if(httpSession.getAttribute("giohang")!=null) {
			List<GioHang> gioHangs=(List<GioHang>) httpSession.getAttribute("giohang");
			HoaDon hoaDon=new HoaDon();
			if(httpSession.getAttribute("user")!=null) {
				KhachHang kh=(KhachHang) httpSession.getAttribute("user");
				hoaDon.setUser(kh);
			}
			hoaDon.setTenNguoiNhan(tenNguoiNhan);
			hoaDon.setSoDTNguoiNhan(soDTNguoiNhan);
			hoaDon.setGhiChu(ghiChu);
			hoaDon.setDiaChiGiaoHang(diaChiGiaoHang);
			hoaDon.setNgayMua(LocalDateTime.now());
			
			int idHoaDon=hoaDonService.ThemHoaDon(hoaDon);
			if(idHoaDon>0) {//them hoa don thanh cong
				//them chitiethoadon
				for(GioHang gioHang:gioHangs) {
					ChiTietHoaDon chiTietHoaDon=new ChiTietHoaDon();
					ChiTietHoaDon.ChiTietHoaDonId chiTietHoaDonId=new ChiTietHoaDon.ChiTietHoaDonId();
					chiTietHoaDonId.setIdChiTietSanPham(gioHang.getIdChiTietSp());
					chiTietHoaDonId.setIdHoaDon(idHoaDon);
					chiTietHoaDon.setChiTietHoaDonId(chiTietHoaDonId);
					chiTietHoaDon.setSoLuong(gioHang.getSoLuong());
					chiTietHoaDon.setGiaTien(gioHang.getGiasp());
					if(chiTietHoaDonService.ThemChiTietHoaDon(chiTietHoaDon)) {
						System.out.println("them thanh cong");
						ketqua=true;
					} else {
						System.out.println("them that bai");
						ketqua=false;
					}
				}
			}
		gioHangs.removeAll(gioHangs);
		}else{
			System.out.println("them that bai");
			ketqua=false;
		}
		
		modelMap.addAttribute("kqThemHoaDon",ketqua);
		return "checkout";
	}
}
