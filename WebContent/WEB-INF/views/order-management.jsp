<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<style type="text/css">
	<%@include file="/resources/css/style.css" %>
</style>
<title>Order Management</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark font-weight-bold">
        <a class="navbar-brand h3" href="home?custId=${ dataModeler.customer.custId  }">Digitel</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse mx-5" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item mx-2">
              <a class="nav-link" href="home?custId=${ dataModeler.customer.custId }">Home</a>
            </li>
          </ul>
          <div class="nav-item dropdown">
            <a class="nav-link text-light" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Welcome, ${ dataModeler.customer.userName }
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="profile-page?custId=${ dataModeler.customer.custId }">My Profile</a>
              <a class="dropdown-item" href="manage-order?custId=${ dataModeler.customer.custId }">My Orders</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item text-danger font-weight-bold" href="/Li_COMP303_Assignment2">Logout</a>
            </div>
          </div>
        </div>
      </nav>
	<div class="container-order">
		<div class="d-flex justify-content-center p-5">
			<div class="text-center border border-light bg-light rounded-lg p-5 needs-validation">
                    <p class="h3 font-weight-bolder p-1">Manage Order</p>
                    <p class="h5 font-italic text-secondary p-2">Digitel Order Management Panel.</p>
                    <p class="h5 font-weight-bolder text-danger">${dataModeler.message}</p>
				    <p class="h5 font-weight-bolder text-success">${dataModeler.info}</p>
				    <p class="h5 font-italic font-weight-bolder text-info">${dataModeler.orderInfo}</p>
				    
                    <table class="table table-hover text-left">
                        <thead>
                            <tr>
                            	<th scope="col">Order Date</th>
                                <th scope="col">Order Id</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Delivery Date</th>
                                <th scope="col">Customer Id</th>
                                <th scope="col">Product Id</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
	                        <c:forEach items="${dataModeler.orderList}" var="order">
		                        <tr>
		                        	<th scope="row"><c:out value="${ order.orderTimestamp }"></c:out></th>
		                        	<td><c:out value="${ order.orderId }"></c:out></td>
	                                <td><c:out value="${ order.quantity }"></c:out></td>
	                                <td><c:out value="${ order.deliveryDate }"></c:out></td>
	                                <td><c:out value="${ order.custId }"></c:out></td>
	                                <td><c:out value="${ order.prodId }"></c:out></td>
	                                <td>
	                                	<a class="mr-3" href="edit-order?orderId=${ order.orderId }">View/Edit</a>
	                                	<a class="text-danger" href="delete-order?orderId=${ order.orderId }">Cancel</a>
	                                </td>
	                           </tr>
							</c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
   	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>