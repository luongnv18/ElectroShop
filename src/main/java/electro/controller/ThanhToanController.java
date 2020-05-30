package electro.controller;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import electro.entity.ChiTietHoaDon;
import electro.entity.ChiTietSanPham;
import electro.entity.DanhMuc;
import electro.entity.GioHang;
import electro.entity.HoaDon;
import electro.entity.KhachHang;
import electro.service.ChiTietHoaDonService;
import electro.service.ChiTietSanPhamService;
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
	@Autowired
	ChiTietSanPhamService chiTietSanPhamService;
	
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
			hoaDon.setTinhTrang(0);
			//list chitiethoadon
			Set<ChiTietHoaDon> lstChiTietHoaDons=new HashSet<ChiTietHoaDon>();
			for(GioHang gioHang:gioHangs) {
				ChiTietHoaDon chiTietHoaDon=new ChiTietHoaDon();
				ChiTietHoaDon.ChiTietHoaDonId chiTietHoaDonId=new ChiTietHoaDon.ChiTietHoaDonId();
				chiTietHoaDonId.setHoaDon(hoaDon);
				ChiTietSanPham chiTietSanPham=new ChiTietSanPham();
				chiTietSanPham.setIdChiTietSanPham(gioHang.getIdChiTietSp());
				chiTietHoaDonId.setChiTietSanPham(chiTietSanPham);
				chiTietHoaDon.setChiTietHoaDonId(chiTietHoaDonId);
				chiTietHoaDon.setSoLuong(gioHang.getSoLuong());
				chiTietHoaDon.setGiaTien(gioHang.getGiasp());
				lstChiTietHoaDons.add(chiTietHoaDon);
			}
			hoaDon.setLstChiTietHoaDon(lstChiTietHoaDons);
			int idHoaDon=hoaDonService.ThemHoaDon(hoaDon);
			System.out.println("hoa don duoc luu co id la: "+idHoaDon);
			if(idHoaDon>0) {//them thanh cong
				System.out.println("them hoa don thanh cong");
				ketqua=true;
				//cap nhat lai so luong ton cua san pham
				for(GioHang gioHang:gioHangs) {
					chiTietSanPhamService.updateSoLuong(gioHang.getIdChiTietSp(), gioHang.getSoLuong());
				}
				gioHangs.removeAll(gioHangs);
				
			}else {//them hoa don that bai
				System.out.println("them hoa don that bai");
				ketqua=false;
			}
		}
		modelMap.addAttribute("kqThemHoaDon",ketqua);
		return "checkout";
	}
}
