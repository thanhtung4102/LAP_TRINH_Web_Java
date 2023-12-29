<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                width: 150px;
                height: 200px;
            }
                    body {
                font-family: 'Roboto', sans-serif;
                background-color: #f8f9fa;
            }

            .container {
                margin-top: 50px;
            }

            .table-wrapper {
                background: #fff;
                padding: 20px;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
            }

            .table-title {
                padding-bottom: 15px;
                margin-bottom: 15px;
                border-bottom: 1px solid #e0e0e0;
                font-size: 24px;
            }

            .table-title h2 {
                margin: 2px 0 0;
                font-size: 24px;
            }

            .table-title .btn {
                font-size: 16px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-right: 10px;
            }

            .table-title .btn i {
                margin-right: 2px;
            }

            .table-title .btn span {
                margin-left: 2px;
            }

            table.table th, table.table td {
                border-color: #e0e0e0;
            }

            table.table th {
                background-color: #f5f5f5;
            }

            table.table th, table.table td, table.table a {
                font-size: 16px;
            }

            table.table thead th, table.table tbody td {
                padding: 12px 15px;
            }

            table.table tbody td {
                vertical-align: middle;
            }

            table.table tbody tr {
                border-bottom: 1px solid #e0e0e0;
            }

            table.table tbody tr:last-of-type {
                border-bottom: none;
            }

            table.table tbody tr.active td {
                background-color: #f8f9fa;
            }

            .custom-checkbox {
                position: relative;
            }

            .custom-checkbox input[type="checkbox"] {
                opacity: 0;
                position: absolute;
            }

            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                width: 18px;
                height: 18px;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }

            .custom-checkbox input[type="checkbox"]:checked + label:before {
                background: #007bff;
                border-color: #007bff;
            }

            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid white;
                border-width: 0 2px 2px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }

            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-width: 0 2px 2px 0;
                transform: rotateZ(45deg);
                height: 15px;
            }

            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #007bff;
            }

            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }

            /* Pagination styles */
            .pagination {
                float: right;
                margin: 0 0 5px;
            }

            .pagination li a {
                border: none;
                font-size: 14px;
                min-width: 30px;
                min-height: 30px;
                color: #333;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }

            .pagination li a:hover {
                background: #007bff;
                color: #fff;
            }

            .pagination li.active a {
                background: #007bff;
                color: #fff;
            }

            .pagination li.active a:hover {
                background: #0056b3;
            }

            .pagination li.disabled i {
                color: #ccc;
            }

            .pagination li i {
                font-size: 16px;
                padding-top: 6px;
            }

            .pagination li.active {
                background: #007bff;
                border-radius: 2px;
            }

            .pagination li.active a {
                color: #fff;
            }

            .pagination li.active a span {
                background-color: #fff;
                border-radius: 2px;
                color: #007bff;
            }
        </style>
    <body>
        <div class="container">
            <% if ((boolean)request.getAttribute("Error") == true) { %>
                <div class="alert alert-warning">
                    Sản phẩm bạn chọn xóa không thể thực hiện.
                </div>
            <% } %>
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                            <a href="#" class="btn btn-danger" data-toggle="modal" onclick="confirmDelete()"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                            </th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listP}" var="o">
                            <tr>
                                <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox${o.id}" name="options[]" class="select-checkbox" value="${o.id}">
                                        <label for="checkbox${o.id}"></label>
                                    </span>
                                </td>
                                <td>${o.id}</td>
                                <td>${o.name}</td>
                                <td>
                                    <img src="${o.image}">
                                </td>
                                <td>${o.price} $</td>
                                <td>
                                    <a href="loadProduct?pid=${o.id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <a href="delete?pid=${o.id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
                    <a href="home"><button type="button" class="btn btn-primary">Back to home</button></a>

        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="image" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Số lượng nhập</label>
                                <input name="soluong" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <textarea name="title" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listCC}" var="o">
                                        <option value="${o.cid}">${o.cname}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal xác nhận xóa -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="delete" method="post">
                        <input type="hidden" name="selectedIds" id="selectedIdsInput" />
                    <div class="modal-header">
                        <h4 class="modal-title">Xác nhận xóa</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>Bạn có chắc chắn muốn xóa sản phẩm đã chọn?</p>
                        <p class="text-warning"><small>Thao tác này không thể hoàn tác.</small></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                        <button type="submit" class="btn btn-danger" id="confirmDeleteButton">Xác nhận xóa</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>

        
    <script src="js/manager.js" type="text/javascript"></script>
<script>
    // Hàm xác nhận xóa
    function confirmDelete() {
        var selectedIds = [];

        // Thu thập các ID của các hộp kiểm đã chọn
        $(".select-checkbox:checked").each(function () {
            selectedIds.push($(this).val());
        });

        if (selectedIds.length > 0) {
            // Sửa đoạn này để phù hợp với nhu cầu của bạn, ví dụ: hiển thị một hộp thoại xác nhận
            // hoặc gửi trực tiếp một biểu mẫu với các ID đã chọn để xóa.
            $("#selectedIdsInput").val(selectedIds.join(','));
            console.log("ID đã chọn: ", selectedIds);
            // Bây giờ bạn có thể thực hiện việc xóa hoặc hiển thị một hộp thoại xác nhận.
             $('#deleteEmployeeModal').modal('show');
        } else {
            // Không có hộp kiểm nào được chọn, cung cấp phản hồi hoặc thực hiện hành động phù hợp.
            alert("Vui lòng chọn ít nhất một sản phẩm để xóa.");
        }
    }
</script>
</body>
</html>