<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>
    
  
<div class="container py-4 py-lg-5 my-4">
            <div class="row">
                <div class="col-md-5  m-lg-auto">
                    <div class="card border-0 shadow">
                        <div class="card-body">
                            <h2 class="h4 mb-3 text-center">로그인</h2>
                            <p class="text-center"><a class="nav-link d-inline fs-lg fw-bold" href="signin.html">일반 회원</a>
                                <span><a class="nav-link d-inline fs-lg fw-bold" href="signin.html">판매점 회원</a></span></p>
                            <hr>
                            <h3 class="fs-base pt-4 pb-2"></h3>
                            <form class="needs-validation" novalidate>
                                <div class="input-group w-100 mb-3"><i class="ci-user position-absolute top-50 translate-middle-y text-muted fs-base ms-3"></i>
                                    <input class="form-control w-100 ms-1 rounded-start" type="text" placeholder="아이디" required>
                                </div>
                                <div class="input-group w-100 mb-3"><i class="ci-locked position-absolute top-50 translate-middle-y text-muted fs-base ms-3"></i>
                                    <div class="password-toggle w-100">
                                        <input class="form-control w-100 ms-1" type="password" placeholder="비밀번호" required>
                                        <label class="password-toggle-btn" aria-label="Show/hide password">
                                         <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                                         </label>
                                    </div>
                                </div>
                                <div class="d-flex flex-wrap justify-content-between">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" checked id="remember_me">
                                        <label class="form-check-label" for="remember_me">자동 로그인</label>
                                    </div>
                                    <a class="nav-link-inline fs-sm" href="signup.html">회원가입</a>
                                </div>
                                <hr class="mt-4">
                                <div class="text-center pt-4">
                                    <button class="btn btn-primary" type="submit"><i class="ci-sign-in me-2 ms-n21"></i>로그인</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <%@ include file="../footer.jsp" %>