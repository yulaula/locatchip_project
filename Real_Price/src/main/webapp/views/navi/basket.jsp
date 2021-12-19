<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- Page Title-->
        <div class="page-title-overlap bg-purple pt-4">
            <div class="container d-lg-flex justify-content-between py-2 py-lg-3">
                <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
                    <h1 class="h3 text-light mb-0">장바구니</h1>
                </div>
            </div>
        </div>
        <div class="container pb-5 mb-2 mb-md-4">
            <div class="row">
                <!-- List of items-->
                <section class="col-lg-8">
                    <div class="d-flex justify-content-between align-items-center pt-3 pb-4 pb-sm-5 mt-1">
                        <h2 class="h6 text-light mb-0"></h2><a class="btn btn-outline-primary btn-sm ps-2" href="marketplace-category.html"><i class="ci-arrow-left me-2"></i>계속 쇼핑하기</a>
                    </div>
                    <!-- Item-->
                    <div class="d-sm-flex justify-content-between align-items-center my-2 pb-3 border-bottom">
                        <div class="d-block d-sm-flex align-items-center text-center text-sm-start">
                            <a class="d-inline-block flex-shrink-0 mx-auto me-sm-4" href="shop-single-v1.html"><img src="2_img/머거본꿀땅콩.gif" width="160" alt="Product"></a>
                            <div class="pt-2">
                                <h3 class="product-title fs-base mb-2"><a href="shop-single-v1.html">머거본 꿀땅콩(135g)</a></h3>
                                <div class="fs-sm"><i class="ci-home opacity-60 me-2"></i>이마트 역삼점</div>
                                <div class="fs-lg text-accent pt-2">2,500<small>원</small></div>
                            </div>
                        </div>
                        <div class="pt-2 pt-sm-0 ps-sm-3 mx-auto mx-sm-0 text-center text-sm-start" style="max-width: 9rem;">
                            <label class="form-label" for="quantity1">수량</label>
                            <input class="form-control" type="number" id="quantity1" min="1" value="1">
                            <button class="btn btn-link px-0 text-danger" type="button"><i class="ci-close-circle me-2"></i><span class="fs-sm">삭제</span></button>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="d-sm-flex justify-content-between align-items-center my-2 pb-3 border-bottom">
                        <div class="d-block d-sm-flex align-items-center text-center text-sm-start">
                            <a class="d-inline-block flex-shrink-0 mx-auto me-sm-4" href="shop-single-v1.html"><img src="img/shop/cart/02.jpg" width="160" alt="Product"></a>
                            <div class="pt-2">
                                <h3 class="product-title fs-base mb-2"><a href="shop-single-v1.html">TH Jeans City Backpack</a></h3>
                                <div class="fs-sm"><span class="text-muted me-2">Brand:</span>Tommy Hilfiger</div>
                                <div class="fs-sm"><span class="text-muted me-2">Color:</span>Khaki</div>
                                <div class="fs-lg text-accent pt-2">$79.<small>50</small></div>
                            </div>
                        </div>
                        <div class="pt-2 pt-sm-0 ps-sm-3 mx-auto mx-sm-0 text-center text-sm-start" style="max-width: 9rem;">
                            <label class="form-label" for="quantity2">Quantity</label>
                            <input class="form-control" type="number" id="quantity2" min="1" value="1">
                            <button class="btn btn-link px-0 text-danger" type="button"><i class="ci-close-circle me-2"></i><span class="fs-sm">Remove</span></button>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="d-sm-flex justify-content-between align-items-center my-2 pb-3 border-bottom">
                        <div class="d-block d-sm-flex align-items-center text-center text-sm-start">
                            <a class="d-inline-block flex-shrink-0 mx-auto me-sm-4" href="shop-single-v1.html"><img src="img/shop/cart/03.jpg" width="160" alt="Product"></a>
                            <div class="pt-2">
                                <h3 class="product-title fs-base mb-2"><a href="shop-single-v1.html">3-Color Sun Stash Hat</a></h3>
                                <div class="fs-sm"><span class="text-muted me-2">Brand:</span>The North Face</div>
                                <div class="fs-sm"><span class="text-muted me-2">Color:</span>Pink / Beige / Dark blue</div>
                                <div class="fs-lg text-accent pt-2">$22.<small>50</small></div>
                            </div>
                        </div>
                        <div class="pt-2 pt-sm-0 ps-sm-3 mx-auto mx-sm-0 text-center text-sm-start" style="max-width: 9rem;">
                            <label class="form-label" for="quantity3">Quantity</label>
                            <input class="form-control" type="number" id="quantity3" min="1" value="1">
                            <button class="btn btn-link px-0 text-danger" type="button"><i class="ci-close-circle me-2"></i><span class="fs-sm">Remove</span></button>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="d-sm-flex justify-content-between align-items-center my-2 pb-3 border-bottom">
                        <div class="d-block d-sm-flex align-items-center text-center text-sm-start">
                            <a class="d-inline-block flex-shrink-0 mx-auto me-sm-4" href="shop-single-v1.html"><img src="img/shop/cart/04.jpg" width="160" alt="Product"></a>
                            <div class="pt-2">
                                <h3 class="product-title fs-base mb-2"><a href="shop-single-v1.html">Cotton Polo Regular Fit</a></h3>
                                <div class="fs-sm"><span class="text-muted me-2">Size:</span>42</div>
                                <div class="fs-sm"><span class="text-muted me-2">Color:</span>Light blue</div>
                                <div class="fs-lg text-accent pt-2">$9.<small>00</small></div>
                            </div>
                        </div>
                        <div class="pt-2 pt-sm-0 ps-sm-3 mx-auto mx-sm-0 text-center text-sm-start" style="max-width: 9rem;">
                            <label class="form-label" for="quantity4">Quantity</label>
                            <input class="form-control" type="number" id="quantity4" min="1" value="1">
                            <button class="btn btn-link px-0 text-danger" type="button"><i class="ci-close-circle me-2"></i><span class="fs-sm">Remove</span></button>
                        </div>
                    </div>
                    <button class="btn btn-outline-accent d-block w-100 mt-4" type="button"><i class="ci-loading fs-base me-2"></i>Update cart</button>
                </section>
                <!-- Sidebar-->
                <aside class="col-lg-4 pt-4 pt-lg-0 ps-xl-5">
                    <div class="bg-white rounded-3 shadow-lg p-4">
                        <div class="py-2 px-xl-2">
                            <div class="text-center mb-4 pb-3 border-bottom">
                                <h2 class="h6 mb-3 pb-1">주문 금액</h2>
                                <h3 class="fw-normal">136,300<small>원</small></h3>
                            </div>
                            <div class="mb-3 mb-4">
                                <label class="form-label mb-3" for="order-comments"><span class="badge bg-info fs-xs me-2">픽업 요청사항</span><span class="fw-medium">메세지를 입력해주세요.</span></label>
                                <textarea class="form-control" rows="6" id="order-comments"></textarea>
                            </div>
                        </div><a class="btn btn-primary btn-shadow d-block w-100 mt-4" href="checkout-details.html"><i class="ci-card fs-lg me-2"></i>결제하기</a>
                    </div>
                </aside>
            </div>
        </div>

<%@ include file="../footer.jsp" %>