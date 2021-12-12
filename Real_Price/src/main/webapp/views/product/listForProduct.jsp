<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div>

<!-- Used for marketplace templates with filters on top-->
        <div class="bg-accent pt-4 pb-7">
            <div class="container pt-2 pb-3 pt-lg-3 pb-lg-4">
                <div class="d-lg-flex justify-content-between pb-3">
                    <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
                        <h1 class="h3 text-light mb-0">상품별 조회</h1>
                    </div>
                </div>
            </div>
            <select class="form-select form-select-sm me-2 ms-65" style="width: 10%;  display: inline;">
                <option>전체</option>
                <option>계란</option>
                <option>쇠고기</option>
                <option>닭고기</option>
                <option>돼지고기</option>
            </select>
            <div class="d-inline justify-content-between align-items-center mb-4">
                <a class="btn btn-outline-primary btn-sm px-5 py-2-1" href="">검색</a>
            </div>
        </div>
        <div class="container pb-5 mb-2 mb-md-4">
            <!-- Toolbar-->
            <div class="bg-light shadow-lg rounded-3 mt-n5 mb-4">
                <div class="d-flex align-items-center ps-2">
                    <!-- Search-->
                    <div class="input-group"><i class="ci-search position-absolute top-50 start-0 translate-middle-y fs-md ms-3"></i>
                        <input class="form-control border-0 shadow-none" type="text" placeholder="상품을 입력해주세요.">
                    </div>
                    <!-- Sort-->
                    <div class="d-flex align-items-center">
                        <div class="dropdown py-4 border-start"><a class="nav-link-style fs-md fw-medium dropdown-toggle p-4" href="#" data-bs-toggle="dropdown"><span class="d-inline-block py-1"><i class="ci-thumb-up align-middle opacity-60 mt-n1 me-2"></i>Popular</span></a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="#"><i class="ci-arrow-down me-2 opacity-60"></i>낮은가격순</a></li>
                                <li><a class="dropdown-item" href="#"><i class="ci-arrow-up me-2 opacity-60"></i>높은가격순</a></li>
                                <li><a class="dropdown-item" href="#"><i class="ci-star me-2 opacity-60"></i>판매순</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Products grid-->
            <div class="row pt-3 mx-n2">
                <!-- Product-->
                <div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-grid-gutter">
                    <div class="card product-card-alt">
                        <div class="product-thumb">
                            <button class="btn-wishlist btn-sm" type="button"><i class="ci-heart"></i></button>
                            <div class="product-card-actions"><a class="btn btn-light btn-icon btn-shadow fs-base mx-2" href="marketplace-single.html"><i class="ci-eye"></i></a>
                                <button class="btn btn-light btn-icon btn-shadow fs-base mx-2" type="button"><i class="ci-cart"></i></button>
                            </div>
                            <a class="product-thumb-overlay" href="marketplace-single.html"></a><img src="2_img/머거본꿀땅콩.gif" alt="Product">
                        </div>
                        <div class="card-body">
                            <div class="d-flex flex-wrap justify-content-between align-items-start pb-2">
                                <div class="text-muted fs-xs me-1"><a class="product-meta fw-medium" href="#">머거본</a></div>
                                <div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i>
                                    <i class="star-rating-icon ci-star-filled active"></i>
                                </div>
                            </div>
                            <h3 class="product-title fs-sm mb-2"><a href="marketplace-single.html">머거본 꿀땅콩(135g)</a></h3>
                            <div class="d-flex flex-wrap justify-content-between align-items-center">
                                <div class="fs-sm me-2"><i class="ci-download text-muted me-1"></i>109<span class="fs-xs ms-1">판매</span></div>
                                <div class="bg-faded-accent text-accent rounded-1 py-1 px-2">2,500<small>원</small></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="my-3">
        </div>

</div>


<%@ include file="../footer.jsp" %>