<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.page-item.active .page-link {
	background-color: #495057;
}
</style>
</head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="/clean"><i class="fas fa-recycle"></i>
			깨끗한도시</a>
		<button class="navbar-toggler" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse flex-row-reverse"
			id="collapsibleNavbar">
			<c:if test="${empty ADMIN}">
				<ul class="nav navbar-nav float-lg-right">
					<li class="nav-item mr-sm-2"><button id="loginBtn"
							type="button" class="btn btn-light m-1">로그인</button></li>
					<li class="nav-item mr-sm-2"><button id="joinBtn"
							type="button" class="btn btn-light m-1">회원가입</button></li>
				</ul>
			</c:if>
			<c:if test="${not empty ADMIN}">
				<ul class="nav navbar-nav float-lg-right">
					<li class="nav-item mr-sm-2"><a class="nav-link"
						href="${contextPath}/admin/"> <i class="fas fa-user"></i>&nbsp;${ADMIN.userid}</a></li>

					<li class="nav-item mr-sm-2"><a class="nav-link"
						href="${contextPath}/user/logout"> <i
							class="fas fa-sign-out-alt"></i>로그아웃
					</a></li>
				</ul>
			</c:if>
		</div>
	</nav>

	<div class="container mt-5">
		<ul class="nav nav-tabs nav-justified">
			<li class="nav-item"><a style="background-color: #98bce4; color:black;" class="nav-link active"
				href="${contextPath}/admin/list"><i class="fas fa-user-friends"></i>
					사용자 목록</a></li>
			<li class="nav-item"><a style="color:black;" class="nav-link"
				href="${contextPath}/admin/monitor">
					<i class="fas fa-location-arrow"></i> 관제</a></li>
			<li class="nav-item"><a style="color:black;" class="nav-link" href="${contextPath}/admin/collection-list">
					<i class="fas fa-history"></i> 이용현황</a></li>
		</ul>

		<div class="jumbotron mt-5">
			<table class="table table-dark table-striped text-center">
				<thead class="thead-dark">
					<tr>
						<th><i class="fas fa-user-friends"></i> 사용자</th>
						<th><i class="fas fa-map-marker-alt"></i> 주소</th>
						<th><i class="fas fa-map-marked-alt"></i> 위도</th>
						<th><i class="fas fa-map-marked-alt"></i> 경도</th>
						<th><i class="far fa-trash-alt"></i> 설치여부</th>
						<th><i class="fas fa-registered"></i> 신청일</th>
					</tr>
				</thead>
				<c:forEach var="user" items="${pi.list}" varStatus="status">
					<tr>
						<td><a style="color:white;" href="${contextPath}/admin/edit/${user.userid}">${user.userid}</a></td>
						<td>${user.address}</td>
						<td>${user.lat}</td>
						<td>${user.lon}</td>
						<td><c:if test="${user.bin == 0}">
								<button type="button" class="btn btn-danger btn-sm">미완료</button>
							</c:if> <c:if test="${user.bin == 1}">
								<button type="button" class="btn btn-light btn-sm">완료</button>
							</c:if></td>
						<td><fmt:formatDate value="${user.regDate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</table>
			<br/>
			<ul class="pagination pagination-md justify-content-center mt-4">
				<c:forEach var="idx" begin="1" end="${pi.totalPage }">
					<c:choose>
						<c:when test="${pi.page == idx}">
							<li class="page-item active"><a class="page-link" style="background-color: #495057; border-color: #f8f9fa;"  
								href="?page=${idx }">${idx }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="?page=${idx }">${idx }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>