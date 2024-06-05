<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>QnA 상세보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <nav class="breadcrumb is-right" aria-label="breadcrumbs">
            <ul>
                <li><a href="${path}">홈</a></li>
                <li><a href="#">커뮤니티</a></li>
                <li class="is-active"><a href="#" aria-current="page">질문 상세보기</a></li>
            </ul>
        </nav>
        
        <h2 class="title is-3">질문답변 상세보기</h2>
        <div class="box">
            <input type="hidden" name="no" value="${qna.qno}" />
            <h3 class="title is-4">제목</h3>
            <div class="content">${qna.title}</div>
            <h3 class="title is-4">작성자</h3>
            <div class="content">${qna.member_id}</div>
            <h3 class="title is-4">작성일</h3>
            <div class="content"><fmt:formatDate value="${qna.resdate}" pattern="yyyy년 MM월 dd일"/></div>
            <h3 class="title is-4">조회수</h3>
            <div class="content">${qna.visited}</div>
            <h3 class="title is-4">글내용</h3>
            <div class="content">${qna.content}</div>

            <h4 class="title is-5 mt-4">답변</h4>
            <c:forEach var="answer" items="${answerList}">
                <div class="box">
                    <h5 class="title is-6">제목: ${answer.title}</h5>
                    <p>내용: ${answer.content}</p>
                    <p>작성자: ${answer.id}</p>
                    <p>작성일: <fmt:formatDate value="${answer.resdate}" pattern="yyyy년 MM월 dd일"/></p>
                </div>
            </c:forEach>

            <div class="buttons is-right">
                <button type="button" class="button is-info" onclick="history.back()">돌아가기</button>
                <c:if test="${sid == qna.member_id || sid == 'admin'}">
                    <button type="button" class="button is-warning" onclick="goToPage('${path}/qna/upQna.do?qno=${qna.qno}')">글수정</button>
                    <button type="button" class="button is-danger" onclick="goToPage('${path}/qna/delQna.do?qno=${qna.qno}')">글삭제</button>
                </c:if>
            </div>
            <script>
                function goToPage(url) {
                    location.href = url;
                }
            </script>

            <c:if test="${sid == 'admin'}">
                <div class="box" style="margin-top: 2rem;">
                    <h4 class="title is-5">답변 등록하기</h4>
                    <form action="${path}/qna/insAnswer.do" method="post">
                        <input type="hidden" name="parno" value="${qna.qno}">
                        <div class="field">
                            <label class="label" for="title">답변제목:</label>
                            <div class="control">
                                <input type="text" class="input" id="title" name="title">
                            </div>
                        </div>
                        <div class="field">
                            <label class="label" for="content">답변내용:</label>
                            <div class="control">
                                <textarea class="textarea" id="content" name="content"></textarea>
                            </div>
                        </div>
                        <div class="field is-grouped is-pulled-right">
                            <div class="control">
                                <button type="submit" class="button is-primary">답변등록</button>
                            </div>
                            <div class="control">
                                <a href="${path}/qna/qnaList.do" class="button is-light">돌아가기</a>
                            </div>
                        </div>
                    </form>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>