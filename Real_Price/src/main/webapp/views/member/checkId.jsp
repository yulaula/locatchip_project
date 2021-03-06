<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	boolean duplicated = (boolean)request.getAttribute("duplicated");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div#checkId-container {
		text-align:center;
		padding-top:50px;
	}
	
	span#duplicated {
		color:red;
		font-weight:bolder;
	}
</style>
</head>
<body>
	<div id="checkId-container">
		<% if(duplicated) { %>
			[<span id="duplicated"><%= request.getParameter("memberId") %></span>]는 사용중 입니다.
			
			<br><br>
			<!-- 아이디 재입력창 구성 -->
			<form action="<%= request.getContextPath() %>/checkId" method="post">
				<input type="text" name="memberId" id="newId" placeholder="아이디(4글자이상)" required>
				<input type="submit" id="checkDuplicate" onclick="return validate();" value="중복검사" >
			</form>		
		<% } else { %>
			[<span><%= request.getParameter("memberId") %></span>]는 사용 가능합니다.
		
			<br><br>
			
			<input type="button" onclick="setMemberId()" value="닫기">		
		<% } %>
	</div>
	<script>
		function validate(){
			let id = document.getElementById("newId").value;
			
			if(id.trim().length < 4){
				alert("아이디는 4글자 이상 입력하세요!");
				document.getElementById("memberId").focus();
				return false;
			}
		}
		
		function setMemberId() {
			// 입력 된 id를 부모창에 대입
			const id = "<%= request.getParameter("memberId") %>";
			
			opener.memberEnrollForm.memberId.value = id;
			opener.memberEnrollForm.memberPwd.focus();
			
			// 팝업창 닫아주기
			close();			
		}	
		
	</script>	
</body>
</html>