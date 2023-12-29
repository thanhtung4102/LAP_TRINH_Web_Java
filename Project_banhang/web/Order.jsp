<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int meth;
    %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><b>Order</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="showOrder" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Order</h4>
                                <button type="button" id="closeModalBtn" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${sessionScope.acc.id}" name="id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${sessionScope.acc.user}" name="name" type="text" class="form-control" readonly required>
                                </div>
                              
                                    <%-- Kiểm tra nếu pid và quantity không rỗng --%>
                                    <% if (request.getAttribute("pid") != null && request.getAttribute("quantity") != null) { %>
                                        <%-- In một loại khác nếu điều kiện này được đáp ứng --%>
                                        <div class="form-group">
                                            <label>ID sản phẩm</label>
                                            <input value="${pid.id}" name="pid" type="text" class="form-control" readonly required>
                                        </div>
                                        <div class="form-group">
                                            <label>Sản phẩm</label>
                                            <input value="${pid.name}" name="nameP" type="text" class="form-control" readonly required>
                                        </div>
                                        <div class="form-group">
                                            <label>Số lượng</label>
                                            <input value="${quantity}" name="quantity" type="text" class="form-control" readonly required>
                                        </div>
                                        <div class="form-group">
                                            <label>Tổng tiền</label>
                                            <input value="${pid.price*quantity}" name="amount" type="text" class="form-control" readonly required>
                                        </div>
                                    <% } else { %>
                                        <div class="form-group">
                                            <label>Numbers of product</label>
                                            <input value="${sessionScope.cart_list.size()}" name="numbers" type="text" class="form-control" readonly required>
                                        </div>
                                        <div class="form-group">
                                            <label>Price</label>
                                            <input value="${total}" name="price" type="text" class="form-control" readonly required>
                                        </div>
                                    <% } %>
                              
                                
                                <div class="form-group">
                                    <label>Address</label>
                                    <input value="" name="addr" id="addr" type="text" class="form-control" required>
                                </div>
                                    
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input value="" name="phone" id="addr" type="text" class="form-control" required>
                                </div>
                               
                             
                                <div class="form-group">
                                    <label>Payment</label>
                                    <select name="paymentMethodId" id = "paymentMethodId" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listpay}" var="pay">
                                            <option value="${pay.id}">${pay.method}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                            </div>
                            <div class="modal-footer">
                                <input type="submit" onclick="addOrder()" class="btn btn-success" value="Confirm">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
        
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Lắng nghe sự kiện click trên nút đóng modal
                document.getElementById('closeModalBtn').addEventListener('click', function() {
                    // Thực hiện chuyển hướng đến trang khác khi nút đóng được click
                    window.location.href = 'show'; // Thay 'URL_cua_trang_mong_muon' bằng URL thực tế
                });
            });
        </script>

    </body>
</html>