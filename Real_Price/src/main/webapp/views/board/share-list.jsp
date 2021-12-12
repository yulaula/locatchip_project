<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- Page Title-->
        <div class="page-title-overlap bg-purple pt-4">
            <div class="container d-lg-flex justify-content-between py-2 py-lg-3">
                <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
                    <h1 class="h3 text-light mb-0">나눔 게시판</h1>
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
                                <div class="img-thumbnail rounded-circle position-relative flex-shrink-0 mx-auto mb-2 mx-md-0 mb-md-0" style="width: 6.375rem;"><span class="badge bg-warning position-absolute end-0 mt-n2" data-bs-toggle="tooltip" title="Reward points"></span><img class="rounded-circle" src="2_img/홍길동.png" alt="user image"></div>
                                <div class="ps-md-3">
                                    <h3 class="fs-base mb-0">홍길동</h3><span class="text-accent fs-sm">gildong1234</span>
                                </div>
                            </div><a class="btn btn-primary d-lg-none mb-2 mt-3 mt-md-0" href="#account-menu" data-bs-toggle="collapse" aria-expanded="false"><i class="ci-menu me-2"></i>Account menu</a>
                        </div>
                        <div class="d-lg-block collapse" id="account-menu">
                            <div class="bg-secondary px-4 py-3">
                                <h3 class="fs-sm mb-0 text-muted">게시판</h3>
                            </div>
                            <ul class="list-unstyled mb-0">
                                <li class="border-bottom mb-0"><a class="nav-link-style d-flex align-items-center px-4 py-3 active" href="nanum_board.html"><i class="ci-pizza opacity-60 me-2"></i>나눔 게시판</a></li>
                                <li class="border-bottom mb-0"><a class="nav-link-style d-flex align-items-center px-4 py-3" href=""><i class="ci-eggs opacity-60 me-2"></i>공동구매 게시판</a></li>
                            </ul>
                        </div>
                    </div>
                </aside>
                <!-- Content  -->
                <section class="col-lg-8">
                    <!-- Toolbar-->
                    <div class="d-flex justify-content-between align-items-center pt-lg-2 pb-4 pb-lg-5 mb-lg-3">
                        <div class="d-flex align-items-center">
                            <label class="d-none d-lg-block fs-sm text-light text-nowrap opacity-75 me-2" for="order-sort"></label>
                            <label class="d-lg-none fs-sm text-nowrap opacity-75 me-2" for="order-sort"></label>
                            <select class="form-select" id="order-sort">
                                <option>전체</option>
                                <option></option>
                                <option></option>
                                <option></option>
                            </select>
                        </div><a class="btn btn-primary btn-sm d-none d-lg-inline-block" href="nanum-board-write.html"><i class="ci-edit me-2"></i>글쓰기</a>
                    </div>
                    <!-- Orders list-->
                    <div class="table-responsive fs-md mb-4">
                        <table class="table table-hover mb-0 text-center">
                            <thead>
                                <tr>
                                    <th style="width: 450px;">제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                    <th>조회</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="py-3"><a class="nav-link-style fw-medium fs-sm" href="#order-details" data-bs-toggle="modal">나눔해요~</a></td>
                                    <td class="py-3">gildong1234</td>
                                    <td class="py-3">2021-12-04</td>
                                    <td class="py-3">12</td>
                                </tr>
                                <tr>
                                    <td class="py-3"><a class="nav-link-style fw-medium fs-sm" href="#order-details" data-bs-toggle="modal">나눔해요~</a></td>
                                    <td class="py-3">gildong1234</td>
                                    <td class="py-3">2021-12-04</td>
                                    <td class="py-3">12</td>
                                </tr>
                                <tr>
                                    <td class="py-3"><a class="nav-link-style fw-medium fs-sm" href="#order-details" data-bs-toggle="modal">나눔해요~</a></td>
                                    <td class="py-3">gildong1234</td>
                                    <td class="py-3">2021-12-04</td>
                                    <td class="py-3">12</td>
                                </tr>
                                <tr>
                                    <td class="py-3"><a class="nav-link-style fw-medium fs-sm" href="#order-details" data-bs-toggle="modal">나눔해요~</a></td>
                                    <td class="py-3">gildong1234</td>
                                    <td class="py-3">2021-12-04</td>
                                    <td class="py-3">12</td>
                                </tr>
                                <tr>
                                    <td class="py-3"><a class="nav-link-style fw-medium fs-sm" href="#order-details" data-bs-toggle="modal">나눔해요~</a></td>
                                    <td class="py-3">gildong1234</td>
                                    <td class="py-3">2021-12-04</td>
                                    <td class="py-3">12</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
        </div>

<%@ include file="../footer.jsp" %>