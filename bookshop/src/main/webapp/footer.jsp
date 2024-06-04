<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="fpath" value="<%=request.getContextPath() %>" />
<hr>    
<footer>
    <div class="ft_wrap">
        <nav id="fnb">
            <ul>
                <li><a href="${hpath}/member/terms.jsp">회원약관</a></li>
                <li><a href="${hpath}/member/policy.jsp">개인정보처리방침</a></li>
            </ul>
        </nav>
        <div id="loc" style="margin-right:20px;">
            <select name="sel" id="sel" onchange="locate()" style=" float:right; margin-right:20px;">
                <option value="">유관기관</option>
                <option value="https://www.busan.go.kr/index">부산광역시</option>
                <option value="https://bto.or.kr/kor/Main.do">부산관광공사</option>
                <option value="https://korean.visitkorea.or.kr/main/main.do">대한민국 구-석구석</option>
                <option value="https://www.bsmeditour.go.kr/">메디투어 부산</option>
                <option value="https://citytourbusan.com/ko/00main/main.php">부산시티투어</option>
                <option value="https://busandabom.net/index.nm">부산문화포털 다봄</option>
                <option value="https://www.busaness.com/">부산 워케이션</option>
                <option value="https://bto.or.kr/cvb/Main.do">부산컨벤션뷰로</option>
                <option value="https://bof.or.kr/cms/main.do">BOF 부산 원 아시아 페스티벌</option>
            </select>
        </div>
        <script>
        function locate() {
            var sel = document.getElementById("sel");
            if (sel.value != "") {
                window.open(sel.value);
            }
        }
        </script>
        <br><br>
        <div id="copyright">
            <p class="tel-tour"> 문의 <strong>1330</strong></p>
            <p class="tel-col"> 고객센터 전화 <strong>1544-9970</strong></p>
            <p class="onday">평일 09:00 - 19:00 </p>
            <p class="copy">Copyright kh 서점. ALL RIGHTS RESERVED.</p>
        </div>
    </div> 
</footer>
