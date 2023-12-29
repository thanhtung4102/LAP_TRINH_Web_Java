<%-- 
    Document   : Detail
    Created on : Dec 29, 2020, 5:43:04 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
         <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                <jsp:include page = "Left.jsp"></jsp:include>
                <div class="col-sm-9">
                    <div class="container">
                        <div class="card">
                            <div class="row">
                                <aside class="col-sm-5 border-right">
                                    <article class="gallery-wrap"> 
                                        <div class="img-big-wrap">
                                            <div> <a href="#"><img src="${detail.image}"></a></div>
                                        </div> <!-- slider-product.// -->
                                        <div class="img-small-wrap">
                                        </div> <!-- slider-nav.// -->
                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3">${detail.name}</h3>

                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="currency">US $</span><span class="num">${detail.price}</span>
                                            </span> 
                                            <!--<span>/per kg</span>--> 
                                        </p> <!-- price-detail-wrap .// -->
                                        <dl class="item-property">
                                            <dt>Description</dt>
                                            <dd><p>${detail.description} </p></dd>
                                        </dl>
                                        <dl class="item-property">
                                            <dt>Số lượng còn lại</dt>
                                            <dd><p>${detail.soluong} </p></dd>
                                        </dl>

                                        <hr>
                                        <div class="row">
                                                <div class="col-sm-5">
                                                    <dl class="param param-inline">
                                                        <dt>Quantity: </dt>
                                                        <dd>
                                                            <select id="quantityDropdown" class="form-control form-control-sm" style="width:70px;">
                                                                <option> 1 </option>
                                                                <option> 2 </option>
                                                                <option> 3 </option>
                                                            </select>
                                                        </dd>
                                                    </dl>  <!-- item-property .// -->
                                                </div> <!-- col.// -->
                                            </div> <!-- row.// -->
                                            <hr>
                                            <a href="#" onclick="buyNow()" class="btn btn-lg btn-primary text-uppercase"> Buy now </a>
                                            <a href="#" onclick="addToCart()" class="btn btn-lg btn-outline-primary text-uppercase"> <i class="fas fa-shopping-cart"></i> Add to cart </a>

                                            <script>
                                                function buyNow() {
                                                    var quantity = parseInt(document.getElementById('quantityDropdown').value);
                                                    var availableQuantity = parseInt("${detail.soluong}");

                                                    if (quantity > availableQuantity) {
                                                        alert("Sản phẩm chỉ còn " + availableQuantity + " sản phẩm. Vui lòng chọn số lượng nhỏ hơn hoặc bằng.");
                                                    } else {
                                                        var productId = "${detail.id}";
                                                        window.location.href = "buyCart?pid=" + productId + "&quantity=" + quantity;
                                                    }
                                                }

                                                function addToCart() {
                                                    var quantity = parseInt(document.getElementById('quantityDropdown').value);
                                                    var availableQuantity = parseInt("${detail.soluong}");

                                                    if (quantity > availableQuantity) {
                                                        alert("Sản phẩm chỉ còn " + availableQuantity + " sản phẩm. Vui lòng chọn số lượng nhỏ hơn hoặc bằng.");
                                                    } else {
                                                        var productId = "${detail.id}";
                                                        window.location.href = "cart?pid=" + productId + "&quantity=" + quantity;
                                                    }
                                                }
                                            </script>

                                    </article> <!-- card-body.// -->
                                </aside> <!-- col.// -->
                            </div> <!-- row.// -->
                        </div> <!-- card.// -->


                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <jsp:include page ="Footer.jsp"></jsp:include>
    </body>
</html>
