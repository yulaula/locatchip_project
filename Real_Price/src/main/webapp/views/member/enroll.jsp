<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<div class="container py-4 py-lg-5 my-4">
            <div class="row">
                <div class="col-md-6 ms-lg-21">
                    <div class="card border-0 shadow">
                        <div class="card-body">
                            <h2 class="h4 mb-3 text-center">회원가입</h2>
                            <p class="text-center"><a class="nav-link d-inline fs-lg fw-bold" href="signup.html">일반 회원</a>
                                <span><a class="nav-link d-inline fs-lg fw-bold" href="signup.html">판매점 회원</a></span></p>
                            <hr class="mb-sm-3">
                            <form class="needs-validation" novalidate>
                                <div class="gx-4 gy-3">
                                    <div class="col-sm-12 mb-4">
                                        <label class="form-label ms-6" for="reg-fn">아이디</label>
                                        <input class="form-control m-auto" type="text" required id="">
                                        <div class="invalid-feedback ms-6">아이디를 입력하세요!</div>
                                    </div>
                                    <div class="col-sm-12 mb-4">
                                        <label class="form-label ms-6" for="reg-password">비밀번호</label>
                                        <input class="form-control m-auto" type="password" required id="reg-password">
                                        <div class="invalid-feedback ms-6">비밀번호를 입력하세요!</div>
                                    </div>
                                    <div class="col-sm-12 mb-4">
                                        <label class="form-label ms-6" for="reg-password-confirm">비밀번호 확인</label>
                                        <input class="form-control m-auto" type="password" required id="reg-password-confirm">
                                        <div class="invalid-feedback ms-6">비밀번호가 일치하지 않습니다!</div>
                                    </div>
                                    <div class="col-sm-12 mb-4">
                                        <label class="form-label ms-6" for="reg-fn">이름</label>
                                        <input class="form-control m-auto" type="text" required id="">
                                        <div class="invalid-feedback ms-6">이름을 입력하세요!</div>
                                    </div>
                                    <div class="col-sm-12 mb-4">
                                        <label class="form-label ms-6" for="reg-ln">전화번호</label>
                                        <input class="form-control m-auto" type="tel" required id="reg-phone">
                                        <div class="invalid-feedback ms-6">전화번호를 입력하세요!</div>
                                    </div>
                                    <div class="col-sm-12 mb-4">
                                        <label class="form-label ms-6" for="reg-email">이메일</label>
                                        <input class="form-control m-auto" type="email" required id="reg-email">
                                        <div class="invalid-feedback ms-6">이메일을 입력하세요!</div>
                                    </div>
                                    <div class="col-sm-12 mb-4">
                                        <label class="form-label ms-6" for="reg-phone">주소</label>
                                        <input class="form-control m-auto" type="text" required id="">
                                        <div class="invalid-feedback ms-6">주소를 입력하세요!</div>
                                    </div>

                                    <div class="col-12 text-center">
                                        <button class="btn btn-primary" type="submit"><i class="ci-user me-2 ms-n1"></i>Sign Up</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 pt-4 mt-3 mt-md-0">
                </div>
            </div>
        </div>
        
<%@ include file="../footer.jsp" %>