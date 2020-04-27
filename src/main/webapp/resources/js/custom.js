$(document).ready(function(){
	$(".product-options").hide();
	$(".the-an").hide();
	
	$(".btn-giohang").click(function(){
		var soLuong= $(this).closest("div").find("input").val();
		var IdSanPham=$(".sanpham-chitiet").attr("data-masp");
		var tenSanPham=$(".sanpham-chitiet").text();
		var giasp=$(".sanpham-chitiet").attr("data-giasp");
		
		$.ajax({
			url:"http://localhost:8080/ElectroShop/api/ThemGioHang",
		    type:"GET",
		    data:{
		    	IdSanPham:IdSanPham,
		    	tenSanPham:tenSanPham,
		    	giasp:giasp,
		    	soLuong: soLuong
		    },
			success: function(value){
				$("#giohang").find(".soluong-spgiohang").text(value);
				alert(value);
				
			}
		})    
		
	})
	
	$(".btn-giohang-trangchu").click(function(){
		var soLuong= 1;
		var IdSanPham=$(this).attr("data-masp");
		var tenSanPham=$(this).find(".the-an").text();
		var giasp=$(this).attr("data-giasp");
//		alert(IdSanPham+tenSanPham+giasp+soLuong);
		$.ajax({
			url:"http://localhost:8080/ElectroShop/api/ThemGioHang",
		    type:"GET",
		    data:{
		    	IdSanPham:IdSanPham,
		    	tenSanPham:tenSanPham,
		    	giasp:giasp,
		    	soLuong: soLuong
		    },
			success: function(value){
				$("#giohang").find(".soluong-spgiohang").text(value);
				alert(value);
				
			}
		})    
		
	})
	
	$(".cart-dropdown").click(function(){
		
		
		
		
	})
	
})