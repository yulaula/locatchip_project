<%@page import="price.model.service.PriceService"%>
<%@page import="basket.model.vo.Basket"%>
<%@page import="basket.model.service.BasketService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="basket.model.vo.BasketDetail"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<%
 	PriceService ps = new PriceService();
	BasketService bs = new BasketService();
	List<BasketDetail> basketList = (List<BasketDetail>)request.getAttribute("basketList");
	Basket basket = (Basket)bs.getBasketDetailByNo(basketList.get(0).getBasketIndex());
	
%>

<!-- Page Title-->
<div class="page-title-overlap bg-purple pt-4">
	<div class="container d-lg-flex justify-content-between py-2 py-lg-3">
		<div class="order-lg-1 pe-lg-4 text-center text-lg-start">
			<h1 class="h3 text-light mb-0">카드 결제</h1>
		</div>
	</div>
</div>
<div class="container pb-5 mb-2 mb-md-4">
	<div class="row">
		<section class="col-lg-8">
			<!-- Steps-->
			<div class="steps steps-light pt-2 pb-3 mb-5">
				<a class="step-item active" href="shop-cart.jsp">
					<div class="step-progress">
						<span class="step-count">1</span>
					</div>
					<div class="step-label">
						<i class="ci-cart"></i>장바구니
					</div>
				</a> <a class="step-item active current" href="card.jsp">
					<div class="step-progress">
						<span class="step-count">2</span>
					</div>
					<div class="step-label">
						<i class="ci-card"></i>결제
					</div>
				</a>
				<a class="step-item" href="">
					<div class="step-progress">
						<span class="step-count">3</span>
					</div>
					<div class="step-label">
						<i class="ci-check-circle"></i>후기
					</div>
				</a>
			</div>
			<!-- Payment methods accordion-->
			<div class="accordion mb-2" id="payment-method">
				<div class="accordion-item">
					<h3 class="accordion-header">
						<a class="accordion-button" href="#card" data-bs-toggle="collapse"><i
							class="ci-card fs-lg me-2 mt-n1 align-middle"></i>카드 정보</a>
					</h3>
					<div class="accordion-collapse collapse show" id="card"
						data-bs-parent="#payment-method">
						<div class="accordion-body">
							<p class="fs-sm">
								&nbsp;&nbsp;<img class="d-inline-block align-middle"
									src="<%=request.getContextPath()%>/views/resources/img/cards.png" width="187" alt="Cerdit Cards">
							</p>
							<div class="credit-card-wrapper"></div>
							<form class="credit-card-form row">
								<div class="mb-3 col-sm-6">
									<input class="form-control m-auto" type="text" name="cardNumber"
										placeholder="카드 번호" required>
								</div>
								<div class="mb-3 col-sm-3">
									<input class="form-control" type="text" name="expiry"
										placeholder="MM/YY" required>
								</div>
								<div class="mb-3 col-sm-3">
									<input class="form-control" type="text" name="cvc"
										placeholder="CVC" required>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- Navigation (desktop)-->
			<div class="d-none d-lg-flex pt-4">
				<div class="w-50 pe-3">
					<a class="btn btn-secondary d-block w-100"
						href=""><i
						class="ci-arrow-left mt-sm-0 me-1"></i><span
						class="d-none d-sm-inline">뒤로가기</span><span
						class="d-inline d-sm-none"></span></a>
				</div>
				<div class="w-50 ps-2">
					<a class="btn btn-primary d-block w-100"
						href="<%= request.getContextPath()%>/paymentComplete?basketIndex=<%=basket.getBasketIndex()%>"><span class="d-none d-sm-inline">결제완료</span><span
						class="d-inline d-sm-none"></span><i
						class="ci-arrow-right mt-sm-0 ms-1"></i></a>
				</div>
			</div>
		</section>
		<!-- Sidebar-->
		<aside class="col-lg-4 pt-4 pt-lg-0 ps-xl-5">
			<div class="bg-white rounded-3 shadow-lg p-4 ms-lg-auto">
				<div class="py-2 px-xl-2">
					<div class="widget mb-3">
						<h2 class="widget-title text-center">픽업 상품</h2>
						<% for(int i = 0; i < basketList.size(); i++) { %>
						<!-- item start -->
						<div class="d-flex align-items-center pb-2 border-bottom">
							<a class="d-block flex-shrink-0" href="shop-single-v1.html"><img
								src="<%=request.getContextPath()%>/views/resources/02_img/<%=basketList.get(i).getGoodId()%>.png" width="64" alt="Product"></a>
							<div class="ps-2">
								<h6 class="widget-product-title">
									<a href="shop-single-v1.html"><%=ps.productName(basketList.get(i).getGoodId()) %></a>
								</h6>
								<div class="widget-product-meta">
									<span class="text-accent me-2"><%=basketList.get(i).getGoodPrice() %><small>원</small></span><span
										class="text-muted">x <%=basketList.get(i).getQuantity() %></span>
								</div>
							</div>
						</div>
						<!-- item end -->			
						<% } %>
									
					</div>

					<h3 class="fw-normal text-center my-4">
						<%=basket.getTotalPrice() %><small>원</small>
					</h3>
				</div>
			</div>
		</aside>
	</div>
</div>

<%@ include file="../footer.jsp"%>