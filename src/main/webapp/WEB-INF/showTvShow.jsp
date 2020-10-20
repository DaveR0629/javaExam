  
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
      <div class="row d-flex justify-content-between p-3">
		       <a href="/user" class="btn btn-secondary btn-outline-danger">profile page</a>
		       <a href="/home" class="btn btn-secondary btn-outline-danger">Home</a>
		       <a href="/logout" class="btn btn-secondary btn-outline-danger">logout</a>
	       </div>  
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header text-light text-center" Style="background:#786d56;"><h2>${someShow.title}</h2></div>
                    <div class="card-body">
                        <h3>Network: ${someShow.network}</h3>
                        <p>Average Rating: ${someShow.getAverageRating()}</p>
                        <a href="/edit/show/${someShow.id}" class="btn btn-secondary btn-outline-warning"> Edit ${someShow.title}</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="card">
                    <div class="card-header text-light text-center" Style="background:#786d56;"><h2>Leave a Review</h2></div>
                    <div class="card-body">
                        <form:form action="/shows/${someShow.id}/review" method="post" modelAttribute="newReview">
                            <div class="row text-center">
                                <div class="col-sm-4 mx-auto form-group">
                                    <label>Rating</label>
                                    <select name="rating" class="form-control">
                                        <option>5</option>
                                        <option>4</option>
                                        <option selected>3</option>
                                        <option>2</option>
                                        <option>1</option>
                                    </select>
                                    <form:errors path="rating" class="text-danger"/>
                                </div>
                            </div>
                            <input type="submit" value="Review ${someShow.title}" class="btn btn-primary btn-block" />
                        </form:form>
                    </div>
                </div>
                <ul class="list-group mt-5">
                    <li class="list-group-item bg-dark text-light">Reviews:</li>
                    <c:forEach items="${someShow.reviews}" var="review">
                        <li class="list-group-item">
                            <strong>${review.user.userName}: ${review.rating} out of 5</strong><br>
                        </li>
                    </c:forEach>
                </ul>
           </div>
        </div>
    </div>
</body>
</html>