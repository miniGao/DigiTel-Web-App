<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<style type="text/css">
	<%@include file="/resources/css/style.css" %>
</style>
<title>Register Account</title>
</head>
<body>
		<div class="row">
            <div class="h1 font-weight-bolder bg-secondary text-light mx-5 my-2 p-2 float-left">DigiTel Inc.</div>
        </div>
        <div class="d-flex justify-content-center">
            <div class="container-signin p-5">
            <div class="d-flex flex-row justify-content-center">
				<p class="h5 font-weight-bold text-danger">${dataModeler.message}</p>
			</div>
                <form action="register" method="POST" class="text-center border border-light bg-light rounded-lg p-5 needs-validation" novalidate>
                    <p class="h3 font-weight-bolder p-1">Create Account</p>
                    <p class="h5 font-italic text-secondary p-2">Start your journey with DigiTel</p>
                    
                    <div class="mb-2">
                        <input type="text" class="form-control" name="custId" placeholder="Create 6-digit User ID, format: 000000" pattern="[0-9]{6}" value="${dataModeler.customer.custId}" required />
                        <div class="invalid-feedback m-1">
                            Please create 6-digit user id according to format: 000000
                        </div>
                    </div>
                    <div class="mb-2">
                        <input type="password" class="form-control" id="password" placeholder="Create Password(minimum length: 6)" minlength="6" required />
                        <div class="invalid-feedback m-1">
                            Please enter password with minimum 6 digits/letters/symbols
                        </div>
                    </div>
                    <div class="mb-2">
                        <input type="password" class="form-control" name="password" id="confirm_password" placeholder="Confirm Password" required />
                        <div class="invalid-feedback m-1">
                            Passwords not match
                        </div>
                    </div>
                    
                    
                        <fieldset class="mt-5">
                            <legend>Profile Details</legend>
                            <div class="d-flex flex-row mt-2">
                                <div class="col-3 text-left p-1">
                                    <label class="h5">User Name:</label>
                                </div>
                                <div class="col-9">
                                    <input class="form-control" type="text" name="userName" placeholder="Please enter your user name" value="${dataModeler.customer.userName}" required />
                                    <div class="invalid-feedback m-1">
                                        Please enter your user name
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex flex-row mt-2">
                                <div class="col-3 text-left p-1">
                                    <label class="h5">Full Name:</label>
                                </div>
                                <div class="d-flex flex-row col-9">
                                    <div class="mr-2">
                                    <input class="form-control" type="text" name="firstname" placeholder="First Name" value="${dataModeler.customer.firstname}" required />
                                    <div class="invalid-feedback m-1">
                                        Please enter your first name
                                    </div>
                                    </div>
                                    <div>
                                    <input class="form-control" type="text" name="lastname" placeholder="Last Name" value="${dataModeler.customer.lastname}" required />
                                    <div class="invalid-feedback m-1">
                                        Please enter your last name
                                    </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex flex-row justify-content-between mt-4">
                                <div class="col-3 text-left p-1">
                                    <label class="h5">Address:</label>
                                </div>
                                <div class="col-9">
                                    <div class="mb-2">
                                        <input class="form-control" type="text" name="address1" placeholder="Street Address" value="${dataModeler.customer.address}" required />
                                        <div class="invalid-feedback m-1">
                                            Please enter your street address
                                        </div>
                                    </div>
                                    <div class="mb-2">
                                        <input class="form-control" type="text" name="address2" placeholder="Street Address Line 2" />
                                    </div>
                                    <div class="d-flex flex-row mb-2">
                                        <div class="w-50 mr-1">
                                            <input class="form-control" type="text" name="city" placeholder="City" value="${dataModeler.customer.city}" required />
                                        </div>
                                        <div class="w-50">
                                            <select class="form-control" id="country" name="country" onchange="getStates(this.id, 'state')" required>
                                                <option value="" selected disabled hidden=true>Country</option>
                                                <option>Canada</option>
                                                <option>United States</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row mb-4">
                                        <div class="w-50 mr-1">
                                            <input class="form-control" type="text" name="postalCode" placeholder="Postal / Zip Code" value="${dataModeler.customer.postalCode}" required>
                                        </div>
                                        <div class="w-50">
                                            <select class="form-control" id="state" name="state_province" required>
                                                <option value="" selected disabled hidden=true>State / Province</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    
                    <div class="d-flex flex-row py-2">
                        <button type="submit" class="btn btn-success btn-block">SIGN UP</button>
                    </div>
                    <p>
                        <a href="/Li_COMP303_Assignment2">Back to Login Page</a>
                    </p>
                </form>
            </div>
        </div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
		<%@include file="/resources/js/bootstrap.custom.validation.js" %>
		<%@include file="/resources/js/password.validation.js" %>
		<%@include file="/resources/js/get.country.states.js" %>
	</script>
</body>
</html>