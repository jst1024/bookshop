<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path2" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${title }</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="${path2 }/resources/css/styles.css">
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
 <style>
.card {
    position: relative;
    overflow: hidden;
}

.card img {
    transition: all 0.3s ease;
}

.card:hover img {
    opacity: 0.7;
}

.card-icons {
    position: absolute;
    bottom: 10px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 10px;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.card:hover .card-icons {
    opacity: 1;
}

.card-icons a {
    background-color: white;
    border-radius: 50%;
    width: 20%;
    height: 20%;
    display: flex;
    align-items: center;
    justify-content: center;
}
</style>
</head>
<body>
	<div id="header">
		<%@ include file="/header.jsp" %>
	</div>
	 <nav id="gnb" class="nav-wrapper">
        <ul class="menu">
            <li class="category">
                <a href="#"><img src="${path2}/resources/icon/hamberger.png" alt="hamberger"></a>
            </li>
            <li class="category">
                <a href="${path2}/product/productList.do" class="dp1">문학</a>
                <ul class="sub">
                    <li><a href="${path2}/" class="dp2">소설</a></li>
                    <li><a href="${path2}/" class="dp2">시</a></li>
                    <li><a href="${path2}/" class="dp2">동화</a></li>
                    <li><a href="${path2}/" class="dp2">에세이</a></li>
                </ul>
            </li>
            <li class="category">
                <a href="#" class="dp1">인문·사회·과학</a>
                <ul class="sub">
                    <li><a href="${path2}/" class="dp2">인문</a></li>
                    <li><a href="${path2}/" class="dp2">사회</a></li>
                    <li><a href="${path2}/" class="dp2">과학</a></li>
                </ul>
            </li>
            <li class="category">
                <a href="#" class="dp1">예술</a>
                <ul class="sub">
                    <li><a href="${path2}/NotiList.do" class="dp2">일러스트</a></li>
                    <li><a href="${path2}/EventList.do" class="dp2">사진집</a></li>
                    <li><a href="${path2}/StList.do" class="dp2">만화</a></li>
                </ul>
            </li>
            <li class="category">
                <a href="#" class="dp1">커뮤니티</a>
                <ul class="sub">
                    <li><a href="${path2}/" class="dp2">공지사항</a></li>
                    <li><a href="${path2}/" class="dp2">상품Q&A</a></li>
                    <li><a href="${path2}/" class="dp2">타인의책상</a></li>
                </ul>
            </li>
        </ul>
        <div class="icons">
            <a href="#"><img src="${path2}/resources/icon/search.png" alt="Search"></a>
            <a href="#"><img src="${path2}/resources/icon/mypage.png" alt="User"></a>
            <a href="#"><img src="${path2}/resources/icon/cart.png" alt="Cart"></a>
        </div>
    </nav>
    <main>
     <!-- 
        <div class="board_gallary_list" style="">
            <h1>${title }</h1>
        </div>
       
	    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
            <c:forEach var="product" items="${productList}">
                <a href="${path2}/product/details.do?id=${product.id}" class="card max-w-sm rounded overflow-hidden shadow-lg">
                    <img class="w-full" src="${path2}/resources/images/cat.jsp" alt="${product.name}">
                    <div class="card-icons">
                        <a href="#"><i class="fas fa-heart"></i></a>
                        <a href="#"><i class="fas fa-shopping-cart"></i></a>
                    </div>
                    <div class="px-6 py-4">
                        <div class="font-bold text-xl mb-2">${product.name}</div>
                        <p class="text-gray-700 text-base">
                            ${product.description}
                        </p>
                    </div>
                </a>
            </c:forEach>
        </div>
        -->
        <div class="board_gallary_list" style="width: 1500px;">
        <h1>Sample Title</h1>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
            <a href="${path2}/product/details.do?id=1" class="card max-w-sm rounded overflow-hidden shadow-lg">
                <img class="w-full" src="${path2}/resources/images/cat.jpg" alt="Sample Image 1">
                <div class="card-icons">
                    <a href="#"><i class="fas fa-heart"></i></a>
                    <a href="#"><i class="fas fa-shopping-cart"></i></a>
                </div>
                <div class="px-6 py-4">
                    <div class="font-bold text-xl mb-2">Sample Product 1</div>
                    <p class="text-gray-700 text-base">This is a description for sample product 1.</p>
                </div>
            </a>
            <a href="${path2}/product/details.do?id=2" class="card max-w-sm rounded overflow-hidden shadow-lg">
                <img class="w-full" src="${path2}/resources/images/cat.jpg" alt="Sample Image 2">
                <div class="card-icons">
                    <a href="#"><i class="fas fa-heart"></i></a>
                    <a href="#"><i class="fas fa-shopping-cart"></i></a>
                </div>
                <div class="px-6 py-4">
                    <div class="font-bold text-xl mb-2">Sample Product 2</div>
                    <p class="text-gray-700 text-base">This is a description for sample product 2.</p>
                </div>
            </a>
            <a href="${path2}/product/details.do?id=3" class="card max-w-sm rounded overflow-hidden shadow-lg">
                <img class="w-full" src="${path2}/resources/images/cat.jpg" alt="Sample Image 3">
                <div class="card-icons">
                    <a href="#"><i class="fas fa-heart"></i></a>
                    <a href="#"><i class="fas fa-shopping-cart"></i></a>
                </div>
                <div class="px-6 py-4">
                    <div class="font-bold text-xl mb-2">Sample Product 3</div>
                    <p class="text-gray-700 text-base">This is a description for sample product 3.</p>
                </div>
            </a>
            <a href="${path2}/product/details.do?id=4" class="card max-w-sm rounded overflow-hidden shadow-lg">
                <img class="w-full" src="${path2}/resources/images/cat.jpg" alt="Sample Image 4">
                <div class="card-icons">
                    <a href="#"><i class="fas fa-heart"></i></a>
                    <a href="#"><i class="fas fa-shopping-cart"></i></a>
                </div>
                <div class="px-6 py-4">
                    <div class="font-bold text-xl mb-2">Sample Product 4</div>
                    <p class="text-gray-700 text-base">This is a description for sample product 4.</p>
                </div>
            </a>
        </div>
    </div>
        <br> 
      <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <c:choose>
                    <c:when test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="${path0}/FoodList.do?page=${currentPage - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <c:forEach begin="1" end="${totalPages}" var="i">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                        <a class="page-link" href="${path0}/FoodList.do?page=${i}">${i}</a>
                    </li>
                </c:forEach>

                <c:choose>
                    <c:when test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="${path0}/FoodList.do?page=${currentPage + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </main>
    <br>
    <br>
    <div id="footer">
        <%@ include file="/footer.jsp" %>
    </div>
</body>
</html>