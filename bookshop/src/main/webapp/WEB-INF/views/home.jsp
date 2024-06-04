<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path2" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BOOKSHOP</title>
    <link rel="stylesheet" href="${path2}/resources/css/styles.css">
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
</head>
<body>
    <div>
    	<%@ include file="/header.jsp" %>
    </div>
    <nav id="gnb" class="nav-wrapper">
        <ul class="menu">
            <li class="category">
                <a href="#"><img src="${path2}/resources/icon/hamberger.png" alt="hamberger"></a>
            </li>
            <li class="category">
                <a href="#" class="dp1">문학</a>
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
        <div id="indicators-carousel" class="relative w-full max-w-2xl mx-auto" data-carousel="static">
            <!-- Carousel wrapper -->
            <div class="relative h-56 overflow-hidden rounded-lg md:h-96">
                <!-- Item 1 -->
                <div class="carousel-item duration-700 ease-in-out" data-carousel-item="active">
                    <img src="${path2}/resources/images/cat.jpg" class="absolute block w-full h-full object-cover" alt="...">
                </div>
                <!-- Item 2 -->
                <div class="carousel-item duration-700 ease-in-out hidden" data-carousel-item>
                    <img src="${path2}/resources/images/cat.jpg" class="absolute block w-full h-full object-cover" alt="...">
                </div>
                <!-- Item 3 -->
                <div class="carousel-item duration-700 ease-in-out hidden" data-carousel-item>
                    <img src="${path2}/resources/images/cat.jpg" class="absolute block w-full h-full object-cover" alt="...">
                </div>
                <!-- Item 4 -->
                <div class="carousel-item duration-700 ease-in-out hidden" data-carousel-item>
                    <img src="${path2}/resources/images/cat.jpg" class="absolute block w-full h-full object-cover" alt="...">
                </div>
                <!-- Add more items as needed -->
            </div>
            <!-- Slider indicators -->
            <div class="absolute z-30 flex space-x-3 bottom-5 left-1/2 transform -translate-x-1/2">
                <button type="button" class="w-3 h-3 rounded-full bg-white" aria-current="true" aria-label="Slide 1" data-carousel-slide-to="0"></button>
                <button type="button" class="w-3 h-3 rounded-full bg-white" aria-current="false" aria-label="Slide 2" data-carousel-slide-to="1"></button>
                <button type="button" class="w-3 h-3 rounded-full bg-white" aria-current="false" aria-label="Slide 3" data-carousel-slide-to="2"></button>
                <button type="button" class="w-3 h-3 rounded-full bg-white" aria-current="false" aria-label="Slide 4" data-carousel-slide-to="3"></button>
            </div>
            <!-- Slider controls -->
            <button type="button" class="absolute top-0 left-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none" data-carousel-prev>
                <span class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 group-hover:bg-white/50 group-focus:ring-4 group-focus:ring-white">
                    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
                    </svg>
                    <span class="sr-only">Previous</span>
                </span>
            </button>
            <button type="button" class="absolute top-0 right-0 z-30 flex items-center justify-center h-full px-4 cursor-pointer group focus:outline-none" data-carousel-next>
                <span class="inline-flex items-center justify-center w-10 h-10 rounded-full bg-white/30 group-hover:bg-white/50 group-focus:ring-4 group-focus:ring-white">
                    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                    </svg>
                    <span class="sr-only">Next</span>
                </span>
            </button>
        </div>
        <section class="categories">
            <a href="${path2}/new-books" class="category-item">
                <img src="${path2}/resources/icon/new.png" alt="New">
                <p>신작도서</p>
            </a>
            <a href="${path2}/best-sellers" class="category-item">
                <img src="${path2}/resources/icon/best.png" alt="Best">
                <p>베스트</p>
            </a>
            <a href="${path2}/preorder" class="category-item">
                <img src="${path2}/resources/icon/shopping.png" alt="Preorder">
                <p>프리오더</p>
            </a>
            <a href="${path2}/restock" class="category-item">
                <img src="${path2}/resources/icon/loud.png" alt="Restock">
                <p>재입고</p>
            </a>
            <a href="${path2}/store-only" class="category-item">
                <img src="${path2}/resources/icon/shop.png" alt="Store Only">
                <p>동네서점 ONLY</p>
            </a>
        </section>
        <section class="carousel-cards">
            <div class="cards">
                <a href="${path2}/book1-details" class="card">
                    <img src="${path2}/resources/images/cat.jpg" alt="Book 1">
                    <p>Book 1</p>
                </a>
                <a href="${path2}/book2-details" class="card">
                    <img src="${path2}/resources/images/cat.jpg" alt="Book 2">
                    <p>Book 2</p>
                </a>
                <a href="${path2}/book3-details" class="card">
                    <img src="${path2}/resources/images/cat.jpg" alt="Book 3">
                    <p>Book 3</p>
                </a>
                <a href="${path2}/book4-details" class="card">
                    <img src="${path2}/resources/images/cat.jpg" alt="Book 4">
                    <p>Book 4</p>
                </a>
                <a href="${path2}/book5-details" class="card">
                    <img src="${path2}/resources/images/cat.jpg" alt="Book 5">
                    <p>Book 5</p>
                </a>
            </div>
        </section>
    </main>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const carouselElement = document.getElementById('indicators-carousel');

            const items = [
                {
                    position: 0,
                    el: document.querySelector('[data-carousel-item="active"]'),
                },
                {
                    position: 1,
                    el: document.querySelector('[data-carousel-item="1"]'),
                },
                {
                    position: 2,
                    el: document.querySelector('[data-carousel-item="2"]'),
                },
                {
                    position: 3,
                    el: document.querySelector('[data-carousel-item="3"]'),
                },
            ];

            const options = {
                defaultPosition: 0,
                interval: 4000,
                indicators: {
                    activeClasses: 'bg-white dark:bg-gray-800',
                    inactiveClasses: 'bg-white/50 dark:bg-gray-800/50 hover:bg-white dark:hover:bg-gray-800',
                    items: [
                        {
                            position: 0,
                            el: document.querySelector('[data-carousel-slide-to="0"]'),
                        },
                        {
                            position: 1,
                            el: document.querySelector('[data-carousel-slide-to="1"]'),
                        },
                        {
                            position: 2,
                            el: document.querySelector('[data-carousel-slide-to="2"]'),
                        },
                        {
                            position: 3,
                            el: document.querySelector('[data-carousel-slide-to="3"]'),
                        },
                    ],
                },
                onNext: () => {
                    console.log('next slider item is shown');
                },
                onPrev: () => {
                    console.log('previous slider item is shown');
                },
                onChange: () => {
                    console.log('new slider item has been shown');
                },
            };

            const carousel = new Carousel(carouselElement, items, options);

            setInterval(() => {
                carousel.next();
            }, options.interval);
        });
    </script>
</body>
</html>
