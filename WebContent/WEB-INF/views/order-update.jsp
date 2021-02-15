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
<title>Update Order</title>
</head>
<body> 
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark font-weight-bold">
        <a class="navbar-brand h3" href="home?custId=${ dataModeler.customer.custId }">Digitel</a>
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
      <div class="d-flex justify-content-center p-5">
	      <div class="container-profile">
	      		<form action="update-order" method="POST" class="text-center border border-light bg-light rounded-lg p-5 needs-validation" id="orderForm" novalidate>
				    <p class="h3 font-weight-bolder p-1">Update Order Details</p>
				    <p class="h5 font-italic text-secondary p-2">Make updates to your order.</p>
				    <p class="h5 font-weight-bolder text-danger">${dataModeler.message}</p>
				    <p class="h5 font-weight-bolder text-success">${dataModeler.info}</p>
				    <input name="custId" type="text" value="${ dataModeler.customer.custId }" hidden="true">
				    <table class="table table-hover text-left">
				        <tbody>
				          <tr>
				            <th scope="row">Order Id</th>
				            <td><input class="form-control" type="text" name="orderId" value="${ dataModeler.orders.orderId }" readonly></td>
				          </tr>
				          <tr>
				            <th scope="row">Order Time</th>
				            <td><input class="form-control" type="text" value="${ dataModeler.orders.orderTimestamp }" readonly></td>
				          </tr>
				          <tr>
				            <th scope="row">Product Model</th>
				            <td>
				            	<div>
	                                <select class="form-control" name="productId" required>
	                                    <option selected="selected" selected hidden="true" value="${ dataModeler.product.productId }">${ dataModeler.product.brandName } ${ dataModeler.product.modelName } - Price: CAD$${ dataModeler.product.price }</option>
	                                   	<c:forEach items="${dataModeler.productList}" var="item">
											<option value="${ item.productId }"><c:out value="${ item.brandName } ${ item.modelName } - Price: CAD$${ item.price }"></c:out></option>
										</c:forEach>
	                                </select>
	                                <div class="invalid-feedback m-1">
	                                    Please pick a phone model
	                                </div>
                            	</div>
				            </td>
				          </tr>
				          <tr>
				            <th scope="row">Order Quantity</th>
				            <td>
								<div>
	                                <input class="form-control" type="number" value="${ dataModeler.orders.quantity }" min="1" name="quantity" required />
	                                <div class="invalid-feedback m-1">
	                                    Please choose quantity
	                                </div>
                            	</div>
							</td>
				          </tr>
				          <tr>
				            <th scope="row">Order Status</th>
				            <td><input class="form-control" type="text" value="${ dataModeler.orders.orderStatus }" readonly></td>
				          </tr>
				          <tr>
				            <th scope="row">Delivery Date</th>
				            <td><input class="form-control" type="text" value="${ dataModeler.orders.deliveryDate }" readonly></td>
				          </tr>
				          <tr>
				            <th scope="row">Full Name</th>
				            <td><input class="form-control" type="text" value="${ dataModeler.customer.firstname } ${ dataModeler.customer.lastname }" readonly></td>
				          </tr>
				          <tr>
				            <th scope="row">Delivery Address</th>
				            <td><input class="form-control" type="text" value="${ dataModeler.customer.address }, ${ dataModeler.customer.city }, ${ dataModeler.customer.province }, ${ dataModeler.customer.country } ${ dataModeler.customer.postalCode }" readonly></td>
				          </tr>

				        </tbody>
				    </table>    
				    <div class="d-flex flex-row mt-5">
				        <button type="submit" class="btn btn-success btn-block">Update Order</button>
				    </div>
				</form>
	      </div>
      </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
		<%@include file="/resources/js/bootstrap.custom.validation.js" %>
	</script>
</body>
</html>