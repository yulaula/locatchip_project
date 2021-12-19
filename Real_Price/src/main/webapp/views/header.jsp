<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>로켓칩!</title>
    <!-- SEO Meta Tags-->
    <meta name="description" content="Cartzilla - Bootstrap E-commerce Template">
    <meta name="keywords" content="bootstrap, shop, e-commerce, market, modern, responsive,  business, mobile, bootstrap, html5, css3, js, gallery, slider, touch, creative, clean">
    <meta name="author" content="Createx Studio">
    <!-- Viewport-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon and Touch Icons-->
    <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png">
    <link rel="manifest" href="site.webmanifest">
    <link rel="mask-icon" color="#fe6a6a" href="safari-pinned-tab.svg">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">
    <!-- Vendor Styles including: Font Icons, Plugins, etc.-->
    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/views/resources/vendor/simplebar/dist/simplebar.min.css" />
    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/views/resources/vendor/tiny-slider/dist/tiny-slider.css" />
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/views/resources/css/theme.min.css">
    <!--main style-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/resources/1_pagestyle/main.css" />
    
    <!-- board & chart -->
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/resources/assets/vendor/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/resources/assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.css">

    <!-- CSS Front Template -->
    <!-- <link rel="stylesheet" href="assets/css/theme.min.css"> -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/resources/assets/css/snippets.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/resources/assets/vendor/quill/dist/quill.snow.css">

    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/views/resources/vendor/prismjs/themes/prism.css" />
    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/views/resources/vendor/prismjs/plugins/toolbar/prism-toolbar.css" />
    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/views/resources/vendor/prismjs/plugins/line-numbers/prism-line-numbers.css" />
    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/views/resources/vendor/chartist/dist/chartist.min.css" />
    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/views/resources/vendor/lightgallery.js/dist/css/lightgallery.min.css" />
    <script src="<%=request.getContextPath()%>/views/resources/vendor/lightgallery.js/dist/js/lightgallery.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/resources/vendor/lg-fullscreen.js/dist/lg-fullscreen.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/resources/vendor/lg-zoom.js/dist/lg-zoom.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/resources/vendor/lg-video.js/dist/lg-video.min.js"></script>
    <!-- Main theme script-->

    <!-- Vendor scrits: js libraries and plugins-->
    <script src="<%=request.getContextPath()%>/views/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/resources/vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/resources/vendor/tiny-slider/dist/min/tiny-slider.js"></script>
    <script src="<%=request.getContextPath()%>/views/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/resources/vendor/prismjs/components/prism-core.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/resources/vendor/prismjs/components/prism-markup.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/resources/vendor/prismjs/components/prism-clike.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/resources/vendor/prismjs/components/prism-javascript.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/resources/vendor/prismjs/components/prism-pug.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/resources/vendor/prismjs/plugins/toolbar/prism-toolbar.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/resources/vendor/prismjs/plugins/copy-to-clipboard/prism-copy-to-clipboard.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/resources/vendor/prismjs/plugins/line-numbers/prism-line-numbers.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/resources/vendor/chartist/dist/chartist.min.js"></script>
    <!-- Main theme script-->
    <script src="<%=request.getContextPath()%>/views/resources/js/theme.min.js"></script>
</head>

<!-- Body-->
<body class="handheld-toolbar-enabled">
    <main class="page-wrapper">
        <!-- Navbar Marketplace-->
        <!-- Remove "navbar-sticky" class to make navigation bar scrollable with the page.-->
        <header class="bg-light shadow-sm navbar-sticky">
            <div class="navbar navbar-expand-lg navbar-light">
                <div class="container">
                    <a class="navbar-brand d-none d-sm-block flex-shrink-0 me-4 order-lg-1" href="index.html"><img src="<%=request.getContextPath()%>/views/resources/2_img/logo.png" width="142" alt="LocationChip"></a>
                    <a class="navbar-brand d-sm-none me-2 order-lg-1" href="index.html"><img src="img/logo-icon.png" width="74" alt="LocationChip"></a>
                    <!-- Toolbar-->
                    <div class="navbar-toolbar d-flex align-items-center order-lg-3">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"><span class="navbar-toggler-icon"></span></button><a class="navbar-tool d-none d-lg-flex" href="javascript:void(0)" data-bs-toggle="collapse"
                            data-bs-target="#searchBox" role="button" aria-expanded="false" aria-controls="searchBox"><span class="navbar-tool-tooltip">Search</span>
                            <div class="navbar-tool-icon-box"><i class="navbar-tool-icon ci-search"></i></div></a>
                        <!-- after login -->
                        <div class="navbar-tool dropdown ms-2">
                            <!--일반 로그인-->
                            <a class="navbar-tool-icon-box dropdown-toggle" href="account-orders.html"><i class="navbar-tool-icon ci-user"></i></a>
                            <!--판매점 로그인-->
                            <!--<a class="navbar-tool d-none d-lg-flex" href="dashboard-products.html"><span class="navbar-tool-tooltip">My page</span><div class="navbar-tool-icon-box"><i class="navbar-tool-icon ci-store"></i></div></a>-->
                            <div class="dropdown-menu dropdown-menu-end">
                                <div style="min-width: 14rem;">
                                    <h6 class="dropdown-header">주문</h6><a class="dropdown-item d-flex align-items-center" href="account-orders.html"><i class="ci-bag opacity-60 me-2"></i>예약 내역<span class="fs-xs text-muted ms-auto">2</span></a>
                                    <div class="dropdown-divider"></div>
                                    <h6 class="dropdown-header">계정</h6><a class="dropdown-item d-flex align-items-center" href="account-profile.html"><i class="ci-user opacity-60 me-2"></i>회원정보 수정</a>

                                    <div class="dropdown-divider"></div><a class="dropdown-item d-flex align-items-center" href="account-signin.html"><i class="ci-sign-out opacity-60 me-2"></i>로그아웃</a>
                                </div>
                            </div>
                            <div class="navbar-tool ms-4"><a class="navbar-tool-icon-box bg-secondary dropdown-toggle" href="shop-cart.html"><span class="navbar-tool-label">3</span><i class="navbar-tool-icon ci-cart"></i></a></div>
                        </div>
                        <!-- before login -->
                        <!-- <div class="navbar-tool dropdown ms-2">
                            <a class="navbar-tool-icon-box dropdown-toggle" href=""><i class="navbar-tool-icon ci-user"></i></a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <div style="min-width: 14rem;">
                                    <a class="dropdown-item d-flex align-items-center" href="signin.html"><i class="ci-sign-in opacity-60 me-2 "></i>로그인</a>
                                    <a class="dropdown-item d-flex align-items-center" href="signup.html"><i class="ci-add-user opacity-60 me-2 "></i>회원가입</a>
                                </div>
                            </div>
                        </div> -->
                        <!-- <div class="navbar-tool ms-4"><a class="navbar-tool-icon-box bg-secondary dropdown-toggle" href="shop-cart.html"><span class="navbar-tool-label"></span><i class="navbar-tool-icon ci-cart"></i></a></div> -->

                    </div>
                    <div class="collapse navbar-collapse me-auto order-lg-2" id="navbarCollapse">
                        <!-- Search-->
                        <div class="input-group d-lg-none my-3"><i class="ci-search position-absolute top-50 start-0 translate-middle-y text-muted fs-base ms-3"></i>
                            <input class="form-control rounded-start" type="text" placeholder="Search marketplace">
                        </div>
                        <!-- Primary menu-->
                        <ul class="navbar-nav">
                            <li class="nav-item ">
                                <div class="navbar-tool dropdown ms-2">
                                    <a class="navbar-tool-icon-box dropdown-toggle" style="width: 0px;" href=""><a class="nav-link " href="">상품</a></a>
                                    <div class="dropdown-menu dropdown-menu-end">
                                        <div style="min-width: 5rem;">
                                            <a class="dropdown-item d-flex align-items-center" href="total_product.html"><i class="ci-bag opacity-60 me-2"></i>카테고리별 조회</a>
                                            <a class="dropdown-item d-flex align-items-center" href="total_product_for_store.html"><i class="ci-store opacity-60 me-2"></i>거리별 조회</a>

                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item "><a class="nav-link " href="total_store.html">점포</a></li>
                            <li class="nav-item "><a class="nav-link " href="price-statistics.html">가격 추이</a></li>
                            <li class="nav-item "><a class="nav-link " href="event.html">이벤트</a></li>
                            <li class="nav-item ">
                                <div class="navbar-tool dropdown ms-2">
                                    <a class="navbar-tool-icon-box dropdown-toggle" style="width: 0px;" href=""><a class="nav-link " href="">게시판</a></a>
                                    <div class="dropdown-menu dropdown-menu-end">
                                        <div style="min-width: 5rem;">
                                            <a class="dropdown-item d-flex align-items-center" href="nanum_board.html"><i class="ci-bag opacity-60 me-2"></i>나눔 게시판</a>
                                            <a class="dropdown-item d-flex align-items-center" href=""><i class="ci-heart opacity-60 me-2"></i>공동구매 게시판</a>

                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Search collapse-->
            <div class="search-box collapse" id="searchBox">
                <div class="card pt-2 pb-4 border-0 rounded-0">
                    <div class="container">
                        <div class="select-group">
                            <select class="form-select form-select-sm me-2" id="sorting">
                                <option>상품</option>
                                <option>점포</option>
                            </select>
                        </div>
                        <div class="input-group"><i class="ci-search position-absolute top-50 start-0 translate-middle-y text-muted fs-base ms-3"></i>
                            <input class="form-control rounded-start" type="text" placeholder="검색어를 입력해주세요.">
                        </div>
                    </div>
                </div>
            </div>
        </header>