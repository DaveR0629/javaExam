  
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
        <h1 class="text-center" >Welcome to the Dashboard</h1>
	       <div class="row d-flex justify-content-between p-3">
		       <a href="/user" class="btn btn-secondary btn-outline-danger">profile page</a>
		       <a href="/logout" class="btn btn-secondary btn-outline-danger">logout</a>
		       <a href="/home" class="btn btn-secondary btn-outline-danger">All Ideas</a>
		       <a href="/home/desc" class="btn btn-secondary btn-outline-danger">Low rating</a>
		       <a href="/home/asc" class="btn btn-secondary btn-outline-danger">High rating</a>
	       </div>
        <div class="row">
           <div class="col-sm-4 bg-light text-center p-3">
               <form:form action="/shows/new" method="post" modelAttribute="newShowPlus">
                   <div class="form-group">
                       <label>Title</label>
                       <form:input path="title" class="form-control" />
                       <form:errors path="title" class="text-danger" />
                   </div>
                   <div class="form-group">
                       <label>Networks</label>
                       <form:input path="network" class="form-control" />
                       <form:errors path="network" class="text-danger" />
                   </div>
                   <input type="submit" value="Add Show" class="btn btn-primary" />
               </form:form>
           </div>
           <div class="col-sm-8">
               <table class="table table-light table-striped table-hover">
                   <tr>
                       <th>Title</th>
                       <th>Networks</th>
                       <th>Added by</th>
                       <th>Average rating</th>
                   </tr>
                   <c:forEach items="${allReviews}" var="review">
                      <tr>
                          <td><a href="/show/${review.tvShow.id}">${review.tvShow.title}</a></td>
                          <td>${review.tvShow.network}</td>
                          <td>${review.user.userName}</td>
                          <td>${review.rating}</td>
                      </tr>
                   </c:forEach>
                </table>
           </div>
        </div>
    </div>
    
</body>
</html>