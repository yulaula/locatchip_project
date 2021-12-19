<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
	
	<!-- Page Title-->
        <div class="page-title-overlap bg-purple pt-4">
            <div class="container d-lg-flex justify-content-between py-2 py-lg-3">
                <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                            <li class="breadcrumb-item"><a class="text-nowrap" href="index.html"><i class="ci-home"></i>Home</a></li>
                            <li class="breadcrumb-item text-nowrap"><a href="shop-grid-ls.html">Shop</a>
                            </li>
                            <li class="breadcrumb-item text-nowrap active" aria-current="page">Checkout</li>
                        </ol>
                    </nav>
                </div>
                <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
                    <h1 class="h3 text-light mb-0">주문 정보</h1>
                </div>
            </div>
        </div>
        <div class="container pb-5 mb-2 mb-md-4">
            <div class="row">
                <section class="col-lg-8">
                    <!-- Steps-->
                    <div class="steps steps-light pt-2 pb-3 mb-5">
                        <a class="step-item active" href="shop-cart.html">
                            <div class="step-progress"><span class="step-count">1</span></div>
                            <div class="step-label"><i class="ci-cart"></i>장바구니</div>
                        </a>
                        <a class="step-item active current" href="checkout-details.html">
                            <div class="step-progress"><span class="step-count">2</span></div>
                            <div class="step-label"><i class="ci-user-circle"></i>결제 정보</div>
                        </a>
                        <a class="step-item" href="checkout-payment.html">
                            <div class="step-progress"><span class="step-count">3</span></div>
                            <div class="step-label"><i class="ci-card"></i>결제</div>
                        </a>
                        <a class="step-item" href="checkout-review.html">
                            <div class="step-progress"><span class="step-count">4</span></div>
                            <div class="step-label"><i class="ci-check-circle"></i>후기</div>
                        </a>
                    </div>
                    <!-- Autor info-->
                    <div class="d-sm-flex justify-content-between align-items-center bg-secondary p-4 rounded-3 mb-grid-gutter">
                        <div class="d-flex align-items-center">
                            <div class="img-thumbnail rounded-circle position-relative flex-shrink-0"><img class="rounded-circle" src="2_img/홍길동.png" width="90" alt="홍길동"></div>
                            <div class="ps-3">
                                <h3 class="fs-base mb-0">홍길동</h3><span class="text-accent fs-sm">gildong1234</span>
                            </div>
                        </div><a class="btn btn-light btn-sm btn-shadow mt-3 mt-sm-0" href="account-profile.html"><i class="ci-edit me-2"></i>Edit profile</a>
                    </div>
                    <!-- Shipping address-->
                    <h2 class="h6 pt-1 pb-3 mb-3 border-bottom">픽업 정보</h2>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="mb-3">
                                <label class="form-label" for="">이름</label>
                                <input class="form-control" type="text" id="">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="mb-3">
                                <label class="form-label" for="">주소</label>
                                <input class="form-control" type="text" id="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="mb-3">
                                <label class="form-label" for="checkout-email">이메일</label>
                                <input class="form-control" type="email" id="checkout-email">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="mb-3">
                                <label class="form-label" for="checkout-phone">전화번호</label>
                                <input class="form-control" type="text" id="checkout-phone">
                            </div>
                        </div>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" checked id="same-address">
                        <label class="form-check-label" for="same-address">픽업 정보 저장</label>
                    </div>
                    <!-- Navigation (desktop)-->
                    <div class="d-none d-lg-flex pt-4 mt-3">
                        <div class="w-50 pe-3"><a class="btn btn-secondary d-block w-100" href="shop-cart.html"><i class="ci-arrow-left mt-sm-0 me-1"></i><span class="d-none d-sm-inline">장바구니</span><span class="d-inline d-sm-none">Back</span></a></div>
                        <div class="w-50 ps-2"><a class="btn btn-primary d-block w-100" href="checkout-payment.html"><span class="d-none d-sm-inline">결제하기</span><span class="d-inline d-sm-none">Next</span><i class="ci-arrow-right mt-sm-0 ms-1"></i></a></div>
                    </div>
                </section>
                <!-- Sidebar-->
                <aside class="col-lg-4 pt-4 pt-lg-0 ps-xl-5">
                    <div class="bg-white rounded-3 shadow-lg p-4 ms-lg-auto">
                        <div class="py-2 px-xl-2">
                            <div class="widget mb-3">
                                <h2 class="widget-title text-center">픽업 상품</h2>
                                <div class="d-flex align-items-center pb-2 border-bottom">
                                    <a class="d-block flex-shrink-0" href="shop-single-v1.html"><img src="img/shop/cart/widget/01.jpg" width="64" alt="Product"></a>
                                    <div class="ps-2">
                                        <h6 class="widget-product-title"><a href="shop-single-v1.html">Women Colorblock Sneakers</a></h6>
                                        <div class="widget-product-meta"><span class="text-accent me-2">$150.<small>00</small></span><span class="text-muted">x 1</span></div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center py-2 border-bottom">
                                    <a class="d-block flex-shrink-0" href="shop-single-v1.html"><img src="img/shop/cart/widget/02.jpg" width="64" alt="Product"></a>
                                    <div class="ps-2">
                                        <h6 class="widget-product-title"><a href="shop-single-v1.html">TH Jeans City Backpack</a></h6>
                                        <div class="widget-product-meta"><span class="text-accent me-2">$79.<small>50</small></span><span class="text-muted">x 1</span></div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center py-2 border-bottom">
                                    <a class="d-block flex-shrink-0" href="shop-single-v1.html"><img src="img/shop/cart/widget/03.jpg" width="64" alt="Product"></a>
                                    <div class="ps-2">
                                        <h6 class="widget-product-title"><a href="shop-single-v1.html">3-Color Sun Stash Hat</a></h6>
                                        <div class="widget-product-meta"><span class="text-accent me-2">$22.<small>50</small></span><span class="text-muted">x 1</span></div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center py-2 border-bottom">
                                    <a class="d-block flex-shrink-0" href="shop-single-v1.html"><img src="img/shop/cart/widget/04.jpg" width="64" alt="Product"></a>
                                    <div class="ps-2">
                                        <h6 class="widget-product-title"><a href="shop-single-v1.html">Cotton Polo Regular Fit</a></h6>
                                        <div class="widget-product-meta"><span class="text-accent me-2">$9.<small>00</small></span><span class="text-muted">x 1</span></div>
                                    </div>
                                </div>
                            </div>
                            <ul class="list-unstyled fs-sm pb-2 border-bottom">
                                <li class="d-flex justify-content-between align-items-center"><span class="me-2">소계:</span><span class="text-end">135,000<small>원</small></span></li>
                                <li class="d-flex justify-content-between align-items-center"><span class="me-2">수수료:</span><span class="text-end">15,000<small>원</small></span></li>
                            </ul>
                            <h3 class="fw-normal text-center my-4">150,000<small>원</small></h3>

                        </div>
                    </div>
                </aside>
            </div>
            <!-- Navigation (mobile)-->
            <div class="row d-lg-none">
                <div class="col-lg-8">
                    <div class="d-flex pt-4 mt-3">
                        <div class="w-50 pe-3"><a class="btn btn-secondary d-block w-100" href="shop-cart.html"><i class="ci-arrow-left mt-sm-0 me-1"></i><span class="d-none d-sm-inline">Back to Cart</span><span class="d-inline d-sm-none">Back</span></a></div>
                        <div class="w-50 ps-2"><a class="btn btn-primary d-block w-100" href="checkout-payment.html"><span class="d-none d-sm-inline">Proceed to Shipping</span><span class="d-inline d-sm-none">Next</span><i class="ci-arrow-right mt-sm-0 ms-1"></i></a></div>
                    </div>
                </div>
            </div>
        </div>


<%@ include file="../footer.jsp" %>