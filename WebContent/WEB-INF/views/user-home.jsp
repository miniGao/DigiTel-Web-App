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
<title>Digitel Services</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark font-weight-bold">
        <a class="navbar-brand h3" href="home?custId=${customer.custId}">Digitel</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse mx-5" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item mx-2">
              <a class="nav-link" href="home?custId=${customer.custId}">Home</a>
            </li>
          </ul>
          <div class="nav-item dropdown">
            <a class="nav-link text-light" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Welcome, ${ customer.userName }
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="profile-page?custId=${customer.custId}">My Profile</a>
              <a class="dropdown-item" href="manage-order?custId=${customer.custId}">My Orders</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item text-danger font-weight-bold" href="/Li_COMP303_Assignment2">Logout</a>
            </div>
          </div>
        </div>
    </nav>
        <div class="d-flex justify-content-center p-5">
            <div class="container-signin p-5">
            <div class="d-flex flex-row justify-content-center">
				<p class="h5 font-weight-bold text-danger">${dataModeler.message}</p>
			</div>
                <div class="text-center border border-light bg-light rounded-lg p-5">
                    <p class="h3 font-weight-bolder p-1">Digitel Services</p>
                    <p class="h5 font-italic text-secondary p-2">Welcome, ${ customer.firstname } ${ customer.lastname } (${ customer.userName }). DigiTel at your service.</p>
                    <div class="border border-lightgrey rounded-lg bg-white p-3">
                        <div class="p-1">
                            <a class="btn btn-dark btn-lg btn-block font-weight-bolder" href="create-order?custId=${customer.custId}">Let's Start Shopping</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>