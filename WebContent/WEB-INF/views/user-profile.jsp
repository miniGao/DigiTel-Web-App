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
<title>Profile Management</title>
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
	      		<form action="update-profile" method="POST" class="text-center border border-light bg-light rounded-lg p-5 needs-validation" id="orderForm" novalidate>
				    <p class="h3 font-weight-bolder p-1">Manage Profile</p>
				    <p class="h5 font-italic text-secondary p-2">Make updates to your profile.</p>
				    <p class="h5 font-weight-bolder text-danger">${dataModeler.message}</p>
				    <p class="h5 font-weight-bolder text-success">${dataModeler.info}</p>
				    <input name="password" type="text" value="${ dataModeler.customer.password }" hidden="true">
				    <table class="table table-hover text-left">
				        <tbody>
				          <tr>
				            <th scope="row">Customer Id</th>
				            <td><input class="form-control" type="text" name="custId" value="${ dataModeler.customer.custId }" readonly></td>
				          </tr>
				          <tr>
				            <th scope="row">User Name</th>
				            <td><input class="form-control" type="text" name="userName" value="${ dataModeler.customer.userName }"></td>
				          </tr>
				          <tr>
				            <th scope="row">First Name</th>
				            <td><input class="form-control" type="text" name="firstname" value="${ dataModeler.customer.firstname }"></td>
				          </tr>
				          <tr>
				            <th scope="row">Last Name</th>
				            <td><input class="form-control" type="text" name="lastname" value="${ dataModeler.customer.lastname }"></td>
				          </tr>
				          <tr>
				            <th scope="row">Street Address</th>
				            <td><input class="form-control" type="text" name="address" value="${ dataModeler.customer.address }"></td>
				          </tr>
				          <tr>
				            <th scope="row">City</th>
				            <td><input class="form-control" type="text" name="city" value="${ dataModeler.customer.city }"></td>
				          </tr>
				          <tr>
				            <th scope="row">Country</th>
				            <td>
				                <select class="form-control" id="country" name="country" onchange="getStates(this.id, 'state')" required>
				                    <option selected="selected" selected hidden="true">${ dataModeler.customer.country }</option>
				                    <option>Canada</option>
				                    <option>United States</option>
				                </select>
				            </td>
				          </tr>
				          <tr>
				            <th scope="row">Province/State</th>
				            <td>
				                <select class="form-control" id="state" name="province" required>
				                    <option selected="selected" selected hidden="true">${ dataModeler.customer.province }</option>
				                </select>
				            </td>
				          </tr>
				          <tr>
				            <th scope="row">Postal Code</th>
				            <td><input class="form-control" type="text" name="postalCode" value="${ dataModeler.customer.postalCode }"></td>
				          </tr>
				        </tbody>
				    </table>    
				    <div class="d-flex flex-row mt-5">
				        <button type="submit" class="btn btn-success btn-block">Update Profile</button>
				    </div>
				</form>
	      </div>
      </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
		<%@include file="/resources/js/bootstrap.custom.validation.js" %>
		<%@include file="/resources/js/get.country.states.js" %>
	</script>
</body>
</html>