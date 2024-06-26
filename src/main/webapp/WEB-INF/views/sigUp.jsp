<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<section class="mt-5">
		<div class="container">
			<div class="row justify-content-center" ">
				<div class="col-md-12 col-lg-10">
					<div class="wrap d-md-flex">
						<div class="img" style="background-image: url(img/mu4.jpg);">
						</div>
						<div class="login-wrap p-4 p-md-5">
							<div class="d-flex">
								<div class="w-100">
									<h3 class="mb-4">Sign Up	</h3>
								</div>
								<div class="w-100">
									<p class="social-media d-flex justify-content-end">
										<a href="#"
											class="social-icon d-flex align-items-center justify-content-center"><span
											class="fa fa-facebook"></span></a> <a href="/product/page"
											class="social-icon d-flex align-items-center justify-content-center"><span
											class="fa fa-twitter"></span></a>
									</p>
								</div>
							</div>
							<form:form action="/sigup/create" method="post"
						modelAttribute="account"
								class="signin-form">
								<div class="form-group mb-3">
									<label class="label" for="name">Username</label>
									<form:input path="username" type="text" class="form-control"
										placeholder="Username/SDT" />
										<form:errors path="username" class="form-text text-danger" />
								</div>
								<div class="form-group mb-3">
									<label class="label" for="name">Fullname</label>
									<form:input path="fullname" type="text" class="form-control"
										placeholder="Fullname" />
								</div>
								<div class="form-group mb-3">
									<label class="label" for="name">Email</label>
									<form:input path="email" type="text" class="form-control"
										placeholder="Email" />
								</div>
								<div class="form-group mb-3">
									<label class="label" for="password">Password</label>
									<form:input path="password" type="password"
										class="form-control" placeholder="Password"/>
								</div>
								<div class="form-group">
									<button type="submit" formaction="/sigup/create"
										class="form-control btn btn-primary rounded submit px-3">Sign Up</button>
								</div>
							</form:form>
							<p class="text-center">
								<a  href="/login">LogIn</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>

</html>