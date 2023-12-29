<%@page import="java.util.List"%>
<%@page import="entity.Account"%>
<%@page import="entity.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart_list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <!--end of menu-->
        <div class="container">
            <% if (request.getAttribute("productExistsInCart") != null) { %>
            <div class="alert alert-warning">
                Sản phẩm đã tồn tại trong giỏ hàng.
                </div>
            <% } %>
            <% if (request.getAttribute("SignUpSuccess") != null) { %>
                <div class="alert alert-warning">
                    Bạn đã đăng ký thành công. Vui lòng đăng nhập lại hệ thống.
                </div>
            <% } %>
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="Home.jsp">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Category</a></li>
                            <li class="breadcrumb-item active" aria-current="#">Sub-category</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
            <jsp:include page = "Left.jsp"></jsp:include>

                <div class="col-sm-9">
                    <div class="row">
                        <c:forEach items="${listP}" var="o">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card" style="margin-bottom:20px ; height:520px ; width: 238px;">
                                    <img class="card-img-top" src="${o.image}" alt="Card image cap" style="width: 238px; height: 295px; ">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a href="detail?pid=${o.id}" title="View Product">${o.name}</a></h4>
                                        <p class="card-text show_txt">${o.title}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block">${o.price} $</p>
                                            </div>
                                            <c:choose>
                                                <c:when test="${o.soluong > 0}">
                                                    <div class="col">
                                                        <a href="cart?pid=${o.id}&quantity=1" class="btn btn-success btn-block">Add to cart</a>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="col">
                                                        <button class="btn btn-danger btn-block" disabled>Hết hàng</button>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>

        <!-- Footer -->
        <jsp:include page ="Footer.jsp"></jsp:include>
    </body>
</html>

