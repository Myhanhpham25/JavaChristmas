<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

<title>Phamily's Christmas Party</title>
</head>
<body id="secondcover">
	<div>
		<h1>
			Welcome,
			<c:out value="${currentUser.name}"></c:out> !!!
		</h1>
		<form id="logoutForm" method="POST" action="/logout">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="submit" value="Logout!" />
		</form>
	</div>
	<div class="col s12">
	<div class="input-field col s6">
	<table class="centered highlight">
        <thead>
          <tr>
              <th>Name</th>
              <th>Potluck contribution</th>
              <th>Action</th>
          </tr>
        </thead>

        <tbody>
        <c:forEach var ="user" items="${ allUsers }">
          <tr>
            <td><c:out value="${ user.name }"></c:out></td>
            <td>Eclair</td>
            <td>$0.87</td>
          </tr>
          <tr>
            <td>Alan</td>
            <td>Jellybean</td>
            <td>$3.76</td>
          </tr>
          <tr>
            <td>Jonathan</td>
            <td>Lollipop</td>
            <td>$7.00</td>
          </tr>
          </c:forEach>
        </tbody>
      </table>

	</div>	
</div>

<div>
<div>
<h2>Potluck Signup!</h2>
	
<form:form action="/addpotluck" method="POST" modelAttribute="potluck" >
       
			<form:label path="food">Food:
			<form:input path="food" />
			</form:label>
    
<input type="submit" value="SignUp!" class="waves-effect waves-light btn" />
    	</form:form>
  </div>


</div>

</body>
</html>