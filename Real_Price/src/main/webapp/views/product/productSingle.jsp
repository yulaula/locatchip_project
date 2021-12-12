<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


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
                    <section class="col-lg-6 pt-2 pt-lg-4 pb-4 mb-lg-3">
                        <div class="pt-3 px-4 pe-lg-0 ps-xl-5">
                            <!-- Product gallery-->
                            <div class="gallery">
                                <a class="gallery-item rounded-3 mb-grid-gutter" href="<%=request.getContextPath()%>/resources/2_img/머거본꿀땅콩.gif" data-sub-html="&lt;h6 class=&quot;fs-sm text-light&quot;&gt;확대하기&lt;/h6&gt;"><img src="2_img/머거본꿀땅콩.gif" alt="Gallery preview"><span class="gallery-item-caption">확대하기</span></a>
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
                    <aside class="col-lg-6 ps-xl-5">
                        <hr class="d-lg-none">
                        <div class="bg-white h-100 p-4 ms-auto border-start">
                            <div class="px-lg-2">
                                <div class="accordion accordion-flush" id="licenses">
                                    <div class="accordion-item border-bottom">
                                        <div class="accordion-header d-flex justify-content-between align-items-center py-3">
                                            <div class="form-check" data-bs-toggle="collapse" data-bs-target="#standard-license">
                                                <input class="form-check-input" type="radio" name="license" id="license-std" checked>
                                                <label class="form-check-label fw-medium text-dark" for="license-std">신정시장</label>
                                            </div>
                                            <h5 class="mb-0 text-accent fw-normal">2,500<small>원</small></h5>
                                        </div>
                                        <div class="accordion-collapse collapse show" id="standard-license" data-bs-parent="#licenses">
                                            <div class="accordion-body py-0 pb-2">
                                                <ul class="list-unstyled fs-sm">
                                                    <li class="d-flex align-items-center"><i class="ci-check-circle text-success me-1"></i><span class="fs-ms">최저가</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <div class="accordion-header d-flex justify-content-between align-items-center py-3">
                                            <div class="form-check" data-bs-toggle="collapse">
                                                <input class="form-check-input" type="radio" name="license">
                                                <label class="form-check-label fw-medium text-dark">GS25 마포점</label>
                                            </div>
                                            <h5 class="mb-0 text-accent fw-normal">2,940<small>원</small></h5>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <div class="accordion-header d-flex justify-content-between align-items-center py-3">
                                            <div class="form-check" data-bs-toggle="collapse" data-bs-target="#extended-license">
                                                <input class="form-check-input" type="radio" name="license">
                                                <label class="form-check-label fw-medium text-dark" for="license-ext">GS25 마포점</label>
                                            </div>
                                            <h5 class="mb-0 text-accent fw-normal">2,940<small>원</small></h5>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <div class="accordion-header d-flex justify-content-between align-items-center py-3">
                                            <div class="form-check" data-bs-toggle="collapse" data-bs-target="#extended-license">
                                                <input class="form-check-input" type="radio" name="license">
                                                <label class="form-check-label fw-medium text-dark" for="license-ext">GS25 마포점</label>
                                            </div>
                                            <h5 class="mb-0 text-accent fw-normal">2,940<small>원</small></h5>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <div class="accordion-header d-flex justify-content-between align-items-center py-3">
                                            <div class="form-check" data-bs-toggle="collapse" data-bs-target="#extended-license">
                                                <input class="form-check-input" type="radio" name="license">
                                                <label class="form-check-label fw-medium text-dark" for="license-ext">GS25 마포점</label>
                                            </div>
                                            <h5 class="mb-0 text-accent fw-normal">2,940<small>원</small></h5>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <a href="shop-cart.html"><button class="btn btn-primary btn-shadow d-block w-100 mt-4" type="button"><i class="ci-cart fs-lg me-2"></i>장바구니</button></a>

                                <div class="bg-secondary rounded p-3 mb-2"><i class="ci-download h5 text-muted align-middle mb-0 mt-n1 me-2"></i><span class="d-inline-block h6 mb-0 me-1">715</span><span class="fs-sm">Sales</span></div>
                                <div class="bg-secondary rounded p-3 mb-4">
                                    <div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i>
                                        <i class="star-rating-icon ci-star"></i>
                                    </div><span class="fs-ms ms-2">4.1/5</span>
                                    <div class="fs-ms text-muted">Review(74)</div>
                                </div>
                                <ul class="list-unstyled fs-sm">
                                    <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium">카테고리</span><a class="product-meta" href="#">견과류</a></li>
                                    <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium">최근 조사일</span><span class="text-muted">2021년 12월 6일</span></li>
                                </ul>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
        </section>
        <!-- Product description + Reviews + Comments-->
        <section class="container mb-4 mb-lg-5">
            <!-- Nav tabs-->
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item"><a class="nav-link p-4" href="#reviews" data-bs-toggle="tab" role="tab">Reviews</a></li>
            </ul>
            <div class="tab-content pt-2">
                <!-- Reviews tab-->
                <div class="tab-pane fade show active" id="reviews" role="tabpanel">
                    <!-- Reviews-->
                    <div class="row pt-2 pb-3">
                        <div class="col-lg-4 col-md-5">
                            <h3 class="h4 mb-4">74개의 리뷰</h3>
                            <div class="star-rating me-2"><i class="ci-star-filled fs-sm text-accent me-1"></i><i class="ci-star-filled fs-sm text-accent me-1"></i><i class="ci-star-filled fs-sm text-accent me-1"></i><i class="ci-star-filled fs-sm text-accent me-1"></i><i class="ci-star fs-sm text-muted me-1"></i></div>
                            <span class="d-inline-block align-middle">4.1</span>
                        </div>
                        <div class="col-lg-8 col-md-7">
                            <div class="d-flex align-items-center mb-2">
                                <div class="text-nowrap me-3"><span class="d-inline-block align-middle text-muted">5</span><i class="ci-star-filled fs-xs ms-1"></i></div>
                                <div class="w-100">
                                    <div class="progress" style="height: 4px;">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 60%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div><span class="text-muted ms-3">43</span>
                            </div>
                            <div class="d-flex align-items-center mb-2">
                                <div class="text-nowrap me-3"><span class="d-inline-block align-middle text-muted">4</span><i class="ci-star-filled fs-xs ms-1"></i></div>
                                <div class="w-100">
                                    <div class="progress" style="height: 4px;">
                                        <div class="progress-bar" role="progressbar" style="width: 27%; background-color: #a7e453;" aria-valuenow="27" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div><span class="text-muted ms-3">16</span>
                            </div>
                            <div class="d-flex align-items-center mb-2">
                                <div class="text-nowrap me-3"><span class="d-inline-block align-middle text-muted">3</span><i class="ci-star-filled fs-xs ms-1"></i></div>
                                <div class="w-100">
                                    <div class="progress" style="height: 4px;">
                                        <div class="progress-bar" role="progressbar" style="width: 17%; background-color: #ffda75;" aria-valuenow="17" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div><span class="text-muted ms-3">9</span>
                            </div>
                            <div class="d-flex align-items-center mb-2">
                                <div class="text-nowrap me-3"><span class="d-inline-block align-middle text-muted">2</span><i class="ci-star-filled fs-xs ms-1"></i></div>
                                <div class="w-100">
                                    <div class="progress" style="height: 4px;">
                                        <div class="progress-bar" role="progressbar" style="width: 9%; background-color: #fea569;" aria-valuenow="9" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div><span class="text-muted ms-3">4</span>
                            </div>
                            <div class="d-flex align-items-center">
                                <div class="text-nowrap me-3"><span class="d-inline-block align-middle text-muted">1</span><i class="ci-star-filled fs-xs ms-1"></i></div>
                                <div class="w-100">
                                    <div class="progress" style="height: 4px;">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 4%;" aria-valuenow="4" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div><span class="text-muted ms-3">2</span>
                            </div>
                        </div>
                    </div>
                    <hr class="mt-4 mb-3">
                    <div class="row py-4">
                        <!-- Reviews list-->
                        <div class="col-md-12">
                            <!-- Review-->
                            <div class="product-review pb-4 mb-4 border-bottom">
                                <div class="d-flex mb-3">
                                    <div class="d-flex align-items-center me-4 pe-2"><img class="rounded-circle" src="img/shop/reviews/01.jpg" width="50" alt="Rafael Marquez">
                                        <div class="ps-3">
                                            <h6 class="fs-sm mb-0">홍길동</h6><span class="fs-ms text-muted">2021-12-02</span>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i>
                                            <i class="star-rating-icon ci-star"></i>
                                        </div>
                                    </div>
                                </div>
                                <p class="fs-md mb-2">짱짱 존맛탱</p>
                                <div class="text-nowrap">
                                    <button class="btn-like" type="button">15</button>
                                    <button class="btn-dislike" type="button">3</button>
                                </div>
                            </div>

                            <!-- <div class="text-center">
                                <button class="btn btn-outline-accent" type="button"><i class="ci-reload me-2"></i>Load more reviews</button>
                            </div> -->
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <!-- Related products carousel-->
        <section class="container mb-5 pb-lg-3">
            <div class="d-flex flex-wrap justify-content-between align-items-center border-bottom pb-4 mb-4">
                <h2 class="h3 mb-0 pt-2">이 제품은 어떠세요?</h2>
                <div class="pt-2"><a class="btn btn-outline-accent btn-sm" href="marketplace-category.html">더보기<i class="ci-arrow-end ms-1 me-n1"></i></a></div>
            </div>
            <!-- Carousel-->
            <div class="tns-carousel">
                <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 2, &quot;gutter&quot;: 16, &quot;controls&quot;: false, &quot;nav&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2 },&quot;768&quot;:{&quot;items&quot;:3}, &quot;992&quot;:{&quot;items&quot;:4}}}">
                    <!-- Product-->
                    <div>
                        <div class="card product-card-alt">
                            <div class="product-thumb">
                                <button class="btn-wishlist btn-sm" type="button"><i class="ci-heart"></i></button>
                                <div class="product-card-actions"><a class="btn btn-light btn-icon btn-shadow fs-base mx-2" href="#"><i class="ci-eye"></i></a>
                                    <button class="btn btn-light btn-icon btn-shadow fs-base mx-2" type="button"><i class="ci-cart"></i></button>
                                </div>
                                <a class="product-thumb-overlay" href="#"></a><img src="2_img/허니버터아몬드.jpg" alt="Product">
                            </div>
                            <div class="card-body">
                                <div class="d-flex flex-wrap justify-content-between align-items-start pb-2">
                                    <div class="text-muted fs-xs me-1"><a class="product-meta fw-medium" href="#">길림양행</a></div>
                                    <div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i>
                                        <i class="star-rating-icon ci-star-filled active"></i>
                                    </div>
                                </div>
                                <h3 class="product-title fs-sm mb-2"><a href="#">허니버터아몬드</a></h3>
                                <div class="d-flex flex-wrap justify-content-between align-items-center">
                                    <div class="fs-sm me-2"><i class="ci-download text-muted me-1"></i>109<span class="fs-xs ms-1">Sales</span></div>
                                    <div class="bg-faded-accent text-accent rounded-1 py-1 px-2">5,000<small>원</small></div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
    

<%@ include file="../footer.jsp" %>