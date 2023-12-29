<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .card {
        margin-bottom: 20px;
        border: 1px solid rgba(0, 0, 0, 0.125);
        border-radius: 8px;
    }

    .card-header {
        border-bottom: 1px solid rgba(0, 0, 0, 0.125);
    }

    .list-group-item {
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .list-group-item:hover {
        background-color: #f8f9fa;
    }

    .card-body img {
        max-width: 100%;
        height: auto;
    }

    .bloc_left_price {
        font-size: 1.25rem;
        color: #007bff;
        font-weight: bold;
    }
</style>

<div class="col-sm-3">

    <!-- Categories Card -->
    <div class="card bg-light mb-3">
        <div class="card-header bg-info text-white text-uppercase">
            <i class="fa fa-list"></i> Categories</div>
        <ul class="list-group category_block">
            <c:forEach items="${listCC}" var="o">
                <li class="list-group-item ${tag == o.cid ? "active" : ""}">
                    <a href="category?cid=${o.cid}" class="text-dark">${o.cname}</a>
                </li>
            </c:forEach>
        </ul>
    </div>

    <!-- Last Product Card -->
    <div class="card bg-light mb-3">
        <div class="card-header bg-warning text-white text-uppercase">Last product</div>
        <div class="card-body">
            <img class="img-fluid rounded" src="${p.image}" alt="${p.name}" />
            <h5 class="card-title"><a href="detail?pid=${p.id}" style="color: black">${p.name}</a></h5>
            <p class="card-text">${p.title}</p>
            <p class="bloc_left_price">${p.price} $</p>
        </div>
    </div>

</div>
