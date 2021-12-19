<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- Used for marketplace templates with filters on top-->
<div class="bg-accent pt-4 pb-7">
	<div class="container pt-2 pb-3 pt-lg-3 pb-lg-4">
		<div class="d-lg-flex justify-content-between pb-3">
			<div class="order-lg-1 pe-lg-4 text-center text-lg-start">
				<h1 class="h3 text-light mb-0">상품 조회 - 거리</h1>
			</div>
		</div>
		<div class="d-inline justify-content-between align-items-center mb-4"
		style="float: right;" >
		<a class="btn btn-outline-primary btn-sm px-5 py-2-1" href="">검색</a>
		</div>
	</div>

	
</div>
<div class="container pb-5 mb-2 mb-md-4">
	<!-- Toolbar-->
	<div class="bg-light shadow-lg rounded-3 mt-n5 mb-4">
		<div class="d-flex align-items-center ps-2">
			<!-- Search-->
			<div class="input-group">
				<i
					class="ci-search position-absolute top-50 start-0 translate-middle-y fs-md ms-3"></i>
				<input class="form-control border-0 shadow-none" type="text"
					placeholder="상품을 입력해주세요.">
			</div>
			<!-- Sort-->
			<div class="d-flex align-items-center">
				<div class="dropdown py-4 border-start">
					<a class="nav-link-style fs-md fw-medium dropdown-toggle p-4"
						href="#" data-bs-toggle="dropdown"><span
						class="d-inline-block py-1"><i
							class="ci-thumb-up align-middle opacity-60 mt-n1 me-2"></i>거리순</span></a>
					<!-- <ul class="dropdown-menu dropdown-menu-end">
						<li><a class="dropdown-item" href="#"><i
								class="ci-arrow-down me-2 opacity-60"></i>낮은가격순</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="ci-arrow-up me-2 opacity-60"></i>높은가격순</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="ci-star me-2 opacity-60"></i>판매순</a></li>
					</ul>
					 -->
				</div>
			</div>
		</div>
	</div>
	<!-- Products grid-->
	<!--  Map 시작 -->


	<div class="container-fluid px-0 my-sm-5" id="map">
		<div class="row g-0">
			<!-- <div class="col-lg-4 iframe-full-height-wrap" style="min-height: 40rem;">
                    <iframe class="iframe-full-height" width="600" height="400" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d53357.14257194912!2d-73.07268695801845!3d40.78017062807504!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89e8483b8bffed93%3A0x53467ceb834b7397!2s396+Lillian+Blvd%2C+Holbrook%2C+NY+11741%2C+USA!5e0!3m2!1sen!2sua!4v1558703206875!5m2!1sen!2sua"></iframe>
                </div> -->
			<!-- MAP -->
			<div class="row col-lg-5">
				<div class="iframe-full-height-wrap" id="map_store"
					style="width: 500; height: 600px;"></div>
				<div id="clickLatlng"></div>
			</div>

			<div class="col-lg-7 px-4 px-xl-5 py-5 border-top">
				<!--Product-->
				<div class="col-lg-3 px-2 mb-grid-gutter float-start" style="width: 30%;">
					<div class="card product-card-alt">
						<div class="product-thumb">
							<div class="product-card-actions">
								<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
									href="marketplace-single.html"><i class="ci-eye"></i></a>
								<!-- <button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
									type="button">
									<i class="ci-cart"></i>
								</button> -->
							</div>
							<a class="product-thumb-overlay" href="marketplace-single.html"></a><img
								src="<%=request.getContextPath()%>/views/resources/2_img/머거본꿀땅콩.gif"
								alt="Product">
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
							<h3 class="product-title fs-sm mb-2">
								<a href="marketplace-single.html">머거본 꿀땅콩(135g)</a>
							</h3>
							<div
								class="d-flex flex-wrap justify-content-between align-items-center">
								<div class="fs-sm me-2">
									<i class="ci-store text-muted me-1"></i>이마트 역삼점
								</div>
								<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
									2,500<small>원</small>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--Product-->
				<div class="col-lg-3 px-2 mb-grid-gutter float-start" style="width: 30%;">
					<div class="card product-card-alt">
						<div class="product-thumb">
							<div class="product-card-actions">
								<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
									href="marketplace-single.html"><i class="ci-eye"></i></a>
								<!-- <button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
									type="button">
									<i class="ci-cart"></i>
								</button> -->
							</div>
							<a class="product-thumb-overlay" href="marketplace-single.html"></a><img
								src="<%=request.getContextPath()%>/views/resources/2_img/머거본꿀땅콩.gif"
								alt="Product">
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
							<h3 class="product-title fs-sm mb-2">
								<a href="marketplace-single.html">머거본 꿀땅콩(135g)</a>
							</h3>
							<div
								class="d-flex flex-wrap justify-content-between align-items-center">
								<div class="fs-sm me-2">
									<i class="ci-store text-muted me-1"></i>이마트 역삼점
								</div>
								<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
									2,500<small>원</small>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!--Product-->
				<div class="col-lg-3 px-2 mb-grid-gutter float-start" style="width: 30%;">
					<div class="card product-card-alt">
						<div class="product-thumb">
							<div class="product-card-actions">
								<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
									href="marketplace-single.html"><i class="ci-eye"></i></a>
								<!-- <button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
									type="button">
									<i class="ci-cart"></i>
								</button> -->
							</div>
							<a class="product-thumb-overlay" href="marketplace-single.html"></a><img
								src="<%=request.getContextPath()%>/views/resources/2_img/머거본꿀땅콩.gif"
								alt="Product">
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
							<h3 class="product-title fs-sm mb-2">
								<a href="marketplace-single.html">머거본 꿀땅콩(135g)</a>
							</h3>
							<div
								class="d-flex flex-wrap justify-content-between align-items-center">
								<div class="fs-sm me-2">
									<i class="ci-store text-muted me-1"></i>이마트 역삼점
								</div>
								<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
									2,500<small>원</small>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!--Product-->
				<div class="col-lg-3 px-2 mb-grid-gutter float-start" style="width: 30%;">
					<div class="card product-card-alt">
						<div class="product-thumb">
							<div class="product-card-actions">
								<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
									href="marketplace-single.html"><i class="ci-eye"></i></a>
								<!-- <button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
									type="button">
									<i class="ci-cart"></i>
								</button> -->
							</div>
							<a class="product-thumb-overlay" href="marketplace-single.html"></a><img
								src="<%=request.getContextPath()%>/views/resources/2_img/머거본꿀땅콩.gif"
								alt="Product">
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
							<h3 class="product-title fs-sm mb-2">
								<a href="marketplace-single.html">머거본 꿀땅콩(135g)</a>
							</h3>
							<div
								class="d-flex flex-wrap justify-content-between align-items-center">
								<div class="fs-sm me-2">
									<i class="ci-store text-muted me-1"></i>이마트 역삼점
								</div>
								<div class="bg-faded-accent text-accent rounded-1 py-1 px-2">
									2,500<small>원</small>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- </form> -->
			</div>
		</div>
	</div>
</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4dfdb45703802754377902c434c5fb72"></script>
	<script>
		var mapContainer = document.getElementById('map_store'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566842222592236,
					126.97865225368048), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다 
			position : map.getCenter()
		});
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

			// 클릭한 위도, 경도 정보를 가져옵니다 
			var latlng = mouseEvent.latLng;

			// 마커 위치를 클릭한 위치로 옮깁니다
			marker.setPosition(latlng);

			var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
			message += '경도는 ' + latlng.getLng() + ' 입니다';

			var resultDiv = document.getElementById('clickLatlng');
			resultDiv.innerHTML = message;

		});
	</script>

	<%@ include file="../footer.jsp"%>