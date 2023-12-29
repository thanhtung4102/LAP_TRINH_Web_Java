<%-- 
    Document   : Detail
    Created on : Dec 29, 2020, 5:43:04 PM
    Author     : trinh
--%>

<%@page import="entity.Product"%>
<%@page import="entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="entity.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int check = 0;
    List<Account> lista = (List<Account>) request.getAttribute("accounts");
    List<Order> listo = (List<Order>) request.getAttribute("orders");
    List<Product> listo2 = (List<Product>) request.getAttribute("product");
    List<Account> lista1 = (List<Account>) request.getAttribute("listacc1");
    if (lista != null && listo != null){
        check = 1;
        request.setAttribute("check", check);
        request.setAttribute("lista", lista);
        request.setAttribute("listo", listo);
    }
    else if (listo2 != null)
    {
        check = 2;
        request.setAttribute("check", check);
        request.setAttribute("listo2", listo2);
    }
    else if (lista1 != null )
        check = 3;
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager</title>
        <link
                href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
                rel="stylesheet">
        <link
                href="${pageContext.request.contextPath}/assets/font-awesome/css/font-awesome.min.css"
                rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/style.css"
                rel="stylesheet">

        <!-- scripts -->
        <script
                src="${pageContext.request.contextPath}/assets/script/jquery-1.12.4.min.js"
                type="text/javascript"></script>
        <script
                src="${pageContext.request.contextPath}/assets/script/bootstrap.min.js"
                type="text/javascript"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"
                type="text/javascript"></script>
                
    </head>
    <body>
        <jsp:include page="/WEB-INF/pages/header.jsp"></jsp:include>
        <jsp:include page="/WEB-INF/pages/sidebar.jsp" />
	<!-- /sidebar -->
        <h1>${check}</h1>
	<div id="page-content-wrapper" class="page-content-toggle">
		<div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6 text-center border-right">
                            <h2 style="color: blue;">Số lượng sản phẩm</h2>
                            <p style="font-size: 40px">${requestScope.listp.size()}</p>
                        </div>
                        <div class="col-md-6 text-center">
                            <h2 style="color: green;">Số lượng khách hàng</h2>
                            <p style="font-size: 40px">${requestScope.listacc.size()}</p>
                        </div>
                    </div>
                </div>
                <% if (request.getAttribute("check") != null && (int)request.getAttribute("check") == 1) { %>
                    <div class="container-fluid">
                        <h2>Top 5 user purchase</h2>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Số thứ tự</th>
                                    <th>Tên người dùng</th>
                                    <th>Tổng tiền mua hàng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%-- Lặp qua top 5 người dùng và hiển thị thông tin --%>
                                <% 
                                    int count = 0;
                                    for (int i =0;i<lista.size();i++) {
                                        if (count >= 5) {
                                            break;
                                        }
                                %>
                                    <tr>
                                        <td><%= count + 1 %></td>
                                        <td><%= lista.get(i).getUser() %></td> <!-- Thay bằng phương thức lấy tên người dùng từ đối tượng Account -->
                                        <td>$<%= listo.get(i).getTotalAmount() %></td> <!-- Thay bằng phương thức lấy tổng tiền mua hàng từ đối tượng Account -->
                                    </tr>
                                <% 
                                    count++;
                                } 
                                %>

                            </tbody>
                        </table>
                    </div>
                <% } %>
                <% if (request.getAttribute("check") != null && (int)request.getAttribute("check") == 2) { %>
                    <div class="container-fluid">
                        <h2>Top 5 products purchase</h2>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Số thứ tự</th>
                                    <th>Tên mặt hàng</th>
                                    <th>Giá mặt hàng</th>
                                    <th>Số lượng mua</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%-- Lặp qua top 5 người dùng và hiển thị thông tin --%>
                                <% 
                                    int count = 0;
                                    for (int i =0;i<listo2.size();i++) {
                                        if (count >= 5) {
                                            break;
                                        }
                                %>
                                    <tr>
                                        <td><%= count + 1 %></td>
                                        <td><%= listo2.get(i).getName()%></td>
                                        <td><%= listo2.get(i).getPrice()%></td>
                                        <td><%= listo2.get(i).getSoluong()%></td> <!-- Thay bằng phương thức lấy tổng tiền mua hàng từ đối tượng Account -->
                                    </tr>
                                <% 
                                    count++;
                                } 
                                %>

                            </tbody>
                        </table>
                    </div>
                <% } %>
                <% if (request.getAttribute("check") == null && request.getAttribute("listacc1") != null) { %>
                    <div class="container-fluid">
                        <h2>List of User</h2>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên người dùng</th>
                                    <th>Delete</th>
                                    <th>Upgrade</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listacc}" var="o">
                                    <tr>
                                        <td>${o.getId()}</td>
                                        <td>${o.getUser()}</td>
                                        <td class="align-middle">
                                            <a href="managerUser?uid=${o.getId()}&action=delete" class="text-dark">
                                                <button type="button" class="btn btn-danger">Delete</button>
                                            </a>
                                        </td>
                                        <td class="align-middle">
                                            <a href="managerUser?uid=${o.getId()}&action=upgrade" class="text-dark">
                                                <button type="button" class="btn btn-success">Upgrade to seller</button>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                <% } %>


		<!-- footer -->
		<jsp:include page="/WEB-INF/pages/footer.jsp" />
		<!-- /footer -->
        </div>
    </body>
</html>
