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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

		<select class="form-select form-select-sm me-2 ms-65" name="bigCategory" id="bigCategory" onchange="changes1Step(this.value);"
		style="width: 10%; display: inline;">
		<option value="">전체</option>
		<option value="030100000">농축수산물</option>
		<option value="030101000">정육·난류</option>
		<option value="030102000">채소</option>
		<option value="030103000">생선류</option>
		<option value="030200000">가공식품</option>
		<option value="030201000">곡물가공품</option>
		<option value="030202000">수산가공품</option>
		<option value="030203000">낙농·축산가공품</option>
		<option value="030204000">조미료·장류·식용유</option>
		<option value="030205000">과자·빙과류</option>
		<option value="030206000">차·음료·주류</option>
		<option value="030300000">일반공산품</option>
		<option value="030301000">이미용품</option>
		<option value="030302000">세탁·주방·가사용품</option>
		<option value="030303000">의류·신변용품</option>
		<option value="030304000">의약외품</option>
	</select> 
	
	<select class="form-select form-select-sm me-2" name="smallCategory" id="smallCategory"
		style="width: 10%; display: inline;">
		<option value="">전체</option>
	</select>
	<div class="d-inline justify-content-between align-items-center mb-4" name = "searchCategory" id = "searchCategory">
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
<script>
function changes1Step(){
	
	var select = document.getElementById("bigCategory");
    var value = select.options[select.selectedIndex].value;

	var num = null;
	var vnum = null;
	
    if(value == "") { // 대분류 value에 따른 소분류 array
        num = ["전체"];
        vnum = [""];
    }else if(value == "030100000") {
        num = ["전체","정육·난류","채소","생선류"];
        vnum = ["03010","030101","030102","030103"];
    }else if(value == "030101000") {
        num = ["전체","계란","쇠고기","닭고기","돼지고기"];
        vnum = ["030101","030101001","030101002","030101003","030101004"];
    }else if(value == "030102000") {
        num = ["전체","배추","양파","무","포기김치","콩나물","단무지","시금치","당근","감자","고구마","버섯","오이","풋고추","호박","대파","마늘","깻잎","상추","생강","양배추","쪽파","가지"];
        vnum = ["030102","030102001","030102002","030102003","030102004","030102005","030102006","030102007","030102008","030102009","030102010","030102011","030102012","030102013","030102014","030102015","030102016","030102017","030102018","030102019","030102020","030102021","030102022"];
    }else if(value == "030103000") {
        num = ["전체","갈치","참조기","고등어","오징어","삼치"];
        vnum = ["030103","030103001","030103002","030103003","030103004","030103005"];
    }else if(value == "030200000") {
        num = ["전체","곡물가공품","수산가공품","낙농·축산가공품","조미료·장류·식용유","과자·빙과류","차·음료·주류"];
        vnum = ["03020","030201","030202","030203","030204","030205","030206"];
    }else if(value == "030201000") {
        num = ["전체","빵","즉석국","즉석덮밥","냉동만두","밀가루","두부","국수","씨리얼","라면","부침가루","식빵","즉석밥","당면","즉석우동","초밥류","스프","즉석죽","견과류","떡국떡","만두피","컵라면","컵밥","탕"];
        vnum = ["030201","030201001","030201002","030201004","030201005","030201007","030201008","030201009","030201010","030201011","030201012","030201013","030201014","030201015","030201017","030201018","030201019","030201020","030201021","030201022","03020100023","030201024","030201025","030201026"];
    }else if(value == "030202000") {
        num = ["전체","김밥김","어묵","맛살","참치캔","맛김","생선통조림","오징어채"];
        vnum = ["030202","030202001","030202002","030202003","030202004","030202005","030202006","030202007"];
    }else if(value == "030103000") {
        num = ["전체","버터","마가린","소시지","햄류","우유","분유","치즈","발효유"];
        vnum = ["030103","030103001","030103002","030103003","030103004","030103005","030103006","030103007","030103008"];
    }else if(value == "030104000") {
        num = ["전체","식초","벌꿀","과일통조림","참기름","식용유","소금","설탕","혼합조미료","고추장","된장","간장","마요네즈","케찹","카레","딸기잼","쌈장","굴소스","멸치액젓"];
        vnum = ["030104","030104001","030104002","030104003","030104004","030104005","030104006","030104007","030104008","030104009","030104010","030104011","030104012","030104013","030104014","030104015","030104016","030104017","030104018"];
    }else if(value == "030205000") {
        num = ["전체","캔디","크래커","감자칩","새우깡","초코파이","초콜릿","껌","아이스크림","빙과류","모나카류아이스크림","에너지바","초코바"];
        vnum = ["030205","030205001","030205002","030205003","030205004","030205005","030205006","030205007","030205008","030205009","030205010","030205011","030205012"];
    }else if(value == "030206000") {
        num = ["전체","비타민음료","캔커피","커피믹스","녹차류","콜라","사이다","생수","과일주스","두유","맥주","소주","차,음료","생수(묶음)","막걸리","식혜","이온음료","컵커피","에너지음료","탄산수"];
        vnum = ["030206","030206001","030206002","030206003","030206004","030206005","030206006","030206007","030206008","030206011","030206012","030206013","030206014","030206015","030206016","030206018","0030206019","030206020","030206021","030206022"];
    }else if(value == "030300000") {
        num = ["전체","이미용품","세탁·주방·가사용품","의류·신변용품","의약외품"];
        vnum = ["03030","030301","030302","030303","030304"];
    }else if(value == "030301000") {
        num = ["전체","베이비로션","바디워시","두루마리화장지","세면용비누","치약","일반샴푸","일반린스","종이기저귀","생리대","핸드로션","일반면도날","물휴지","썬크림","염색약","손세정제","곽티슈","립케어","칫솔","클렌징폼"];
        vnum = ["030301","030301001","030301002","030301004","030301006","030301007","030301010","030301011","030301012","030301013","030301016","030301017","030301018","030301019","030301020","030301021","030301022","030301023","030301024","030301025"];
    }else if(value == "030302000") {
        num = ["전체","건전지","위생백","섬유탈취제","섬유유연제","주방세제","키친타월","고무장갑","랩","호일","세정제","습기제거제","살균소독제","표백제","부탄까스","살충제","세탁세제(가루형)","세탁세제(액체형)"];
        vnum = ["030302","030302001","030302002","030302003","030302005","030302006","030302007","030302008","030302009","030302010","030302011","030302012","030302013","030302014","030302015","030302016","030302017","030302018"];
    }else if(value == "030303000") {
        num = ["전체"];
        vnum = ["030303000"];
    }else if(value == "030304000") {
        num = ["전체","소화제","피로회복제","구강청정제"];
        vnum = ["030304","030304001","030304002","030304009"];
    }

  
    var selectObj = document.getElementById("smallCategory"); 
    if ( selectObj == null ) return; // 객체가 존재하지 않으면 취소
    selectObj.options.length = 0; // 길이를 0으로 하면 초기화

 
    $('#smallCategory').empty(); // 소분류 카테고리를 비움


    
    for(var count = 0; count < num.length; count++){ // 만든 num과 vnum 중 선택된 대분류 value에 해당하는 것을 소분류 select박스에 삽입                 
        var option = $("<option value='"+vnum[count]+"'>"+num[count]+"</option>");
        $('#smallCategory').append(option);
    }
    
    $("#searchCategory").click(()=>{
		let code = $("#smallCategory").val().trim();

	
		let url = '<%=request.getContextPath()%>/searchByCategory?categoryCode=' + code;		
		$("a").attr("href", url);
		
	});
}

</script>

<%@ include file="../footer.jsp"%>