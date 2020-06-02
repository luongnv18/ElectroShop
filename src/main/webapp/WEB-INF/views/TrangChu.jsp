<%@page import="electro.entity.SanPham"%>
<%@page import="electro.entity.DanhMuc"%>
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

<title>Electro Shop</title>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/slick.css"/>" />
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/slick-theme.css"/>" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/nouislider.min.css"/>" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" />
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/custom.css"/>" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>
<body>
	<%
		List<DanhMuc> lstdanhmuc = (List<DanhMuc>) request.getAttribute("lstDanhMuc");
		List<SanPham> lstSP = (List<SanPham>) request.getAttribute("lstSanPham");
		List<SanPham> lstSPBanChay = (List<SanPham>) request.getAttribute("lstSPBanChay");
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
					<li class="active"><a href="./">Trang chủ</a></li>
					<li><a href="./SanPham">Sản phẩm</a></li>
				</ul>
				<!-- /NAV -->
			</div>
			<!-- /responsive-nav -->
		</div>
		<!-- /container -->
	</nav>
	<!-- /NAVIGATION -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- shop -->
				<div class="col-md-4 col-xs-6">
					<a href="./SanPham?category=1" class="cta-btn">
					<div class="shop">
						<div class="shop-img">
							<img src="<c:url value="/resources/img/shop01.png"/>" alt="">
						</div>
						<div class="shop-body">
							<h3>
								Bộ sưu tập<br>Laptop
							</h3>
							<a href="./SanPham?category=1" class="cta-btn">Shop now <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					</a>
				</div>
				<!-- /shop -->

				<!-- shop -->
				<div class="col-md-4 col-xs-6">
				<a href="./SanPham?category=2" class="cta-btn">
					<div class="shop">
						<div class="shop-img">
							<img src="<c:url value="/resources/img/shop03.png"/>" alt="">
						</div>
						<div class="shop-body">
							<h3>
								Bộ sưu tập<br>Tai nghe
							</h3>
							<a href="./SanPham?category=2" class="cta-btn">Shop now <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</a>
				</div>
				<!-- /shop -->

				<!-- shop -->
				<div class="col-md-4 col-xs-6">
				<a href="./SanPham?category=3" class="cta-btn">
					<div class="shop">
						<div class="shop-img">
							<img src="<c:url value="/resources/img/shop02.png"/>" alt="">
						</div>
						<div class="shop-body">
							<h3>
								Bộ sưu tập<br>Máy ảnh
							</h3>
							<a href="./SanPham?category=3" class="cta-btn">Shop now <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					</a>
				</div>
				<!-- /shop -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h3 class="title">SẢN PHẨM MỚI</h3>
						
					</div>
				</div>
				<!-- /section title -->
				
				<!-- Products tab & slick -->
				<div class="col-md-12">
					<div class="row">
						<div class="products-tabs">
							<!-- tab -->
							<div id="tab1" class="tab-pane active">
								<div class="products-slick" data-nav="#slick-nav-1">
									<%
										for (SanPham sp : lstSP) {
									%>
									<!-- product -->

									<div class="product">
										<a href="ChiTiet/<%=sp.getIdSanPham()%>">
											<div class="product-img">
												<img src="<c:url value="<%=sp.GetListImage()[0]%>"/>"
													alt="">
												<div class="product-label">
													<span class="sale">30%</span> <span class="new">NEW</span>
												</div>
											</div>
										</a>

										<div class="product-body">
											<p class="product-category"></p>
											<h3 class="product-name">
												<a href="ChiTiet/<%=sp.getIdSanPham()%>"> <%=sp.getTenSanPham()%>
												</a>
											</h3>
											<h4 class="product-price">
												<%=sp.getGia()%>
												<del class="product-old-price"><%=sp.getGia()%></del>
											</h4>
											<div class="product-rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>

											<div class="product-btns">
												<button class="add-to-wishlist">
													<i class="fa fa-heart-o"></i><span class="tooltipp">add
														to wishlist</span>
												</button>
												<button class="add-to-compare">
													<i class="fa fa-exchange"></i><span class="tooltipp">add
														to compare</span>
												</button>
												<button class="quick-view">
													<i class="fa fa-eye"></i><span class="tooltipp">quick
														view</span>
												</button>
											</div>
										</div>
										<div class="add-to-cart" >
											<button class="add-to-cart-btn btn-giohang-trangchu" data-masp=<%=sp.getIdSanPham()%> data-giasp=<%=sp.getGia() %> data-image=<%=sp.GetListImage()[0] %>>
												<span class="the-an tensanpham" data-idmau=<%=sp.getLstChiTietSanPham().get(0).getMauSanPham().getIdMau() %> data-idsize=<%=sp.getLstChiTietSanPham().get(0).getSizeSanPham().getIdSize() %>
												data-tenmau=<%=sp.getLstChiTietSanPham().get(0).getMauSanPham().getMau() %>
												data-idctsp=<%=sp.getLstChiTietSanPham().get(0).getIdChiTietSanPham() %>>
												<%=sp.getTenSanPham() %></span>
												<span class="the-an tensize"><%=sp.getLstChiTietSanPham().get(0).getSizeSanPham().getSize() %></span>
												<span class="the-an tenmau"><%=sp.getLstChiTietSanPham().get(0).getMauSanPham().getMau() %></span>
												<i class="fa fa-shopping-cart"></i> add to cart
											</button>
										</div>
									</div>
									<%}%>
								</div>
								<div id="slick-nav-1" class="products-slick-nav"></div>
							</div>
							<!-- /tab -->
						</div>
					</div>
				</div>

				<!-- Products tab & slick -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- HOT DEAL SECTION -->
	<div id="hot-deal" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="hot-deal">
						<ul class="hot-deal-countdown">
							<li>
								<div>
									<h3>02</h3>
									<span>Days</span>
								</div>
							</li>
							<li>
								<div>
									<h3>10</h3>
									<span>Hours</span>
								</div>
							</li>
							<li>
								<div>
									<h3>34</h3>
									<span>Mins</span>
								</div>
							</li>
							<li>
								<div>
									<h3>60</h3>
									<span>Secs</span>
								</div>
							</li>
						</ul>
						<h2 class="text-uppercase">Ưu đãi cực lớn</h2>
						<p>Giảm giá lên đến 50%</p>
						<a class="primary-btn cta-btn" href="./SanPham">Shop now</a>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /HOT DEAL SECTION -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h3 class="title">SẢN PHẨM BÁN CHẠY</h3>						
					</div>
				</div>
				<!-- /section title -->

				<!-- Products tab & slick -->
				<div class="col-md-12">
					<div class="row">
						<div class="products-tabs">
							<!-- tab -->
							<div id="tab2" class="tab-pane fade in active">
								<div class="products-slick" data-nav="#slick-nav-2">
									<%
										int i = 0;
										for (SanPham sp : lstSPBanChay) {
											i++;
									%>
									<!-- product -->
										
									<div class="product">
									<a href="ChiTiet/<%=sp.getIdSanPham()%>">
										<div class="product-img">
											<img src="<c:url value="<%=sp.GetListImage()[0]%>"/>"
												alt="">
											<div class="product-label">
												<span class="sale">Còn <%=sp.getLstChiTietSanPham().get(0).getSoLuong()%> sản phẩm</span> <span class="new">TOP <%=i%></span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category"><%=sp.getDanhMuc().getTenDanhMuc() %></p>
											<h3 class="product-name">
												<a href="#"><%=sp.getTenSanPham() %></a>
											</h3>
											<h4 class="product-price">
												<%=sp.getGia() %>
												<del class="product-old-price"><%=sp.getGia() %></del>
											</h4>
											<div class="product-rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product-btns">
												<button class="add-to-wishlist">
													<i class="fa fa-heart-o"></i><span class="tooltipp">add
														to wishlist</span>
												</button>
												<button class="add-to-compare">
													<i class="fa fa-exchange"></i><span class="tooltipp">add
														to compare</span>
												</button>
												<button class="quick-view">
													<i class="fa fa-eye"></i><span class="tooltipp">quick
														view</span>
												</button>
											</div>
										</div>
										<div class="add-to-cart" >
											<button class="add-to-cart-btn btn-giohang-trangchu" data-masp=<%=sp.getIdSanPham()%> data-giasp=<%=sp.getGia() %> data-image=<%=sp.GetListImage()[0] %>>
												<span class="the-an tensanpham" data-idmau=<%=sp.getLstChiTietSanPham().get(0).getMauSanPham().getIdMau() %> data-idsize=<%=sp.getLstChiTietSanPham().get(0).getSizeSanPham().getIdSize() %>
												data-tenmau=<%=sp.getLstChiTietSanPham().get(0).getMauSanPham().getMau() %>
												data-idctsp=<%=sp.getLstChiTietSanPham().get(0).getIdChiTietSanPham() %>>
												<%=sp.getTenSanPham() %></span>
												<span class="the-an tensize"><%=sp.getLstChiTietSanPham().get(0).getSizeSanPham().getSize() %></span>
												<span class="the-an tenmau"><%=sp.getLstChiTietSanPham().get(0).getMauSanPham().getMau() %></span>
												<i class="fa fa-shopping-cart"></i> add to cart
											</button>
										</div>
										</a>
									</div>
									<!-- /product -->
									
									<% 
										} 
									%>
	
								</div>
								<div id="slick-nav-2" class="products-slick-nav"></div>
							</div>
							<!-- /tab -->
						</div>
					</div>
				</div>
				<!-- /Products tab & slick -->
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
						<p>
							Đăng ký <strong>MUA HÀNG</strong>
						</p>
						<form>
							<input class="input" type="email" placeholder="Nhập Email của bạn">
							<button class="newsletter-btn">
								<i class="fa fa-envelope"></i> ĐĂNG KÝ
							</button>
						</form>
						<ul class="newsletter-follow">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram"></i></a></li>
							<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
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
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut.</p>
							<ul class="footer-links">
								<li><a href="#"><i class="fa fa-map-marker"></i>1734
										Stonecoal Road</a></li>
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

</body>
</html>
