<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
	#cart {text-align: right;}
	
		<!-- 제이쿼리 사용 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
		crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	
	<!-- 부트스트랩 아이콘 -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	
	<!-- 구글 글씨체 -->
	<style>
	@import
		url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=East+Sea+Dokdo&family=Gaegu:wght@700&family=Gowun+Batang:wght@700&display=swap')
		;
	
	* {
		font-family: 'Dongle', sans-serif;
		font-family: 'East Sea Dokdo', cursive;
		font-family: 'Gaegu', cursive;
		font-family: 'Gowun Batang', serif;
	}
	
	body {
		min-height: 100vh;
		background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
			to(#1d466c));
		background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
		background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
		background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
		background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
	}
	
	.input-form {
		max-width: 680px;
		margin-top: 80px;
		padding: 32px;
		background: #fff;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 10px;
		-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
	}
</style>
<%@ include file="../include/onclickEvent.jspf" %>
</head>
<body>
<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<form method="post">
				<p>${vo.category }</p>
				<div class="row">
					<div><img src="../img/${vo.reName }" alt="${vo.oriName }"></div>
					<div>${vo.product }
					${vo.price }원</div>
				</div>
				<table>
					<tbody>
						<tr>
							<td colspan="2">
								<img src="../img/${vo.reName }" alt="${vo.oriName }">
							</td>
						</tr>
						
						<tr>
							<th>가격</th>
							<td>${vo.price }원</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${vo.pId }</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea name="pIntroduce" rows="8" cols="50" title="제품소개">${vo.pIntroduce }</textarea>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								<c:if test="${vo.pId == id }">
									<input type="button" class="btn btn-outline-success btn-sm" value="수정" onclick="productEdit(this.form)">
									<input type="button" class="btn btn-outline-danger btn-sm" value="삭제" onclick="productEditDe(this.form)">
								</c:if>
									<input type="button" class="btn btn-outline-info btn-sm" value="목록" onclick="productList(this.form)">
							</td>
						</tr>
					</tfoot>
				</table>
				<div>
					<input type="hidden" name="nowPage" value="${nPage }">
				</div>
</form>
</div>
</div>
</div>
				
				
				<!--  -->
				<h4 class="mb-3">${vo.product }</h4>
				<div class="row">
					<div class="col-md-4 mb-3">
						<img src="../img/${vo.reName }" width="150px" height="150px">
					</div>
					<div class="col-md-8 mb-3">
						<span class="blue">${vo.category }</span> 
						<br><span class="gray bold italic">${vo.price }원</span><br>
						<i class="bi bi-hand-thumbs-up-fill red">작성자 ${vo.pId }</i>
					</div>
					<div class="col-md-8 mb-3">
						<input type="button" class="btn btn-success btn-sm btn-block" value="장바구니 담기" onclick="#">
					</div>
				</div>
				<textarea name="pIntroduce" rows="8" cols="50" title="제품소개">${vo.pIntroduce }</textarea><br>
				<c:if test="${vo.pId == id }">
					<input type="button" class="btn btn-outline-success btn-sm" value="수정" onclick="productEdit(this.form)">
					<input type="button" class="btn btn-outline-danger btn-sm" value="삭제" onclick="productEditDe(this.form)">
				</c:if>
					<input type="button" class="btn btn-outline-info btn-sm" value="목록" onclick="productList(this.form)">
				<div>
					<input type="hidden" name="nowPage" value="${nPage }">
				</div>
	<footer class="my-3 text-center text-small">
		<p class="mb-1">&copy; shoppingmall</p>
	</footer>
<%-- 이전
<div>
	<form method="post">
	<table>
		<caption>제품보기(상세페이지)</caption>
		<tbody>
			<tr>
				<th>카테고리</th>
				<td>${vo.category }</td>
				<td><input type="hidden" name="nowPage" value="${nPage }"></td>
			</tr>
			<tr>
				<th>제품명</th>
				<td>${vo.product }</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${vo.price }원</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${vo.pId }</td>
			</tr>
			<tr>
				<th>제품이미지</th>
				<td>
					<img src="../img/${vo.reName }" alt="${vo.oriName }">
				</td>
			</tr>
			<tr>
				<th>제품소개</th>
				<td>
					<textarea name="pIntroduce" rows="8" cols="50" title="제품소개">${vo.pIntroduce }</textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<c:if test="${vo.pId == id }">
						<input type="button" class="btn btn-outline-success btn-sm" value="수정" onclick="productEdit(this.form)">
						<input type="button" class="btn btn-outline-danger btn-sm" value="삭제" onclick="productEditDe(this.form)">
					</c:if>
						<input type="button" class="btn btn-outline-info btn-sm" value="목록" onclick="productList(this.form)">
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
</div>
<!--  -->
<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">${vo.product }</h4>
				<div class="row">
					<div class="col-md-4 mb-3">
						<img src="../img/${vo.reName }" width="150px" height="150px">
					</div>
					<div class="col-md-8 mb-3">
						<br> ${vo.product } <br>
					
						<span class="blue">${vo.product }</span> 
						<br><span class="gray bold italic"> 제품명</span> <br> 조회수 ${vo.product } <br> <i
							class="bi bi-hand-thumbs-up-fill red" id="good"></i> <span
							class="rec_count">${vo.product }</span> &nbsp;&nbsp; 
							<!--<i class="bi bi-hand-thumbs-down" id="bad"></i>  -->
					</div>
				</div>

				<div class="mb-3">${vo.product }</div>

 --%>
<%-- 

				<button class="btn btn-success btn-sm btn-block" type="button"
					onclick="location.href='controller?type=update&reviewIdx=${vo.reviewIdx }&cPage=${pvo.nowPage}'">
					수정</button>
				<button class="btn btn-danger btn-sm btn-block" type="button"
					onclick="review_delete(this.form)">
					삭제</button>
				<button class="btn btn-primary btn-sm btn-block" type="button"
					onclick="location.href='../reviewIndex.jsp'">목록보기</button>
 --%>
<script>
  
  /* 기본양식 */
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
</script>
</body>
</html>