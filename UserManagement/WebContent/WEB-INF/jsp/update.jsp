<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ情報更新</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/update.css">

</head>
<body>

	<div class="header">
		<div class="logout">
			<a href="">ログアウト</a>
		</div>
		<div class="username">${userInfo.name}さん</div>
	</div>


	<div class="container">

		<div class="container-top">
			<h1>
				<strong>ユーザ情報更新</strong>
			</h1>
		</div>

		<div class="container-middle">
			<div class="row">
				<div class="col-sm-2">
					<p>ログインID</p>
				</div>
				<div class="col-sm-10">
					<p>${user.loginId}</p>
				</div>
			</div>

			<form class="form-update" action="UpdateServlet" method="post">
				<input type="hidden" name="id" value="${user.id}">
				<input type="hidden" name="loginId" value="${user.loginId}">
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">パスワード</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword" name="password"
							placeholder="Password">
					</div>
				</div>

				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">パスワード(確認)</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword"
							placeholder="Password" name="password2">
					</div>
				</div>

				<div class="form-group row">
					<label for="inputId" class="col-sm-2 col-form-label">ユーザ名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputId" name="name"
							value="${user.name}">
					</div>
				</div>

				<div class="form-group row">
					<label for="inputId" class="col-sm-2 col-form-label">生年月日</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" id="inputId" name="birthDate"
							value="${user.birthDateStr}">
					</div>
				</div>
				<p>
					<c:if test="${errMsg != null}">
		${errMsg}
		</c:if>
				</p>

				<div class="container-bottom">
					<div class="button-wrapper">
						<input type="submit" value="更新" />
					</div>
				</div>
			</form>



			<a href="http://localhost:8080/UserManagement/UserListServlet">戻る</a>


		</div>
</body>
</html>