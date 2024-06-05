<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>notice List(공지사항)</title>
    <link href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css" rel="stylesheet">
</head>
<body>
    <div class="noticediv">
      <section class="page" id="page1">
        <div class="breadcrumb">
            <p><a href="${path }">홈</a><a href="">커뮤니티</a><span>공지사항</span></p>
        </div>
        <hr>
        <h2 class="title is-3">공지사항 목록</h2>
        <div class="table-container">
            <table class="table is-fullwidth is-striped">
                <thead>
                    <tr>
                      <th>nno</th>
                      <th>title</th>
                      <th>content</th>
                      <th>author</th>
                      <th>filename</th>
                      <th>visited</th>
                      <th>resdate</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="notice" items="${noticeList}">
            		<tr>
		                <td>${notice.nno}</td>
		                <td><a href="${path}/notice/getNotice.do?nno=${notice.nno}">${notice.title}</a></td>
		                <td>${notice.content}</td>
		                <td>${notice.author}</td>
		                <td>${notice.filename}</td>
		                <td>${notice.visited}</td>
		                <td>${notice.resdate}</td>
		                <td><a href="${path}/notice/upNotice.do?bno=${notice.nno}">Edit</a> </td>
		                <td><a href="${path}/notice/delNotice.do?bno=${notice.nno}">Delete</a> </td>
            		</tr>
        		</c:forEach>
               </tbody>
            </table>
            <div class="buttons is-right">
   				<a href="${path}/notice/insNotice.do">Insert notice</a>
			</div>     
       </div>
    </section>
    </div>
</body>
</html>