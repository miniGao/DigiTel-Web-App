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
<title>Make Order</title>
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
	<div class="container">
            <div class="d-flex justify-content-center p-5">
                <div class="container">
                    <form action="submit-order" method="POST" class="text-center border border-light bg-light rounded-lg p-5 needs-validation" id="orderForm" novalidate>
                        <p class="h3 font-weight-bolder p-1">Order Your New Phone</p>
                        <p class="h5 font-italic text-secondary p-2">Hi, ${ dataModeler.customer.userName }. DigiTel offers the most popular phone brands and models!</p>
                        <p class="h5 font-weight-bolder text-danger">${dataModeler.message}</p>
                        <input name="custId" type="text" value="${ dataModeler.customer.custId }" hidden="true" >
                        <div class="d-flex flex-row justify-content-between mt-5">
                            <label class="h5 text-left font-weight-bold w-20 p-1">Browse Phone: </label>
                            <div class="w-75">
                                <select class="form-control" name="productId" required>
                                    <option value="" selected disabled hidden=true>Please Select</option>
                                   	<c:forEach items="${dataModeler.productList}" var="item">
										<option value="${ item.productId }"><c:out value="${ item.brandName } ${ item.modelName } - Price: CAD$${ item.price }"></c:out></option>
									</c:forEach>
                                </select>
                                <div class="invalid-feedback m-1">
                                    Please pick a phone
                                </div>
                            </div>
                        </div>

                        <div class="d-flex flex-row justify-content-between mt-2">
                            <label class="h5 text-left font-weight-bold w-20 p-1">Choose Quantity: </label>
                            <div class="w-75">
                                <input class="form-control" type="number" value="1" min="1" name="quantity" required />
                                <div class="invalid-feedback m-1">
                                    Please choose quantity
                                </div>
                            </div>
                        </div>
                        
                        <fieldset class="mt-5">
                            <legend class="text-center">Payment Information</legend>
                            <div class="d-flex flex-row justify-content-between mt-4">
                                <div class="w-20 p-1">
                                    <label class="h5 font-weight-bold mr-1">Credit Card Number:</label>
                                    <label class="h5 font-weight-bold text-danger">*</label>
                                </div>
                                <div class="w-75">
                                    <input class="form-control" type="text" name="creditCardNumber" placeholder="Please enter credit card number" pattern="[0-9]{16}" required />
                                    <div class="invalid-feedback m-1">
                                        Please verify your credit card number, 16-digits
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex flex-row justify-content-between mt-2">
                                <div class="w-20 p-1">
                                    <label class="h5 font-weight-bold mr-1">Expiration Date:</label>
                                    <label class="h5 font-weight-bold text-danger">*</label>
                                </div>
                                <div class="d-flex flex-row w-25">
                                    <select class="form-control mx-2" name="ExpDtMonth">
                                        <option>01</option>
                                        <option>02</option>
                                        <option>03</option>
                                        <option>04</option>
                                        <option>05</option>
                                        <option>06</option>
                                        <option>07</option>
                                        <option>08</option>
                                        <option>09</option>
                                        <option>10</option>
                                        <option>11</option>
                                        <option>12</option>
                                    </select>
                                    <select class="form-control" name="ExpDtYear">
                                        <option>2020</option>
                                        <option>2021</option>
                                        <option>2022</option>
                                        <option>2023</option>
                                        <option>2024</option>
                                        <option>2025</option>
                                        <option>2026</option>
                                    </select>
                                </div>
                            </div>
                            <div class="d-flex flex-row justify-content-between mt-2">
                                <div class="w-20 p-1">
                                    <label class="h5 font-weight-bold mr-1">Security Code:</label>
                                </div>
                                <div class="w-20">
                                    <input class="form-control" type="text" name="securityCode" placeholder="Security code" pattern="[0-9]{3}" required />
                                    <div class="invalid-feedback m-1">
                                        Please verify your security code
                                    </div>
                                </div>
                            </div>
                        </fieldset>

                        <div class="d-flex flex-row mt-5">
                            <button type="submit" class="btn btn-success btn-block">Order Now</button>
                        </div>
                    </form>
                </div>
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