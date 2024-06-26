<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

</head>
<body>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div class="chartjs-size-monitor">
					<div class="chartjs-size-monitor-expand">
						<div class=""></div>
					</div>
					<div class="chartjs-size-monitor-shrink">
						<div class=""></div>
					</div>
				</div>


				<div class="mt-2">
					<form:form action="/admin/create" method="post"
						modelAttribute="user" class="row g-3">
						<div class="col-md-6">
							<label for="inputEmail4" class="form-label">UserName: </label>
							<form:input type="text" class="form-control id" id="id"
								placeholder="Username" path="username" />
							<form:errors path="username" class="form-text text-danger" />
						</div>
						<div class="col-md-6">
							<label for="inputPassword4" class="form-label">Password</label> <form:input
								type="password" class="form-control password" id="password"
								name="password" path="password" value="" />
						</div>
						<div class="col-12">
							<label for="inputAddress" class="form-label">FullName: </label>
							<form:input type="text" class="form-control fullname"
								id="fullname" placeholder="Fullname" path="fullname" />
						</div>

						<div class="col-12">
							<label for="inputAddress" class="form-label">Email: </label> <form:input
								type="email" class="form-control email" id="email"
								placeholder="" path="email" name="email" value="" />
						</div>

						<div class="col-12">

							<label for="admin" class="form-label mt-2">Role:</label> <br>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="admin" ${user.admin?"checked":""} 
									id="inlineRadio1" value="true"> <label
									class="form-check-label" for="inlineRadio1">Admin</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="admin"
									id="inlineRadio2" value="false" ${user.admin?"":"checked"}> <label
									class="form-check-label" for="inlineRadio2">User</label>
							</div>

						</div>
						<div class="input-group mb-3">
							<label class="input-group-text" for="inputGroupFile02">Hinh
								Anh</label>
							<form:input path="photo" multiple="multiple" type="file"
								class="form-control" id="inputGroupFile02" />
						</div>
						<div class="col-12">
							<button formaction="/admin/create" class="btn btn-success"
								type="submit">
								<i class="fa-solid fa-floppy-disk"></i> Create
							</button>
							<button formaction="/admin/update" class="btn btn-info">
								<i class="fa-solid fa-floppy-disk"></i> Update
							</button>
							<button formaction="/admin/delete" class="btn btn-danger">
								<i class="fa-solid fa-floppy-disk"></i> Delete
							</button>
							<button formaction="/admin/index" class="btn btn-light"
								type="submit">
								<i class="fa-solid fa-floppy-disk"></i> Reset
							</button>
						</div>
					</form:form>
					<c:if test="${not empty success_user}">
						<div class="alert alert-success mt-3" role="alert">
							${success_user}</div>
					</c:if>
				</div>

				<hr>
				<div class="table-responsive mt-2" style=" max-height: 200px;
    overflow: auto;">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th scope="col">Username</th>
								<th scope="col">Password</th>
								<th scope="col">Fullname</th>
								<th scope="col">Email</th>
								<th scope="col">Role</th>
								<th scope="col">Edit</th>
							</tr>
						</thead>
						
						<tbody >

							<c:forEach var="user" items="${account}">
								<tr>
									<td>${user.username}</td>
									<td>${user.password}</td>
									<td>${user.fullname}</td>
									<td>${user.email}</td>
									<td>${user.admin}</td>
									<td><a href="/admin/edit?id=${user.username}"><i
											class="bi bi-pencil text-success me-2"></i></a> <a
										href="/admin/delete?id=${user.username}"><i
											class="bi bi-trash3 text-danger"></i></a></td>
								</tr>
							</c:forEach>


						</tbody>
					</table>
				</div>




			</main>


		</div>
	</div>
</body>
</html>