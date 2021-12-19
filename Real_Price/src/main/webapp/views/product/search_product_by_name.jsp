<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="price.model.vo.Price"%>
<%@ page import="price.model.service.PriceService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../header.jsp"%>


<%
	PriceService ps = new PriceService();
	List<Price> list = (ArrayList<Price>)request.getAttribute("list");

%>
<!-- Used for marketplace templates with filters on top-->
<div class="bg-accent pt-4 pb-7">
	<div class="container pt-2 pb-3 pt-lg-3 pb-lg-4">
		<div class="d-lg-flex justify-content-between pb-3">
			<!-- <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                                <li class="breadcrumb-item"><a class="text-nowrap" href="index.html"><i class="ci-home"></i>Home</a></li>
                                <li class="breadcrumb-item text-nowrap"><a href="home-marketplace.html">Market</a>
                                </li>
                                <li class="breadcrumb-item text-nowrap active" aria-current="page">Inside category</li>
                            </ol>
                        </nav>
                    </div> -->
			<div class="order-lg-1 pe-lg-4 text-center text-lg-start">
				<h1 class="h3 text-light mb-0">상품별 조회</h1>
			</div>
		</div>
	</div>

	<select class="form-select form-select-sm me-2 ms-65"
		style="width: 10%; display: inline;">
		<option>전체</option>
		<option>정육·난류</option>
		<option>생선류</option>
	</select> <select class="form-select form-select-sm me-2"
		style="width: 10%; display: inline;">
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
			<div class="input-group">
				<form action="searchByProductName" method="POST">
					<i
						class="ci-search position-absolute top-50 start-0 translate-middle-y fs-md ms-3"></i>

					<input class="form-control border-0 shadow-none" type="text"
						id="productName" name="productName" placeholder="상품을 입력해주세요.">
				</form>
			</div>
			<!-- Sort-->
			<div class="d-flex align-items-center">
				<div class="dropdown py-4 border-start">
					<a class="nav-link-style fs-md fw-medium dropdown-toggle p-4"
						href="#" data-bs-toggle="dropdown"><span
						class="d-inline-block py-1"><i
							class="ci-thumb-up align-middle opacity-60 mt-n1 me-2"></i>Popular</span></a>
					<ul class="dropdown-menu dropdown-menu-end">
						<li><a class="dropdown-item" href="#"><i
								class="ci-arrow-down me-2 opacity-60"></i>낮은가격순</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="ci-arrow-up me-2 opacity-60"></i>높은가격순</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="ci-rocket me-2 opacity-60"></i>점포별</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="ci-loading me-2 opacity-60"></i>Updated</a></li>
					</ul>
				</div>
			</div>
			<!-- Pagination-->
			<!-- <div class="d-none d-md-flex align-items-center border-start ps-4"><span class="fs-md text-nowrap me-4">Pages&nbsp; 1 / 5</span><a class="nav-link-style p-4 border-start" href="#"><span class="d-inline-block py-1"><i class="ci-arrow-left"></i></span></a>
                        <a class="nav-link-style p-4 border-start" href="#"><span class="d-inline-block py-1"><i class="ci-arrow-right"></i></span></a>
                    </div> -->
		</div>
	</div>
	<!-- Products grid-->
	<div class="row pt-3 mx-n2">
		<!-- Product-->
		<% if(list.size()>=1) { %>
		<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-grid-gutter"
			id="product">
			<div class="card product-card-alt">
				<div class="product-thumb">
					<button class="btn-wishlist btn-sm" type="button">
						<i class="ci-heart"></i>
					</button>
					<div class="product-card-actions">
						<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							href="marketplace-single.html"><i class="ci-eye"></i></a>
						<button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							type="button">
							<i class="ci-cart"></i>
						</button>
					</div>
					<a class="product-thumb-overlay" href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(0).getGoodId()%>"></a><img
						src="<%=request.getContextPath()%>/views/resources/2_img/<%= list.get(0).getGoodId() %>.png" alt="Product">
				</div>
				<div class="card-body">
					<div
						class="d-flex flex-wrap justify-content-between align-items-start pb-2">
						<div class="text-muted fs-xs me-1">
							<a class="product-meta fw-medium" href="#">머거본</a>
						</div>
						<div class="star-rating">
							<i class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i> <i
								class="star-rating-icon ci-star-filled active"></i>
						</div>
					</div>

					<span> 
					<a class="product-title fs-sm mb-2"
						style="text-decoration: none; color: black;"
						href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(0).getGoodId()%>">
							<%= ps.productName(list.get(0).getGoodId()) %>
					</a>
					</span>

					<div
						class="d-flex flex-wrap justify-content-between align-items-center">
						<div class="fs-sm me-2">
							<i class="ci-download text-muted me-1"></i>109<span
								class="fs-xs ms-1">판매</span>
						</div>
						<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
							<%= list.get(0).getGoodPrice() %><small>원</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%} %>
		<!-- Product-->
		<% if(list.size()>=2) { %>
		<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-grid-gutter"
			id="product">
			<div class="card product-card-alt">
				<div class="product-thumb">
					<button class="btn-wishlist btn-sm" type="button">
						<i class="ci-heart"></i>
					</button>
					<div class="product-card-actions">
						<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							href="marketplace-single.html"><i class="ci-eye"></i></a>
						<button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							type="button">
							<i class="ci-cart"></i>
						</button>
					</div>
					<a class="product-thumb-overlay" href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(1).getGoodId()%>"></a><img
						src="<%=request.getContextPath()%>/views/resources/2_img/<%= list.get(1).getGoodId() %>.png" alt="Product">
				</div>
				<div class="card-body">
					<div
						class="d-flex flex-wrap justify-content-between align-items-start pb-2">
						<div class="text-muted fs-xs me-1">
							by <a class="product-meta fw-medium" href="#">Createx Std. </a>in
							<a class="product-meta fw-medium" href="#">Graphics</a>
						</div>
						<div class="star-rating">
							<i class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i> <i
								class="star-rating-icon ci-star"></i>
						</div>
					</div>
					<span> <a class="product-title fs-sm mb-2"
						style="text-decoration: none; color: black;"
						href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(1).getGoodId()%>">
							<%= ps.productName(list.get(1).getGoodId()) %>
					</a>
					</span>
					<div
						class="d-flex flex-wrap justify-content-between align-items-center">
						<div class="fs-sm me-2">
							<i class="ci-download text-muted me-1"></i>95<span
								class="fs-xs ms-1">Sales</span>
						</div>
						<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
							<%= list.get(1).getGoodPrice() %><small>원</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%} %>
		<!-- Product-->
		<% if(list.size()>=3) { %>
		<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-grid-gutter"
			id="product">
			<div class="card product-card-alt">
				<div class="product-thumb">
					<button class="btn-wishlist btn-sm" type="button">
						<i class="ci-heart"></i>
					</button>
					<div class="product-card-actions">
						<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							href="marketplace-single.html"><i class="ci-eye"></i></a>
						<button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							type="button">
							<i class="ci-cart"></i>
						</button>
					</div>
					<a class="product-thumb-overlay" href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(2).getGoodId()%>"></a><img
						src="<%=request.getContextPath()%>/views/resources/2_img/<%= list.get(2).getGoodId() %>.png" alt="Product">
				</div>
				<div class="card-body">
					<div
						class="d-flex flex-wrap justify-content-between align-items-start pb-2">
						<div class="text-muted fs-xs me-1">
							by <a class="product-meta fw-medium" href="#">pixels </a>in <a
								class="product-meta fw-medium" href="#">Graphics</a>
						</div>
						<div class="star-rating">
							<i class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-half active"></i><i
								class="star-rating-icon ci-star"></i>
						</div>
					</div>
					<span> 
					<a
						class="product-title fs-sm mb-2"
						style="text-decoration: none; color: black;"
						href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(2).getGoodId()%>">
							<%= ps.productName(list.get(2).getGoodId()) %>
					</a>
					</span>
					<div
						class="d-flex flex-wrap justify-content-between align-items-center">
						<div class="fs-sm me-2">
							<i class="ci-download text-muted me-1"></i>316<span
								class="fs-xs ms-1">Sales</span>
						</div>
						<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
							<%= list.get(2).getGoodPrice() %><small>원</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%} %>
		<!-- Product-->
		<% if(list.size()>4) { %>
		<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-grid-gutter"
			id="product">
			<div class="card product-card-alt">
				<div class="product-thumb">
					<button class="btn-wishlist btn-sm" type="button">
						<i class="ci-heart"></i>
					</button>
					<div class="product-card-actions">
						<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							href="marketplace-single.html"><i class="ci-eye"></i></a>
						<button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							type="button">
							<i class="ci-cart"></i>
						</button>
					</div>
					<a class="product-thumb-overlay" href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(3).getGoodId()%>"></a><img
						src="<%=request.getContextPath()%>/views/resources/2_img/<%= list.get(3).getGoodId() %>.png" alt="Product">
				</div>
				<div class="card-body">
					<div
						class="d-flex flex-wrap justify-content-between align-items-start pb-2">
						<div class="text-muted fs-xs me-1">
							by <a class="product-meta fw-medium" href="#">pixels </a>in <a
								class="product-meta fw-medium" href="#">Graphics</a>
						</div>
						<div class="star-rating">
							<i class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i> <i
								class="star-rating-icon ci-star"></i>
						</div>
					</div>
					<span>
					<a
						class="product-title fs-sm mb-2"
						style="text-decoration: none; color: black;"
						href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(3).getGoodId()%>">
							<%= ps.productName(list.get(3).getGoodId()) %>
					</a>
					</span>
					<div
						class="d-flex flex-wrap justify-content-between align-items-center">
						<div class="fs-sm me-2">
							<i class="ci-download text-muted me-1"></i>234<span
								class="fs-xs ms-1">Sales</span>
						</div>
						<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
							<%= list.get(3).getGoodPrice() %><small>원</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%} %>
		<!-- Product-->
		<% if(list.size()>=5) { %>
		<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-grid-gutter"
			id="product">
			<div class="card product-card-alt">
				<div class="product-thumb">
					<button class="btn-wishlist btn-sm" type="button">
						<i class="ci-heart"></i>
					</button>
					<div class="product-card-actions">
						<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							href="marketplace-single.html"><i class="ci-eye"></i></a>
						<button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							type="button">
							<i class="ci-cart"></i>
						</button>
					</div>
					<a class="product-thumb-overlay" href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(4).getGoodId()%>"></a><img
						src="<%=request.getContextPath()%>/views/resources/2_img/<%= list.get(4).getGoodId() %>.png" alt="Product">
				</div>
				<div class="card-body">
					<div
						class="d-flex flex-wrap justify-content-between align-items-start pb-2">
						<div class="text-muted fs-xs me-1">
							by <a class="product-meta fw-medium" href="#">Createx Std. </a>in
							<a class="product-meta fw-medium" href="#">UI Design</a>
						</div>
						<div class="star-rating">
							<i class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-half active"></i><i
								class="star-rating-icon ci-star"></i><i
								class="star-rating-icon ci-star"></i>
						</div>
					</div>
					<span>
					<a
						class="product-title fs-sm mb-2"
						style="text-decoration: none; color: black;"
						href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(4).getGoodId()%>">
							<%= ps.productName(list.get(4).getGoodId()) %>
					</a>
					</span>
					<div
						class="d-flex flex-wrap justify-content-between align-items-center">
						<div class="fs-sm me-2">
							<i class="ci-download text-muted me-1"></i>153<span
								class="fs-xs ms-1">Sales</span>
						</div>
						<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
							<%= list.get(4).getGoodPrice() %><small>원</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%} %>
		<!-- Product-->
		<% if(list.size()>=6) { %>
		<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-grid-gutter"
			id="product">
			<div class="card product-card-alt">
				<div class="product-thumb">
					<button class="btn-wishlist btn-sm" type="button">
						<i class="ci-heart"></i>
					</button>
					<div class="product-card-actions">
						<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							href="marketplace-single.html"><i class="ci-eye"></i></a>
						<button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							type="button">
							<i class="ci-cart"></i>
						</button>
					</div>
					<a class="product-thumb-overlay" href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(5).getGoodId()%>"></a><img
						src="<%=request.getContextPath()%>/views/resources/2_img/<%= list.get(5).getGoodId() %>.png" alt="Product">
				</div>
				<div class="card-body">
					<div
						class="d-flex flex-wrap justify-content-between align-items-start pb-2">
						<div class="text-muted fs-xs me-1">
							by <a class="product-meta fw-medium" href="#">Createx Std. </a>in
							<a class="product-meta fw-medium" href="#">Graphics</a>
						</div>
						<div class="star-rating">
							<i class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i> <i
								class="star-rating-icon ci-star-filled active"></i>
						</div>
					</div>
					<span>
					<a
						class="product-title fs-sm mb-2"
						style="text-decoration: none; color: black;"
						href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(5).getGoodId()%>">
							<%= ps.productName(list.get(5).getGoodId()) %>
					</a>
					</span>
					<div
						class="d-flex flex-wrap justify-content-between align-items-center">
						<div class="fs-sm me-2">
							<i class="ci-download text-muted me-1"></i>26<span
								class="fs-xs ms-1">Sales</span>
						</div>
						<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
							<%= list.get(5).getGoodPrice() %><small>원</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%} %>
		<!-- Product-->
		<% if(list.size()>=7) { %>
		<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-grid-gutter"
			id="product">
			<div class="card product-card-alt">
				<div class="product-thumb">
					<button class="btn-wishlist btn-sm" type="button">
						<i class="ci-heart"></i>
					</button>
					<div class="product-card-actions">
						<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							href="marketplace-single.html"><i class="ci-eye"></i></a>
						<button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							type="button">
							<i class="ci-cart"></i>
						</button>
					</div>
					<a class="product-thumb-overlay" href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(6).getGoodId()%>"></a><img
						src="<%=request.getContextPath()%>/views/resources/2_img/<%= list.get(6).getGoodId() %>.png" alt="Product">
				</div>
				<div class="card-body">
					<div
						class="d-flex flex-wrap justify-content-between align-items-start pb-2">
						<div class="text-muted fs-xs me-1">
							by <a class="product-meta fw-medium" href="#">pixels </a>in <a
								class="product-meta fw-medium" href="#">UI Design</a>
						</div>
						<div class="star-rating">
							<i class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i> <i
								class="star-rating-icon ci-star"></i>
						</div>
					</div>
					<span>
					<a
						class="product-title fs-sm mb-2"
						style="text-decoration: none; color: black;"
						href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(6).getGoodId()%>">
							<%= ps.productName(list.get(6).getGoodId()) %>
					</a>
					</span>
					<div
						class="d-flex flex-wrap justify-content-between align-items-center">
						<div class="fs-sm me-2">
							<i class="ci-download text-muted me-1"></i>36<span
								class="fs-xs ms-1">Sales</span>
						</div>
						<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
							<%= list.get(6).getGoodPrice() %><small>원</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%} %>
		<!-- Product-->
		<% if(list.size()>=8) { %>
		<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-grid-gutter"
			id="product">
			<div class="card product-card-alt">
				<div class="product-thumb">
					<button class="btn-wishlist btn-sm" type="button">
						<i class="ci-heart"></i>
					</button>
					<div class="product-card-actions">
						<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							href="marketplace-single.html"><i class="ci-eye"></i></a>
						<button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							type="button">
							<i class="ci-cart"></i>
						</button>
					</div>
					<a class="product-thumb-overlay" href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(7).getGoodId()%>"></a><img
						src="<%=request.getContextPath()%>/views/resources/2_img/<%= list.get(7).getGoodId() %>.png" alt="Product">
				</div>
				<div class="card-body">
					<div
						class="d-flex flex-wrap justify-content-between align-items-start pb-2">
						<div class="text-muted fs-xs me-1">
							by <a class="product-meta fw-medium" href="#">theDesigner </a>in
							<a class="product-meta fw-medium" href="#">Graphics</a>
						</div>
						<div class="star-rating">
							<i class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star"></i><i
								class="star-rating-icon ci-star"></i>
						</div>
					</div>
					<span>
					<a
						class="product-title fs-sm mb-2"
						style="text-decoration: none; color: black;"
						href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(7).getGoodId()%>">
							<%= ps.productName(list.get(7).getGoodId()) %>
					</a>
					</span>
					<div
						class="d-flex flex-wrap justify-content-between align-items-center">
						<div class="fs-sm me-2">
							<i class="ci-download text-muted me-1"></i>57<span
								class="fs-xs ms-1">Sales</span>
						</div>
						<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
							<%= list.get(7).getGoodPrice() %><small>원</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%} %>
		<!-- Product-->
		<% if(list.size()>=9) { %>
		<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-grid-gutter"
			id="product">
			<div class="card product-card-alt">
				<div class="product-thumb">
					<button class="btn-wishlist btn-sm" type="button">
						<i class="ci-heart"></i>
					</button>
					<div class="product-card-actions">
						<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							href="marketplace-single.html"><i class="ci-eye"></i></a>
						<button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							type="button">
							<i class="ci-cart"></i>
						</button>
					</div>
					<a class="product-thumb-overlay" href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(8).getGoodId()%>"></a><img
						src="<%=request.getContextPath()%>/views/resources/2_img/<%= list.get(8).getGoodId() %>.png" alt="Product">
				</div>
				<div class="card-body">
					<div
						class="d-flex flex-wrap justify-content-between align-items-start pb-2">
						<div class="text-muted fs-xs me-1">
							by <a class="product-meta fw-medium" href="#">Createx Std. </a>in
							<a class="product-meta fw-medium" href="#">Graphics</a>
						</div>
						<div class="star-rating">
							<i class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i> <i
								class="star-rating-icon ci-star-filled active"></i>
						</div>
					</div>
					<span onClick="singleProd()" style='cursor: pointer'>
					<a
						class="product-title fs-sm mb-2"
						style="text-decoration: none; color: black;"
						href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(8).getGoodId()%>">
							<%= ps.productName(list.get(8).getGoodId()) %>
					</a>
					</span>
					<div
						class="d-flex flex-wrap justify-content-between align-items-center">
						<div class="fs-sm me-2">
							<i class="ci-download text-muted me-1"></i>21<span
								class="fs-xs ms-1">Sales</span>
						</div>
						<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
							<%= list.get(8).getGoodPrice() %><small>원</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%} %>
		<!-- Product-->
		<% if(list.size()>=10) { %>
		<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-grid-gutter"
			id="product">
			<div class="card product-card-alt">
				<div class="product-thumb">
					<button class="btn-wishlist btn-sm" type="button">
						<i class="ci-heart"></i>
					</button>
					<div class="product-card-actions">
						<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							href="marketplace-single.html"><i class="ci-eye"></i></a>
						<button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							type="button">
							<i class="ci-cart"></i>
						</button>
					</div>
					<a class="product-thumb-overlay" href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(9).getGoodId()%>"></a><img
						src="<%=request.getContextPath()%>/views/resources/2_img/<%= list.get(9).getGoodId() %>.png" alt="Product">
				</div>
				<div class="card-body">
					<div
						class="d-flex flex-wrap justify-content-between align-items-start pb-2">
						<div class="text-muted fs-xs me-1">
							by <a class="product-meta fw-medium" href="#">Createx Std. </a>in
							<a class="product-meta fw-medium" href="#">UI Design</a>
						</div>
						<div class="star-rating">
							<i class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i> <i
								class="star-rating-icon ci-star"></i>
						</div>
					</div>
					<span onClick="singleProd()" style='cursor: pointer'>
					<a
						class="product-title fs-sm mb-2"
						style="text-decoration: none; color: black;"
						href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(9).getGoodId()%>">
							<%= ps.productName(list.get(9).getGoodId()) %>
					</a>
					</span>
					<div
						class="d-flex flex-wrap justify-content-between align-items-center">
						<div class="fs-sm me-2">
							<i class="ci-download text-muted me-1"></i>117<span
								class="fs-xs ms-1">Sales</span>
						</div>
						<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
							<%= list.get(9).getGoodPrice() %><small>원</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%} %>
		<!-- Product-->
		<% if(list.size()>=11) { %>
		<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-grid-gutter"
			id="product">
			<div class="card product-card-alt">
				<div class="product-thumb">
					<button class="btn-wishlist btn-sm" type="button">
						<i class="ci-heart"></i>
					</button>
					<div class="product-card-actions">
						<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							href="marketplace-single.html"><i class="ci-eye"></i></a>
						<button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							type="button">
							<i class="ci-cart"></i>
						</button>
					</div>
					<a class="product-thumb-overlay" href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(10).getGoodId()%>"></a><img
						src="<%=request.getContextPath()%>/views/resources/2_img/<%= list.get(10).getGoodId() %>.png" alt="Product">
				</div>
				<div class="card-body">
					<div
						class="d-flex flex-wrap justify-content-between align-items-start pb-2">
						<div class="text-muted fs-xs me-1">
							by <a class="product-meta fw-medium" href="#">pixels </a>in <a
								class="product-meta fw-medium" href="#">Graphics</a>
						</div>
						<div class="star-rating">
							<i class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-half active"></i><i
								class="star-rating-icon ci-star"></i>
						</div>
					</div>
					<span>
					<a
						class="product-title fs-sm mb-2"
						style="text-decoration: none; color: black;"
						href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(10).getGoodId()%>">
							<%= ps.productName(list.get(10).getGoodId()) %>
					</a>
					</span>
					<div
						class="d-flex flex-wrap justify-content-between align-items-center">
						<div class="fs-sm me-2">
							<i class="ci-download text-muted me-1"></i>94<span
								class="fs-xs ms-1">Sales</span>
						</div>
						<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
							<%= list.get(10).getGoodPrice() %><small>원</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%} %>
		<!-- Product-->
		<% if(list.size()>=12) { %>
		<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-grid-gutter"
			id="product">
			<div class="card product-card-alt">
				<div class="product-thumb">
					<button class="btn-wishlist btn-sm" type="button">
						<i class="ci-heart"></i>
					</button>
					<div class="product-card-actions">
						<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							href="marketplace-single.html"><i class="ci-eye"></i></a>
						<button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
							type="button">
							<i class="ci-cart"></i>
						</button>
					</div>
					<a class="product-thumb-overlay" href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(11).getGoodId()%>"></a><img
						src="<%=request.getContextPath()%>/views/resources/2_img/<%= list.get(11).getGoodId() %>.png" alt="Product">
				</div>
				<div class="card-body">
					<div
						class="d-flex flex-wrap justify-content-between align-items-start pb-2">
						<div class="text-muted fs-xs me-1">
							by <a class="product-meta fw-medium" href="#">pixels </a>in <a
								class="product-meta fw-medium" href="#">Graphics</a>
						</div>
						<div class="star-rating">
							<i class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i><i
								class="star-rating-icon ci-star-filled active"></i> <i
								class="star-rating-icon ci-star"></i>
						</div>
					</div>
					<span onClick="singleProd()" style='cursor: pointer'>
					<a
						class="product-title fs-sm mb-2"
						style="text-decoration: none; color: black;"
						href="<%=request.getContextPath()%>/singleProduct?goodId=<%=list.get(11).getGoodId()%>">
							<%= ps.productName(list.get(11).getGoodId()) %>
					</a>
					</span>
					<div
						class="d-flex flex-wrap justify-content-between align-items-center">
						<div class="fs-sm me-2">
							<i class="ci-download text-muted me-1"></i>122<span
								class="fs-xs ms-1">Sales</span>
						</div>
						<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
							<%= list.get(11).getGoodPrice() %><small>원</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%} %>
	</div>
	<hr class="my-3">

</div>

<%@ include file="../footer.jsp"%> 