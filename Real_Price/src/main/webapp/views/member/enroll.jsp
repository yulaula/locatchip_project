<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="container py-4 py-lg-5 my-4">
	<div class="row">
		<div class="col-md-6 ms-lg-21">
			<div class="card border-0 shadow">
				<div class="card-body">
					<h2 class="h4 mb-3 text-center">회원가입</h2>
					<!-- <p class="text-center">
						<a class="nav-link d-inline fs-lg fw-bold" href="signup.html">일반
							회원</a> <span><a class="nav-link d-inline fs-lg fw-bold"
							href="signup.html">판매점 회원</a></span>
					</p> -->
					<hr class="mb-sm-3">
					<!-- <form class="needs-validation" novalidate>  -->
					<form class="needs-validation" name="memberEnrollForm"
						action="<%= request.getContextPath() %>/enroll" method="POST"
						novalidate>

						<div class="gx-4 gy-3">
							<div class="col-sm-12 mb-4">
								<label class="form-label ms-6" for="newId">아이디</label> <input
									class="form-control m-auto" name="memberId" id="newId"
									type="text" required /> <input id="checkDuplicate"
									value="중복검사" type="button" />
								<div class="invalid-feedback ms-6">아이디를 입력하세요!</div>
							</div>
							<div class="col-sm-12 mb-4">
								<label class="form-label ms-6" for="reg-password">비밀번호</label> <input
									class="form-control m-auto" type="password" name="memberPwd"
									id="reg-password" required />
								<div class="invalid-feedback ms-6">비밀번호를 입력하세요!</div>
							</div>
							<div class="col-sm-12 mb-4">
								<label class="form-label ms-6" for="reg-password-confirm">비밀번호
									확인</label> <input class="form-control m-auto" type="password"
									id="reg-password-confirm" required />
								<div class="invalid-feedback ms-6">비밀번호가 일치하지 않습니다!</div>
							</div>
							<div class="col-sm-12 mb-4">
								<label class="form-label ms-6" for="reg-fn">이름</label> <input
									class="form-control m-auto" type="text" id="reg-name" name="memberName" required />
								<div class="invalid-feedback ms-6">이름을 입력하세요!</div>
							</div>
							<div class="col-sm-12 mb-4">
								<label class="form-label ms-6" for="reg-phone">전화번호</label> <input
									class="form-control m-auto" type="tel" id="reg-phone" name="phone" required />
								<div class="invalid-feedback ms-6">전화번호를 입력하세요!</div>
							</div>
							<div class="col-sm-12 mb-4">
								<label class="form-label ms-6" for="reg-email">이메일</label> <input
									class="form-control m-auto" type="email" id="reg-email" name="email"
									required />
								<div class="invalid-feedback ms-6">이메일을 입력하세요!</div>
							</div>
							<div class="col-sm-12 mb-4">
								<label class="form-label ms-6" for="reg-address">주소</label> <input
									class="form-control m-auto" type="text" id="reg-address" name="address" required />
								<div class="invalid-feedback ms-6">주소를 입력하세요!</div>
							</div>

							<div class="col-12 text-center">
								<button class="btn btn-primary" id="enrollSubmit" type="submit">
									<i class="ci-user me-2 ms-n1"></i>회원가입
								</button>
							</div>

						</div>
					</form>
					<form name="checkIdForm">
						<input type="hidden" name="memberId">
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-6 pt-4 mt-3 mt-md-0"></div>
	</div>
</div>

<script>
	
	$("#checkDuplicate").click(()=>{
		let id = $("#newId").val().trim();
		if(id.length < 4){
			alert("아이디는 최소 4글자 입니다.");
			return;
		}

		let url = "<%=request.getContextPath()%>/checkId";
		let title = "duplicate";
		let status = "left=500px,top=100px,width=500px,height=300px";
		
		open("",title,status);
		
		checkIdForm.target = title;
		checkIdForm.action = url;
		checkIdForm.method = "post";
		checkIdForm.memberId.value = id;
		checkIdForm.submit();
	});
	
</script>


<%@ include file="../footer.jsp"%>