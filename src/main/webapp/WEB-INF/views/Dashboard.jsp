<%@page import="electro.entity.ChiTietSanPham"%>
<%@page import="electro.entity.SizeSanPham"%>
<%@page import="electro.entity.MauSanPham"%>
<%@page import="electro.entity.ThuongHieu"%>
<%@page import="electro.entity.DanhMuc"%>
<%@page import="java.util.List"%>
<%@page import="electro.entity.SanPham"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<c:url value="/resources/css/custom.css"/>">
    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>"> -->
    <link rel="stylesheet" href="<c:url value="/resources/dashboard/assets/vendor/bootstrap/css/bootstrap.min.css"/>">
    <!-- <link href="<c:url value="/resources/dashboard/assets/vendor/fonts/circular-std/style.css"/>" rel="stylesheet"> -->
    <link rel="stylesheet" href="<c:url value="/resources/dashboard/assets/libs/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/dashboard/assets/vendor/fonts/fontawesome/css/fontawesome-all.css"/>">
    <!-- <link rel="stylesheet" href="<c:url value="/resources/dashboard/assets/vendor/charts/chartist-bundle/chartist.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/dashboard/assets/vendor/charts/morris-bundle/morris.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/dashboard/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/dashboard/assets/vendor/charts/c3charts/c3.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/dashboard/assets/vendor/fonts/flag-icon-css/flag-icon.min.css"/>"> -->
    <title>Dashboard ElectroShop</title>
</head>

<body>


	<%List<SanPham> sanPhams=(List<SanPham>)request.getAttribute("lstSanPham");
		List<DanhMuc> danhMucs=(List<DanhMuc>)request.getAttribute("lstDanhMuc");
		List<ThuongHieu> thuongHieus=(List<ThuongHieu>)request.getAttribute("lstThuongHieu");
		List<MauSanPham> mauSanPhams=(List<MauSanPham>)request.getAttribute("lstMau");
		List<SizeSanPham> sizeSanPhams=(List<SizeSanPham>)request.getAttribute("lstSize");
		int tongsotrang=(Integer)request.getAttribute("tongsotrang");
	%>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="/ElectroShop/dashboard">ElectroShop</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item">
                            <div id="custom-search" class="top-search-bar">
                                <input class="form-control" type="text" placeholder="Search..">
                            </div>
                        </li>
                        <li class="nav-item dropdown notification">
                            <a class="nav-link nav-icons" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-fw fa-bell"></i> <span class="indicator"></span></a>
                            <ul class="dropdown-menu dropdown-menu-right notification-dropdown">
                                <li>
                                    <div class="notification-title"> Notification</div>
                                    <div class="notification-list">
                                        <div class="list-group">
                                            <a href="#" class="list-group-item list-group-item-action active">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="<c:url value="/resources/dashboard/assets/images/avatar-2.jpg"/>" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Jeremy Rakestraw</span>accepted your invitation to join the team.
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="<c:url value="/resources/dashboard/assets/images/avatar-3.jpg"/>" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">John Abraham </span>is now following you
                                                        <div class="notification-date">2 days ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                   <div class="notification-list-user-img"><img src="<c:url value="/resources/dashboard/assets/images/avatar-4.jpg"/>" alt="" class="user-avatar-md rounded-circle"></div>
                                                   <div class="notification-list-user-block"><span class="notification-list-user-name">Monaan Pechi</span> is watching your main repository
                                                       <div class="notification-date">2 min ago</div>
                                                   </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="<c:url value="/resources/dashboard/assets/images/avatar-5.jpg"/>" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Jessica Caruso</span>accepted your invitation to join the team.
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                        		<li>
                                    <div class="list-footer"> <a href="#">View all notifications</a></div>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown connection">
                            <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-fw fa-th"></i> </a>
                            <ul class="dropdown-menu dropdown-menu-right connection-dropdown">
                                <li class="connection-list">
                                    <div class="row">
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="<c:url value="/resources/dashboard/assets/images/github.png"/>" alt="" > <span>Github</span></a>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="<c:url value="/resources/dashboard/assets/images/dribbble.png"/>" alt="" > <span>Dribbble</span></a>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="<c:url value="/resources/dashboard/assets/images/dropbox.png"/>" alt="" > <span>Dropbox</span></a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="<c:url value="/resources/dashboard/assets/images/bitbucket.png"/>" alt=""> <span>Bitbucket</span></a>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="<c:url value="/resources/dashboard/assets/images/mail_chimp.png"/>" alt="" ><span>Mail chimp</span></a>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="<c:url value="/resources/dashboard/assets/images/slack.png"/>" alt="" > <span>Slack</span></a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="conntection-footer"><a href="#">More</a></div>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="<c:url value="/resources/dashboard/assets/images/avatar-1.jpg"/>" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name">John Abraham </h5>
                                    <span class="status"></span><span class="ml-2">Available</span>
                                </div>
                                <a class="dropdown-item" href="#"><i class="fas fa-user mr-2"></i>Account</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-cog mr-2"></i>Setting</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-power-off mr-2"></i>Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
        <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                Menu
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link active" href="/ElectroShop/dashboard"><i class="fa fa-fw fa-user-circle"></i>Sản phẩm <span class="badge badge-success"></span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/ElectroShop/dashboard/hoadon"><i class="fa fa-fw fa-rocket"></i>Hóa đơn</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3" aria-controls="submenu-3"><i class="fas fa-fw fa-chart-pie"></i>Chart</a>
                                <div id="submenu-3" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/chart-c3.html">C3 Charts</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/chart-chartist.html">Chartist Charts</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/chart-charts.html">Chart</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/chart-morris.html">Morris</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/chart-sparkline.html">Sparkline</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/chart-gauge.html">Guage</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-4" aria-controls="submenu-4"><i class="fab fa-fw fa-wpforms"></i>Forms</a>
                                <div id="submenu-4" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/form-elements.html">Form Elements</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/form-validation.html">Parsely Validations</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/multiselect.html">Multiselect</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/datepicker.html">Date Picker</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/bootstrap-select.html">Bootstrap Select</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-5" aria-controls="submenu-5"><i class="fas fa-fw fa-table"></i>Tables</a>
                                <div id="submenu-5" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/general-table.html">General Tables</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/data-tables.html">Data Tables</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-divider">
                                Features
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-6" aria-controls="submenu-6"><i class="fas fa-fw fa-file"></i> Pages </a>
                                <div id="submenu-6" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/blank-page.html">Blank Page</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/blank-page-header.html">Blank Page Header</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/login.html">Login</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/404-page.html">404 page</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/sign-up.html">Sign up Page</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/forgot-password.html">Forgot Password</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/pricing.html">Pricing Tables</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/timeline.html">Timeline</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/calendar.html">Calendar</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/sortable-nestable-lists.html">Sortable/Nestable List</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/widgets.html">Widgets</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/media-object.html">Media Objects</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/cropper-image.html">Cropper</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/color-picker.html">Color Picker</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-7" aria-controls="submenu-7"><i class="fas fa-fw fa-inbox"></i>Apps <span class="badge badge-secondary">New</span></a>
                                <div id="submenu-7" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/inbox.html">Inbox</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/email-details.html">Email Detail</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/email-compose.html">Email Compose</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/message-chat.html">Message Chat</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-8" aria-controls="submenu-8"><i class="fas fa-fw fa-columns"></i>Icons</a>
                                <div id="submenu-8" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/icon-fontawesome.html">FontAwesome Icons</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/icon-material.html">Material Icons</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/icon-simple-lineicon.html">Simpleline Icon</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/icon-themify.html">Themify Icon</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/icon-flag.html">Flag Icons</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/icon-weather.html">Weather Icon</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-9" aria-controls="submenu-9"><i class="fas fa-fw fa-map-marker-alt"></i>Maps</a>
                                <div id="submenu-9" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/map-google.html">Google Maps</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="pages/map-vector.html">Vector Maps</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-10" aria-controls="submenu-10"><i class="fas fa-f fa-folder"></i>Menu Level</a>
                                <div id="submenu-10" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Level 1</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-11" aria-controls="submenu-11">Level 2</a>
                                            <div id="submenu-11" class="collapse submenu" style="">
                                                <ul class="nav flex-column">
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="#">Level 1</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="#">Level 2</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#">Level 3</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <!-- ============================================================== -->
                    <!-- pageheader  -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title">Quản lý sản phẩm </h2>
                                <p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Sản phẩm</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Quản lý sản phẩm</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <button type="button" class="btn btn-primary mb-2" style="float: right;" data-toggle="modal" data-target="#themsanphamform" id="btnThemSanPham">Thêm sản phẩm</button>
                            <!-- Modal -->
                                <div class="modal fade" id="themsanphamform" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="themsanphamformTitle">Thêm sản phẩm</h5>
                                                <a href="#" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </a>
                                            </div>
                                            <div class="modal-body">
                                                <h5>Thông tin sản phẩm</h5>
                                                <form id="formThemSanPham">
                                                    <div class="form-group">
                                                        <label for="masanpham" class="col-form-label">Mã sản phẩm</label>
                                                        <input id="masanpham" name="masanpham" type="text" class="form-control" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="tensanpham" class="col-form-label">Tên sản phẩm</label>
                                                        <input id="tensanpham" name="tensanpham" type="text" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="giasp" class="col-form-label">Giá</label>
                                                        <input id="giasp" name="giasp" type="number" class="form-control" placeholder="Giá">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="baohanhsp" class="col-form-label">Bảo hành</label>
                                                        <input id="baohanhsp" name="baohanhsp" type="text" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="tinhtrangsp" class="col-form-label">Tình trạng</label>
                                                        <input id="tinhtrangsp" name="tinhtrangsp" type="text" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="motasp">Mô tả</label>
                                                        <textarea id="motasp" name="motasp" class="form-control"  rows="3"></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="danhmucsp">Danh mục</label>
                                                        <select class="form-control" id="danhmucsp" name="danhmucsp">
                                                           <%for(DanhMuc dm : danhMucs){%>
                                                            <option value="<%=dm.getIdDanhMuc()%>"><%=dm.getTenDanhMuc()%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="thuonghieusp">Thương hiệu</label>
                                                        <select class="form-control" id="thuonghieusp" name="thuonghieusp">
                                                            <%for(ThuongHieu th : thuongHieus){%>
                                                            <option value="<%=th.getIdThuongHieu()%>"><%=th.getTenThuongHieu()%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>

                                                    <div class="custom-file mb-3">
                                                        <input id="hinhsp" name="hinhsp" type="file" class="custom-file-input" multiple>
                                                        <label class="custom-file-label" for="hinhsp">Hình ảnh</label>
                                                    </div>

                                                    <h5>Chi tiết sản phẩm</h5>
                                                    <div class="form-group" id="chitietsanphamform">
                                                        
                                                        
                                                    </div>
                                                    <div class="input-group input-group-sm mb-3" >
                                                        <button type="button" class="btn btn-primary btn-rounded btn-sm" id="btnThemChiTietSanPham">Thêm chi tiết</button>
                                                    </div>  
                                                    
                                                </form>
                                                <span id="ketqua" ></span>
                                            </div>
                                            <div class="modal-footer">
                                                <a href="#" class="btn btn-secondary" data-dismiss="modal">Đóng</a>
                                                <a href="#" class="btn btn-primary" id="btnSubmitThemSanPhamForm">Thêm</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <!-- End Modal -->
                        </div>
                    </div>
                    <div class="the-an divclone" ten="ctsp">
                        <div class="input-group input-group-sm mb-3 col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2" style="float:left;">
                           <span class="input-group-prepend"><span class="input-group-text">Màu</span></span>
                            <select name="mausp" class="form-control">
                               <%for(MauSanPham mau : mauSanPhams){%>
                                <option value="<%=mau.getIdMau()%>"><%=mau.getMau()%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="input-group input-group-sm mb-3 col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2" style="float:left;">
                            <span class="input-group-prepend"><span class="input-group-text">Size</span></span>
                            <select name="sizesp" class="form-control">
                               <%for(SizeSanPham size : sizeSanPhams){%>
                                <option value="<%=size.getIdSize()%>"><%=size.getSize()%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="input-group input-group-sm mb-3 col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2" style="float: right;">
                            <span class="input-group-prepend"><span class="input-group-text">Số lượng</span></span>
                            <input name="soluongsp" value="1" min="1" type="number" class="form-control">
                            <input name="mactsp" type="text" class="the-an">
                            <a href="#" class="btnXoaChiTietSanPham" style="align-self: center;display: block;margin-left: 5px;cursor: pointer;">X</a>
                        </div>

                        </div>
                    <!-- ============================================================== -->
                    <!-- end pageheader  -->
                    <!-- ============================================================== -->
                    <div class="ecommerce-widget">
                        <div class="row">
                            <!-- ============================================================== -->
                      
                            <!-- ============================================================== -->

                                          <!-- recent orders  -->
                            <!-- ============================================================== -->
                            <!-- Tìm kiếm sản phẩm -->
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mb-2">
	                            <form action="" method="get">
	                                <div class="input-group">
	                                    <input name="id" type="search" class="form-control" placeholder="Mã sản phẩm">
	                                    <div class="input-group-append">
	                                        <button class="btn btn-primary" type="submit">Tìm kiếm</button>
	                                    </div>
	                                </div>
	                             </form>   
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mb-2">
                            	<form action="" method="get">
                            		<div class="input-group">
                                    	<input name="tensanpham" type="search" class="form-control" placeholder="Tên sản phẩm">
	                                    <div class="input-group-append">
	                                        <button class="btn btn-primary" type="submit">Tìm kiếm</button>
	                                    </div>
                                	</div>
                            	</form>
                                
                            </div>
                            <!-- End Tìm kiếm sản phẩm -->
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Sản phẩm</h5>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table" id="tableSanPham">
                                                <thead class="bg-light">
                                                    <tr class="border-0">
                                                        <th class="border-0">ID</th>
                                                        <th class="border-0">Hình ảnh</th>
                                                        <th class="border-0">Tên sản phẩm</th>
                                                        <th class="border-0">Giá</th>
                                                        <th class="border-0">Bảo hành</th>
                                                        <th class="border-0">Tình trạng</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <%if(request.getAttribute("message")==null){
                                                for(SanPham sp : sanPhams){
                                                %>
                                                    <tr class="thongtinsanpham">
                                                        <td><%=sp.getIdSanPham() %></td>
                                                        <td>
                                                            <div class="m-r-10"><img src="<c:url value="<%=sp.GetListImage()[0] %>"/>" alt="user" class="rounded" width="45"></div>
                                                        </td>
                                                        <td><%=sp.getTenSanPham() %></td>
                                                        <td><%=sp.getGia() %> </td>
                                                        <td><%=sp.getBaoHanh() %></td>
                                                        <td><%=sp.getTinhTrang() %></td>
                                                        <td class="the-an" data-madm="<%=sp.getDanhMuc().getIdDanhMuc() %>" data-math="<%=sp.getThuongHieu().getIdThuongHieu() %>"><%=sp.getMoTa() %></span></td>
                                                        <%for(ChiTietSanPham ctsp : sp.getLstChiTietSanPham()){%>
                                                        <td class="the-an chitietsanpham" data-mactsp="<%=ctsp.getIdChiTietSanPham() %>" data-mamau="<%=ctsp.getMauSanPham().getIdMau() %>" data-masize="<%=ctsp.getSizeSanPham().getIdSize() %>"data-soluong="<%=ctsp.getSoLuong() %>"></span></td>
                                                        <% } %>
                                                        <!--<td><span class="badge-dot badge-brand mr-1"></span>InTransit </td>  -->
                                                        <td>
                                                        	<div class="btn-group">
                                                                <button class="btn btn-info btnSuaSanPham" data-toggle="modal" data-target="#themsanphamform">Sửa</button>
                                                                <button class="btn btn-danger btnXoaSanPham">Xóa</button>
                                                            </div>
                                                       	</td>
                                                    </tr>
                                                  <%}} %>
                                                    <tr>
                                                        <td colspan="9"><a href="#" class="btn btn-outline-light float-right">View Details</a></td>
                                                    </tr>
                                                </tbody>
                                                 <span>${message }</span>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- start pagination -->
                                <ul class="pagination" id="pagination-dashboardsanpham">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span>      </a>
                                    </li>
                                    <%for(int i=1; i<=tongsotrang; i++){%>
                                    <li class="page-item"><a class="page-link" href=""><%=i%></a></li>
                                    <%} %>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span>
                                           <span class="sr-only">Next</span></a>
                                    </li>
                                </ul>
                                <!-- end pagination -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <div class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                             Copyright © 2020 Concept. All rights reserved. Dashboard by <a href="">ElectroShop</a>.
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="text-md-right footer-links d-none d-sm-block">
                                <a href="javascript: void(0);">About</a>
                                <a href="javascript: void(0);">Support</a>
                                <a href="javascript: void(0);">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- end wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <!-- jquery 3.3.1 -->
    <script src="<c:url value="/resources/dashboard/assets/vendor/jquery/jquery-3.3.1.min.js"/>"></script>
    <!-- bootstap bundle js -->
    <!--  <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>-->
    <script src="<c:url value="/resources/dashboard/assets/vendor/bootstrap/js/bootstrap.bundle.js"/>"></script>
    <script src="<c:url value="/resources/js/custom.js"/>"></script>
    <!-- slimscroll js -->
   <!--  <script src="<c:url value="/resources/dashboard/assets/vendor/slimscroll/jquery.slimscroll.js"/>"></script>
    <!-- main js -->
    <!-- <script src="<c:url value="/resources/dashboard/assets/libs/js/main-js.js"/>"></script> -->
    <!-- chart chartist js -->
    <!-- <script src="<c:url value="/resources/dashboard/assets/vendor/charts/chartist-bundle/chartist.min.js"/>"></script> -->
    <!-- sparkline js -->
    <!-- <script src="<c:url value="/resources/dashboard/assets/vendor/charts/sparkline/jquery.sparkline.js"/>"></script> -->
    <!-- morris js -->
    <!-- <script src="<c:url value="/resources/dashboard/assets/vendor/charts/morris-bundle/raphael.min.js"/>"></script> -->
    <!-- <script src="<c:url value="/resources/dashboard/assets/vendor/charts/morris-bundle/morris.js"/>"></script> -->
    <!-- chart c3 js -->
    <!-- <script src="<c:url value="/resources/dashboard/assets/vendor/charts/c3charts/c3.min.js"/>"></script> -->
    <!-- <script src="<c:url value="/resources/dashboard/assets/vendor/charts/c3charts/d3-5.4.0.min.js"/>"></script> -->
    <!-- <script src="<c:url value="/resources/dashboard/assets/vendor/charts/c3charts/C3chartjs.js"/>"></script> -->
    <!-- <script src="<c:url value="/resources/dashboard/assets/libs/js/dashboard-ecommerce.js"/>"></script> -->
    
</body>
 
</html>