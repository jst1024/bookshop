<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path0" value="<%=request.getContextPath() %>" />  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>회원 목록</title>
</head>
<body>
<header id="header">
	<a href="${path0 }">메인으로</a>
</header>
<div id="contents">
	<section class="page" id="page1">
		<div style="width:1400px; margin:0 auto;">
			<h3 class="page_title">회원 목록</h3>
			<div>
				<table class="table" id="tb1">
					<thead>
						<tr>
							<th class="item1">아이디</th>
							<th class="item2">비밀번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${memberList }">
						<tr>
							<td>
								<strong>${dto.id }</strong>
							</td>
						</tr>
						<tr>
							<td>
								<strong>${dto.pw }</strong>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr>
			</div>
		</div>
	</section>
</div>
<footer id="footer" class="footer-nav row expanded collapse">

</footer>
</body>
</html>