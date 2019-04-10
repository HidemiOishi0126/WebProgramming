<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ一覧</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/list.css">
</head>


<body>

	<div class="header">
		<div class="logout">
			<a href="LogoutServlet">ログアウト</a>
		</div>
		<div class="username">${userInfo.name}さん
		</div>

	</div>


	<div class="container">
		<div class="container-top">
			<h1>
				<strong>ユーザ一覧</strong>
			</h1>

			<a href="http://localhost:8080/UserManagement/SignupServlet">新規登録</a>
		</div>
		<form class="form-search" action="UserListServlet" method="post">
			<div class="container-mtop">
				<div class="form-group row">
					<label for="inputId" class="col-sm-2 col-form-label">ログインID</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputId"
							name="loginId">
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
						<div class="row">
							<div class="col-sm-5">
								<input type="date" class="form-control" id="inputId"
									name="startDate">
							</div>
							<div class="col-sm-2">～</div>
							<div class="col-sm-5">
								<input type="date" class="form-control" id="inputId"
									name="endDate">
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="container-bottom">
				<div class="botton-wrapper">
					<input type="submit" value="検索" />
				</div>
			</div>
		</form>
		<hr>
	</div>


	<div class="container">
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">ユーザ名</th>
					<th scope="col">生年月日</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${userList}">
					<tr>
						<th scope="row">${user.loginId}</th>
						<td>${user.name}</td>
						<td>${user.birthDate}</td>
						<td>
							<a href="http://localhost:8080/UserManagement/UserDetailServlet?id=${user.id}">
								<button type="button" class="btn btn-primary">詳細</button>
							</a>
							<c:if test="${userInfo.loginId == user.loginId || 'admin' == userInfo.loginId}"><a href="http://localhost:8080/UserManagement/UpdateServlet?id=${user.id}">
								<button type="button" class="btn btn-success">更新</button>
							</a></c:if>
							<c:if test="${'admin' == userInfo.loginId}">
							<a href="http://localhost:8080/UserManagement/DeleteServlet?id=${user.id}">
								<button type="button" class="btn btn-danger">削除</button>
							</a></c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>
