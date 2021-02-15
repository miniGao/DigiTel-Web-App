<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<style type="text/css">
	<%@include file="resources/css/style.css" %>
</style>
<title>Welcome to DigiTel</title>
</head>
<body>
	<div class="row">
        <div class="h1 font-weight-bolder bg-secondary text-light mx-5 my-2 p-2 float-left">DigiTel Inc.</div>
    </div>
    
    <div class="container">
        <div class="d-flex flex-row">
			<div class="w-50 p-5">
            	<p class="h1 font-weight-bolder p-2">Welcome to DigiTel!</p>
				<p class="h3 font-italic text-secondary p-4">Connect to the world using DigiTel.</p>
			</div>
			<div class="w-50 p-5">
				<form action="sign-in" method="POST" class="text-center border border-light bg-light rounded-lg p-5 needs-validation" novalidate>
		            <p class="h4 mb-4">Sign in</p>
		            
		            <div class="mb-2">
		                <input type="text" class="form-control" placeholder="User ID" name="custId" required />
		                <div class="invalid-feedback m-1">
		                    Please enter user id.
		                </div>
		            </div>
		            <div class="mb-2">
		                <input type="password" class="form-control" placeholder="Password" name="password" required />
		                <div class="invalid-feedback m-1">
		                    Please enter password.
		                </div>
		            </div>
		            <div class="d-flex flex-row py-2">
		                <button type="submit" class="btn btn-info btn-block">SIGN IN</button>
		            </div>
		            <p>New to DigiTel?
		                <a href="register">Register here</a>
		            </p>
		        </form>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
		<%@include file="resources/js/bootstrap.custom.validation.js" %>
	</script>
</body>
</html>