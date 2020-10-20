  
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
        <h1 class="text-center" >Edit ${someShow.title}</h1>
	       <div class="row d-flex justify-content-between p-3">
		       <a href="/user" class="btn btn-secondary btn-outline-danger">profile page</a>
		       <a href="/home" class="btn btn-secondary btn-outline-danger">Home</a>
		       <a href="/logout" class="btn btn-secondary btn-outline-danger">logout</a>
	       </div>
        <div class="row">
           <div class="col mx-auto bg-light text-center p-3">
               <form:form action="/show/update/${someShow.id}" method="post" modelAttribute="someShow">
                   <div class="form-group">
                       <label>Title</label>
                       <form:input path="title" class="form-control" placeholder="${someShow.title}"/>
                       <form:errors path="title" class="text-danger" />
                   </div>
                   <div class="form-group">
                       <label>Network</label>
                       <form:input path="network" class="form-control" placeholder="${someShow.network}"/>
                       <form:errors path="network" class="text-danger" />
                   </div>
                   <input type="submit" value="edit Show" class="btn btn-primary" />
               </form:form> 
                <a href="/show/destroy/${someShow.id}" class="btn btn-secondary btn-outline-warning"> Delete ${someShow.title}</a>
           </div>
        </div>
    </div>
</body>
</html>