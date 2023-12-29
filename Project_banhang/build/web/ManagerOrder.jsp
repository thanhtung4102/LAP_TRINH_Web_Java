<%-- 
    Document   : Cart
    Created on : Oct 31, 2020, 9:42:21 PM
    Author     : trinh
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.Cart"%>
<%@page import="java.util.List"%>
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
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        
    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="shopping-cart">
                <div class="px-4 px-lg-0">

                    <div class="pb-5">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                    <!-- Shopping cart table -->
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col" class="border-0" style="text-align: center; padding: 0">
                                                        <div class="p-2 px-3 text-uppercase" style="background-color: rgb(164, 159, 159)">Ngày mua</div>
                                                    </th>
                                                    <th scope="col" class="border-0" style="text-align: center; padding: 0">
                                                        <div class="p-2 px-3 text-uppercase" style="background-color: rgb(164, 159, 159)">Địa chỉ</div>
                                                    </th>
                                                    <th scope="col" class="border-0" style="text-align: center; padding: 0">
                                                        <div class="p-2 px-3 text-uppercase" style="background-color: rgb(164, 159, 159)">Phone</div>
                                                    </th>
                                                    <th scope="col" class="border-0" style="text-align: center; padding: 0">
                                                        <div class="p-2 px-3 text-uppercase" style="background-color: rgb(164, 159, 159)">Tổng tiền</div>
                                                    </th>
                                                    <th scope="col" class="border-0" style="text-align: center; padding: 0">
                                                        <div class="p-2 px-3 text-uppercase" style="background-color: rgb(164, 159, 159)">Xóa</div>
                                                    </th>
                                                    <th scope="col" class="border-0" style="text-align: center; padding: 0">
                                                        <div class="p-2 px-3 text-uppercase" style="background-color: rgb(164, 159, 159)">Xem chi tiết</div>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${list}" var="o" varStatus="loop">
                                                <tr>                                                   
                                                    <td class="align-middle" style="text-align: center"><strong>${o.getOrderDate()}</strong></td>
                                                    <td class="align-middle" style="text-align: center"><strong>${lists[loop.index].address}</strong></td>
                                                    <td class="align-middle" style="text-align: center"><strong>${lists[loop.index].phone}</strong></td>
                                                    <td class="align-middle" style="text-align: center"><strong>${o.getTotalAmount() }</strong></td>
                                                    <td class="align-middle" style="text-align: center"><a href="deleteOrder?oid=${o.orderId}" class="text-dark">
                                                            <button type="button" class="btn btn-danger">Delete</button>
                                                        </a>
                                                    </td>
                                                    <td class="align-middle" style="text-align: center"><a href="detailOrder?oid=${o.orderId}" class="text-dark">
                                                            <button type="button" class="btn btn-success">Xem chi tiết</button>
                                                        </a>
                                                    </td>
                                                </tr> 
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>

</html>
</html>
