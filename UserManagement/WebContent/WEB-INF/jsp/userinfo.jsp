<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ情報詳細参照</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/userinfo.css">
</head>


<body>

	<div class="header">
		<div class="logout">
			<a href ="">ログアウト</a>
		</div>
		<div class="username">ユーザ名
		</div>

	</div>


	<div class="container">
		<div class="container-top">
			<h1><strong>ユーザ情報詳細参照</strong></h1>
		</div>

		<div class="container-middle">
			<div class="row">
				<div class="col-sm-3"><p>ログインID</p></div>
				<div class="col-sm-9"><p>${user.loginId}</p></div>
			</div>

			<div class="row">
				<div class="col-sm-3"><p>ユーザ名</p></div>
				<div class="col-sm-9"><p>${user.name}</p></div>
			</div>

			<div class="row">
				<div class="col-sm-3"><p>生年月日</p></div>
				<div class="col-sm-9"><p>${user.birthDate}</p></div>
			</div>

			<div class="row">
				<div class="col-sm-3"><p>登録日時</p></div>
				<div class="col-sm-9"><p>${user.createDate}</p></div>
			</div>

			<div class="row">
				<div class="col-sm-3"><p>更新日時</p></div>
				<div class="col-sm-9"><p>${user.updateDate}</p></div>
			</div>
		</div>

		<div class="container-bottom">

			<a href="http://localhost:8080/UserManagement/UserListServlet">戻る</a>
		</div>

	</div>