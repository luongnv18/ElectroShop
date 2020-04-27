<%@page import="java.util.ArrayList"%>
<%@page import="electro.entity.GioHang"%>
<%@page import="electro.entity.DanhMuc"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
		List<DanhMuc> lstDanhMucs = (List<DanhMuc>) request.getAttribute("lstDanhMuc");
		List<GioHang> lstGioHangs=new ArrayList();
		if(request.getAttribute("giohang")!=null){
			lstGioHangs=(List<GioHang>)request.getAttribute("giohang");
		}

	%>
	<%=lstGioHangs.size() %>
	<!-- HEADER -->
	<header>
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
					<li><a href="#"><i class="fa fa-envelope-o"></i>
							email@email.com</a></li>
					<li><a href="#"><i class="fa fa-map-marker"></i> 236 Hoàng
							Quốc Việt, Cầu Giấy, Hà Nội</a></li>
				</ul>
				<ul class="header-links pull-right">
					<li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
					<%
						String email = "Đăng Nhập";
						if (request.getAttribute("email") != null)
							email = "Xin chào " + request.getAttribute("email").toString();
					%>
					<li><a href="DangNhap"><i class="fa fa-user-o"></i><%=email%></a></li>
				</ul>
			</div>
		</div>
		<!-- /TOP HEADER -->

		<!-- MAIN HEADER -->
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->
					<div class="col-md-3">
						<div class="header-logo">
							<a href="/ElectroShop" class="logo"> <img
								src="<c:url value="/resources/img/logo.png"/>" alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->

					<!-- SEARCH BAR -->
					<div class="col-md-6">
						<div class="header-search">
							<form>
								<select class="input-select">
									<option value="0">Tất cả sản phẩm</option>
									<%
										for (DanhMuc dm : lstDanhMucs) {
									%>
									<option value="1"><%=dm.getTenDanhMuc()%></option>
									<%
										}
									%>
								</select> <input class="input" placeholder="Từ khóa">
								<button class="search-btn" type="submit">Tìm kiếm</button>
							</form>
						</div>
					</div>
					<!-- /SEARCH BAR -->

					<!-- ACCOUNT -->
					<div class="col-md-3 clearfix">
						<div class="header-ctn">
							<!-- Wishlist -->
							<div>
								<a href="#"> <i class="fa fa-heart-o"></i> <span>Your
										Wishlist</span>
									<div class="qty">2</div>
								</a>
							</div>
							<!-- /Wishlist -->

							<!-- Cart -->
							<div class="dropdown" id="giohang">
								<a class="dropdown-toggle" data-toggle="dropdown"
									aria-expanded="true"> <i class="fa fa-shopping-cart"></i> <span>Giỏ hàng</span>
									<div class="qty soluong-spgiohang"><%=lstGioHangs.size() %></div>
								</a>
								<div class="cart-dropdown">
									<div class="cart-list">
									<%for(GioHang gioHang : lstGioHangs){
									%>
										<div class="product-widget">
											<div class="product-img">
												<img src="<c:url value="/resources/img/product01.png"/>"
													alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name">
													<a href="#"><%=gioHang.getTenSanPham() %></a>
												</h3>
												<h4 class="product-price">
													<span class="qty"><%=gioHang.getSoLuong() %>x</span><%=gioHang.getGiasp() %>VND
												</h4>
											</div>
											<button class="delete">
												<i class="fa fa-close"></i>
											</button>
										</div>
										<%} %>

									</div>
									<div class="cart-summary">
										<small><%=lstGioHangs.size() %> sản phẩm đã chọn</small>
										<% int tongtien=0;
										for(GioHang giohang:lstGioHangs){
											tongtien=tongtien+giohang.getGiasp()*giohang.getSoLuong();
										}%>
										<h5>Tổng tiền: <%=tongtien %>VND</h5>
									</div>
									<div class="cart-btns">
										<a href="#">View Cart</a> <a href="#">Checkout <i
											class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
							</div>
							<!-- /Cart -->

							<!-- Menu Toogle -->
							<div class="menu-toggle">
								<a href="#"> <i class="fa fa-bars"></i> <span>Menu</span>
								</a>
							</div>
							<!-- /Menu Toogle -->
						</div>
					</div>
					<!-- /ACCOUNT -->
				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</div>
		<!-- /MAIN HEADER -->
	</header>
	<!-- /HEADER -->