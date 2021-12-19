<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

 <!-- Sidebar menu-->
        <aside class="offcanvas offcanvas-expand w-100 border-end zindex-lg-5 pt-lg-5" id="sideNav" style="max-width: 20rem;">
            <div class="pt-2 d-none d-lg-block"></div>
            <ul class="nav nav-tabs nav-justified mt-4 mt-lg-5 mb-0" role="tablist" style="min-height: 3rem;">
                <li class="nav-item"><a class="nav-link fw-medium active" href="#categories" data-bs-toggle="tab" role="tab">상품 목록</a></li>
                <li class="nav-item d-lg-none"><a class="nav-link fs-sm" href="#" data-bs-dismiss="offcanvas" role="tab"><i class="ci-close fs-xs me-2"></i>Close</a></li>
            </ul>
            <div class="offcanvas-body px-0 pt-3 pb-0" data-simplebar>
                <div class="tab-content">
                    <!-- Categories-->
                    <div class="sidebar-nav tab-pane fade show active" id="categories" role="tabpanel">
                        <div class="widget widget-categories">
                            <div class="accordion" id="shop-categories">
                                <!-- Special offers-->
                                <div class="accordion-item border-bottom">
                                    <h3 class="accordion-header px-grid-gutter"><a class="nav-link-style d-block fs-md fw-normal py-3" href="price-statistics.html"><span class="d-flex align-items-center"><i class="ci-corn fs-lg text-danger mt-n1 me-2"></i>머거본 꿀땅콩(135g)</span></a></h3>
                                </div>
                                <!-- Bakery-->
                                <div class="accordion-item border-bottom">
                                    <h3 class="accordion-header px-grid-gutter">
                                        <button class="accordion-button collapsed py-3" type="button" data-bs-toggle="collapse" data-bs-target="#bakery" aria-expanded="false" aria-controls="bakery"><span class="d-flex align-items-center"><i class="ci-bread fs-lg opacity-60 mt-n1 me-2"></i>Bakery</span></button>
                                    </h3>
                                    <div class="collapse" id="bakery" data-bs-parent="#shop-categories">
                                        <div class="px-grid-gutter pt-1 pb-4">
                                            <div class="widget widget-links">
                                                <ul class="widget-list">
                                                    <li class="widget-list-item"><a class="widget-list-link" href="#">View all</a></li>
                                                    <li class="widget-list-item"><a class="widget-list-link" href="#">Bread</a>
                                                        <ul class="widget-list pt-1">
                                                            <li class="widget-list-item"><a class="widget-list-link" href="#">Baguette</a></li>
                                                            <li class="widget-list-item"><a class="widget-list-link" href="#">Loaves</a></li>
                                                            <li class="widget-list-item"><a class="widget-list-link" href="#">Ciabatta</a></li>
                                                            <li class="widget-list-item"><a class="widget-list-link" href="#">Wheat bread</a></li>
                                                            <li class="widget-list-item"><a class="widget-list-link" href="#">Corn bread</a></li>
                                                            <li class="widget-list-item"><a class="widget-list-link" href="#">Rye bread</a></li>
                                                            <li class="widget-list-item"><a class="widget-list-link" href="#">Rye wheat bread</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="widget-list-item"><a class="widget-list-link" href="#">Bagels</a>
                                                        <ul class="widget-list pt-1">
                                                            <li class="widget-list-item"><a class="widget-list-link" href="#">Puff pastry</a></li>
                                                            <li class="widget-list-item"><a class="widget-list-link" href="#">Stuffed buns</a></li>
                                                            <li class="widget-list-item"><a class="widget-list-link" href="#">Buns, sweet cheese danish</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="widget-list-item"><a class="widget-list-link" href="#">Pita and Flatbread</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </aside>

        <!-- Page Title-->
        <div class="page-title-overlap bg-accent pt-4">
            <div class="container d-lg-flex justify-content-between py-2 py-lg-3">
                <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                            <li class="breadcrumb-item"><a class="text-nowrap" href="index.html"><i class="ci-home"></i>Home</a></li>
                            <li class="breadcrumb-item text-nowrap"><a href="marketplace-category.html">Market</a>
                            </li>
                            <li class="breadcrumb-item text-nowrap active" aria-current="page">Single Item</li>
                        </ol>
                    </nav>
                </div>
                <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
                    <h1 class="h3 text-light mb-0">머거본 꿀땅콩(135g)</h1>
                </div>
            </div>
        </div>
        <!-- Shadow box-->
        <section class="container mb-3 pb-3">
            <div class="bg-light shadow-lg rounded-3 overflow-hidden">
                <div class="row">
                    <!-- Content-->
                    <section class="col-lg-4 pt-2 pt-lg-4 pb-4 mb-lg-3">
                        <div class="pt-3 px-4 pe-lg-0 ps-xl-5">
                            <!-- Product gallery-->
                            <div class="gallery">
                                <a class="gallery-item rounded-3 mb-grid-gutter" href="2_img/머거본꿀땅콩.gif" data-sub-html="&lt;h6 class=&quot;fs-sm text-light&quot;&gt;확대하기&lt;/h6&gt;"><img src="2_img/머거본꿀땅콩.gif" alt="Gallery preview"><span class="gallery-item-caption">확대하기</span></a>
                                <div class="row">
                                </div>
                            </div>
                            <!-- Wishlist + Sharing-->
                            <div class="d-flex flex-wrap justify-content-between align-items-center border-top pt-3">
                                <div class="py-2 me-2">
                                    <button class="btn btn-outline-accent" type="button"><i class="ci-heart fs-lg me-2"></i>찜하기</button>
                                </div>
                                <div class="py-2"><i class="ci-share-alt fs-lg align-middle text-muted me-2"></i><a class="btn-social bs-outline bs-facebook bs-sm ms-2" href="#"><i class="ci-facebook"></i></a>
                                    <a class="btn-social bs-outline bs-twitter bs-sm ms-2" href="#"><i class="ci-twitter"></i></a><a class="btn-social bs-outline bs-instagram bs-sm ms-2" href="#"><i class="ci-instagram"></i></a></div>
                            </div>
                        </div>
                    </section>
                    <!-- Sidebar-->
                    <section class="col-lg-8 pt-lg-4 pb-4 mb-3">
                        <div class="pt-2 px-4 ps-lg-0 pe-xl-5">
                            <h2 class="h3 py-2 text-center text-sm-start">가격 추이</h2>
                            <div class="row mx-n2">
                                <div class="col-lg-12 px-2">
                                    <div class="card mb-4">


                                        <!-- Legend -->
                                        <!--
                                        <div class="d-flex flex-wrap justify-content-center fs-ms">
                                            <div class="border rounded py-1 px-2 me-2 mb-2">
                                                <div class="d-inline-block align-middle me-1" style="width: .75rem; height: .75rem; background-color: #f34770;"></div>
                                                <span class="d-inline-block align-middle">가격</span>
                                            </div>
                                        </div>
                                        -->

                                        <!-- Chart -->
                                        <!--
                                        <div class="ct-chart ct-perfect-fourth" data-line-chart='{"labels": ["W1", "W2", "W3", "W4", "W5", "W6", "W7", "W8", "W9"], "series": [[12, 9, 7, 8, 6, 4, 3, 2, 0], [2, 1, 3, 7, 9, 8, 7.7, 4, 7], [1, 3, 4, 5, 6, 8, 9, 10, 11]]}' data-options='{"axisY": {"onlyInteger": true}}'
                                            data-series-color='{"colors": ["#4e54c8", "#fea569", "#f34770"]}'></div>
                                        -->

                                        <div class="d-flex flex-wrap justify-content-center fs-ms">
                                            <div class="d-flex flex-wrap justify-content-center fs-ms">
                                                <div class="border rounded py-1 px-2 me-2 mb-2">
                                                    <div class="d-inline-block align-middle me-1" style="width: .75rem; height: .75rem; background-color: #4e54c8;"></div>
                                                    <span class="d-inline-block align-middle">Company 1</span>
                                                </div>
                                            </div>
                                            <div class="ct-chart ct-perfect-fourth" data-line-chart='{"labels": [["W1", "W2", "W3", "W4", "W5", "W6", "W7", "W8", "W9"]], 
                                                "series": [[12, 9, 7, 8, 6, 4, 3, 2, 0]]}' data-options='{"axisY": {"onlyInteger": true}}' data-series-color='{"colors": [["#4e54c8"]]}'>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </section>

<%@ include file="../footer.jsp" %>