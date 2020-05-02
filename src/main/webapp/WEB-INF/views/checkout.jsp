<%@page import="java.util.ArrayList"%>
<%@page import="electro.entity.GioHang"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Đặt hàng</title>

 		<!-- Google font -->
 		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

 		<!-- Bootstrap -->
 		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>"/>

 		<!-- Slick -->
 		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/slick.css"/>"/>
 		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/slick-theme.css"/>"/>

 		<!-- nouislider -->
 		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/nouislider.min.css"/>"/>

 		<!-- Font Awesome Icon -->
 		<link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>">

 		<!-- Custom stlylesheet -->
 		<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

    </head>
	<body>
		<%
		List<GioHang> lstGioHangs=new ArrayList();
		if(request.getAttribute("giohang")!=null){
			lstGioHangs=(List<GioHang>)request.getAttribute("giohang");
		}
		%>
		<jsp:include page="header.jsp"></jsp:include>
		<!-- NAVIGATION -->
		<nav id="navigation">
			<!-- container -->
			<div class="container">
				<!-- responsive-nav -->
				<div id="responsive-nav">
					<!-- NAV -->
					<ul class="main-nav nav navbar-nav">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">Hot Deals</a></li>
						<li><a href="#">Categories</a></li>
						<li><a href="#">Laptops</a></li>
						<li><a href="#">Smartphones</a></li>
						<li><a href="#">Cameras</a></li>
						<li><a href="#">Accessories</a></li>
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		<!-- /NAVIGATION -->

		<!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="breadcrumb-header">Checkout</h3>
						<ul class="breadcrumb-tree">
							<li><a href="#">Home</a></li>
							<li class="active">Checkout</li>
						</ul>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /BREADCRUMB -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			
			<div class="container">
				<!-- row -->
				<div class="row">

					<div class="col-md-6">
					<span id="ketqua" value=${kqThemHoaDon }></span>
						<!-- Billing Details -->
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Thông tin nhận hàng</h3>
							</div>
							<div class="form-group">
								<input class="input tenNguoiNhan" type="text" name="first-name" placeholder="Họ tên người nhận hàng">
							</div>
							<div class="form-group">
								<input class="input soDTNguoiNhan" type="tel" name="tel" placeholder="Số điện thoại người nhận">
							</div>
							<div class="form-group">
								<input class="input diaChiGiaoHang" type="text" name="address" placeholder="Địa chỉ giao hàng">
							</div>
							<div class="form-group">
								<div class="input-checkbox">
									<input type="checkbox" id="create-account">
									<label for="create-account">
										<span></span>
										Create Account?
									</label>
									<div class="caption">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>
										<input class="input" type="password" name="password" placeholder="Nhập mật khẩu của bạn">
									</div>
								</div>
							</div>
						</div>
						<!-- /Billing Details -->

						<!-- Shiping Details -->
						<div class="shiping-details">
							<div class="section-title">
								<h3 class="title">Shiping address</h3>
							</div>
							<div class="input-checkbox">
								<input type="checkbox" id="shiping-address">
								<label for="shiping-address">
									<span></span>
									Ship to a diffrent address?
								</label>
								<div class="caption">
									<div class="form-group">
										<input class="input" type="text" name="first-name" placeholder="First Name">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="last-name" placeholder="Last Name">
									</div>
									<div class="form-group">
										<input class="input" type="email" name="email" placeholder="Email">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="address" placeholder="Address">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="city" placeholder="City">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="country" placeholder="Country">
									</div>
									<div class="form-group">
										<input class="input" type="text" name="zip-code" placeholder="ZIP Code">
									</div>
									<div class="form-group">
										<input class="input" type="tel" name="tel" placeholder="Telephone">
									</div>
								</div>
							</div>
						</div>
						<!-- /Shiping Details -->

						<!-- Order notes -->
						<div class="order-notes">
							<textarea class="input ghichu" placeholder="Ghi chú"></textarea>
						</div>
						<!-- /Order notes -->
					</div>

					<!-- Order Details -->
					<div class="col-md-6 order-details">
						<div class="section-title text-center">
							<h3 class="title">Chi tiết đơn hàng</h3>
						</div>
						<div class="order-summary">
							<div class="order-col">
								<table class="table table-striped">
								  <thead>
								    <tr>
								      <th scope="col">Tên sản phẩm</th>
								      <th scope="col">Màu</th>
								      <th scope="col">Size</th>
								      <th scope="col">Số lượng</th>
								       <th scope="col">Giá tiền</th>
								        <th scope="col"></th>
								    </tr>
								  </thead>
								  <tbody>
								  	<%
										for(GioHang gioHang:lstGioHangs){
									%>
								    <tr>
								      <td class="idsanpham" value=<%=gioHang.getIdSanPham()%>><%=gioHang.getTenSanPham().trim()%></td>
								      <td class="idmau" value=<%=gioHang.getIdMau() %>><%=gioHang.getTenMau()%></td>
								      <td class="idsize" value=<%=gioHang.getIdSize()%>><%=gioHang.getTenSize()%></td>
								      <td><%=gioHang.getSoLuong()%></td>
								      <td class="sotien giatien"><%=gioHang.getGiasp()*gioHang.getSoLuong()%></td>
								      <td><button class="btn btn-danger btn-xoa-giohang">Xóa</button></td>
								    </tr>
								    <% }%>
								  </tbody>
								</table>
							</div>
							<div class="order-col">
								<div>Shiping</div>
								<div><strong>FREE</strong></div>
							</div>
							<div class="order-col">
								<div><strong>TỔNG TIỀN</strong></div>
								<div><strong class="order-total" id="tongtien">$2940.00</strong></div>
							</div>
						</div>
						<div class="payment-method">
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-1">
								<label for="payment-1">
									<span></span>
									Direct Bank Transfer
								</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-2">
								<label for="payment-2">
									<span></span>
									Cheque Payment
								</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
							<div class="input-radio">
								<input type="radio" name="payment" id="payment-3">
								<label for="payment-3">
									<span></span>
									Paypal System
								</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="terms">
							<label for="terms">
								<span></span>
								I've read and accept the <a href="#">terms & conditions</a>
							</label>
						</div>

						<a href="" class="primary-btn order-submit btn-dathang">Đặt hàng</a>
					</div>
					<!-- /Order Details -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- NEWSLETTER -->
		<div id="newsletter" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<div class="newsletter">
							<p>Sign Up for the <strong>NEWSLETTER</strong></p>
							<form>
								<input class="input" type="email" placeholder="Enter Your Email">
								<button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
							</form>
							<ul class="newsletter-follow">
								<li>
									<a href="#"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-twitter"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-instagram"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-pinterest"></i></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /NEWSLETTER -->

		<!-- FOOTER -->
		<footer id="footer">
			<!-- top footer -->
			<div class="section">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">About Us</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
								<ul class="footer-links">
									<li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
									<li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
									<li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Categories</h3>
								<ul class="footer-links">
									<li><a href="#">Hot deals</a></li>
									<li><a href="#">Laptops</a></li>
									<li><a href="#">Smartphones</a></li>
									<li><a href="#">Cameras</a></li>
									<li><a href="#">Accessories</a></li>
								</ul>
							</div>
						</div>

						<div class="clearfix visible-xs"></div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Information</h3>
								<ul class="footer-links">
									<li><a href="#">About Us</a></li>
									<li><a href="#">Contact Us</a></li>
									<li><a href="#">Privacy Policy</a></li>
									<li><a href="#">Orders and Returns</a></li>
									<li><a href="#">Terms & Conditions</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Service</h3>
								<ul class="footer-links">
									<li><a href="#">My Account</a></li>
									<li><a href="#">View Cart</a></li>
									<li><a href="#">Wishlist</a></li>
									<li><a href="#">Track My Order</a></li>
									<li><a href="#">Help</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /top footer -->
		</footer>
		<!-- /FOOTER -->

		<!-- jQuery Plugins -->
		<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
		<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
		<script src="<c:url value="/resources/js/slick.min.js"/>"></script>
		<script src="<c:url value="/resources/js/nouislider.min.js"/>"></script>
		<script src="<c:url value="/resources/js/jquery.zoom.min.js"/>"></script>
		<script src="<c:url value="/resources/js/main.js"/>"></script>
		<script src="<c:url value="/resources/js/custom.js"/>"></script>
		<script type="text/javascript">
			document.addEventListener("DOMContentLoaded",function () {
				var ketqua=document.getElementById("ketqua");
				if(ketqua.getAttribute("value")=="false"){
					ketqua.setAttribute("style",'color: red;font-weight: bold;')
					ketqua.innerHTML="Đặt hàng thất bại";
				}
				else if(ketqua.getAttribute('value')=="true"){
					ketqua.setAttribute("style",'color: limegreen;font-weight: bold;');
					ketqua.innerHTML="Đặt hàng thành công";
				}
				//xu ly dat hang
				var dathang=document.querySelector('.btn-dathang');
				dathang.onclick=function () {
					var tenNguoiNhan=document.querySelector(".tenNguoiNhan");
					var soDTNguoiNhan=document.querySelector(".soDTNguoiNhan");
					var diaChiGiaoHang=document.querySelector(".diaChiGiaoHang");
					var ghichu=document.querySelector(".ghichu");
					var href="thanhtoan/"+tenNguoiNhan.value+"/"+soDTNguoiNhan.value+"/"+diaChiGiaoHang.value+"/"+ghichu.value+"";
					dathang.setAttribute("href",href);
				}
				//tinh tong tien
				var x=document.getElementsByClassName("sotien");
				var tongtien=document.getElementById("tongtien");
				var tong=0;
				for (var i = 0; i < x.length; i++) {
					tong+= parseInt(x[i].innerHTML.split('.').join(''));
				}
				tongtien.textContent=tong.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
			},false)
		</script>
	</body>
</html>
