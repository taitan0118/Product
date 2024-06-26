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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">


    <!-- ScrollTop -->
   <link rel="stylesheet" href="/css/ScrollTop.css">
    <script src="/js/ScrollTop.js"></script>
</head>
<body>
   <jsp:include page="layout/header.jsp" />
    <div class="container ">
        <div class="row">
            
            <div class="col-lg-8 mt-4">
        
            	<c:forEach items="${cart}" var="c">
            	<div class="row mt-4">
                    <div class="col-sm-12 col-lg-9 col-md-9">
                        <div class="row">
                            <div class="col-xs-12 col-sm-4s col-md-4 col-lg-4 col-md-4">
                                <img src="/img/${c.image}" width="100%" alt="">
                            </div>
                            <div class="col-xs-12 col-lg-8 col-md-8">
                                <a href="" style="text-decoration: none">
                                    <h4 class="media-heading mt-sm-3 mt-lg-1 mt-md-1 text-warning">${c.name}</h4>
                                </a>
                                <h5 class="price mt-4">
                                    <span class="saleoff"><strong>Giá:</strong><fmt:formatNumber
								value="${c.sale}" pattern="#,##0" /> VND</span>
                                </h5>
                                <span> <b>Mã SP: </b> ${c.id}</span>
                                <div class="row bottom">
                                    <div class="col-6 col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                        <div class="row">
                                            <div class="col-6">
                                                <label for="" class="text-start">Size</label>
                                                <select class="form-select" aria-label="Default select example">
                                                <option selected>35</option>
                                                <option value="1">36</option>
                                                <option value="2">37</option>
                                                <option value="3">38</option>
                                                <option value="4">39</option>
                                                <option value="5">40</option>
                                                <option value="6">41</option>
                                                <option value="7">42</option>
                                                <option value="8">43</option>
                                                <option value="9">44</option>
                                              </select></div>
                                            <div class="col-6">
                                                <label for="">Số Lượng</label>
                                                <input id="${c.id}input"
									value="${c.quantity}" onblur="updateQty('${c.id}')" type="number"
									min="1" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-lg-3 col-md-3">
                        <div class="row">
                            <div class="col-lg-12 mt-3">
                                <h3 class="text-danger"><fmt:formatNumber
								value="${c.quantity * c.sale}" pattern="#,##0" /> VND</h3>
                                <span>Tồn Kho: ${c.inventory}</span>
                            </div>
                            <div class="col-lg-12 mt-3">
                                <button class="btn btn-success me-3 mt-2" style="width: 70px;"><i class="bi bi-heart"></i></button>
                                <a href="/cart/remove/${c.id}"><button class="btn btn-success mt-2"style="width: 70px;"><i class="bi bi-trash3-fill"></i></button></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 item-divider">
                    <hr>
                    </div>
                </div>
         
            </c:forEach>

                
           
                <Center> <a href="/cart/clear"><button class="btn btn-dark mt-4" style="width: 250px">Xóa hết</button></a> </Center>
            </div>
            <div class="col-lg-4 mt-4">
                <div class="container mt-3 bg-light">
                    <h3>Đơn hàng</h3>
                <hr class="mt-2">
                <div><Span style="font-weight: 600">Tổng Tiền: </Span><span class="text-right" style="font-weight: 700; font-size: 30px;"><fmt:formatNumber
								value="${tongtien}" pattern="#,##0" /> VND</span></div>
                <hr class="mt-2">
				<form:form action="/cart/paynow" method="post" modelAttribute="order" >
                    <input name="address" path="address" class="form-control me-2" type="text"/>
                        <center><button class="btn btn-success mt-4 mb-3" style="width: 50%;" type="submit">Thanh Toán</button></center>
                </form:form>
            
                </div>
            </div>
        </div>
        
    </div>
    <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="bi bi-arrow-up"></i></button>
    
   <jsp:include page="layout/footer.jsp" />
</body>
<script type="text/javascript">
		function updateQty(id) {
			if(document.getElementById(id + "input").value > 10){
				document.getElementById(id + "input").value = 10
				location.href = "/cart/update?id=" + id + "&sl="
				+ document.getElementById(id + "input").value;
			}if(document.getElementById(id + "input").value < 1){
				document.getElementById(id + "input").value = 1
				location.href = "/cart/update?id=" + id + "&sl="
				+ document.getElementById(id + "input").value;
			}
			location.href = "/cart/update?id=" + id + "&sl="
			+ document.getElementById(id + "input").value;
		}
	</script>


</html>