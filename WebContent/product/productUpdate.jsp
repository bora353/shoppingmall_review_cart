<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

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
<style>
	
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
	
	<!-- 구글 글씨체 -->
	@import
		url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=East+Sea+Dokdo&family=Gaegu:wght@700&family=Gowun+Batang:wght@700&display=swap')
		;
	
	* {
		font-family: 'Dongle', sans-serif;
		font-family: 'East Sea Dokdo', cursive;
		font-family: 'Gaegu', cursive;
		font-family: 'Gowun Batang', serif;
	}
	
	/*** 페이지 표시 영역 스타일(시작) ****/
	.paging {
		list-style: none;
	}
	
	.paging li {
		float: left;
		margin-right: 8px;
	}
	
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		/* border: 1px solid #00B3DC; */
		font-weight: bold;
		color: black;
	}
	
	.paging .disable {
		color: #aaa;
	}
	
	.paging .now {
		background-color: pink;
		border-radius: 50%;
		padding: 3px 7px;
	}
	
	a {
		text-decoration-line: none;
		color: black;
	}
	
	h3 {
		text-align: center;
	}
	
	.red {
		color: tomato;
	}
	.blue {
		color: blue;
	}
	.pink {
		color: #FFAEBC;
	}
	.gray {
		color: gray;
	}
	.italic{
		font-style:italic;
	}
	.bold{
		font-weight: bold;
	}
	.right{
	margin-left:auto;
		float:right;
		position: absolute;
		top: 0;
		right: 0;
		padding: 20px;
	}
	.container-fluid{
		padding : 10px;
	}
	.navbar{
		 margin-bottom : 35px; 
	}
	
	/* footer */
   .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
</style>
<%@ include file="../include/onclickEvent.jspf" %>
</head>
<body>
<%@ include file="../include/header.html" %>
<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<form method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="inputdefault">제품명</label>
					<input type="text" class="form-control" id="inputdefault" name="product" title="제품명" value="${vo.product }">
					<div class="col-sm-10">
						<label class="control-label col-sm-2" for="pwd">제품명</label>
						<input type="text" class="form-control" name="product" title="제품명" value="${vo.product }">
			        </div>
			    </div>
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
						<input type="file" name="filename" title="제품이미지">
						<input type="button" class="btn btn-success btn-sm btn-block" value="장바구니 담기" onclick="#">
					</div>
				</div>
				<div class="form-group">
					<label for="comment">제품소개:</label>
					<textarea class="form-control" rows="5" name="pIntroduce" title="제품소개">${vo.pIntroduce }</textarea>
				</div>
				<div>
					<input type="hidden" name="nowPage" value="${nPage }">
					<input type="hidden" name="pIdx" value="${vo.pIdx }">
				</div>
				<c:if test="${vo.pId == id }">
					<input type="button" class="btn btn-outline-success btn-sm" value="수정" onclick="productEdit(this.form)">
					<input type="button" class="btn btn-outline-danger btn-sm" value="삭제" onclick="productEditDe(this.form)">
				</c:if>
					<input type="button" class="btn btn-outline-info btn-sm" value="목록" onclick="productList(this.form)">
			</form>
		</div>
	</div>
</div>
<!--  -->
<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<form method="post">
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
			</form>
		</div>
	</div>
</div>
<!--  -->
<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<form method="post" enctype="multipart/form-data">
				<h4><input type="text" name="product" title="제품명" value="${vo.product }"></h4>
				<div class="row">
					<div class="col-md-4 mb-3">
						<img src="../img/${vo.reName }" width="150px" height="150px">
						<input type="file" name="filename" title="제품이미지">
					</div>
					<div class="col-md-8 mb-3">
						<span>
							<select name="category" title="카테고리">
							<option selected disabled value="값없음">::카테고리</option>
								<option value="${vo.category }" selected>${vo.category }</option>
								<option value="가전">가전</option>
								<option value="주방">주방</option>
								<option value="식품">식품</option>
								<option value="패션">패션</option>
								<option value="문구">문구</option>
							</select>
						</span><br>
						
						<span><input type="text" name="price" title="가격" value="${vo.price }">원</span><br>
						<i>작성자 ${vo.pId }</i>
					</div>
				</div>
				<textarea name="pIntroduce" rows="8" cols="50" title="제품소개">${vo.pIntroduce }</textarea><br>
				<input type="button" class="btn btn-outline-success btn-sm" value="수정" onclick="productUpdate(this.form)">
				<input type="reset" class="btn btn-outline-warning btn-sm" value="초기화">
				<input type="button" class="btn btn-outline-info btn-sm" value="목록" onclick="productList(this.form)">
				<!-- <input type="button" class="btn btn-outline-info btn-sm" value="목록" onclick="history.back(-3)"> -->
				<%-- 
				<c:if test="${vo.pId == id }">
					<input type="button" class="btn btn-outline-success btn-sm" value="수정" onclick="productEdit(this.form)">
					<input type="button" class="btn btn-outline-danger btn-sm" value="삭제" onclick="productEditDe(this.form)">
				</c:if>
					<input type="button" class="btn btn-outline-info btn-sm" value="목록" onclick="productList(this.form)"> --%>
				<div>
					<input type="hidden" name="nowPage" value="${nPage }">
					<input type="hidden" name="pIdx" value="${vo.pIdx }">
				</div>
			</form>
		</div>
	</div>
	<footer class="my-3 text-center text-small">
		<p class="mb-1">&copy; shoppingmall</p>
	</footer>
</div>
<%-- 이전
<div>
	<form method="post" enctype="multipart/form-data">
	<table>
		<caption>제품 정보수정</caption>
		<tbody>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="category" title="카테고리">
					<option selected disabled value="값없음">::카테고리</option>
						<option value="${vo.category }" selected>${vo.category }</option>
						<option value="가전">가전</option>
						<option value="주방">주방</option>
						<option value="식품">식품</option>
						<option value="패션">패션</option>
						<option value="문구">문구</option>
					</select>
				</td>
				<td><input type="hidden" name="nowPage" value="${nPage }"></td>
			</tr>
			<tr>
				<th>제품명</th>
				<td>
					<input type="text" name="product" title="제품명" value="${vo.product }">
					<input type="hidden" name="pIdx" value="${vo.pIdx }">
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price" title="가격" value="${vo.price }">원</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="pId" title="작성자" value="${vo.pId }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>제품이미지</th>
				<td>
					<input type="file" name="filename" title="제품이미지">
				</td>
			</tr>
			<tr>
				<th>제품소개</th>
				<td>
					<textarea name="pIntroduce" rows="8" cols="50" title="제품소개">${vo.pIntroduce }
					</textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" class="btn btn-outline-success btn-sm" value="수정" onclick="productUpdate(this.form)">
					<input type="reset" value="초기화">
					<input type="button" class="btn btn-outline-info btn-sm" value="목록" onclick="productList(this.form)">
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
</div>
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
<%@ include file="../include/footer.html" %>
</body>
</html>