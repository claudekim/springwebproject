<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="/resources/js/upload.js" type="text/javascript"></script>
<link rel="stylesheet" href="/resources/style/main.css" />
<title>Welcome to TEAM</title>
</head>
<body>
	<div class="container">

		<div class="row containerBig">
			<div class="col-sm-offset-1 col-sm-10 col-xs-12">
				<!--기본틀 메뉴네비 -->
				<jsp:include page="../main/header.jsp"/>
				<div class="row returnCatagory">
					<div class="col-sm-offset-1 col-sm-5 col-xs-6">
						<a href="#" onclick="history.back()"> ◀ 이전돌아가기 </a>
					</div>
				</div>
				<br>
				<!-- 상세이미지랑 수량 장바구니등등  -->
				<div class="row detailList">
					<div class="col-sm-offset-1 col-sm-5 col-xs-12">
					<form id="myForm"></form>
					
					<c:choose>
							<c:when test="${product.productImgPath=='이미지없음'}">
								<img src="/resources/ImgEx.png" class="img-responsive"
									style="max-width: 380px; max-height: 380px;" alt="${product.productName}">
							</c:when>
							<c:otherwise>
								<img src="/displayFile?fileName=${product.productImgPath}"
									class="img-responsive" style="max-width: 380px; max-height: 380px;" alt="${product.productName}">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-sm-5 col-xs-12">
						<table class="table table-condensed">
							<thead>
								<tr>
									<th colspan="2">${product.productName}</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>가격</td>
									<td>${product.productPrice} 원</td>
								</tr>
								<tr>
									<td>수량</td>
									<td>${product.rest} 개</td>
								</tr>
							</tbody>
						</table>
						<br>
						<br>
						<table class="table selectItem">
							<tbody>
								<tr>
									<td>수량선택</td>
									<td>
										<div class="count_range">
											<input value="-" count_range="m" type="button"
												style="width: 25px;"> <input class="productQuantity" value="0"
												readonly name="productQuantity" 
												style="width: 40px; text-align: center;"> <input
												value="+" count_range="p" type="button" style="width: 25px;">
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center;"><p id="select"></p><span></span></th>
								</tr>
								<tr>
									<td>
										<button class="btn btn-warning btn-block" name="cartList" id="cartList">장바구니</button>
									</td>
									<td>
										<button class="btn btn-success btn-block" name="buyNow" id="buyNow">바로구매</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<hr>
				
			<div class="row detailContent">
				<div class="col-sm-offset-1 col-sm-5 col-xs-6">
					상세설명 :					
					<br> ${product.productContent}<br> <br>
				</div>
			</div>
			<hr>
			<div class="row detailList">
				<div class="col-sm-offset-1 col-sm-5 col-xs-6">
					요기에 상품문의가 오면 되욧...!<br>
				</div>
			</div>
			<br><br><br>
			<!--회사 정보 맨밑 팀이름 	제작자 이름 학원 이름 등등~ -->
			<footer class="container-fluid text-left">
				<p>
					우리가 누군지 물어보신다면<br> 대답해드리는게 인지상정...... 팀플하는중입니다ㅜㅜ<br>
					김서울/김태훈/이슬아<br>
					<문의>중앙<br>
					Mail : asdf@asdfasdf.co.kt<br>
					Phone : 101-1010-1010 
				</p>
			</footer>
		</div>
	</div>
	</div>
	<script type="text/javascript">
	
	$(document).ready(function(){
		
		var max = ${product.rest};//남은수량
		var productName ='${product.productName}';
		var productPrice = ${product.productPrice};//가격
		var params=getUrlParams();//상품번호가져오기
		var productNo=params.productNo;
        var totalPrice;//최종금액
        var id='${login.id}';//임시아이디
        console.log('${login.id}');
        var productQuantity=0;//수량숫자값으로받을거
		
       
		//▼▼▼▼▼▼▼▼수량 +,-가 눌렸을때▼▼▼▼▼▼▼▼
	    $('.count_range input[count_range]').click(function(e){//수량 +,-가 눌렸을때
	    	 if(id==''){
	        	 alert("로그인이 필요한 작업입니다.");
	        }else{
	        e.preventDefault();
	        var type = $(this).attr('count_range');//구분자
	        var $productQuantity = $(this).parent().children('input.productQuantity');//수량 키+벨류
	        var productQuantity_val = $productQuantity.val();//수량문자값
	       
	
            
          //수량 -가 눌렸을때
	        if(type=='m'){
	        	
	            if((productQuantity_val-1)<=0){//수량이 0이면 없애버린다.
		            					console.log("eval(productQuantity_val) 마이너스>> "+(eval(productQuantity_val)-1));
	                $("#select").next().removeClass('selectCount').text("");
		            $productQuantity.val(0);
		            productQuantity=(eval(productQuantity_val)-1);
	                return;
	            }
	            
	            $productQuantity.val(parseInt(productQuantity_val)-1);//수량칸에 보여지는 숫자 줄이기
	            productQuantity=(eval(productQuantity_val)-1);
	            totalPrice = productQuantity*productPrice;//결제값계산
	            $("#select").next().addClass('selectCount').text("총 상품가격 : "+productPrice+"원 x "+productQuantity+"개 = "+totalPrice+" 원");

	         //수량 +가 눌렸을때
	        }else if(type=='p'){
	        	
	        	//최대수량일때
	        	if(productQuantity_val==max){
	        	  alert("최대수량에 도달했습니다.")
		          return;
		        }
	            $productQuantity.val(parseInt(productQuantity_val)+1);//수량칸에 보여지는 숫자 늘리기
	            productQuantity=(eval(productQuantity_val)+1);
		        totalPrice=productQuantity*productPrice;//결제값계산
	            $("#select").next().addClass('selectCount').text("총 상품가격 : "+productPrice+"원 x "+productQuantity+"개 = "+totalPrice+" 원");
	        }

	        }  			 
	    });
		$('#cartList').click(function(e)
				{//장바구니 눌렸을때
				 if(id==''){
	        		 alert("로그인이 필요한 작업입니다.");
	      		  }else{
					 console.log("------------------------------");
					 console.log("a상품번호 >> "+params.productNo);
					 console.log("a수량선택 >> "+productQuantity);
					 console.log("a최종가격 >> "+totalPrice);

			       if(productQuantity>0)
			       {   

						var formData = new FormData();//폼태그가 없으니까 스크립트에서 폼객체만든거다.
						formData.append("productQuantity", productQuantity);//폼에다 데이터를 넣고
						formData.append("productNo", params.productNo);//폼에다 데이터를 넣고
						formData.append("productName", productName);//폼에다 데이터를 넣고
						formData.append("productPrice", productPrice);//폼에다 데이터를 넣고
						formData.append("id", id);//폼에다 데이터를 넣고
						
						//▼▼▼ajax 시작
						$.ajax
						({
							type : 'post',
							url : '/main/insertCartList',
							dateType : 'text',
							data : formData,
							processData : false,
							contentType : false,
							success : function(result) 
							{
								if(result=="ALREADY")
								{
									if (confirm("장바구니에 동일상품이 존재합니다 수량추가 하시겠습니까?")) 
									//네 수량 추가 할게요!
									{		
										$.ajax
										({
											type : 'post',
											url : '/main/updateCartList',
											dateType : 'text',
											data : formData,
											processData : false,
											contentType : false,
											success : function(result) 
											{
												if (confirm("장바구니에 추가되었습니다 |n장바구니로 이동하시겠습니까?")) 
												{								
												document.location.href = "/main/cartList?id=${login.id}";
												}
											},
											error : function(result) 
											{
												alert("실패");
												return;
											}
										});
									}	
								}
								else
								{
									if (confirm("장바구니에 저장되었습니다 |n장바구니로 이동하시겠습니까?")) {								
										document.location.href = "/main/cartList?id=${login.id}";
										}
								}
							},
							error : function(result) 
							{
								alert("실패");
								return;
							}
						});//ajax 끝!
			       }
			       else
			       {
			    		alert("수량을 선택해 주세요!");
			       }
	      		  }
			  });
        
       ////수량 0 초과일때만 움직이는 if문 끝
        
        
        
        
		//주소에서 상품번호 가져올 메솟
	    function getUrlParams() {
    	    var params = {};
    	    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
    	    return params;
    	} 


	    
	    

	});
	</script>
</body>
</html>