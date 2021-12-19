<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- Page Title-->
<div class="bg-accent pt-4 pb-4">
	<div class="container pt-2 pb-3 pt-lg-3 pb-lg-4">
		<div class="d-lg-flex justify-content-between pb-3">
			<div class="order-lg-1 pe-lg-4 text-center text-lg-start">
				<h1 class="h3 text-light mb-0">점포별 조회</h1>
			</div>
		</div>
	</div>
	<select class="form-select form-select-sm me-2 ms-65"
		style="width: 10%; display: inline;">
		<option>전체</option>
		<option>서울시</option>
		<option>경기도</option>
	</select> <select class="form-select form-select-sm me-2 mb-5"
		style="width: 10%; display: inline;">
		<option>전체</option>
		<option>강남구</option>
		<option>송파구</option>
		<option>광진구</option>
		<option>강동구</option>
		<option>성동구</option>
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
				<i
					class="ci-search position-absolute top-50 start-0 translate-middle-y fs-md ms-3"></i>
				<input class="form-control border-0 shadow-none" type="text"
					placeholder="점포를 입력해주세요.">
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
								class="ci-flag me-2 opacity-60"></i>Newest</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="ci-rocket me-2 opacity-60"></i>Bestsellers</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="ci-loading me-2 opacity-60"></i>Updated</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="ci-arrow-down me-2 opacity-60"></i>Low Price</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="ci-arrow-up me-2 opacity-60"></i>High Price</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- Split section: Map + Contact form-->
	<div class="container-fluid px-0 my-sm-5" id="map">
		<div class="row g-0 ms-18">
			<!-- <div class="col-lg-4 iframe-full-height-wrap" style="min-height: 40rem;">
                    <iframe class="iframe-full-height" width="600" height="400" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d53357.14257194912!2d-73.07268695801845!3d40.78017062807504!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89e8483b8bffed93%3A0x53467ceb834b7397!2s396+Lillian+Blvd%2C+Holbrook%2C+NY+11741%2C+USA!5e0!3m2!1sen!2sua!4v1558703206875!5m2!1sen!2sua"></iframe>
                </div> -->
			<div class="col-lg-4 iframe-full-height-wrap" id="map_store"
				style="width: 400; height: 600px;"></div>

			<div class="col-lg-6 px-4 px-xl-5 py-5 border-top">
				<!-- <form class="needs-validation mb-3" novalidate> -->
				<div class="table-responsive fs-md mb-4">
					<table class="table table-hover mb-0">
						<thead>
							<tr>
								<th class="text-center fw-bold">매장명</th>
								<th class="text-center fw-bold">매장 정보</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="py-3 text-center pt-4-1"><a
									class="nav-link-style fw-medium fs-sm" href="#order-details"
									data-bs-toggle="modal">신세계백화점 강남점</a></td>
								<td class="py-3 text-center">서울 서초구 반포동 19-3<br>02-1588-1234
								</td>
							</tr>
							<tr>
								<td class="py-3 text-center pt-4-1"><a
									class="nav-link-style fw-medium fs-sm" href="#order-details"
									data-bs-toggle="modal">신세계백화점 강남점</a></td>
								<td class="py-3 text-center">서울 서초구 반포동 19-3<br>02-1588-1234
								</td>
							</tr>
							<tr>
								<td class="py-3 text-center pt-4-1"><a
									class="nav-link-style fw-medium fs-sm" href="#order-details"
									data-bs-toggle="modal">신세계백화점 강남점</a></td>
								<td class="py-3 text-center">서울 서초구 반포동 19-3<br>02-1588-1234
								</td>
							</tr>
							<tr>
								<td class="py-3 text-center pt-4-1"><a
									class="nav-link-style fw-medium fs-sm" href="#order-details"
									data-bs-toggle="modal">신세계백화점 강남점</a></td>
								<td class="py-3 text-center">서울 서초구 반포동 19-3<br>02-1588-1234
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- </form> -->
			</div>
		</div>
	</div>
</div>


		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4dfdb45703802754377902c434c5fb72&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map_store'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder
					.addressSearch(
							'서울 서초구 반포동 19-3',
							function(result, status) {

								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});

									// 인포윈도우로 장소에 대한 설명을 표시합니다
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : '<div style="width:150px;text-align:center;padding:6px 0;">신세계백화점 강남점</div>'
											});
									infowindow.open(map, marker);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
		</script>
		<%@ include file="../footer.jsp"%>