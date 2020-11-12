package electro.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import electro.entity.DanhMuc;
import electro.entity.HoaDon;
import electro.entity.KhachHang;
import electro.entity.MauSanPham;
import electro.entity.SanPham;
import electro.entity.SizeSanPham;
import electro.entity.ThuongHieu;
import electro.service.DanhMucSPService;
import electro.service.HoaDonService;
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
	@Autowired
	HoaDonService hoaDonService;
	
	@GetMapping
	public String Default(HttpSession session) {
		if(session.getAttribute("user")==null) {
			return "redirect:DangNhap";
		}
		else {
			KhachHang kh=(KhachHang)session.getAttribute("user");
			System.out.println(kh.getRole().getName());
			if(kh.getRole().getName().equals("Admin")) {
				return "redirect:/dashboard/sanpham";
			}
			else return "redirect:/";
			
		}
	}
	
	@GetMapping(value = {"/sanpham"})
	public String SanPhamDashboard (@RequestParam(name = "tensanpham",required = false) String tensanpham,@RequestParam(name = "id",required = false) Integer id,ModelMap modelMap) {
		List<SanPham> sanPhams=new ArrayList<SanPham>();
		int tongsotrang=1;
		String message=null;
		if(tensanpham==null && id==null) {
			System.out.println(tensanpham);
			System.out.println(id);
			sanPhams=sanPhamService.GetListSanPhamLimit(0);
			tongsotrang=(int) Math.ceil(sanPhamService.GetTotalCount()/5.0);
			
		}else if(tensanpham!=null) {
			sanPhams=sanPhamService.findByTenSanPham(tensanpham);
			tongsotrang=(int) Math.ceil(sanPhams.size()/5.0);
		}else if(id!=null) {
			SanPham sanPham=sanPhamService.findById(id);
			if(sanPham==null) {
				message="Không tìm thấy sản phẩm nào!";
			}
			sanPhams.add(sanPham);
		}
		if(sanPhams.size()<=0) {
			message="Không tìm thấy sản phẩm nào!";
		}
		modelMap.addAttribute("message",message);
		modelMap.addAttribute("tongsotrang", tongsotrang);
		modelMap.addAttribute("lstSanPham",sanPhams);
		List<ThuongHieu> thuongHieus=thuongHieuSPService.GetListThuongHieu();
		List<DanhMuc> danhMucs=danhMucSPService.GetListDanhMuc();
		List<SizeSanPham> sizeSanPhams=sizeSanPhamService.getAllSizeSP();
		List<MauSanPham> mauSanPhams=mauSanPhamService.getAllMauSP();
		modelMap.addAttribute("lstDanhMuc",danhMucs);
		modelMap.addAttribute("lstThuongHieu",thuongHieus);
		modelMap.addAttribute("lstMau",mauSanPhams);
		modelMap.addAttribute("lstSize",sizeSanPhams);
		return "Dashboard";
	}
	
	@GetMapping("/hoadon")
	public String HoaDonDashboard (@RequestParam(name = "phoneNumber",required = false) String phoneNumber,@RequestParam(name = "id",required = false) Integer id,ModelMap modelMap) {
		List<HoaDon> hoaDons=new ArrayList<HoaDon>();
		int tongsotrang=1;
		String message=null;
		if(phoneNumber==null && id==null) {
			System.out.println(phoneNumber);
			System.out.println(id);
			hoaDons=hoaDonService.getListHoaDonLimit(0);
			tongsotrang=(int) Math.ceil(hoaDonService.getTotalCount()/5.0);
			
		}else if(phoneNumber!=null) {
			hoaDons=hoaDonService.findByPhone(phoneNumber);
			tongsotrang=(int) Math.ceil(hoaDons.size()/5.0);
		}else if(id!=null) {
			HoaDon hoaDon=hoaDonService.findById(id);
			if(hoaDon==null) {
				message="Không tìm thấy hóa đơn nào!";
			}
			hoaDons.add(hoaDon);
		}
		System.out.println(hoaDons.size());
		if(hoaDons.size()<=0) {
			message="Không tìm thấy hóa đơn nào!";
		}
		modelMap.addAttribute("message",message);
		modelMap.addAttribute("tongsotrang", tongsotrang);
		modelMap.addAttribute("lstHoaDon",hoaDons);
		return "HoaDonDashboard";
	}



}
