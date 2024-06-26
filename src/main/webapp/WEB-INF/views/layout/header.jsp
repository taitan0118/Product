<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<nav
			class="navbar navbar-expand-lg navbar-light w-100 justify-content-center ">
			<div class="container px-3">
				<a class="navbar-brand" href="#"> <img src="/img/logo.jpg"
					alt=""></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="offcanvas offcanvas-start offcanvas-nav"
					id="offcanvasNavbar" style="width: 20rem">
					<div class="offcanvas-header">
						<a href="" class="text-inverse"><img src="/img/logo.jpg"
							alt=""></a>
						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					
					<div class="offcanvas-body pt-0 justify-content-center">
						<ul class="navbar-nav mx-auto align-items-lg-center">
							<li class="nav-item dropdown"><a class="nav-link " href="/product/page"
								 data-bs-toggle="" ><s:message code="header.product"/></a></li>
							<li class="nav-item dropdown"><a class="nav-link" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false"><s:message code="header.category"/></a></li>
							<li class="nav-item dropdown"><a class="nav-link" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false"><s:message code="header.boy"/></a>
							</li>
							<li class="nav-item dropdown"><a class="nav-link" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false"><s:message code="header.girl"/></a>
							</li>
							<li class="nav-item dropdown"><a class="nav-link" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">Sale
									Up</a></li>
							<li class="nav-item dropdown"><a class="nav-link" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false"><s:message code="header.like"/></a></li>
						</ul>
						<div class="mt-3 mt-lg-0 d-flex align-items-center">
							<form class="d-flex mx-2" role="search">
								<input class="form-control me-2" type="search"
									placeholder="Search" aria-label="Search">
								<button class="btn btn-outline-success" type="submit">
									<i class="bi bi-search"></i>
								</button>
							</form>
							<a href="/cart" class="btn btn-success me-2"><i
								class="bi bi-cart4"></i></a>
							<!-- Example split danger button -->
							<div class="btn-group">
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-success"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									<i class="bi bi-person-circle"></i>
								</button>

								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<h1 class="text-success text-center">${user.fullname}</h1>
												<form class="mt-3" action="/logout" method="post">
													<div class="mb-3">
														<input value="${user.username}" readonly
															placeholder="Username" type="text" class="form-control" />
													</div>
													<div class="mb-3">
														<input value="${user.password}" placeholder="Password"
															type="password" class="form-control" />
													</div>
													<div class="mb-3">
														<input value="${user.fullname}" placeholder="Fullname"
															type="text" class="form-control" />
													</div>
													<div class="mb-3">
														<input value="${user.email}" placeholder="Email"
															type="email" class="form-control" />
													</div>
													<div class="w-100 text-center">
														<button formaction="/admin/index" formmethod="get"
															type="submit" class="btn btn-info">Category</button>
														<button type="submit" class="btn btn-danger">Logout</button>
													</div>
												</form>
											</div>

										</div>
									</div>
								</div>
								<button type="button"
									class="btn btn-success dropdown-toggle dropdown-toggle-split"
									data-bs-toggle="dropdown" aria-expanded="false">
									<span class="visually-hidden">Toggle Dropdown</span>
								</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="/login">LogIn</a></li>
									<li><a class="dropdown-item" href="/sigup">SignUp</a></li>
	
				
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="/logout">LogOut</a></li>
								</ul>
							</div>
							<div class="text-end">
							<a href="?lang=vi" class="px-2 text-decoration-none text-success"><s:message code="header.vietnamese"/></a>
          <a href="?lang=en" class="px-2 text-decoration-none text-success"><s:message code="header.english"/></a>
          
        </div>
						</div>

					</div>
				</div>
			</div>
		</nav>
	</header>
</body>
<script>
	$(document).ready(function(){
		$("a[href*=lang]").on("click", function(){
			var param = $(this).attr("href");
			$.ajax({
				url: "/" + param,
				success: function(){
					location.reload();
				}
			});
			return false;
		})
	})
</script>
</html>