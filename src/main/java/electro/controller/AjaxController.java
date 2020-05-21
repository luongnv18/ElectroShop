package electro.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import electro.entity.ChiTietSanPham;
import electro.entity.DanhMuc;
import electro.entity.GioHang;
import electro.entity.MauSanPham;
import electro.entity.SanPham;
import electro.entity.SanPhamDTO;
import electro.entity.SizeSanPham;
import electro.entity.ThuongHieu;
import electro.service.ChiTietSanPhamService;
import electro.service.SanPhamService;

@Controller
@RequestMapping("/api")
@SessionAttributes("giohang")
public class AjaxController {
	@GetMapping("/XoaGioHang")
	@ResponseBody
	public String XoaGioHang(@RequestParam int idSanPham, @RequestParam int idMau, @RequestParam int idSize,
			HttpSession httpSession) {
		if (httpSession.getAttribute("giohang") != null) {
			System.out.println(idSanPham + "-" + idMau + "-" + idSize);
			List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			int vitri = KiemTraSanPhamTonTaiTrongGioHang(idSanPham, idMau, idSize, gioHangs);
			System.out.println("vitrixoa:" + vitri);
			if (vitri >= 0) {
				gioHangs.remove(vitri);
				return "true";
			} else
				return "false";
		}
		return "false";
	}

	@GetMapping("/ThemGioHang")
	@ResponseBody
	public String ThemGioHang(@RequestParam int idSanPham, @RequestParam String tenSanPham, @RequestParam int giasp,
			@RequestParam int soLuong, @RequestParam String image, @RequestParam int idChiTietSp,
			@RequestParam int idMau, @RequestParam int idSize, @RequestParam String tenSize,
			@RequestParam String tenMau, HttpSession httpSession) {
		if (httpSession.getAttribute("giohang") == null) {
			List<GioHang> gioHangs = new ArrayList<GioHang>();
			GioHang gioHang = new GioHang();
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
			System.out.println("so luong san pham gio hang: " + gioHangs);
			return gioHangs.size() + "";
		} else {
			System.out.println("kiem tra ton tai");
			List<GioHang> gioHangs = (List<GioHang>) httpSession.getAttribute("giohang");
			int vitri = KiemTraSanPhamTonTaiTrongGioHang(idSanPham, idMau, idSize, gioHangs);
			System.out.println(idSanPham + "::" + vitri);
			if (vitri >= 0) {// co ton tai
				System.out.println("ton tai");
				int soluongmoi = gioHangs.get(vitri).getSoLuong() + soLuong;
				gioHangs.get(vitri).setSoLuong(soluongmoi);
			} else {// khong ton tai
				System.out.println("khong ton tai");
				GioHang gioHang = new GioHang();
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
			System.out.println("so luong san pham gio hang: " + gioHangs);
			// httpSession.setAttribute("giohang", gioHangs);
			return gioHangs.size() + "";
		}
	}

	private int KiemTraSanPhamTonTaiTrongGioHang(int idSanPham, int idMau, int idSize, List<GioHang> lstGioHang) {
		for (int i = 0; i < lstGioHang.size(); i++) {
			System.out.println("vitri" + i + "-idsanpham:" + lstGioHang.get(i).getIdSanPham() + "-idmau:"
					+ lstGioHang.get(i).getIdMau() + "-idsize" + lstGioHang.get(i).getIdSize());
			if (lstGioHang.get(i).getIdSanPham() == idSanPham && lstGioHang.get(i).getIdMau() == idMau
					&& lstGioHang.get(i).getIdSize() == idSize)
				return i;
		}
		return -1;
	}

	@Autowired
	ChiTietSanPhamService chiTietSanPhamService;

	// lay size theo mau
	@GetMapping("/LaySizeTheoMau")
	@ResponseBody
	public String LaySizeTheoMau(HttpSession httpSession, int masp, int mamau) {
		String kq = "";
		List<ChiTietSanPham> lst = chiTietSanPhamService.LaySizeTheoMau(masp, mamau);
		for (ChiTietSanPham ctsp : lst) {
			kq = kq + ctsp.getIdChiTietSanPham() + ";" + ctsp.getSizeSanPham().getIdSize() + ";";
		}
		System.out.println(kq);
		kq = kq.substring(0, kq.length() - 1);
		System.out.println(kq);
		return kq;
	}

	@Autowired
	SanPhamService sanPhamService;

	@GetMapping(path = "/LaySanPhamLimit", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<SanPhamDTO> LaySanPhamLimit(@RequestParam int vitribatdau) {
		System.out.println(vitribatdau);
		List<SanPhamDTO> lstSanPhamDTOs = new ArrayList<SanPhamDTO>();

		List<SanPham> sanPhams = sanPhamService.GetListSanPhamLimit(vitribatdau);
		for (SanPham sp : sanPhams) {
			SanPhamDTO spDTO = new SanPhamDTO();
			spDTO.setIdSanPham(sp.getIdSanPham());
			spDTO.setTenSanPham(sp.getTenSanPham());
			spDTO.setGia(sp.getGia());
			spDTO.setTinhTrang(sp.getTinhTrang());
			spDTO.setBaoHanh(sp.getBaoHanh());
			spDTO.setMoTa(sp.getMoTa());
			spDTO.setImage(sp.getImage());
			spDTO.setThuongHieu(sp.getThuongHieu());
			spDTO.setDanhMuc(sp.getDanhMuc());
			List<ChiTietSanPham> lsChiTietSanPhams = new ArrayList<ChiTietSanPham>();
			for (ChiTietSanPham temp : sp.getLstChiTietSanPham()) {
				ChiTietSanPham chiTietSanPham = new ChiTietSanPham();
				chiTietSanPham.setIdChiTietSanPham(temp.getIdChiTietSanPham());
				MauSanPham mauSanPham = new MauSanPham(temp.getMauSanPham().getIdMau(), temp.getMauSanPham().getMau());
				SizeSanPham sizeSanPham = new SizeSanPham(temp.getSizeSanPham().getIdSize(),
						temp.getSizeSanPham().getSize());
				chiTietSanPham.setMauSanPham(mauSanPham);
				chiTietSanPham.setSizeSanPham(sizeSanPham);
				chiTietSanPham.setSoLuong(temp.getSoLuong());
				lsChiTietSanPhams.add(chiTietSanPham);
			}
			spDTO.setLstChiTietSanPham(lsChiTietSanPhams);
			lstSanPhamDTOs.add(spDTO);
		}

		return lstSanPhamDTOs;
	}

	@Autowired
	ServletContext servletContext;

	@PostMapping("/UploadFile")
	@ResponseBody
	public String UploadFile(@RequestParam MultipartFile file) {
		String path_save_file = servletContext.getRealPath("/resources/img/");
		System.out.println(path_save_file);
		System.out.println(file.getOriginalFilename());
		File file_save = new File(path_save_file + file.getOriginalFilename());
		try {
			file.transferTo(file_save);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}

	@PostMapping(path = "/ThemSanPham")
	@ResponseBody
	public void ThemSanPham(String dataJson) {
		System.out.println(dataJson);
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonObject;
		try {
			SanPham sanPham=new SanPham();
			jsonObject = objectMapper.readTree(dataJson);
			sanPham.setTenSanPham(jsonObject.get("tensanpham").asText());
			sanPham.setGia(jsonObject.get("giasp").asInt());
			sanPham.setBaoHanh(jsonObject.get("baohanhsp").asText());
			sanPham.setTinhTrang(jsonObject.get("tinhtrangsp").asText());
			sanPham.setMoTa(jsonObject.get("motasp").asText());
			sanPham.setDanhMuc(new DanhMuc(jsonObject.get("danhmucsp").asInt()));
			sanPham.setThuongHieu(new ThuongHieu(jsonObject.get("thuonghieusp").asInt()));
			sanPham.setImage(jsonObject.get("hinhsp").asText());
			List<ChiTietSanPham> chiTietSanPhams=new ArrayList<ChiTietSanPham>();
			JsonNode jsonObjectChiTiet=jsonObject.get("chitietsanpham");
			for(JsonNode objChiTiet:jsonObjectChiTiet){
				ChiTietSanPham chiTietSanPham=new ChiTietSanPham();
				chiTietSanPham.setMauSanPham(new MauSanPham(objChiTiet.get("mausp").asInt()));
				chiTietSanPham.setSizeSanPham(new SizeSanPham(objChiTiet.get("sizesp").asInt()));
				chiTietSanPham.setSoLuong(objChiTiet.get("soluongsp").asInt());
				chiTietSanPhams.add(chiTietSanPham);
			}
			sanPham.setLstChiTietSanPham(chiTietSanPhams);
			 sanPhamService.ThemSanPham(sanPham);
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// {"tensanpham":"","giasp":"","baohanhsp":"","tinhtrangsp":"","motasp":"","danhmucsp":"1","thuonghieusp":"1",
		// "chitietsanpham":[{"mausp":"1","sizesp":"1","soluongsp":"1"},{"mausp":"1","sizesp":"1","soluongsp":"100"}]}
	}
	@DeleteMapping(path = "/XoaSanPham/{masp}")
	@ResponseBody
	public void XoaSanPham(@PathVariable int masp){
		boolean bool=sanPhamService.XoaSanPham(masp);
		System.out.println(bool);
	}
	@PostMapping(path = "/CapNhatSanPham")
	@ResponseBody
	public void CapNhatSanPham( String dataJson){
		System.out.println("cap nhat: "+dataJson);
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonObject;
		try {
			SanPham sanPham=new SanPham();
			jsonObject = objectMapper.readTree(dataJson);
			sanPham.setIdSanPham(jsonObject.get("masanpham").asInt());
			sanPham.setTenSanPham(jsonObject.get("tensanpham").asText());
			sanPham.setGia(jsonObject.get("giasp").asInt());
			sanPham.setBaoHanh(jsonObject.get("baohanhsp").asText());
			sanPham.setTinhTrang(jsonObject.get("tinhtrangsp").asText());
			sanPham.setMoTa(jsonObject.get("motasp").asText());
			sanPham.setDanhMuc(new DanhMuc(jsonObject.get("danhmucsp").asInt()));
			sanPham.setThuongHieu(new ThuongHieu(jsonObject.get("thuonghieusp").asInt()));
			if(!jsonObject.get("hinhsp").asText().equals("")){
				sanPham.setImage(jsonObject.get("hinhsp").asText());
			}
			List<ChiTietSanPham> chiTietSanPhams=new ArrayList<ChiTietSanPham>();
			JsonNode jsonObjectChiTiet=jsonObject.get("chitietsanpham");
			for(JsonNode objChiTiet:jsonObjectChiTiet){
				ChiTietSanPham chiTietSanPham=new ChiTietSanPham();
				if(!objChiTiet.get("mactsp").asText().equals("")) {
					chiTietSanPham.setIdChiTietSanPham(objChiTiet.get("mactsp").asInt());
				}
				
				chiTietSanPham.setMauSanPham(new MauSanPham(objChiTiet.get("mausp").asInt()));
				chiTietSanPham.setSizeSanPham(new SizeSanPham(objChiTiet.get("sizesp").asInt()));
				chiTietSanPham.setSoLuong(objChiTiet.get("soluongsp").asInt());
				chiTietSanPhams.add(chiTietSanPham);
			}
			sanPham.setLstChiTietSanPham(chiTietSanPhams);
			 sanPhamService.SuaSanPham(sanPham);
//			 Hibernate: insert into ChiTietSanPham (NgayNhap, SoLuong, IdMau, IdSanPham, IdSize) values (?, ?, ?, ?, ?)
// Hibernate: insert into ChiTietSanPham (NgayNhap, SoLuong, IdMau, IdSanPham, IdSize) values (?, ?, ?, ?, ?)
// Hibernate: insert into ChiTietSanPham (NgayNhap, SoLuong, IdMau, IdSanPham, IdSize) values (?, ?, ?, ?, ?)
// Hibernate: insert into ChiTietSanPham (NgayNhap, SoLuong, IdMau, IdSanPham, IdSize) values (?, ?, ?, ?, ?)
// Hibernate: update SanPham set BaoHanh=?, Gia=?, Image=?, MoTa=?, TenSanPham=?, TinhTrang=?, IdDanhMuc=?, IdThuongHieu=? where IdSanPham=?
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
