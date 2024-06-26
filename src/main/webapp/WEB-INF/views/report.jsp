<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<div class="col-md-8 me-auto ms-auto mt-5">
		<form class="d-flex text-center justify-content-around" action="" method="get">
			<button formaction="/admin/index" type="submit" class="btn btn-primary">Category Management</button>
			<button formaction="/product/index" type="submit" class="btn btn-info">Sort & Serch</button>
			<button formaction="/product/page" type="submit" class="btn btn-secondary">Serch-Pagination</button>
			<button formaction="/product/report" type="submit" class="btn btn-danger">Report</button>
			<button formaction="/mail" type="submit" class="btn btn-warning">Mail</button>
			<button formaction="/home/index" type="submit" class="btn btn-success">Interceptor</button>
			<button formaction="/login" type="submit" class="btn btn-light">Auth Interceptor</button>
		</form>
	</div>
	<h1 class="text-primary-emphasis text-center mb-5 mt-3">Tồn kho theo loại hàng</h1>
	<table class="table table-light table-hover me-auto ms-auto w-50 mt-3 text-center">
		<thead>
		    <tr>
		      <th scope="col">Loại hàng</th>
		      <th scope="col">Tổng giá</th>
		      <th scope="col">Số sản phẩm</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach items="${items}" var="item">
		    	<tr>
			      <th scope="row">${item.group}</th>
			      <td>${item.sum}</td>
			      <td>${item.count}</td>
			    </tr>
		    </c:forEach>
		  </tbody>
	</table>
</body>
</html>