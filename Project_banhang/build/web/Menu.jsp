<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="home">Book Store</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <c:if test="${sessionScope.acc.isAdmin == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="admin">Manager Store</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc.isSell == 1 || sessionScope.acc.isAdmin == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="manager">Manager Product</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="managerOrder">Manager Order</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </c:if>
            </ul>

            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input oninput="searchByName(this)" value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3" href="show">
                    <i class="fa fa-shopping-cart"></i> Cart
                    <% if (session.getAttribute("acc") != null || session.getAttribute("cart_list") != null ) { %>
                    <span class="badge badge-light"> 
                                ${cart_list.size()}
                    </span>
                                <% } %>
                </a>
                <c:if test="${sessionScope.acc == null}">
                        <a id="userIcon" class="btn btn-info btn-sm ml-3" href="Login.jsp" class="nav-link">
                            <i class="fa fa-user"> Login </i> 
                        </a>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <a id="userIcon" class="btn btn-info btn-sm ml-3" href="ChangePassword.jsp" class="nav-link">
                            <i class="fa fa-user"></i> ${sessionScope.acc.user} 
                    </a>
                </c:if>
            </form>
        </div>
    </div>
</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Cửa hàng bán sách</h1>
        <p class="lead text-muted mb-0">Các sản phẩm bán liên quan đến sở thích của bạn</p>
    </div>
</section>

<!--end of menu-->
