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
        <jsp:include page="navbar_dashboard.jsp">
        	<jsp:param value="active" name="activesanpham"/>
        </jsp:include>
        
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

    <script src="<c:url value="/resources/dashboard/assets/vendor/bootstrap/js/bootstrap.bundle.js"/>"></script>
    <script src="<c:url value="/resources/js/custom.js"/>"></script>
    
</body>
 
</html>