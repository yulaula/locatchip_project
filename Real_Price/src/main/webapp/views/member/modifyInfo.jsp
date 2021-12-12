<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>


<div class="page-title-overlap bg-purple pt-4">
            <div class="container d-lg-flex justify-content-between py-2 py-lg-3">
                <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
                    <h1 class="h3 text-light mb-0">회원 정보 수정</h1>
                </div>
            </div>
        </div>
        <div class="container pb-5 mb-2 mb-md-4">
            <div class="row">
                <!-- Sidebar-->
                <aside class="col-lg-4 pt-4 pt-lg-0 pe-xl-5">
                    <div class="bg-white rounded-3 shadow-lg pt-1 mb-5 mb-lg-0">
                        <div class="d-md-flex justify-content-between align-items-center text-center text-md-start p-4">
                            <div class="d-md-flex align-items-center">
                                <div class="img-thumbnail rounded-circle position-relative flex-shrink-0 mx-auto mb-2 mx-md-0 mb-md-0" style="width: 6.375rem;"><span class="badge bg-warning position-absolute end-0 mt-n2" data-bs-toggle="tooltip" title="Reward points"></span><img class="rounded-circle" src="<%=request.getContextPath()%>/resources/2_img/홍길동.png" alt="user image"></div>
                                <div class="ps-md-3">
                                    <h3 class="fs-base mb-0">홍길동</h3><span class="text-accent fs-sm">gildong1234</span>
                                </div>
                            </div><a class="btn btn-primary d-lg-none mb-2 mt-3 mt-md-0" href="#account-menu" data-bs-toggle="collapse" aria-expanded="false"><i class="ci-menu me-2"></i>Account menu</a>
                        </div>
                        <div class="d-lg-block collapse" id="account-menu">
                            <div class="bg-secondary px-4 py-3">
                                <h3 class="fs-sm mb-0 text-muted">주문</h3>
                            </div>
                            <ul class="list-unstyled mb-0">
                                <li class="border-bottom mb-0"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="account-orders.html"><i class="ci-bag opacity-60 me-2"></i>예약 내역<span class="fs-sm text-muted ms-auto">2</span></a></li>
                                <li class="border-bottom mb-0"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="wishlist.html"><i class="ci-heart opacity-60 me-2"></i>찜<span class="fs-sm text-muted ms-auto">4</span></a></li>
                            </ul>
                            <div class="bg-secondary px-4 py-3">
                                <h3 class="fs-sm mb-0 text-muted">계정</h3>
                            </div>
                            <ul class="list-unstyled mb-0">
                                <li class="border-bottom mb-0"><a class="nav-link-style d-flex align-items-center px-4 py-3 active" href="account-profile.html"><i class="ci-user opacity-60 me-2"></i>회원정보 수정</a></li>
                                <li class="mb-0"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="account-payment.html"><i class="ci-card opacity-60 me-2"></i>결제 방식</a></li>
                                <li class="d-lg-none border-top mb-0"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="account-signin.html"><i class="ci-sign-out opacity-60 me-2"></i>로그아웃</a></li>
                            </ul>
                        </div>
                    </div>
                </aside>
                <!-- Content  -->
                <section class="col-lg-8">
                    <!-- Toolbar-->
                    <div class="d-none d-lg-flex justify-content-between align-items-center pt-lg-3 pb-4 pb-lg-5 mb-lg-3">
                        <h6 class="fs-base text-light mb-0">업데이트할 정보</h6><a class="btn btn-primary btn-sm" href="account-signin.html"><i class="ci-sign-out me-2"></i>로그아웃</a>
                    </div>
                    <!-- Profile form-->
                    <form>
                        <div class="bg-secondary rounded-3 p-4 mb-4">
                            <div class="d-flex align-items-center"><img class="rounded" src="2_img/홍길동.png" width="90" alt="홍길동">
                                <div class="ps-3">
                                    <button class="btn btn-light btn-shadow btn-sm mb-2" type="button"><i class="ci-loading me-2"></i>사진 변경</button>
                                    <div class="p mb-0 fs-ms text-muted">Upload JPG, GIF or PNG image. 300 x 300 required.</div>
                                </div>
                            </div>
                        </div>
                        <div class="row gx-4 gy-3">
                            <div class="col-sm-6">
                                <label class="form-label" for="">이름</label>
                                <input class="form-control" type="text" id="" value="">
                            </div>
                            <div class="col-sm-6">
                                <label class="form-label" for="">주소</label>
                                <input class="form-control" type="text" id="" value="">
                            </div>
                            <div class="col-sm-6">
                                <label class="form-label" for="account-email">이메일</label>
                                <input class="form-control" type="email" id="account-email" value="" disabled>
                            </div>
                            <div class="col-sm-6">
                                <label class="form-label" for="account-phone">전화번호</label>
                                <input class="form-control" type="text" id="account-phone" value="" required>
                            </div>
                            <div class="col-sm-6">
                                <label class="form-label" for="account-pass">새 비밀번호</label>
                                <div class="password-toggle">
                                    <input class="form-control" type="password" id="account-pass">
                                    <label class="password-toggle-btn" aria-label="Show/hide password">
                                        <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <label class="form-label" for="account-confirm-pass">비밀번호 확인</label>
                                <div class="password-toggle">
                                    <input class="form-control" type="password" id="account-confirm-pass">
                                    <label class="password-toggle-btn" aria-label="Show/hide password">
                                        <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-12">
                                <hr class="mt-2 mb-3">
                                <div class="d-flex flex-wrap justify-content-between align-items-center">
                                    <button class="btn btn-primary mt-3 mt-sm-0" type="button">수정</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
        </div>
        
<%@ include file="../footer.jsp" %>