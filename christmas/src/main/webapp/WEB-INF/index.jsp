<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>


<title>Phamily's Christmas Party</title>
</head>
<body id="frontcover">
<h1> Phamily's Christmas Party</h1>
  <div class="row box">
  	<c:if test="${logoutMessage != null}">
			<c:out value="${logoutMessage}"></c:out>
		</c:if>
		<h2>Login</h2>
		<c:if test="${errorMessage != null}">
			<c:out value="${errorMessage}"></c:out>
		</c:if>
		
    <form class="col s12" method="POST" action="/login">
    
      <div class="row">
        <div class="input-field col s3">
          <i class="material-icons prefix">email</i>
          <input id="icon_prefix username" type="text" name="username" class="validate" />
          <label for="icon_prefix username">Email</label>
        </div>
        </div>
        
         <div class="row">
        <div class="input-field col s3">
          <i class="material-icons prefix">edit</i>
          <input id="icon_telephone password" type="password" class="validate" name="password" />
          <label for="icon_telephone password">Password</label>
        </div>
        </div>
        
            <div class="row">
        <div>
        <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" /> 
		
		<input class="waves-effect waves-light btn" type="submit" value="Login!" />
        </div>
        </div>
    

    </form>
  </div>

  <div class="row box">
		<h2>Register</h2>
		<h3 style="color: green">
			<c:out value="${successful}"></c:out>
		</h3>
   	<form:form class="col s12" action="/registration" method="POST" modelAttribute="user" >
      <div class="row">
      
        <div class="input-field col s3">
          <i class="material-icons prefix">person</i>
         
					<form:input class="validate" path="Name" />
					<form:errors path="Name" />
			 <form:label path="Name">Name: </form:label>	
        </div>
      </div>
      <div class="row">
       <div class="input-field col s3">
          <i class="material-icons prefix">email</i>
        
					<form:input class="validate" path="email" />
					<form:errors path="email" />
			 <form:label path="email">Email:</form:label>	
        </div>
      </div>
       <div class="row">
         <div class="input-field col s3">
          <i class="material-icons prefix">edit</i>
       
					<form:password class="validate" path="password" />
					<form:errors path="password" />
			 <form:label path="password">Password:</form:label>	
        </div>
        </div>
        <div class="row">
           <div class="input-field col s3">
          <i class="material-icons prefix">edit</i>
        <form:label path="passwordConfirmation">Password Confirmation:</form:label>
				<form:password class="validate" path="passwordConfirmation" />
				<form:errors path="passwordConfirmation" />
        </div>
        </div>
<input type="submit" value="Register!" class="waves-effect waves-light btn" />
      
	
    	</form:form>
  </div>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
</body>
</html>