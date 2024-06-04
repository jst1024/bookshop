<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="hpath" value="<%=request.getContextPath() %>" />
<header id="header" class="header-wrapper">
	 <div class="header-logo">
        <a href="${hpath }"><img src="${hpath }/resources/images/logo/logo.png" alt="로고" id="logo"></a>
     </div>
     <div class="header-login">
         <ul>
            <c:choose>
          <c:when test="${sid.equals('admin') }">
           <li><a href="${hpath }/LogOut.do">로그아웃</a></li>
           <li><a href="${hpath }/AdminMain.do">관리자게시판</a></li>
          </c:when>
             <c:when test="${empty sid }">
              <li><a href="${hpath }/member/login.jsp">로그인</a></li>
              <li><a href="${hpath }/Join.do">회원가입</a></li>
          </c:when>
          <c:when test="${not empty sid }">
           <li><a href="${hpath }/LogOut.do">로그아웃</a></li>
           <li><a href="${hpath }/EditMember.do?id=${sid }">회원정보</a></li>
          </c:when>
         	</c:choose>
         </ul>
     </div>
</header> 
