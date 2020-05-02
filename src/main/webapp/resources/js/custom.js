$(document).ready(function(){
//	$(".product-options").hide();
	$(".the-an").hide();
	dinhdangtien();
	$(".btn-giohang-chitiet").click(function(){
		var value = $(".mausanpham option:selected"); 
		var idMau=value.val();
		var tenMau=value.text();
		var value2 = $("#sizesanpham option:selected");
		var idChiTietSp=value2.attr("data-mactsp");
		var tenSize=value2.text();
		var idSize=value2.val();
		var soLuong= $(this).closest("div").find("input").val();
		var idSanPham=$(".sanpham-chitiet").attr("data-masp");
		var tenSanPham=$(".sanpham-chitiet").text();
		var giasp=$(".sanpham-chitiet").attr("data-giasp");
		var image=$(".sanpham-chitiet").attr("data-image");
		
		$.ajax({
			url:"http://localhost:8080/ElectroShop/api/ThemGioHang",
		    type:"GET",
		    data:{
				idSanPham:idSanPham,
		    	tenSanPham:tenSanPham,
		    	giasp:giasp,
		    	soLuong: soLuong,
		    	image:image,
		    	idChiTietSp:idChiTietSp,
		    	idMau:idMau,
		    	idSize:idSize,
		    	tenMau:tenMau,
		    	tenSize:tenSize
		    },
			success: function(value){
				$("#giohang").find(".soluong-spgiohang").text(value);
				
			}
		})    
		
	})
	
	$(".btn-giohang-trangchu").click(function(){
		var idChiTietSp=$(this).find("span").attr("data-idctsp");
		var idMau=$(this).find("span").attr("data-idmau");
		var tenMau=$(this).find(".tenmau").text();
		var tenSize=$(this).find(".tensize").text();
		var idSize=$(this).find("span").attr("data-idsize");
		var soLuong= 1;
		var idSanPham=$(this).attr("data-masp");
		var tenSanPham=$(this).find(".tensanpham").text();
		var giasp=$(this).attr("data-giasp");
		var image=$(this).attr("data-image");
		
		$.ajax({
			url:"http://localhost:8080/ElectroShop/api/ThemGioHang",
		    type:"GET",
		    data:{
		    	idSanPham:idSanPham,
		    	tenSanPham:tenSanPham,
		    	giasp:giasp,
		    	soLuong: soLuong,
		    	image:image,
		    	idChiTietSp:idChiTietSp,
		    	idMau:idMau,
		    	idSize:idSize,
		    	tenMau:tenMau,
		    	tenSize:tenSize
		    },
			success: function(value){
				$("#giohang").find(".soluong-spgiohang").text(value);
			}
		})    
		
	})
	
	$(".mausanpham").click(function(){
//		alert("aaa");
		$(".sizesanpham").hide();
		$(".sizesanpham").removeAttr("selected");
		
		var masp=$(this).closest("div").attr("data-masp");
		var mamau=$(this).val();
		$.ajax({
			url:"http://localhost:8080/ElectroShop/api/LaySizeTheoMau",
		    type:"GET",
		    data:{
		    	masp:masp,
		    	mamau:mamau
		    },
			success: function(strListIdSize){
				var listIdSize=new Array();
				listIdSize=strListIdSize.split(";");
				for (var i = 0; i < listIdSize.length; i++) {
					if(i%2==1){
						$("#size"+listIdSize[i]).show();
						$("#size"+listIdSize[i]).removeAttr("style");
					}
					else{
						$("#size"+listIdSize[i+1]).attr("data-mactsp",listIdSize[i]);
					}	
						
					} 
				$("#size"+listIdSize[i-1]).attr("selected","true");
			},
		    error: function (error) {
		        alert('error; ' + eval(error));
		    }
		})    
	})
	$(".btn-xoa-giohang").click(function(){
		var self=$(this);
		var idSanPham=$(this).closest("tr").find(".idsanpham").attr("value");
		var idMau=$(this).closest("tr").find(".idmau").attr("value");
		var idSize=$(this).closest("tr").find(".idsize").attr("value");
		$.ajax({
			url:"http://localhost:8080/ElectroShop/api/XoaGioHang",
		    type:"GET",
		    data:{
		    	idSanPham:idSanPham,
		    	idMau:idMau,
		    	idSize:idSize
		    },
			success: function(value){
				if(value=="true"){
					self.closest("tr").remove();
					var soluonggiohang=parseInt($("#giohang").find(".soluong-spgiohang").text());
					$("#giohang").find(".soluong-spgiohang").text(soluonggiohang-1);
					tinhtongtien();
				}
				else alert('xoa that bai');
				
			},
		    error: function (error) {
		        alert('error; ' + eval(error));
		    }
		})    
	})
	
	$(".cart-dropdown").click(function(){	
		
	})
	function tinhtongtien() {
		var x=document.getElementsByClassName("sotien");
		var tongtien=document.getElementById("tongtien");
		var tong=0;
		for (var i = 0; i < x.length; i++) {
			tong+= parseInt(x[i].innerHTML.split('.').join(''));
		}
		tongtien.textContent=tong.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
	}
	function dinhdangtien() {
		var x=document.getElementsByClassName("giatien");
		for (var i = 0; i < x.length; i++) {
			giatien= parseInt(x[i].innerHTML);
			x[i].textContent=giatien.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
		}
	}
	
})