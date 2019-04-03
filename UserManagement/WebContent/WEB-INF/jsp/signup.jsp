<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>新規登録</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/list.css">

</head>


<body>

	<div class="header">
		<div class="logout">
			<a href="">ログアウト</a>
		</div>
		<div class="username">ユーザ名</div>

	</div>


	<div class="container">
		<div class="container-top">
			<h1>
				<strong>ユーザ新規登録</strong>
			</h1>
		</div>

		<form class="form-signup" action="SignupServlet" method="post">
			<div class="container-middle">
				<div class="form-group row">
					<label for="inputId" class="col-sm-2 col-form-label">ログインID</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputId"
							name="loginId" placeholder="Id">
					</div>
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">パスワード</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword"
							name="password" placeholder="Password">
					</div>
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">パスワード(確認)</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword"
							name="password" placeholder="Password">
					</div>
				</div>

				<div class="form-group row">
					<label for="inputId" class="col-sm-2 col-form-label">ユーザ名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputId" name="name">
					</div>
				</div>

				<div class="form-group row">
					<label for="inputId" class="col-sm-2 col-form-label">生年月日</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" id="inputId"
							name="birthDate">
					</div>
				</div>

			</div>

			<div class="container-bottom">
				<div class="button-wrapper">
					<input type="submit" value="登録" />
				</div>
			</div>
		</form>
	</div>

	<p>
		<c:if test="${errMsg != null}">
		${errMsg}
		</c:if>
	<p>

	<a href="http://localhost:8080/UserManagement/UserListServlet">戻る</a>

</body>
</html>