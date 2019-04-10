<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ削除確認</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/delete.css">

</head>
<body>

<div class="header">
		<div class="logout">
			<a href ="LogoutServlet">ログアウト</a>
		</div>
		<div class="username">${userInfo.name}さん
		</div>

	</div>


	<div class="container">
		<div class="container-top">
			<h1><strong>ユーザ削除確認</strong></h1>
		</div>

		<div class="container-middle">

			<p>ログインID:${user.loginId}</p>

			<p>を本当に削除してよろしいでしょうか。</p>


				<div class="button-wrapper">
						<a class="btn btn-light" href="http://localhost:8080/UserManagement/UserListServlet" role="button">キャンセル</a>
				</div>

			<form class="form-delete" action="DeleteServlet" method="post">
						<input type="hidden" name="id" value="${user.id}">
				<div class="button-wrapper">
						<input type="submit"class="btn btn-primary" value="OK" />
				</div>
			</form>
		</div>





		<div class="container-bottom">

			<a href="http://localhost:8080/UserManagement/UserListServlet">戻る</a>
		</div>

	</div>

</body>
</html>