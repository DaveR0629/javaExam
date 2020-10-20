  
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
<body style="background:#b0624f;">
    <div class="container">
    	<h1 class="text-center">${user.userName} Profile</h1>
      <div class="row d-flex justify-content-between p-3">
		       <a href="/user" class="btn btn-secondary btn-outline-danger">profile page</a>
		       <a href="/home" class="btn btn-secondary btn-outline-danger">Home</a>
		       <a href="/logout" class="btn btn-secondary btn-outline-danger">logout</a>
	       </div>
        <div class="card">
            <div class="card-header text-light" id="formHead">${user.firstName} ${user.lastName}</div>
            <div class="card-body">
                <p>Email: ${user.email}</p>
                <p>Member since: ${user.createdAt}</p>
                <p>Shows Added: ${user.tvShows.size()}</p>
                <p>Reviews Left: ${user.reviews.size()}</p>
                <h4>Shows you haven't yet reviewed!</h4>
                <ul>
                    <c:forEach items="${showsToReview}" var="show">
                        <li><a href="/show/${show.id}">${show.title}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>