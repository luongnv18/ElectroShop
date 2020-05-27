package electro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import electro.entity.DanhMuc;
import electro.entity.SanPham;
import electro.entity.ThuongHieu;
import electro.service.DanhMucSPService;
import electro.service.SanPhamService;
import electro.service.ThuongHieuSPService;

@Controller
@SessionAttributes({ "user", "giohang" })
@RequestMapping("/SanPham")
public class StoreController {

	@Autowired
	DanhMucSPService danhMucSPService;

	@Autowired
	SanPhamService sanPhamService;

	@Autowired
	ThuongHieuSPService thuongHieuSPService;

	@GetMapping
	public String Default(ModelMap modelMap, @RequestParam(required = false, name = "category") String category,
			@RequestParam(required = false, name = "brand") String brand,
			@RequestParam(required = false, name = "price-from") String from,
			@RequestParam(required = false, name = "price-to") String to,
			@RequestParam(required = false, name = "headerName") String headerName,
			@RequestParam(required = false, name = "headerCategory") String headerCategory,
			@RequestParam(required = false, name = "sort") String sort) {

		List<DanhMuc> lstDanhMucs = danhMucSPService.GetListDanhMuc();
		List<SanPham> lstSanPhams = sanPhamService.GetListSanPham();
		List<ThuongHieu> lstThuongHieus = thuongHieuSPService.GetListThuongHieu();
		List<Long> lstSoLuongTheoDM = sanPhamService.DemSPTheoDM();
		List<Long> lstSoLuongTheoTH = sanPhamService.DemSPTheoTh();
		List<SanPham> lstSPBanChay = sanPhamService.getSanPhamBanChay();
		List<SanPham> TimKiemSanPham = null;

		modelMap.addAttribute("lstDanhMuc", lstDanhMucs);
		modelMap.addAttribute("lstSanPham", lstSanPhams);
		modelMap.addAttribute("lstThuongHieu", lstThuongHieus);
		modelMap.addAttribute("lstSoLuongTheoDM", lstSoLuongTheoDM);
		modelMap.addAttribute("lstSoLuongTheoTH", lstSoLuongTheoTH);
		modelMap.addAttribute("lstSPBanChay", lstSPBanChay);

		if (sort != null) {
			if (sort.equals("0")) {
				TimKiemSanPham = sanPhamService.GetListSanPham();
				modelMap.addAttribute("lstSPTimKiem", TimKiemSanPham);
				return "store";
			}
			if (sort.equals("1")) {
				TimKiemSanPham = sanPhamService.SapXepSanPhamTheoNgayNhap();
				modelMap.addAttribute("lstSPTimKiem", TimKiemSanPham);
				return "store";
			}
			if (sort.equals("2")) {
				TimKiemSanPham = sanPhamService.GetListSanPham();
				modelMap.addAttribute("lstSPTimKiem", TimKiemSanPham);
				return "store";
			}
			if (sort.equals("3")) {
				TimKiemSanPham = sanPhamService.SapXepSanPhamTheoGiaTuThapDenCao();
				modelMap.addAttribute("lstSPTimKiem", TimKiemSanPham);
				return "store";
			}
			if (sort.equals("4")) {
				TimKiemSanPham = sanPhamService.SapXepSanPhamTheoGiaTuCaoDenThap();
				modelMap.addAttribute("lstSPTimKiem", TimKiemSanPham);
				return "store";
			}
		}

		if (headerCategory != null) {
			if (headerName != null && !headerCategory.equals("0")) {
				TimKiemSanPham = sanPhamService.TimKiemSanPhamTheoTenVaDanhMuc(headerName, headerCategory);
				modelMap.addAttribute("lstSPTimKiem", TimKiemSanPham);
				return "store";
			}

			if (!headerCategory.equals("0")) {
				TimKiemSanPham = sanPhamService.TimKiemSanPhamTheoDanhMuc(headerCategory);
				modelMap.addAttribute("lstSPTimKiem", TimKiemSanPham);
				return "store";
			}
		}

		if (headerName != null) {
			TimKiemSanPham = sanPhamService.TimKiemSanPhamTheoTen(headerName);
			modelMap.addAttribute("lstSPTimKiem", TimKiemSanPham);
			return "store";
		}

		if (category != null && brand != null) {
			TimKiemSanPham = sanPhamService.TimKiemSanPhamTheoDanhMucVaThuongHieu(category, brand);
			modelMap.addAttribute("lstSPTimKiem", TimKiemSanPham);
			return "store";
		}

		if (category != null) {
			TimKiemSanPham = sanPhamService.TimKiemSanPhamTheoDanhMuc(category);
			modelMap.addAttribute("lstSPTimKiem", TimKiemSanPham);
			return "store";
		}

		if (brand != null) {
			TimKiemSanPham = sanPhamService.TimKiemSanPhamTheoThuongHieu(brand);
			modelMap.addAttribute("lstSPTimKiem", TimKiemSanPham);
			return "store";
		}

		if (from != null && to != null) {
			TimKiemSanPham = sanPhamService.TimKiemSanPhamTheoGia(from, to);
			modelMap.addAttribute("lstSPTimKiem", TimKiemSanPham);
			return "store";
		}

		if (category == null && brand == null && (from == null || to == null)) {
			TimKiemSanPham = sanPhamService.GetListSanPham();
			modelMap.addAttribute("lstSPTimKiem", TimKiemSanPham);
			return "store";
		}

		return "store";
	}

}
