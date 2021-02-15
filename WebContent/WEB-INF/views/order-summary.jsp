<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<style type="text/css">
	<%@include file="/resources/css/style.css" %>
</style>
<title>Order Summary</title>
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
                    <div class="container-summary text-center border border-light bg-light rounded-lg p-5 needs-validation">
                        <p class="h3 font-weight-bolder p-1">Order Summary</p>
					    <p class="h5 font-weight-bolder text-danger">${dataModeler.message}</p>
					    <p class="h5 font-weight-bolder text-success">${dataModeler.info}</p>
                        <table class="table bg-lightblue text-left">
                            <tbody>
                                <tr>
                                  <th scope="row">Order Time</th>
                                  <td>${ dataModeler.orders.orderTimestamp }</td>
                                </tr>
                                <tr>
                                  <th scope="row">Product Id</th>
                                  <td>${ dataModeler.product.productId }</td>
                                </tr>
                                <tr>
                                  <th scope="row">Product Name</th>
                                  <td>${ dataModeler.product.brandName } ${dataModeler.product.modelName}</td>
                                </tr>
                                <tr>
                                  <th scope="row">Quantity</th>
                                  <td>${ dataModeler.orders.quantity }</td>
                                </tr>
                                <tr>
                                  <th scope="row">Delivery Time</th>
                                  <td>${ dataModeler.orders.deliveryDate }</td>
                                </tr>
                                <tr>
                                  <th scope="row">Order Status</th>
                                  <td>${ dataModeler.orders.orderStatus }</td>
                                </tr>
                                <tr>
                                  <th scope="row">Customer Id</th>
                                  <td>${ dataModeler.customer.custId }</td>
                                </tr>
                                <tr>
                                  <th scope="row">Customer Name</th>
                                  <td>${ dataModeler.customer.firstname } ${ dataModeler.customer.lastname }</td>
                                </tr>
                                <tr>
                                    <th scope="row">Payment Method</th>
                                    <td>${ dataModeler.paymentMethod }</td>
                                </tr>
                                <tr>
                                    <th scope="row">Card No.</th>
                                    <td>${ dataModeler.creditCardNumber }</td>
                                </tr>
                                <tr>
                                    <th class="font-weight-bold" scope="row">Total Price</th>
                                    <td>CAD$ ${ dataModeler.orders.quantity * dataModeler.product.price }</td>
                                </tr>
                              </tbody>
                        </table>
                        <div>
                        	<a class="btn btn-success btn-lg btn-block text-light" href="create-order?custId=${dataModeler.customer.custId}">Continue Shopping</a>
                        </div>
                    </div>
                </div>
            </div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>