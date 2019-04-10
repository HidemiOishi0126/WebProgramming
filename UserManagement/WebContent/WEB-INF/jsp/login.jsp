<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
	<div class="container">
		<h1 class="text-center">
			<strong>ログイン画面</strong>
		</h1>


		<p>
			<c:if test="${errMsg != null}">
		${errMsg}
		</c:if>
		</p>


		<form class="form-signin" action="LoginServlet" method="post">
			<div class="form-group row">
				<label for="inputId" class="col-sm-2 col-form-label">ログインID</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputId" name="loginId"
						placeholder="Id">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">パスワード</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPassword"
						name="password" placeholder="Password">
				</div>
			</div>
			<div class="text-center">

				<input class="button" type="submit" value="ログイン" />

			</div>
		</form>


	</div>
</body>
</html>