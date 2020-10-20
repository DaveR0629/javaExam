  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>.Java Exam</title>
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.2/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container p-3">
    <div class="jumbotron text-center">
    	<h1>Welcome to the .Java Exam</h1>
    </div>
    <c:if test="${user != null}">
    	<div class="alert alert-info">Welcome back ${user.firstName} ---><a href="/home"class="btn btn-success btn-outline-warning">home</a></div>
    </c:if>
    <div class="row">
    	<div class="col-sm-8">
    		<div class="card">
    			<div class="card-header text-light" id="formHead">Register</div>
    				<div class="card-body">
    				<form:form class="col-sm" action="register" method="post"
    			modelAttribute="registerringUser">
    		<div class="form-group">
				<label>User Name</label>
				<form:input path="userName" class="form-control"/>
				<form:errors path="userName" class="text-danger"/>
			</div>
    		<div class="row">
				<div class="form-group col-sm-6">
					<label>First Name</label>
					<form:input path="firstName" class="form-control"/>
					<form:errors path="firstName" class="text-danger"/>
				</div>
				<div class="form-group col-sm-6">
					<label>Last Name</label>
					<form:input path="lastName" class="form-control"/>
					<form:errors path="LastName" class="text-danger"/>
				</div>
    		</div>
    		
			<div class="form-group">
				<label>Email</label>
				<form:input path="email" class="form-control"/>
				<form:errors path="email" class="text-danger"/>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>password</label>
					<form:input type="password" path="password" class="form-control"/>
					<form:errors  path="password" class="text-danger"/>
				</div>
				<div class="form-group col-sm-6">
					<label>Confirm Password</label>
					<form:input type="password" path="confirm" class="form-control"/>
					<form:errors path="confirm" class="text-danger"/>
				</div>
    		</div>
			<input  type="submit" value="Register" class="btn btn-primary"/>
		 </form:form> 
    				</div>
    		</div>
    	</div>
    	<div class="col-sm-4">
    		<div class="card">
    			<div class="card-header text-light" id="formHead">Login</div>
    				<div class="card-body text-center">
					   <form:form class="col-sm" action="/login" method="post"
			    			modelAttribute="loginUser">
						<div class="form-group">
							<label>User Name</label>
							<form:input path="userName" class="form-control"/>
							<form:errors path="userName" class="text-danger"/>
						</div>
						<div class="form-group">
							<label>password</label>
							<form:input type="password" path="password" class="form-control"/>
							<form:errors  path="password" class="text-danger"/>
						</div>
						<input type="submit" value="login" class="btn btn-primary"/>
					   </form:form> 
    				</div>
    			</div>
		   	</div>
		   </div>
    </div>
</body>
</html>