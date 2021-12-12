<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./header.jsp"%>

<!-- Hero section-->
        <section class="bg-accent bg-position-top-center bg-purple py-5">
            <div class="pb-lg-5 mb-lg-3">
                <div class="container py-lg-5 my-lg-5">
                    <div class="pb-lg-9 mb-3 mb-sm-5">
                        <div class="d-flex justify-content-center" style="border: 0px red solid;">
                            <ul class=" navbar-nav navbar-mega-nav me-lg-2 ms-0 fl-le bg-light" style="height: 54px;">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle ps-lg-0" href="#" data-bs-toggle="dropdown">
                                        <i class="ci-lightning align-middle mt-n1 me-2 ms-2"></i>실시간 검색어</a>
                                    <ul class="dropdown-menu py-1">
                                        <li class="dropdown"><a class="dropdown-item bg-light" href="#" data-bs-toggle="dropdown">1. 햇반</a>
                                        </li>
                                        <li class="dropdown"><a class="dropdown-item bg-light" href="#" data-bs-toggle="dropdown">2. 칫솔</a>
                                        </li>
                                        <li class="dropdown"><a class="dropdown-item bg-light" href="#" data-bs-toggle="dropdown">3. 딸기</a>
                                        </li>
                                        <li class="dropdown"><a class="dropdown-item bg-light" href="#" data-bs-toggle="dropdown">4. 소고기</a>
                                        </li>
                                        <li class="dropdown"><a class="dropdown-item bg-light" href="#" data-bs-toggle="dropdown">5. 아이스크림</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <div style="border: 0px rgb(0, 13, 255) solid; width: 80%; margin-right: -200px;" class="">
                                <div class=" input-group input-group-lg">
                                    <i class="ci-search position-absolute top-50 start-0 translate-middle-y text-muted fs-base ms-3 "></i>
                                    <input class=" form-control rounded-start" type="text" placeholder="검색어를 입력해주세요. ">
                                    <select class="form-select-1  m-md-auto" id-sorting>
                                        <option class="bg-light ">상품</option>
                                        <option class="bg-light ">점포</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="div_categorize ">
            <div class="div_categorize_detail ">
                <a href="total_product.html ">
                    <div class="div1_products">
                        <img class="product_img " src="<%=request.getContextPath()%>/views/resources/2_img/product.png " alt="product ">
                    </div>
                </a>
                <button class="button_category1"><a href="total_product.html">상품별 조회</a></button>
            </div>
            <div class="div_categorize_detail ">
                <a href="total_store.html ">
                    <div class="div2_stores">
                        <img class="store_img " src="<%=request.getContextPath()%>/views/resources/2_img/store.png " alt="product ">
                    </div>
                </a>
                <button class="button_category2 "><a href="total_store.html">점포별 조회</a></button>
            </div>
            <div class="div_categorize_detail ">
                <a href="best_product.html ">
                    <div class="div3_best">
                        <img class="best_img " src="<%=request.getContextPath()%>/views/resources/2_img/best.png" alt="best ">
                    </div>
                </a>
                <button class="button_category3 "><a href="best_product.html">인기 BEST</a></button>
            </div>
        </div>



<%@ include file="./footer.jsp" %>