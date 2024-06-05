<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.bookshop.domain.Product" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<c:set var="path2" value="<%=request.getContextPath() %>" />
<%
    // 더미 데이터 설정
    List<Product> productList = new ArrayList<>();
    for (int i = 1; i <= 70; i++) {
        productList.add(new Product(
            "P" + i,
            "Category1-" + i,
            "Category2-" + i,
            "Sample Product " + i,
            "Subtitle " + i,
            1000 * i,
            "Author " + i,
            "This is a description for sample product " + i + ".",
            "Company " + i,
            10 * i,
            "cat.jpg",
            "cat.jpg",
            "cat.jpg",
            "cat.jpg",
            4.5f,
            10 * i
        ));
    }
    request.setAttribute("productList", productList);
%>
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
    transition: all 0.3s ease;
}

.card img {
    display: block; /* Ensure no space below the image */
    width: 100%;
    height: auto;
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
    z-index: 10;
}

.card:hover .card-icons {
    opacity: 1;
}

.card-icons a {
    background-color: white;
    border-radius: 50%;
    width: 2rem;
    height: 2rem;
    display: flex;
    align-items: center;
    justify-content: center;
}


.pagination {
    display: flex;
    justify-content: center; /* 중앙 정렬 */
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.pagination li {
    margin: 0 2px; /* 페이지 사이의 공간 줄이기 */
}

.pagination a {
    padding: 8px 12px; /* 간격 조정 */
    text-decoration: none;
    color: #000;
    background-color: #ddd;
    border-radius: 4px;
}

.pagination a.active {
    background-color: #4CAF50;
    color: white;
}

.pagination a:hover:not(.active) {
    background-color: #ddd;
}

.pagination a.disabled {
    color: #aaa;
    pointer-events: none;
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
        <div class="board_gallary_list" style="width: 1500px;">
        	<div>
            <h1>Sample Title</h1>
            </div>
            <div id="product-container" class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
			    <c:forEach var="product" items="${productList}">
			        <div class="card max-w-sm rounded overflow-hidden shadow-lg">
			            <img class="w-full" src="${path2}/resources/images/${product.img1}" alt="${product.pname}">
			            <div class="card-icons">
			                <a href="#"><i class="fas fa-heart"></i></a>
			                <a href="#"><i class="fas fa-shopping-cart"></i></a>
			            </div>
			            <div class="px-6 py-4 bg-white">
			                <div class="font-bold text-xl mb-2">${product.pname}</div>
			                <p class="text-gray-700 text-base">${product.content}</p>
			            </div>
			        </div>
			    </c:forEach>
			</div>
			<br>
			<br>
			<nav aria-label="Page navigation example">
			    <ul id="pagination" class="pagination justify-content-center"></ul>
			</nav>
        </div>
        <!-- 
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
         -->
    </main>
    <br>
    <br>
    <div id="footer">
        <%@ include file="/footer.jsp" %>
    </div>
	<script>
    const products = document.querySelectorAll('.card');
    const productsPerPage = 12;
    const pagination = document.getElementById('pagination');
    const productContainer = document.getElementById('product-container');
    let currentPage = 1;

    function showPage(page) {
        currentPage = page;
        const start = (currentPage - 1) * productsPerPage;
        const end = start + productsPerPage;

        products.forEach((product, index) => {
            if (index >= start && index < end) {
                product.style.display = 'block';
            } else {
                product.style.display = 'none';
            }
        });

        updatePagination();
    }

    function updatePagination() {
        pagination.innerHTML = '';
        const totalPages = Math.ceil(products.length / productsPerPage);
        const maxPagesToShow = 5;
        const startPage = Math.max(1, currentPage - Math.floor(maxPagesToShow / 2));
        const endPage = Math.min(totalPages, startPage + maxPagesToShow - 1);

        const createPageItem = (text, page, disabled = false) => {
            const li = document.createElement('li');
            const a = document.createElement('a');
            a.href = '#';
            a.innerText = text;
            if (disabled) {
                a.classList.add('disabled');
                a.style.pointerEvents = 'none';
                a.style.color = '#aaa';
            } else {
                a.addEventListener('click', (e) => {
                    e.preventDefault();
                    showPage(page);
                });
            }
            li.appendChild(a);
            return li;
        };

        // 항상 표시되는 이전 5페이지 이동 버튼
        pagination.appendChild(createPageItem('«', Math.max(1, currentPage - 5), currentPage <= 5));
        // 항상 표시되는 이전 페이지 이동 버튼
        pagination.appendChild(createPageItem('‹', currentPage - 1, currentPage === 1));

        for (let i = startPage; i <= endPage; i++) {
            const li = document.createElement('li');
            const a = document.createElement('a');
            a.href = '#';
            a.innerText = i;
            if (currentPage === i) {
                a.classList.add('active');
            }
            a.addEventListener('click', (e) => {
                e.preventDefault();
                showPage(i);
            });
            li.appendChild(a);
            pagination.appendChild(li);
        }

        // 항상 표시되는 다음 페이지 이동 버튼
        pagination.appendChild(createPageItem('›', currentPage + 1, currentPage === totalPages));
        // 항상 표시되는 다음 5페이지 이동 버튼
        pagination.appendChild(createPageItem('»', Math.min(totalPages, currentPage + 5), currentPage + 5 > totalPages));
    }

    document.addEventListener('DOMContentLoaded', () => {
        showPage(currentPage);
    });
</script>



</body>
</html>
