<%@page import="electro.entity.ThuongHieu"%>
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

<title>Cửa hàng đồ điện tử</title>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>" />

<!-- Slick -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/css/slick.css"/>" />
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/css/slick-theme.css"/>" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/css/nouislider.min.css"/>" />

<!-- Font Awesome Icon -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/font-awesome.min.css"/>">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/css/style.css"/>" />

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
		List<SanPham> lstSanPham = (List<SanPham>) request.getAttribute("lstSanPham");
		List<ThuongHieu> lstThuongHieu = (List<ThuongHieu>) request.getAttribute("lstThuongHieu");
		List<Long> lstSoLuongTheoDM = (List<Long>) request.getAttribute("lstSoLuongTheoDM");
		List<Long> lstSoLuongTheoTH = (List<Long>) request.getAttribute("lstSoLuongTheoTH");
		List<SanPham> lstSPTimKiem = (List<SanPham>) request.getAttribute("lstSPTimKiem");
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
					<li><a href="./">Trang chủ</a></li>
					<li class="active"><a href="./SanPham">Sản phẩm</a></li>
					<li><a href="#">Loại sản phẩm</a></li>
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
					<ul class="breadcrumb-tree">
						<li><a href="./">Trang chủ</a></li>
						<li><a href="/ElectroShop/SanPham">Sản phẩm</a></li>
					</ul>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /BREADCRUMB -->

	<!-- SECTION -->
	<form method="get">
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- ASIDE -->
					<div id="aside" class="col-md-3">
						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">Loại sản phẩm</h3>

							<div class="checkbox-filter">
								<%
									int i = 0;
									for (DanhMuc danhmuc : lstdanhmuc) {
										i++;
								%>

								<div class="input-checkbox">
									<input type="checkbox" id="category-<%=i%>" name="category"
										value="<%=danhmuc.getIdDanhMuc()%>"> <label
										for="category-<%=i%>"> <span></span><%=danhmuc.getTenDanhMuc()%>
										<small>(<%=lstSoLuongTheoDM.get(i - 1)%>)
									</small>
									</label>

								</div>
								<%
									}
								%>
								<button class="search-btn-2" type="submit">Tìm kiếm</button>
							</div>

						</div>
						<!-- /aside Widget -->

						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">Giá</h3>
							<div class="price-filter">
								<div id="price-slider"></div>
								<div class="input-number">
									<input type="number" placeholder="Từ" name="price-from">
									<span class="qty-up">+</span> <span class="qty-down">-</span>
								</div>
								<span>-</span>
								<div class="input-number">
									<input type="number" placeholder="Đến" name="price-to">
									<span class="qty-up">+</span> <span class="qty-down">-</span>
								</div>
							</div>
						</div>
						<!-- /aside Widget -->

						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">Thương hiệu</h3>
							<%
								int j = 0;
								for (ThuongHieu thuonghieu : lstThuongHieu) {
									j++;
							%>
							<div class="checkbox-filter">
								<div class="input-checkbox">
									<input type="checkbox" id="brand-<%=j%>" name="brand"
										value="<%=thuonghieu.getIdThuongHieu()%>" /> <label
										for="brand-<%=j%>"> <span></span> <%=thuonghieu.getTenThuongHieu()%>
										<small>(<%=lstSoLuongTheoTH.get(j - 1)%>)
									</small>
									</label>
								</div>
							</div>
							<%
								}
							%>
							<button class="search-btn-2" type="submit">Tìm kiếm</button>
						</div>
						<!-- /aside Widget -->

						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">Sản phẩm bán chạy</h3>
							<%
								for (SanPham sp : lstSanPham) {
							%>
							<div class="product-widget">
								<a href="ChiTiet/<%=sp.getIdSanPham()%>">
									<div class="product-img">
										<img src="<c:url value="<%=sp.GetListImage()[0]%>"/>" alt="">
									</div>
								</a>
								<div class="product-body">
									<p class="product-category"><%=sp.getThuongHieu().getTenThuongHieu()%></p>
									<h3 class="product-name">
										<a href="ChiTiet/<%=sp.getIdSanPham()%>"><%=sp.getTenSanPham()%></a>
									</h3>
									<h4 class="product-price">
										<%=sp.getGia()%>
										<del class="product-old-price"><%=sp.getGia()%></del>
									</h4>
								</div>
							</div>
							<%
								}
							%>
						</div>
						<!-- /aside Widget -->
					</div>

					<!-- /ASIDE -->

					<!-- STORE -->
					<div id="store" class="col-md-9">
						<!-- store top filter -->
						<div class="store-filter clearfix">
							<div class="store-sort">

								<label> Sắp xếp: <select class="input-select" id="sort"
									name="sort">
										<option value="0">--- Chọn ---</option>
										<option value="1">Mới nhất</option>
										<option value="2">Bán chạy nhất</option>
										<option value="3">Giá từ thấp đến cao</option>
										<option value="4">Giá từ cao đến thấp</option>
								</select>
								</label> <label> Hiển thị: <select class="input-select"
									name="show">
										<option value="0">20 sản phẩm</option>
										<option value="1">50 sản phẩm</option>
										<option value="2">100 sản phẩm</option>
								</select>
								</label>

							</div>
						</div>
						<!-- /store top filter -->

						<!-- store products -->

						<div class="row">
							<%
								for (SanPham sp : lstSPTimKiem) {
							%>
							<!-- product -->
							<div class="col-md-4 col-xs-6">
								<div class="product">
									<a href="ChiTiet/<%=sp.getIdSanPham()%>">
										<div class="product-img">
											<img src="<c:url value="<%=sp.GetListImage()[0]%>"/>" alt="">
											<div class="product-label">
												<span class="sale">-30%</span> <span class="new">NEW</span>
											</div>
										</div>
									</a>
									<div class="product-body">
										<p class="product-category">Category</p>
										<h3 class="product-name">
											<a href="ChiTiet/<%=sp.getIdSanPham()%>"> <%=sp.getTenSanPham()%></a>
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
									<div class="add-to-cart">
										<button class="add-to-cart-btn btn-giohang-trangchu"
											data-masp=<%=sp.getIdSanPham()%> data-giasp=<%=sp.getGia()%>>
											<span class="the-an"><%=sp.getTenSanPham()%></span> <i
												class="fa fa-shopping-cart"></i> add to cart
										</button>
									</div>
								</div>
							</div>
							<!-- /product -->

							<div class="clearfix visible-sm visible-xs"></div>
							<%
								}
							%>
						</div>
						<!-- /store products -->

						<!-- store bottom filter -->
						<div class="store-filter clearfix">
							<span class="store-qty">Showing 20-100 products</span>
							<ul class="store-pagination">
								<li class="active">1</li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
							</ul>
						</div>
						<!-- /store bottom filter -->
					</div>
					<!-- /STORE -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
	</form>

	<!-- NEWSLETTER -->
	<div id="newsletter" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="newsletter">
						<p>
							Sign Up for the <strong>NEWSLETTER</strong>
						</p>
						<form>
							<input class="input" type="email" placeholder="Enter Your Email">
							<button class="newsletter-btn">
								<i class="fa fa-envelope"></i> Subscribe
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

		<!-- bottom footer -->
		<div id="bottom-footer" class="section">
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12 text-center">
						<ul class="footer-payments">
							<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
							<li><a href="#"><i class="fa fa-credit-card"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
						</ul>
						<span class="copyright"> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>
								document.write(new Date().getFullYear());
							</script> All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</span>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bottom footer -->
	</footer>
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.session.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/slick.min.js"/>"></script>
	<script src="<c:url value="/resources/js/nouislider.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.zoom.min.js"/>"></script>
	<script src="<c:url value="/resources/js/main.js"/>"></script>
	<script src="<c:url value="/resources/js/custom.js"/>"></script>
	
	<script>
		$(document).ready(function() {
			$('#sort').change(function() {
				$.session.set('#sort', $('#sort').val());
				$(this).parents("form").submit();
			})
		});

		$(function () { 
			if($.session.get('#sort')!=null)
				$('#sort').val($.session.get('#sort'));

        });
	</script>
</body>
</html>
