<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Phamily's Christmas Party</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://use.fontawesome.com/1166bbf884.js"></script>

</head>

<body id="secondcover">
	<div>
		<form id="logoutForm" method="POST" action="/logout">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="submit" class="btn btn-primary btn-sm" value="Logout!" />
		</form>
		<h1 id="strobe" style="color:red"> 
			<c:out value="${currentUser.name}"></c:out>, you're invited to the annual Phamily's <p style="color: green">White Elephant Christmas Party! </p> 
		</h1>
		<h3 style="color:green">Dress Code: Any kind of plaid</h3>
		<h3 style="color:red">Time: 1:00PM</h3>
		<h3 style="color:green">Location: Phamily's house</h3>
		<h2 style="color:red">White Elephant Rule: $15-$20* </h2>
		<p>*prices include tax</p>

	</div>
	<div>
		<div class="d-inline-flex p-2">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th scope="col">Guest</th>
						<th scope="col">Potluck contribution</th>
						<th scope="col">RSVP<br> Write in the comment box how many ppl. </th>	
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${ allUsers }">
						<tr>
							<td><c:out value="${ user.name }"></c:out><br> 
							<c:if test="${ user.id == currentUser.id }">
							<a href="/deleteUser/${ user.id }">(delete) </a></c:if></td>
							<td><c:forEach var="potluck" items="${user.potlucks }">
									<c:out value="${ potluck.food }" />,
									<c:if test="${ user.id == currentUser.id }">
										<a href="/delete/${ potluck.id }">(delete) </a> | <br>
									</c:if>
								</c:forEach></td>	
							<td>
									<c:choose>
										<c:when test="${user.status == true}">
            				Attending | <a href="/cancel/${ user.id }">Cancel</a>
										</c:when>
										<c:otherwise>
						Not Attending | <a href="/attend/${ user.id }">Join</a>
										</c:otherwise>
									</c:choose>
							</td>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	
<div class="border border-danger d-inline-flex p-2 rounded">

<div>
<h2>Potluck Signup!</h2>

<form:form action="/addpotluck" method="POST" modelAttribute="potluck">
<form:label path="food">Food:
<form:input path="food" />
</form:label>
<input type="submit" class="btn btn-danger" value="SignUp!" />
</form:form>	
</div>	
</div>
	
<div class="border border-success d-inline-flex p-2 rounded">
<div>
	<h3 style="color:red">Comment Board</h3>
		<div class="scrollbox"><c:forEach var="comment" items="${ comments }">
		<p><c:out value="${comment.name }" /> says: <c:out value="${comment.message }" /> 
		<c:if test="${ comment.name == currentUser.name }">
		<a href="/deleteComment/${ comment.id }"> | delete</a> 
		</c:if>
		</p>
		</c:forEach></div>

		<h4 style="color:green">Add Comment:</h4>
		<form:form action="/addComment" method="POST"
			modelAttribute="comment">
			<form:hidden path="name" value="${currentUser.name}"></form:hidden>
			<form:label path="message">
   			<form:errors path="message" />
				<form:input type="text" path="message" />
			</form:label>
			<input type="submit" class="btn btn-success" value="Add Comment">
		</form:form>
	 </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script> 
</body>
</html>