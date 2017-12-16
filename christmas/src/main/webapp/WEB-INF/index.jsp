<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <script src="https://use.fontawesome.com/1166bbf884.js"></script>

<title>Phamily's Christmas Party</title>
</head>

<body id="frontcover">

    <div>
	<h1 id="strobe" class="display-3" style="text-align: left">Phamily's Christmas Party</h1>
	</div>
	
	<div>
		<c:if test="${logoutMessage != null}">
			<c:out value="${logoutMessage}"></c:out>
		</c:if>
		<h2 style="color:red">Login</h2>
		<c:if test="${errorMessage != null}">
			<c:out value="${errorMessage}"></c:out>
		</c:if>
		<form method="POST" action="/login">
				<div>
					 <label>Email: </label><input id="username" type="text" name="username">
				</div>
				<div>
					<input type="hidden" name="password" value="password">
				</div>
				<div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
					<input type="submit" value="Login!" class="btn btn-success"  />
				</div>
		</form>
	</div>
<br>
<br>
	<div>
		<h2 style="color:green">Register</h2>
		<h3 style="color: green">
			<c:out value="${successful}"></c:out>
		</h3>
		<form:form action="/registration" method="POST" modelAttribute="user">
				<div>
					<form:label path="Name">Name: </form:label>
					<form:input path="Name" />
					<form:errors path="Name" />
				
				</div>
				<div>
				<form:label path="email">Email:</form:label>
					<form:input class="validate" path="email" />
					<form:errors path="email" />
					
				</div>
				<div>
				<form:label path="password"></form:label>
					<form:hidden path="password" value="password"/>
					<form:errors path="password" />
					
				</div>	
				<div>
					<form:label path="passwordConfirmation"></form:label>
					<form:hidden path="passwordConfirmation" value="password" />
					<form:errors path="passwordConfirmation" />
				</div>
			<input type="submit" value="Register!" class="btn btn-danger" />
		</form:form>
	</div><br><br>
	
	<div class="wrapping">
        <div class="container">   
    <div id="carousel_images">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="2000">
                <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                
                <div class="carousel-inner" role="listbox">
                
                <div class="carousel-item active">
                    <img class="img-fluid img-thumbnail rounded" src="/css/taylor.jpg">
                </div>
                
                <div class="carousel-item">
                    <img class="img-fluid img-thumbnail" src="/css/elijah.jpg">
                </div>
                
                <div class="carousel-item">
                    <img class="img-fluid img-thumbnail" src="/css/greyson.jpg">
                </div>
                
                  <div class="carousel-item">
                    <img class="img-fluid img-thumbnail" src="/css/Layla.jpg">
                </div>
                
                  <div class="carousel-item">
                    <img class="img-fluid img-thumbnail" src="/css/Remy.jpg">
                </div>
                
                   <div class="carousel-item">
                    <img class="img-fluid img-thumbnail" src="/css/hosanna.jpg">
                </div>
                
                   <div class="carousel-item">
                    <img class="img-fluid img-thumbnail" src="/css/sammy.jpg">
                </div>
                
                   <div class="carousel-item">
                    <img class="img-fluid img-thumbnail" src="/css/melody.jpg">
                </div>
                
                
                </div>
                
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
                </a>
        </div>
    </div>
        </div>
    </div>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script> 
</body>
</html>