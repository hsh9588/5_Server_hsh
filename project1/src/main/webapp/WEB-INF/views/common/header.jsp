<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <header>
            <section>
                <a href="/">
                    <img src="/resources/images/logo.jpg" id="home-logo">
                </a>
            </section>

            <section>
                <article class="search-area">
                    <form action="#">
                        <fieldset>
                            <input type="text" id="query" name="query" placeholder="검색어를 입력해주세요.">
            
                            <button type="submit" id="search-btn" class="fa-solid fa-magnifying-glass"></button>
                        </fieldset>
                    </form>
                </article>
            </section>

            <section></section>

            <%-- 헤더 오른쪽 상단 메뉴 --%>
            <div id="header-top-menu">
                <a href="/"> 메인 페이지 </a>
                |
                <a href="#">로그인</a>  
            </div>
        </header>

        <nav>
            <ul>

                 <c:forEach var="boardType" items="${boardTypeMap}">
                    <%-- 
                        EL 을 이용해서 Map 데이터를 다루는 방법 
                        key ==> ${변수명.key}
                        value ==> ${변수명.value}
                    --%>

                    <li><a href="/board/${boardType.key}/list">${boardType.value}</a></li>

                 </c:forEach>
            </ul>
        </nav>