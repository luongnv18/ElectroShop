$(document).ready(function(){
//	$(".product-options").hide();
//	 $(".the-an").hide();
	const elmtclone=$('.divclone').clone();
	elmtclone.removeAttr('class');
	$('#pagination-dashboardsanpham li:nth-child(2)').addClass('active');
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

	//dashboard
	$('#btnThemSanPham').click(function(event) {
		//reset lai chitietsanpham
		$('#chitietsanphamform').children().remove();
		$('#chitietsanphamform').append(elmtclone);
		//thay doi text button
		$('#themsanphamformTitle').text('Thêm sản phẩm mới');
		$('#btnSubmitThemSanPhamForm').text('Thêm sản phẩm');
	});
	
	$('body').on('click', '.btnSuaSanPham', function(event) {
		//reset lai chitietsanpham
		$('#chitietsanphamform').children().remove();
		$('#chitietsanphamform').append(elmtclone);

		$('#themsanphamformTitle').text('Sửa thông tin sản phẩm');
		$('#btnSubmitThemSanPhamForm').text('Sửa sản phẩm');
		//lay thong tin san pham do vao form
		var masp=$(this).closest("tr").find('td').first().text();
		var tensp=$(this).closest("tr").find('td:nth-child(3)').text();
		var giasp=parseInt($(this).closest("tr").find('td:nth-child(4)').text());
		var baohanh=$(this).closest("tr").find('td:nth-child(5)').text();
		var tinhtrang=$(this).closest("tr").find('td:nth-child(6)').text();
		var motasp=$(this).closest("tr").find('.the-an').text();
		var madm=$(this).closest("tr").find('.the-an').attr('data-madm');
		var math=$(this).closest("tr").find('.the-an').attr('data-math');
		$('#masanpham').val(masp);
		$('#tensanpham').val(tensp);
		$('#giasp').val(giasp);
		$('#baohanhsp').val(baohanh);
		$('#tinhtrangsp').val(tinhtrang);
		$('#motasp').val(motasp);
		$('#danhmucsp').val(madm);
		$('#thuonghieusp').val(math);
		//lay thong tin cac chi tiet san pham
		// var chitietsp={};
		$(this).closest('tr').find('.the-an.chitietsanpham').each(function(index, el) {
			//clone sau do gan gia tri cho clone
			if (index==0) {
				$('select[name="mausp"]').val($(this).attr('data-mamau'));
				$('select[name="sizesp"]').val($(this).attr('data-masize'));
				$('input[name="soluongsp"]').val($(this).attr('data-soluong'));
				$('input[name="mactsp"]').val($(this).attr('data-mactsp'));
			}else{
				var elmtclone1=$('div.divclone').clone();
				elmtclone1.removeAttr('class');
				elmtclone1.find('select[name="mausp"]').val($(this).attr('data-mamau'));
				elmtclone1.find('select[name="sizesp"]').val($(this).attr('data-masize'));
				elmtclone1.find('input[name="soluongsp"]').val($(this).attr('data-soluong'));
				elmtclone1.find('input[name="mactsp"]').val($(this).attr('data-mactsp'));
				$('#chitietsanphamform').append(elmtclone1);
			}
		});
	});	

	$('body').on('click', '.btnXoaSanPham', function(event) {
		console.log('xoa san pham');
		var masp=$(this).closest('.thongtinsanpham').find('td').first().text();
		console.log(masp);
		$(this).closest(".thongtinsanpham").remove();
		$.ajax({
			type: "DELETE",
			url: "/ElectroShop/api/XoaSanPham/"+masp,
			success: function (response) {
				console.log(response);
			}
		});
	});

	$('#btnThemChiTietSanPham').click(function(event) {
		clonephantu('#chitietsanphamform');
	});

	$('#btnSubmitThemSanPhamForm').click(function(event) {
		event.preventDefault();
		if ($(this).text()=='Thêm sản phẩm') {
			url='/ElectroShop/api/ThemSanPham';
			var type='POST';
		} else {
			url='/ElectroShop/api/CapNhatSanPham';
			var type='POST';
		}
		var fields=$('#formThemSanPham').serializeArray();
		json={};
		chitietsp=[];
		tempObj={};
		$.each(fields, function(i, field){
			if (field.name=='mausp'||field.name=='sizesp'||field.name=='soluongsp'||field.name=='mactsp') {
				tempObj[field.name]=field.value;
				if (field.name=='mactsp') {
					chitietsp.push(tempObj);
					tempObj={};
				}
			}
			else json[field.name]=field.value;
		});
		json["hinhsp"]=hinhsp;
	    json["chitietsanpham"]=chitietsp;
	   $.ajax({
			url:url,
			type:type,
		    data:{
		    	dataJson: JSON.stringify(json)
		    },
			success: function(value){
				if(url=='/ElectroShop/api/ThemSanPham'){
					$('#ketqua').text('Thêm sản phẩm thành công');
					$('#ketqua').attr('style','color: limegreen;font-weight: bold;');
				}else{
					$('#ketqua').text('Cập nhật sản phẩm thành công');
					$('#ketqua').attr('style','color: limegreen;font-weight: bold;');
				}
			},
		    error: function (error) {
		    	if(url=='/ElectroShop/api/ThemSanPham'){
		    		$('#ketqua').text('Thêm sản phẩm thất bại');
					$('#ketqua').attr('style','color: red;font-weight: bold;');
				}else{
					$('#ketqua').text('Cập nhật sản phẩm thất bại');
					$('#ketqua').attr('style','color: red;font-weight: bold;');
				}
				
		        alert('error; ' + eval(error));
		    }
		})

	});

	$('#pagination-dashboardsanpham li').click(function (event) { 
		event.preventDefault();
		$('#pagination-dashboardsanpham li').removeClass('active');
		$(this).addClass('active');
		var vitribatdau=$(this).text();
		vitribatdau=(vitribatdau-1)*5;
		$.ajax({
			url:"/ElectroShop/api/LaySanPhamLimit",
			type: "GET",
		    data:{
		    	vitribatdau:vitribatdau
		    },
			success: function(value){
				var clone=$(".thongtinsanpham:nth-child(1)").clone();
				$("#tableSanPham tbody").children().remove();
				for (var index = 0; index < value.length; index++) {
					clone.find('td:nth-child(1)').text(value[index].idSanPham);
					clone.find('td:nth-child(2) div img').attr('src',"/ElectroShop"+value[index].image.split(";")[0]);
					clone.find('td:nth-child(3)').text(value[index].tenSanPham);
					clone.find('td:nth-child(4)').text(value[index].gia);
					clone.find('td:nth-child(5)').text(value[index].baoHanh);
					clone.find('td:nth-child(6)').text(value[index].tinhTrang);
					clone.find('td:nth-child(7)').attr('data-madm',value[index].danhMuc.idDanhMuc);
					clone.find('td:nth-child(7)').attr('data-math',value[index].thuongHieu.idThuongHieu);
					clone.find('td:nth-child(7)').text(value[index].moTa);
					var clonectsp=clone.find('td:nth-child(8)');
					clone.find('.chitietsanpham').remove();
					var lstChiTietSanPham=value[index].lstChiTietSanPham;
					for (var i = 0; i < lstChiTietSanPham.length; i++) {
						clonectsp.attr('data-mactsp',lstChiTietSanPham[i].idChiTietSanPham);
						clonectsp.attr('data-mamau',lstChiTietSanPham[i].mauSanPham.idMau);
						clonectsp.attr('data-masize',lstChiTietSanPham[i].sizeSanPham.idSize);
						clonectsp.attr('data-soluong',lstChiTietSanPham[i].soLuong);
						clone.find('td:nth-child(7)').after(clonectsp[0].outerHTML);
					}
					
					$("#tableSanPham tbody").append(clone[0].outerHTML);
				}
			}
		})
	});
	//upload file
	var hinhsp="";
	$('#hinhsp').change(function(event) {
		files=event.target.files;
		namefiles='Hình ảnh: ';
		var form =new FormData();
		for(x of files){
			hinhsp=hinhsp+"/resources/img/"+x.name+";";
			namefiles+=x.name+' ';
			form.append("file",x);
			uploadNext(form);
			console.log(form.get("file"));
			form.delete("file");
			console.log(x.name);
		}
		$('label[for="hinhsp"]').text(namefiles);
	})
	function uploadNext(form) {
		$.ajax({
			url:"/ElectroShop/api/UploadFile",
		    type:"POST",
		    data:form,
		    contentType:false,
		    processData:false,
		    enctype: "multipart/form-data",
			success: function(value){
				
			}
		})
	}

	$('body').on('click', '.btnXoaChiTietSanPham', function(event) {
		event.preventDefault();
		$(this).closest('div[ten="ctsp"]').remove();
	});
	
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
	function clonephantu(idphantu) {
		var elmtclone1=elmtclone;
//		 var elmtclone1=$('div.divclone').clone();
		 elmtclone1.removeAttr('class');
		$(idphantu).append(elmtclone1[0].outerHTML);
	}
	
//hoadondashboard.jsp
	//load thong tin hoa don vao form
	$('body').on('click','.fa-edit', function () {
		$('#ketqua').text('');
		var mahd=$(this).closest('tr').find('td:nth-child(1)').text();
		var tennguoinhan=$(this).closest('tr').find('td:nth-child(2)').text();
		var sodienthoai=$(this).closest('tr').find('td:nth-child(3)').text();
		var diachigiaohang=$(this).closest('tr').find('td:nth-child(4)').text();
		var ghichuhoadon=$(this).closest('tr').find('td:nth-child(5)').text();
		var tinhtranghoadon=$(this).closest('tr').find('td:nth-child(7) div span').attr('value');
		$('#mahd').val(mahd);
		$('#tennguoinhan').val(tennguoinhan);
		$('#sodienthoai').val(sodienthoai);
		$('#diachigiaohang').val(diachigiaohang);
		$('#ghichuhoadon').val(ghichuhoadon);
		$('#tinhtranghoadon').val(tinhtranghoadon);
		
	});
	//pagination hoa don
	$('#pagination-dashboardhoadon li').click(function (event) { 
		event.preventDefault();
		$('#pagination-dashboardhoadon li').removeClass('active');
		$(this).addClass('active');
		var vitribatdau=$(this).text();
		vitribatdau=(vitribatdau-1)*5;
		$.ajax({
			url:"/ElectroShop/api/LayHoaDonLimit",
			type: "GET",
		    data:{
		    	vitribatdau:vitribatdau
		    },
			success: function(value){
				var clone=$(".thongtinhoadon:nth-child(1)").clone();
				$("#tableHoaDon tbody").children().remove();
				for (var index = 0; index < value.length; index++) {
					clone.find('td:nth-child(1)').text(value[index].idHoaDon);
					clone.find('td:nth-child(2)').text(value[index].tenNguoiNhan);
					clone.find('td:nth-child(3)').text(value[index].soDTNguoiNhan);
					clone.find('td:nth-child(4)').text(value[index].diaChiGiaoHang);
					clone.find('td:nth-child(5)').text(value[index].ghiChu);
					clone.find('td:nth-child(6)').text(value[index].ngayMua.dayOfMonth+'/'+value[index].ngayMua.monthValue+'/'+value[index].ngayMua.year+' '+value[index].ngayMua.hour+':'+value[index].ngayMua.minute+':'+value[index].ngayMua.second);
					switch (value[index].tinhTrang) {
						case 0:
							clone.find('td:nth-child(7) div span').attr('class','badge badge-brand mr-2');
							clone.find('td:nth-child(7) div span').text('Đang xử lý');
							clone.find('td:nth-child(7) div span').attr('value',0);
							break;
						case 1:
							clone.find('td:nth-child(7) div span').attr('class','badge badge-info mr-2');
							clone.find('td:nth-child(7) div span').text('Đã thanh toán');
							clone.find('td:nth-child(7) div span').attr('value',1);
							break;
						case 2:
							clone.find('td:nth-child(7) div span').attr('class','badge badge-primary mr-2');
							clone.find('td:nth-child(7) div span').text('Đang giao hàng');
							clone.find('td:nth-child(7) div span').attr('value',2);
							break;
						case 3:
							clone.find('td:nth-child(7) div span').attr('class','badge badge-success mr-2');
							clone.find('td:nth-child(7) div span').text('Đã giao hàng');
							clone.find('td:nth-child(7) div span').attr('value',3);
							break;
						case 4:
							clone.find('td:nth-child(7) div span').attr('class','badge badge-danger mr-2');
							clone.find('td:nth-child(7) div span').text('Đã hủy');
							clone.find('td:nth-child(7) div span').attr('value',4);
							break;
						default:
							break;
					}
					$("#tableHoaDon tbody").append(clone[0].outerHTML);
				}
			}
		})
	});
	//UpdateHoaDon
	$('#btnSubmitHoaDonForm').click(function(event) {
		event.preventDefault();
		var fields=$('#formUpdateHoaDon').serializeArray();
		json={};
		$.each(fields, function(i, field){
			json[field.name]=field.value;
		});
	   $.ajax({
			url:'/ElectroShop/api/UpdateHoaDon',
			type:'POST',
		    data:{
		    	dataJson: JSON.stringify(json)
		    },
			success: function(value){
					$('#ketqua').text('Cập nhật hóa đơn thành công');
					$('#ketqua').attr('style','color: limegreen;font-weight: bold;');
			},
		    error: function (error) {
					$('#ketqua').text('Cập nhật hóa đơn thất bại');
					$('#ketqua').attr('style','color: red;font-weight: bold;');
		        console.log('error; ' + eval(error));
		    }
		})

	});
	
})