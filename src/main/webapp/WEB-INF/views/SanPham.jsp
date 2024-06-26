<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootraps -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<!-- css sản phẩm -->
<link rel="stylesheet" href="/css/SanPham.css">
<!-- ScrollTop -->
<link rel="stylesheet" href="/css/ScrollTop.css">
<script src="/js/ScrollTop.js"></script>
<!-- alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>

<link rel="stylesheet" href="sweetalert2.min.css" /> 
</head>
<body>
	<jsp:include page="layout/header.jsp" />
	
	<div id="carouselExampleIndicators" class="carousel slide">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/img/banner1.jpg" class="d-block w-100" 
					style="object-fit: cover;" alt="...">
			</div>
			<div class="carousel-item">
				<img src="/img/banner2.jpg" style="object-fit: cover;" class="d-block w-100" 
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="/img/banner3.jpg" style="object-fit: cover;" class="d-block w-100" 
					alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<div class="container mt-4">
		<div class="row mt-5">
		<div class="col-lg-4 col-md-4 col-sm-12 mt-3">
			<div class="dropdown">
				<button class="btn btn-outline-success dropdown-toggle" style="width: 100%"
					type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false">Doanh Mục Sản Phẩm</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="width: 100%">
					<li><a class="dropdown-item" href="#">Áo</a></li>
					<li><a class="dropdown-item" href="#">Quần</a></li>
					<li><a class="dropdown-item" href="#">Giày</a></li>
					<li><a class="dropdown-item" href="#">Mũ</a></li>
				</ul>
			</div>
		</div>
			<div class="col-6 col-xs-6 col-lg-2 col-md-2 col-sm-6 mt-3">
				<div class="dropdown ">
				<button class="btn btn-outline-success dropdown-toggle" style="width: 100%"
					type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false">Tất Cả</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item" href="/product/page">Tất Cả</a></li>
					<li><a class="dropdown-item" name="nam" href="/product/page?nam=true">Nam</a></li>
					<li><a class="dropdown-item" name="nu" href="/product/page?nu=true&a=${a}&a2=${a2}">Nữ</a></li>
				</ul>
			</div>
			</div>
			<div class="col-6 col-xs-6 col-lg-2 col-md-2 col-sm-6 mt-3">
				<div class="dropdown">
				<button class="btn btn-outline-success dropdown-toggle"
					type="button" id="dropdownMenuButton1" style="width: 100%" data-bs-toggle="dropdown"
					aria-expanded="false">Giá</button>
				<ul class="dropdown-menu text-center" aria-labelledby="dropdownMenuButton1">
				<li><a class="dropdown-item" href="/product/page">Tất Cả</a></li>
					<li><a class="dropdown-item" href="/product/page?a=0&a2=100000&nam=${nam}&nu=${nu}" name="a"><100,000 VND</a></li>
					<li><a class="dropdown-item" href="/product/page?a=100000&a2=300000&nam=${nam}&nu=${nu}">100,000 VND > 300,000 VND</a></li>
					<li><a class="dropdown-item" href="/product/page?a=300000&a2=500000&nam=${nam}&nu=${nu}">300,000 VND > 500,000 VND</a></li>
					<li><a class="dropdown-item" href="/product/page?a=500000&a2=700000&nam=${nam}&nu=${nu}">500,000 VND > 700,000 VND</a></li>
					<li><a class="dropdown-item" href="/product/page?a=700000&a2=900000&nam=${nam}&nu=${nu}">700,000 VND > 900,000 VND</a></li>
					<li><a class="dropdown-item" href="/product/page?a=900000&a2=10000000&nam=${nam}&nu=${nu}">900,000 VND ></a></li>
				</ul>
			</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-12 mt-3">
				<form class="d-flex" role="search"action="/product/page" method="post" >
				<input class="form-control me-2" name="name" value="${name}" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">
					<i class="bi bi-search"></i>
				</button>
			</form>
			</div>
			
			
		</div>
	</div>

	<div class="container mt-4">
		<div class="row mt-4">
			<c:forEach items="${products.content}" var="p">
				<div class="item col-6 col-xm-4 col-sm-6 col-lg-3 col-md-4  mt-5">
					<div class="card text-start">
						<img class="image card-img-top" src="/img/${p.image}"
							style="min-height: 100%; height:300px; width:100%; object-fit:cover" alt="Title" />
						<div class="middle">

							<!-- Button trigger modal -->
							
								<a href="/product/add/${p.id}"><button type="submit" 
									class="btn btn-warning me-2 mt-2 text-danger" >
									<i class="bi bi-bag-plus"></i>
								</button></a>
							<br>
							<div class="btn btn-warning mt-2 text-danger" id="myButton">
								<i class="bi bi-heart"></i>
							</div>
						</div>
					</div>
					<div class="text-center mt-2">
						<a class="card-title" href="/product/detail/${p.id}"
							style="font-weight: 700; text-decoration: none;"> ${p.name}</a>
						<br> <span class="card-text">${p.describe}</span><br>
						<span class="me-2 text-danger" style="font-weight: 700;"><fmt:formatNumber
								value="${p.sale}" pattern="#,##0" /> VND</span><span class="me-2"
							style="font-size: 15px; text-decoration: line-through;"><fmt:formatNumber
								value="${p.price}" pattern="#,##0" /> VND</span>

					</div>
				</div>
			</c:forEach>
			
		</div>
		
		<nav class="mt-5" aria-label="Page navigation example">
	    <ul class="pagination justify-content-center">
	  	<c:if test="${products.number == 0}">
	  		<li class="page-item disabled">
		      <a href="/product/page?nam=${nam}&nu=${nu}&a=${a}&a2=${a2}&name=${name}&p=0" class="page-link"><i class="bi bi-chevron-double-left"></i></a>
		    </li>
		    <li class="page-item disabled">
		      <a href="/product/page?nam=${nam}&nu=${nu}&a=${a}&a2=${a2}&name=${name}&p=${products.number-1}" class="page-link" href="#"><i class="bi bi-chevron-left"></i></a>
		    </li>
	  	</c:if>
	  	<c:if test="${products.number != 0}">
	  		<li class="page-item">
		      <a href="/product/page?nam=${nam}&nu=${nu}&a=${a}&a2=${a2}&name=${name}&p=0" class="page-link"><i class="bi bi-chevron-double-left"></i></a>
		    </li>
		
		    <li class="page-item">
		      <a href="/product/page?nam=${nam}&nu=${nu}&a=${a}&a2=${a2}&name=${name}&p=${products.number-1}" class="page-link" href="#"><i class="bi bi-chevron-left"></i></a>
		    </li>
	  	</c:if>
	  	<c:if test="${products.number == products.totalPages-1}">
	  		<li class="page-item disabled">
		      <a href="/product/page?nam=${nam}&nu=${nu}&a=${a}&a2=${a2}&name=${name}&p=${products.number+1}" class="page-link" href="#"><i class="bi bi-chevron-right"></i></a>
		    </li>
		    <li class="page-item disabled">
		      <a href="/product/page?nam=${nam}&nu=${nu}&a=${a}&a2=${a2}&name=${name}&p=${products.totalPages-1}" class="page-link" href="#"><i class="bi bi-chevron-double-right"></i></a>
		    </li>
	  	</c:if>
	  	<c:if test="${products.number != products.totalPages-1}">
	  		<li class="page-item">
		      <a href="/product/page?nam=${nam}&nu=${nu}&a=${a}&a2=${a2}&name=${name}&p=${products.number+1}" class="page-link" href="#"><i class="bi bi-chevron-right"></i></a>
		    </li>
		    <li class="page-item">
		      <a href="/product/page?nam=${nam}&nu=${nu}&a=${a}&a2=${a2}&name=${name}&p=${products.totalPages-1}" class="page-link" href="#"><i class="bi bi-chevron-double-right"></i></a>
		    </li>
	  	</c:if>
	  </ul>
	</nav>
	</div>
	<button onclick="topFunction()" id="myBtn" title="Go to top">
		<i class="bi bi-arrow-up"></i>
	
	</button>
	
		<jsp:include page="layout/footer.jsp" />
	
</body>
<script>
    const button = document.getElementById('myButton');
    const icon = button.querySelector('i');

    button.addEventListener('click', () => {
        button.classList.toggle('active');
        if (button.classList.contains('active')) {
            icon.classList.remove('bi-heart-fill');
            icon.classList.add('bi-heart');
        } else {
            icon.classList.remove('bi-heart');
            icon.classList.add('bi-heart-fill');
        }
    });
    document.getElementById('addSP').addEventListener('click', function() {
    	 Swal.fire({
    	        title: "Thêm thành công!",
    	        text: "Thank you bé iu ♥",
    	        icon: "success"
    	      });
    	});
</script>

</html>