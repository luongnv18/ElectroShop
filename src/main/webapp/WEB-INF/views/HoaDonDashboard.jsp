<%@page import="electro.entity.HoaDon"%>
<%@page import="java.util.List"%>
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
	<%
		List<HoaDon> hoaDons=(List<HoaDon>)request.getAttribute("lstHoaDon");
		
	%>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
		<jsp:include page="navbar_dashboard.jsp">
			<jsp:param value="active" name="activehoadon"/>
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
                                <h2 class="pageheader-title">Quản lý hóa đơn </h2>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Quản lý hóa đơn</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
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
                            <!-- Tìm kiếm hóa đơn -->
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mb-2">
	                            <form action="" method="get">
	                                <div class="input-group">
	                                    <input name="id" type="search" class="form-control" placeholder="Mã hóa đơn">
	                                    <div class="input-group-append">
	                                        <button class="btn btn-primary" type="submit">Tìm kiếm</button>
	                                    </div>
	                                </div>
	                             </form>   
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 mb-2">
                            	<form action="" method="get">
                            		<div class="input-group">
                                    	<input name="phoneNumber" type="search" class="form-control" placeholder="Số điện thoại">
	                                    <div class="input-group-append">
	                                        <button class="btn btn-primary" type="submit">Tìm kiếm</button>
	                                    </div>
                                	</div>
                            	</form>
                                
                            </div>
                            <!-- End Tìm kiếm hóa đơn -->
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">Hóa đơn</h5>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table" id="tableHoaDon">
                                                <thead class="bg-light">
                                                    <tr class="border-0">
                                                        <th class="border-0">ID</th>
                                                        <th class="border-0">Tên người nhận</th>
                                                        <th class="border-0">Số ĐT</th>
                                                        <th class="border-0">Địa chỉ</th>
                                                        <th class="border-0">Ghi chú</th>
                                                        <th class="border-0">Ngày mua</th>
                                                        <th class="border-0">Tình trạng</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <%if(request.getAttribute("message")==null){
                                                for (HoaDon hd : hoaDons){%>
                                                    <tr class="thongtinhoadon">
                                                        <td><%=hd.getIdHoaDon() %></td>
                                                        <td><%=hd.getTenNguoiNhan() %></td>
                                                        <td><%=hd.getSoDTNguoiNhan() %></td>
                                                        <td><%=hd.getDiaChiGiaoHang() %></td>
                                                        <td><%=hd.getGhiChu() %> </td>
                                                        <td><%=hd.getNgayMua() %></td>
                                                        <td>
                                                        	<div class="btn-group">
	                                                        <%switch(hd.getTinhTrang()){
	                                                          case 0:
	                                                            out.println("<span value=0 class=\"badge badge-brand mr-2\">Đang xử lý</span>");
	                                                            break;
	                                                          case 1:
	                                                        	  out.println("<span value=1 class=\"badge badge-info mr-2\">Đã thanh toán</span>");
	                                                            break;
	                                                          case 2:
	                                                        	  out.println("<span value=2 class=\"badge badge-primary mr-2\">Đang giao hàng</span>");
	                                                            break;
	                                                          case 3:
	                                                        	  out.println("<span value=3 class=\"badge badge-success mr-2\">Đã giao hàng</span>");
	                                                            break;
	                                                          case 4:
	                                                        	  out.println("<span value=4 class=\"badge badge-danger mr-2\">Đã hủy</span>");
	                                                            break;
	                                                          default:
	                                                            // code block
	                                                        }
	                                                        %>
                                                        		<i class="fas fa-edit" class="btn btn-primary" data-toggle="modal" data-target="#hoadonModal"></i>
                                                       		</div> 
                                                    	</td>
                                                        
                                                    </tr>
                                                    <%}} %>
                                                </tbody>
                                                <span>${message }</span>
                                                <!-- Modal -->
                                                <div class="modal fade" id="hoadonModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Tình trạng hóa đơn</h5>
                                                                <a href="#" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                 </a>
                                                            </div>
                                                            <div class="modal-body">
                                                            	<form action="" id="formUpdateHoaDon">
	                                                            	<div class="form-group">
						                                                <label for="mahd" class="col-form-label">Mã hóa đơn</label>
						                                                <input id="mahd" name="mahd" type="text" class="form-control" readonly>
						                                            </div>
	                                                            	<div class="form-group">
						                                                <label for="tennguoinhan" class="col-form-label">Tên người nhận</label>
						                                                <input id="tennguoinhan" name="tennguoinhan" type="text" class="form-control">
						                                            </div>
						                                            <div class="form-group">
						                                                <label for="sodienthoai" class="col-form-label">Số điện thoại</label>
						                                                <input id="sodienthoai" name="sodienthoai" type="number" class="form-control">
						                                            </div>
						                                            <div class="form-group">
						                                                <label for="diachigiaohang">Địa chỉ giao hàng</label>
						                                                <textarea class="form-control" id="diachigiaohang" name="diachigiaohang" rows="3"></textarea>
						                                            </div>
						                                            <div class="form-group">
						                                                <label for="ghichuhoadon" class="col-form-label">Ghi chú</label>
						                                                <input id="ghichuhoadon" name="ghichuhoadon" type="text" class="form-control">
						                                            </div>
	                                                                <div class="form-group">
						                                                <label for="tinhtranghoadon">Tình trạng hóa đơn</label>
						                                                <select class="form-control" id="tinhtranghoadon" name="tinhtranghoadon">
						                                                	<option value=0>Đang xử lý</option>
						                                                    <option value=1>Đã thanh toán</option>
						                                                    <option value=2>Đang giao hàng</option>
						                                                    <option value=3>Đã giao hàng</option>
						                                                    <option value=4>Đã hủy</option>
						                                                </select>
						                                            </div>
                                                            	</form>
                                                            	<span id="ketqua" ></span>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <a href="#" class="btn btn-secondary" data-dismiss="modal">Close</a>
                                                                <a href="#" class="btn btn-primary" id="btnSubmitHoaDonForm">Save changes</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- End Modal -->
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- start pagination -->
                                <ul class="pagination" id="pagination-dashboardhoadon">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span>      </a>
                                    </li>
                                    <li class="page-item active"><a class="page-link" href="">1</a></li>
                                    <%for(int i=2;i<=(Integer)request.getAttribute("tongsotrang");i++){
                                    	%>
                                    <li class="page-item"><a class="page-link" href=""><%=i %></a></li>
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