package electro.entity;

import java.io.Serializable;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.CascadeType;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;


@Entity(name="ChiTietHoaDon")
@AssociationOverrides({
    @AssociationOverride(name = "chiTietHoaDonId.hoaDon",
        joinColumns = @JoinColumn(name = "IdHoaDon")),
    @AssociationOverride(name = "chiTietHoaDonId.chiTietSanPham",
        joinColumns = @JoinColumn(name = "IdChiTietSanPham")) })
public class ChiTietHoaDon {
	@EmbeddedId
	ChiTietHoaDonId chiTietHoaDonId;
	int SoLuong;
	int GiaTien;
	
	@Transient
	public HoaDon getHoaDon() {
        return getChiTietHoaDonId().getHoaDon();
    }
    public void setHoaDon(HoaDon hoaDon) {
        getChiTietHoaDonId().setHoaDon(hoaDon);
    }
    
    @Transient
	public ChiTietSanPham getChiTietSanPham() {
        return getChiTietHoaDonId().getChiTietSanPham();
    }
    public void setChiTietSanPham(ChiTietSanPham chiTietSanPham) {
        getChiTietHoaDonId().setChiTietSanPham(chiTietSanPham);
    }
    
	public ChiTietHoaDonId getChiTietHoaDonId() {
		return chiTietHoaDonId;
	}

	public void setChiTietHoaDonId(ChiTietHoaDonId chiTietHoaDonId) {
		this.chiTietHoaDonId = chiTietHoaDonId;
	}

	public int getSoLuong() {
		return SoLuong;
	}

	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}

	public int getGiaTien() {
		return GiaTien;
	}

	public void setGiaTien(int giaTien) {
		GiaTien = giaTien;
	}

	@SuppressWarnings("serial")
	@Embeddable
	public static class ChiTietHoaDonId implements Serializable{
		@ManyToOne(cascade = CascadeType.ALL)
		HoaDon hoaDon;
		@ManyToOne(cascade = CascadeType.ALL)
		ChiTietSanPham chiTietSanPham;
		
		public HoaDon getHoaDon() {
			return hoaDon;
		}
		public void setHoaDon(HoaDon hoaDon) {
			this.hoaDon = hoaDon;
		}
		public ChiTietSanPham getChiTietSanPham() {
			return chiTietSanPham;
		}
		public void setChiTietSanPham(ChiTietSanPham chiTietSanPham) {
			this.chiTietSanPham = chiTietSanPham;
		}
		
		
	
//		@Override
//		public boolean equals(Object obj) {
//			// TODO Auto-generated method stub	
//			if (obj instanceof ChiTietHoaDonId) {
//				ChiTietHoaDonId another = (ChiTietHoaDonId) obj;
//	            if (this.IdHoaDon==another.IdHoaDon &&
//	                this.IdChiTietSanPham==another.IdChiTietSanPham) {
//	                    return true;
//	            }
//	        }
//	        return false;
//		}
//		@Override
//		public int hashCode() {
//			// TODO Auto-generated method stub
//			return Objects.hash(getIdHoaDon(), getIdChiTietSanPham());
//		}
		
	}
	
}
