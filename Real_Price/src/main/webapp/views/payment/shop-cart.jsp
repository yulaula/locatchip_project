<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="price.model.vo.Price"%>
<%@ page import="basket.model.vo.Basket"%>
<%@ page import="basket.model.vo.BasketDetail"%>
<%@ page import="basket.model.service.BasketService"%>
<%@ page import="price.model.service.PriceService"%>
<%@ include file="../header.jsp"%>

<%
PriceService ps = new PriceService();
List<Price> priceList = (ArrayList<Price>) request.getAttribute("priceList");
BasketService bs = new BasketService();
Basket basket = bs.findBasketByMemberId(loginMember.getMemberId());
List<BasketDetail> basketDetailList = (ArrayList<BasketDetail>) request.getAttribute("basketDetailList");
System.out.println(basketList.get(0).getBasketIndex());
System.out.println(basketDetailList.get(0).getBdIndex());
%>

<%@ include file="../header.jsp"%>

<!-- Page Title-->
<div class="page-title-overlap bg-purple pt-4">
	<div class="container d-lg-flex justify-content-between py-2 py-lg-3">
		<div class="order-lg-1 pe-lg-4 text-center text-lg-start">
			<h1 class="h3 text-light mb-0">장바구니</h1>
		</div>
	</div>
</div>
<div class="container pb-5 mb-2 mb-md-4">
	<div class="row">
		<!-- List of items-->
		<section class="col-lg-8">
			<div
				class="d-flex justify-content-between align-items-center pt-3 pb-4 pb-sm-5 mt-1">
				<h2 class="h6 text-light mb-0"></h2>
				<a class="btn btn-outline-primary btn-sm ps-2"
					href="marketplace-category.html"><i class="ci-arrow-left me-2"></i>계속
					쇼핑하기</a>
			</div>
			<%
			for (int i = 0; i < basketDetailList.size(); i++) {
			%>
			<!-- Item-->
			<div
				class="d-sm-flex justify-content-between align-items-center my-2 pb-3 border-bottom">
				<div
					class="d-block d-sm-flex align-items-center text-center text-sm-start">
					<a class="d-inline-block flex-shrink-0 mx-auto me-sm-4"
						href="shop-single-v1.html"><img
						src="<%=request.getContextPath()%>/views/resources/2_img/<%=basketDetailList.get(0).getGoodId()%>.png"
						width="160" alt="Product"></a>
					<div class="pt-2">
						<h3 class="product-title fs-base mb-2">
							<a href="<!--해당 상품 페이지로....-->"><%= ps.productName(basketDetailList.get(i).getGoodId()) %></a>
						</h3>
						<div class="fs-sm">
							<i class="ci-home opacity-60 me-2"></i><%= //shop리턴하는 것 %>
						</div>
						<div class="fs-lg text-accent pt-2">
							<%= bs.getBasketDetailPrice(basketDetailList.get(i).getBdIndex()) %>
							<small>원</small>
						</div>
					</div>
				</div>
				<div
					class="pt-2 pt-sm-0 ps-sm-3 mx-auto mx-sm-0 text-center text-sm-start"
					style="max-width: 9rem;">
					<label class="form-label" for="quantity1">수량</label> <input
						class="form-control" type="number" id="quantity1" name="quantity1" min="1"
						value="1">
					<button class="btn btn-link px-0 text-danger" type="button" 
					onclick="location.href=''"> <!-- 수량변경 버튼 -->
						<i class="ci-check-circle me-2"></i><span class="fs-sm">수정</span>
					</button>

					<button class="btn btn-link px-0 text-danger" type="button">
						<i class="ci-close-circle me-2"></i><span class="fs-sm">삭제</span>
					</button>
				</div>
			</div>
			<%
			}
			%>
		</section>
		<!-- Sidebar-->
		<aside class="col-lg-4 pt-4 pt-lg-0 ps-xl-5">
			<div class="bg-white rounded-3 shadow-lg p-4">
				<div class="py-2 px-xl-2">
					<div class="text-center mb-4 pb-3 border-bottom">
						<h2 class="h6 mb-3 pb-1">주문 금액</h2>
						<h3 class="fw-normal">
							<%= bs.getBasketTotalPrice(loginMember.getId()) %><small>원</small>
						</h3>
					</div>
					<div class="mb-3 mb-4">
						<label class="form-label mb-3" for="order-comments"><span
							class="badge bg-info fs-xs me-2">픽업 요청사항</span><span
							class="fw-medium">메세지를 입력해주세요.</span></label>
						<textarea class="form-control" rows="6" name="input_comment" id="order-comments"></textarea>
					</div>
				</div>
				<a class="btn btn-primary btn-shadow d-block w-100 mt-4"
					href="<%= request.getContextPath()%>/paymentView?basketIndex=<%=basket.getBasketIndex()%>"><i class="ci-card fs-lg me-2"></i>결제하기</a>
			</div>
		</aside>
	</div>
</div>

<%@ include file="../footer.jsp"%>