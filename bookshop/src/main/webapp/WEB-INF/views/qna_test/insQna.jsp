<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Qna등록</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
    <div class="container">
        <nav class="breadcrumb is-right" aria-label="breadcrumbs">
            <ul>
                <li><a href="${path}">홈</a></li>
                <li><a href="#">커뮤니티</a></li>
                <li class="is-active"><a href="#" aria-current="page">질문</a></li>
            </ul>
        </nav>
        <hr>
        <h2 class="title is-3 has-text-centered">QNA 등록</h2>
        <div class="box">
            <form action="${path}/qna/insQnaPro" method="post">
                <div class="field">
                    <label class="label" for="title">글제목:</label>
                    <div class="control">
                        <input class="input" type="text" id="title" name="title" required>
                    </div>
                </div>
                <div class="field">
                    <label class="label" for="content">내용:</label>
                    <div class="control">
                        <textarea class="textarea" id="content" name="content" required maxlength="1000" placeholder="내용을 입력해주세요" style="resize:none;"></textarea>
                    </div>
                </div>
                <input type="hidden" name="parno" value="0">
                <input type="hidden" name="plevel" value="1">
                <input type="hidden" name="hits" value="0">
                <div class="buttons is-right">
                    <button class="button is-primary" type="submit">등록하기</button>
                    <button class="button is-light" type="button" onclick="history.back()">돌아가기</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>