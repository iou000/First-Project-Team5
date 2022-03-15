<!-- @author 김지혜 + 김경섭 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>레시피 상세 페이지</title>
    <!-- <link rel="stylesheet" type="text/css" href="css/recipeView.css"> -->
    <link rel="stylesheet" type="text/css" href="css/common.css?ver=14">
    <link rel="stylesheet" type="text/css" href="css/library.css?ver=14">
    <link rel="stylesheet" type="text/css" href="css/product.css?ver=14">
</head>

<div id="wrap" class="main">
	<%@ include file="../header.jsp" %>
	<div class="innercon">
        <section class="proinfo-area">
        	<!-- propic// -->
            <div class="propic">
            	<div class="propicbig">
            		<!-- 이미지가 있을 경우 첫번째 이미지를 넣어줌. -->
     				<div class="zoomWrapper" style="height: 624px; width: 520px;">
     					<img src="./images/recipe/${recipeVO.image}" alt="이미지없음" style="position: absolute;">
     				</div>
                </div>
            </div>
            <!-- //propic -->
        </section>
	        <div class="prodetailcont" style="min-height: 339px;">
	            <div class="prodetail-area">
	            
	                <!-- tabs// -->
	                <div class="tab-menu protabs" style="position: absolute; inset: auto auto 0px 0px;">
	                    <a href="#p_proDetail" class="active" style="width: 25%;"><span>상세정보</span></a>
	                    <a href="#p_proBuyinfo" style="width: 25%;"><span>구매정보</span></a>
	                    <a href="#p_cancel" style="width: 25%;"><span>취소/교환/반품</span></a>
	                    <a href="#p_proReview" style="width: 25%;"><span>리뷰 <em id="reviewCnt">88</em></span></a>
	                    <!-- 구독상품일때 문의하기 제거 -->
 
	                    
	                    <a href="#p_proQna"><span>상품문의 <em id="qnaCnt">0</em></span></a>s
	                    

	                    <!-- //구독상품일때 문의하기 제거 -->
	                </div>
	                <!-- //tabs -->            
	            
	                <!-- 상품상세// -->
	                <section id="p_proDetail" class="tab-contents prodetail active">
	                    <h3 class="hide">상품상세</h3>
	                    
	                    <!-- 스피드캣  ca 요청 -->
	                    <img width="0" height="0" style="border:0px;" src="https://tohomeca.thehyundai.com/Acceleration/Cached?pid=S02101031111&amp;cVer=20211130153052&amp;dv=pc&amp;charset=utf-8&amp;https=Y&amp;inc_css=N&amp;inc_js=N&amp;tu=https%3A%2F%2Ftohome.thehyundai.com%2Ffront%2Fpd%2Fpdf%2FimgDetail.do%3FslitmCd%3DS02101031111">
	                    
	                    
		                    <div class="detailcont">
		                        <div style="width:100%;margin:auto;max-width:840px;" id="speedycat_container_root" class="speedycat_container_root_class">
	
	<div class="productdetail m1">&nbsp; 
	<div class="contbox"> 
	<h4 class="ptitle big"><div class="speedycat-container"></div>치밀하게 여문 한 송이의 쫄깃함</h4> 
	<p class="ptxt default">나풀나풀 풍성한 초록 잎이 가장 먼저 눈에 띈다면 죽향 딸기입니다. 단맛으로 시작해 신맛으로 끝나는 기승전결의 새콤달콤함을 느낄 수 있습니다. 촘촘한 과육으로 속까지 알차게 여물어 쫄깃함까지 느낄 수 있는 고급 품종의 딸기입니다. 옹골진 속살이 잘 무르지 않아 다른 품종의 딸기보다 조금 더 여유 있게 주문해도 좋습니다.</p> 
	<p class="ptxt default">※ 배송되는 과정에서 딸기가 조금 눌릴 수 있습니다. 상품의 신선도와 품질에는 이상이 없는 점 알려드립니다.</p></div></div><!---------- //모듈1 : 인트로 END -------- --><!---------- 모듈2 : 책임과존중 텍스트+이미지인경우// START -------- -->
	<div class="productdetail m2"> 
	<div class="contbox"> 
	<h5 class="ptitle middle">우리의 책임과 존중</h5> 
	<div class="ptxt quote"> 
	<div class="col-img">&nbsp;<div class="speedycat-container"></div> <img class="img-txt" alt="" src="http://tohome.thehyundai.com/UIUX/m/pjtCom/images/sub/template/product/pro_template_02_2.png"></div> 
	<div class="col-cont"> 
	<h6 class="ptitle small">현대식품관&nbsp;오종혁 바이어</h6> 
	<p class="desc">&nbsp;&nbsp; “딸기는 친근한 과일이지만 겨울 한 철만 맛 볼 수 있는 귀한 과일이기도 합니다. 실제로 산지, 기후, 생산자에 따라 품질 편차가 큰 섬세한 과일 중 하나예요. 따라서 특정 생산자의 상품을 고정해 거래하지 않고, 취급 때마다 가장 우수한 품질을 재배하는 산지의 생산자를 선별해 거래하고 있습니다. 이번 첫 딸기 철엔 전남 담양 와우 딸기 작목반에서 빛깔 좋은 죽향 딸기를 들여왔습니다.”&nbsp;<span class="mark"></span></p></div></div></div></div><!---------- //모듈2 : 책임과존중 텍스트+이미지인경우 END -------- --><!---------- 모듈4 : 노력과정성// START -------- -->
	<div class="productdetail m4">&nbsp; 
	<div class="contbox"> 
	<h5 class="ptitle middle"><div class="speedycat-container"></div>식탁에 오를 자격</h5> 
	<ul class="ptxt checklist"> 
	<li>고른 빛깔과 균일한 표면의 상품으로 세심하게 선별</li> 
	<li>수확한 당일 하루만 판매하는 상품</li> 
	</ul> 
	<h5 class="ptitle middle">미각노트</h5> 
	<ul class="ptxt checklist"> 
	<li>첫 입에 느껴지는 진한 단맛과 약간의 산미를 느낄 수 있는 끝 맛</li> 
	<li>과육이 촘촘하고 다른 딸기 품종에 비해 단단해 탄력 있는 식감</li> 
	</ul></div></div><!---------- //모듈4 : 노력과정성 END -------- --><!---------- 모듈6 : 마무리// START -------- -->
	<div class="productdetail m6"> 
	<div class="pbox col">&nbsp;</div></div><!---------- //모듈6 : 마무리 END -------- --><!-- //상품상세템플릿 -->
	
	<script type="text/javascript">setTimeout(function () { SlazyStart(''); }, 50);setTimeout(function() { SlazyReSet(''); }, 500);setTimeout(function() { SlazyReSet(''); }, 1000);</script></div>
		                    </div>                    
	                    
	
				        <!-- 상품정보// -->
				        
				        <!-- //상품정보 -->                    
	                </section>
	                <!-- //상품상세 -->
	                
	                <!-- 구매정보// -->
	                <section id="p_proBuyinfo" class="tab-contents probuyinfo">
	                    <h3 class="hide"><strong>구매정보</strong></h3>
	
	                    <div id="mndrInfUseYn"><h4>상품필수정보</h4>
	<div class="cont">
	    <table class="table">
	        <caption>상품주요정보</caption>
	        <colgroup><col style="width:300px"><col></colgroup>
	        <tbody>
	        <tr>
	            <th>바코드 정보</th>
	            <td class="txt-left">8806079873017</td>
	        </tr>
	        <tr>
	            <th>안심사용기한</th>
	            <td class="txt-left">수령 후 2일 이상 사용가능</td>
	        </tr>
	        <tr>
	            <th>포장단위별 내용물의 용량(중량), 수량, 크기</th>
	            <td class="txt-left">[당일수확] 죽향딸기 500g / 식품 특성상 중량은 3% 내외의 차이가 발생할 수 있습니다. / 크기(cm) : 18.5x13x7.5</td>
	        </tr>
	        <tr>
	            <th>생산자, 수입품의 경우 수입자를 함께 표기</th>
	            <td class="txt-left">본 상품은 다수의 생산자로부터 납품받아 판매하는 상품으로 특정생산자 고지에 어려움이 있습니다. 고객님의 양해부탁드립니다.
	</td>
	        </tr>
	        <tr>
	            <th>농수산물의 원산지 표시에 관한 법률에 따른 원산지 </th>
	            <td class="txt-left">상품 이미지 옆 기본정보 내 원산지를 확인해주시기 바랍니다.
	</td>
	        </tr>
	        <tr>
	            <th>제조연월일(포장일 또는 생산연도), 유통기한</th>
	            <td class="txt-left">농산물로 별도의 유통기한은 없으나 가급적 빠르게 드시기 바랍니다.
	</td>
	        </tr>
	        <tr>
	            <th>품목 또는 명칭</th>
	            <td class="txt-left">상품상세 혹은 이미지참조</td>
	        </tr>
	        <tr>
	            <th>농산물 - 농수산물품질관리법상 유전자변형농산물 표시, 지리적 표시</th>
	            <td class="txt-left">해당사항없음</td>
	        </tr>
	        <tr>
	            <th>수입식품에 해당하는 경우 '수입식품안전관리특별법에 따른 수입신고를 필함'의 문구</th>
	            <td class="txt-left">해당사항없음</td>
	        </tr>
	        <tr>
	            <th>상품 구성</th>
	            <td class="txt-left">죽향딸기 500g</td>
	        </tr>
	        <tr>
	            <th>보관방법 또는 취급방법</th>
	            <td class="txt-left">냉장보관</td>
	        </tr>
	        <tr>
	            <th>소비자상담 관련 전화번호 </th>
	            <td class="txt-left">현대식품관 to home 고객센터(1800-9549)</td>
	        </tr>
	        <tr>
	            <th>식품 등의 표시ㆍ광고에 관한 법류에 따른 소비자 안전을 위한 주의사항</th>
	            <td class="txt-left">상품상세 혹은 이미지참조</td>
	        </tr>
	        </tbody>
	    </table>
	</div>
	</div>
	
	                    <div id="sellerInfo"></div>
	
	                    <div class="buyinfo" id="buyinfo"></div>
	                    
						<div class="infotxt notice">
						    <ul>
						        <li>전자상거래 등에서의 소비자 보호에 관한 법률에 의한 반품규정이 판매자가 지정한 반품조건보다 우선합니다.</li>
						        <li>단, 판매자 또는 협력사가 지정한 반품조건이 소비자에게 더 유리한 경우 가장 유리한 반품조건으로 적용됩니다.</li>
						        <li>구매자가 미성년자인 경우에는 상품 구입시 법정 대리인이 동의하지 아니하면 미성년자 본인 또는 법정 대리인이 구매취소 할 수 있습니다.</li>
						        <li class="pointtxt"><a href="/front/dp/dpf/customerCenterMain.do">소비자 피해보상 처리 및 상품 등에 대한 불만처리 방법(CS)</a></li>
						    </ul>
						</div>                    
	                </section>
	                <!-- //구매정보 -->
	                
	                <!-- 취소/교환/반품//-->
	                    <section id="p_cancel" class="tab-contents probuyinfo">
	                        <div class="buyinfo">
	                            <h4>주문취소 안내</h4>
	                            <div class="cont">
	                                <div class="infotxt">
	                                    <ul>
	                                        <li>결제완료 이후 주문의 상태가 “상품준비중”으로 변경될 경우, 취소가 제한됩니다.</li>
	                                        <li>비회원은 로그인 &gt; 비회원주문조회에서 주문을 취소하실 수 있습니다.</li>
	                                        <li>일부 예약배송, 정기배송, 정기구독 등의 예약상품은 배송 3~4일전까지만 취소하실 수 있습니다.</li>
	                                        <li>주문상품의 부분취소는 불가능합니다.</li>
	                                        <li>카드환불은 카드사 정책에 따르며, 취소 시 사용하신 H.Point, H.Bonus, 쿠폰 등은 모두 복원됩니다.
	                                            단, 취소시 사용기한이 지난 혜택은 복원되지 않습니다.</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	
	                        <div class="buyinfo">
	                            <h4>교환/반품안내</h4>
	                            <div class="cont">
	                                <div class="infotxt">
	                                    <p>※상품설명에 배송/교환/반품/취소 관련 안내가 기재된 경우 다음 안내사항보다 우선적용됩니다.</p>
	                                    <ul>
	                                        <li>상품에 문제가 있는 경우<br>
	                                            : 냉장/냉동상품은 제품수령 후 최대 2일(48시간) 내,<br>
	                                            상품을     촬영한 사진과 함께 1:1문의 게시판에 등록하시면,<br>
	                                            담당자 확인 후 교환/반품이 진행됩니다.<br>
	                                            : 상온상품(유통기한 30일 이상)및 기타상품은 제품수령 후<br>
	                                            3개월 이내에 사진과 함께 1:1문의 게시판에 등록하시면,<br>
	                                            담당자 확인 후 교환/반품이 진행됩니다.<br>
	                                            이때 발생하는 모든 배송비는 현대식품관 투홈이 부담합니다.</li>
	                                        <li>단순변심/주문착오의 경우<br>
	                                            : 냉장/냉동상품은 교환/반품이 불가능합니다.<br>
	                                            : 상온상품(유통기한 30일 이상)및 기타상품은 제품수령 후<br>
	                                            최대 7일 이내에 사진과 함께 1:1문의 게시판에 등록하시면, 담당자 확인 후 교환/반품이 진행됩니다. 이때 발생하는 모든 배송비(교환:왕복, 반품:편도)는 고객님께서 부담하셔야 합니다.</li>
	                                        <li>
	                                            교환/반품이 불가한 경우<br>
	                                            : 교환/반품 가능기간을 초과하였을 경우<br>
	                                            : 상품 및 구성품을 사용하였거나 부주의로 인하여 상품이 훼손(파손/고장/오염 등)된 경우<br>
	                                            : 상품 사용 시 상품설명에 기재된 주의사항을 지키지 않는 경우<br>
	                                            : 상품택을 파손하였거나 분실했을 경우<br>
	                                            : 배송 후 설치완료된 상품인 경우<br>
	                                            : 기타 ‘전자상거래 등에서의 소비자보호에 관한 법률’이<br>
	                                            정하는 청약철회 제한사유에 해당되는 경우
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </section>
	                    <!-- //취소/교환/반품-->
	                
	                <!-- 리뷰// -->
	                <section id="p_proReview" class="tab-contents proreview">
	                    <h3 class="hide"><strong>리뷰</strong></h3>
	                    
	                    <div class="list-top"><button type="button" class="btn black btn-review" onclick="fnReviewSelectPopupOpen(this, 'A');">리뷰 작성</button>
	<span class="grade-star big">
	    <span><span style="width:92%;"></span></span>
	    <strong><em>4.6</em> <i class="bar">/</i> 5</strong>
	</span>
	</div>
	
	                    <div class="list-sort">
	                        <label><input type="checkbox" name="pic" id="onlyPic" data-pic-yn="N" onclick="fnReviewAjaxPcList('A', 1);"><span>포토 리뷰</span></label>
	                        <div class="form-sort" id="reviewImgYn">
	                            <label><input type="radio" name="sort" value="1" onclick="fnReviewAjaxPcList('A', 1);"><span>베스트순</span></label>
	                            <label><input type="radio" name="sort" value="2" checked="" onclick="fnReviewAjaxPcList('A', 1);"><span>최신순</span></label>
	                        </div>
	                        
	                        <!-- 패키지 여부가 Y일 경우 -->   
	                        
	                    </div>
	
	                    <!-- 리뷰 리스트 동적 구현 -->
	                    <div class="review-list"><ul>
	<li data-no="577059" data-wrt-id="paej68" data-ord-no="22030700054711" data-slitm-cd="S02101031111" data-opt-cd="" data-img-path="PD/PDImages/S/7/1/0/8806079873017_00.jpg" data-contents="요번 딸기는 너무 물러서 가격대비 실망입니다
	저번에 싱싱하고 맛있어 재주문 한것인데..." data-img-path1="" data-img-path2="" data-img-path3="" data-slitm-nm="[당일수확] 죽향딸기 500g" data-slitm-desc="수확한 당일 하루만 판매하는 상품입니다." data-atfl-no="" data-scrg="3">
	    <div class="star">
	        <div class="grade-star"><span><span style="width:60%;">3</span></span></div>
	    </div>
	    <div class="recont">
	        <div class="ti">
	            <span class="txt-option">
	            수확한 당일 하루만 판매하는 상품입니다.
	            </span>
	            <span class="txt-review">요번 딸기는 너무 물러서 가격대비 실망입니다<br>저번에 싱싱하고 맛있어 재주문 한것인데...</span>
	        </div>
			   <div class="like">
			       <button type="button" class="btn smaller gray btn-reviewlike" onclick="fnToggleClass(this);">0</button>
				   리뷰가 도움이 되었나요?
			   </div>
	    </div>
	        <div class="info">
	            <span class="txt-id">pae*****</span>
	            <span class="txt-date">2022.03.12</span>
	        </div>
	        
			<div class="btnwrap">
			<button type="button" class="btn-notify" onclick="fnClickReviewReport(this)">신고</button>
			</div>
	</li>
	<li data-no="575432" data-wrt-id="minanala" data-ord-no="22030900191594" data-slitm-cd="S02101031111" data-opt-cd="" data-img-path="PD/PDImages/S/7/1/0/8806079873017_00.jpg" data-contents="주로 현백 식품관에서 장보고 야채,과일 퀄리티 신뢰 하고 있는데 2만3천원 딸리 사는데 이래도 되나. 이게 정말 당일 수확일까......별하나도 아깝다
	다신 딸기 구매는 안할듯" data-img-path1="pd/pdd/2022/03/10/071559037/048C8ECF-D34D-40FE-A8A2-AADAB587AB75.jpeg" data-img-path2="pd/pdd/2022/03/10/065220689/EC333730-D680-457B-A157-1900AFF0D294.jpeg" data-img-path3="" data-slitm-nm="[당일수확] 죽향딸기 500g" data-slitm-desc="수확한 당일 하루만 판매하는 상품입니다." data-atfl-no="889618" data-scrg="1">
	    <div class="star">
	        <div class="grade-star"><span><span style="width:20%;">1</span></span></div>
	    </div>
	    <div class="recont">
	        <div class="pic" data-menu="[당일수확] 죽향딸기 500g" data-star="1" data-option="수확한 당일 하루만 판매하는 상품입니다.">
					<button type="button" data-picidx="1"><img src="https://tohomeimage.thehyundai.com/pd/pdd/2022/03/10/071559037/048C8ECF-D34D-40FE-A8A2-AADAB587AB75.jpeg?RS=720&amp;AO=1" style="width: auto; height: 120px;"></button>
					<button type="button" data-picidx="2"><img src="https://tohomeimage.thehyundai.com/pd/pdd/2022/03/10/065220689/EC333730-D680-457B-A157-1900AFF0D294.jpeg?RS=720&amp;AO=1" style="width: auto; height: 120px;"></button>
	        </div>
	        <div class="ti">
	            <span class="txt-option">
	            수확한 당일 하루만 판매하는 상품입니다.
	            </span>
	            <span class="txt-review">주로 현백 식품관에서 장보고 야채,과일 퀄리티 신뢰 하고 있는데 2만3천원 딸리 사는데 이래도 되나. 이게 정말 당일 수확일까......별하나도 아깝다<br>다신 딸기 구매는 안할듯</span>
	        </div>
			   <div class="like">
			       <button type="button" class="btn smaller gray btn-reviewlike" onclick="fnToggleClass(this);">1</button>
				   리뷰가 도움이 되었나요?
			   </div>
	    </div>
	        <div class="info">
	            <span class="txt-id">min*****</span>
	            <span class="txt-date">2022.03.10</span>
	        </div>
	        
			<div class="btnwrap">
			<button type="button" class="btn-notify" onclick="fnClickReviewReport(this)">신고</button>
			</div>
	</li>
	<li data-no="574378" data-wrt-id="moomin" data-ord-no="22030700055162" data-slitm-cd="S02101031111" data-opt-cd="" data-img-path="PD/PDImages/S/7/1/0/8806079873017_00.jpg" data-contents="달아요~ 그런데 죽향치고는 약간 덜 단단하네요~" data-img-path1="pd/pde/2022/03/08/200611745/7090DD1B-65BA-435A-9990-14EAB9700EBF.jpeg" data-img-path2="" data-img-path3="" data-slitm-nm="[당일수확] 죽향딸기 500g" data-slitm-desc="수확한 당일 하루만 판매하는 상품입니다." data-atfl-no="888660" data-scrg="5">
	    <div class="star">
	        <div class="grade-star"><span><span style="width:100%;">5</span></span></div>
	    </div>
	    <div class="recont">
	        <div class="pic" data-menu="[당일수확] 죽향딸기 500g" data-star="5" data-option="수확한 당일 하루만 판매하는 상품입니다.">
					<button type="button" data-picidx="1"><img src="https://tohomeimage.thehyundai.com/pd/pde/2022/03/08/200611745/7090DD1B-65BA-435A-9990-14EAB9700EBF.jpeg?RS=720&amp;AO=1" style="width: auto; height: 120px;"></button>
	        </div>
	        <div class="ti">
	            <span class="txt-option">
	            수확한 당일 하루만 판매하는 상품입니다.
	            </span>
	            <span class="txt-review">달아요~ 그런데 죽향치고는 약간 덜 단단하네요~</span>
	        </div>
			   <div class="like">
			       <button type="button" class="btn smaller gray btn-reviewlike" onclick="fnToggleClass(this);">0</button>
				   리뷰가 도움이 되었나요?
			   </div>
	    </div>
	        <div class="info">
	            <span class="txt-id">moo*****</span>
	            <span class="txt-date">2022.03.08</span>
	        </div>
	        
			<div class="btnwrap">
			<button type="button" class="btn-notify" onclick="fnClickReviewReport(this)">신고</button>
			</div>
	</li>
	<li data-no="570358" data-wrt-id="moomin" data-ord-no="22030200172426" data-slitm-cd="S02101031111" data-opt-cd="" data-img-path="PD/PDImages/S/7/1/0/8806079873017_00.jpg" data-contents="달콤하고 맛있어요 ㅎㅎ 포장 섬세하게 와서 좋았어요~" data-img-path1="pd/pde/2022/03/03/200419062/08B91DF5-191A-4A0B-B190-2DA6FFB7B079.jpeg" data-img-path2="" data-img-path3="" data-slitm-nm="[당일수확] 죽향딸기 500g" data-slitm-desc="수확한 당일 하루만 판매하는 상품입니다." data-atfl-no="885304" data-scrg="5">
	    <div class="star">
	        <div class="grade-star"><span><span style="width:100%;">5</span></span></div>
	    </div>
	    <div class="recont">
	        <div class="pic" data-menu="[당일수확] 죽향딸기 500g" data-star="5" data-option="수확한 당일 하루만 판매하는 상품입니다.">
					<button type="button" data-picidx="1"><img src="https://tohomeimage.thehyundai.com/pd/pde/2022/03/03/200419062/08B91DF5-191A-4A0B-B190-2DA6FFB7B079.jpeg?RS=720&amp;AO=1" style="width: auto; height: 120px;"></button>
	        </div>
	        <div class="ti">
	            <span class="txt-option">
	            수확한 당일 하루만 판매하는 상품입니다.
	            </span>
	            <span class="txt-review">달콤하고 맛있어요 ㅎㅎ 포장 섬세하게 와서 좋았어요~</span>
	        </div>
			   <div class="like">
			       <button type="button" class="btn smaller gray btn-reviewlike" onclick="fnToggleClass(this);">0</button>
				   리뷰가 도움이 되었나요?
			   </div>
	    </div>
	        <div class="info">
	            <span class="txt-id">moo*****</span>
	            <span class="txt-date">2022.03.03</span>
	        </div>
	        
			<div class="btnwrap">
			<button type="button" class="btn-notify" onclick="fnClickReviewReport(this)">신고</button>
			</div>
	</li>
	</ul>
	<!-- pagination// -->
	<div class="pagination">
	   <span class="num">
	   <a href="javascript:fnReviewAjaxPcList('B', '1');" class="active">1</a><!-- 현재페이지 class="active" -->
	   <a href="javascript:fnReviewAjaxPcList('B', '2');">2</a>
	   <a href="javascript:fnReviewAjaxPcList('B', '3');">3</a>
	   <a href="javascript:fnReviewAjaxPcList('B', '4');">4</a>
	   <a href="javascript:fnReviewAjaxPcList('B', '5');">5</a>
	   <a href="javascript:fnReviewAjaxPcList('B', '6');">6</a>
	   <a href="javascript:fnReviewAjaxPcList('B', '7');">7</a>
	   <a href="javascript:fnReviewAjaxPcList('B', '8');">8</a>
	   <a href="javascript:fnReviewAjaxPcList('B', '9');">9</a>
	   <a href="javascript:fnReviewAjaxPcList('B', '10');">10</a>
	   </span>
	   <a href="javascript:fnBlockCnt('A', 'B');" class="next">다음</a>
	</div>
	<!-- //pagination -->
	</div>
	                    
	                </section>
	                <!-- //리뷰 -->
	
	                <section id="p_proReviewWrite" class="tab-contents prowrite review">
	                    <h3>리뷰작성</h3>
	                    <div class="product-list vertical">
	                        <span class="thumb">
	                            <img src="" alt="" id="popReviewWriteImg">
	                        </span>
	                        <!-- data-no: 글번호, data-cd:패키지일 경우 상품코드,  data-ord-no: 주문번호-->
	                        <div class="contr" data-no="" data-cd="" data-ord-no="">
	                            <strong class="txt-ti"></strong>
	                            <span class="txt-option"></span>
	
	                        </div>
	                    </div>
	
	                    <form id="fileForm" method="post" enctype="multipart/form-data">
	                        <fieldset>
	                            <legend class="hide">리뷰작성</legend>
	                            <input type="hidden" name="itemEvalAtclNo" value="">
	                            <input type="hidden" name="ordNo" value="">
	                            <input type="hidden" name="slitmCd" value="">
	                            <input type="hidden" name="optItemCd" value="">
	                            <input type="hidden" name="pckgItemYn" value="">    
	                            <input type="hidden" name="itemEvalScrg" id="itemEvalScrg" value="">
	                            <input type="hidden" name="itemEvalCntn" id="itemEvalCntn" value="">
	                            <input type="hidden" name="imgCnt" id="imgCnt" value="">    
	                            <input type="hidden" name="imgYn1" id="imgYn1" value="">            
	                            <input type="hidden" name="imgYn2" id="imgYn2" value="">            
	                            <input type="hidden" name="imgYn3" id="imgYn3" value="">    
	                            <input type="hidden" name="pathType1" id="pathType1" value="">  
	                            <input type="hidden" name="pathType2" id="pathType2" value="">
	                            <input type="hidden" name="atflNo" id="atflNo" value="">
	                            
	                            <div class="write-area">
	                                <div class="reviewstar">
	                                    <div class="grade-star big active">
	                                        <span class="active" id="start1">1점</span>
	                                        <span class="active" id="start2">2점</span>
	                                        <span class="active" id="start3">3점</span>
	                                        <span class="active" id="start4">4점</span>
	                                        <span class="active" id="start5">5점</span>
	                                        <input type="hidden" name="starV" value="5">
	                                        <div class="txt" id="totstart"><em class="tot">5</em>/<em>5</em></div>
	                                    </div>
	                                </div>
	                                
	                                <div class="form-default horizon form-file" id="expsY2">
	                                    <strong>사진 첨부</strong>
	                                    <div class="upload-file">
	                                        <label><input type="file" class="upload-hidden" title="사진 첨부" name="uploadImg" id="uploadImg1" accept="image/*"></label>
	                                    </div>
	                                    <div class="upload-file">
	                                        <label><input type="file" class="upload-hidden" title="사진 첨부" name="uploadImg" id="uploadImg2" accept="image/*"></label>
	                                    </div>
	                                    <div class="upload-file">
	                                        <label><input type="file" class="upload-hidden" title="사진 첨부" name="uploadImg" id="uploadImg3" accept="image/*"></label>
	                                    </div>
	                                </div>
	                                
	                                <label class="form-counter" id="expsY1">
	                                    <textarea title="리뷰 입력" placeholder="최소 글자수는 10자 이상입니다. 고객님의 취향과 경험을 좀 더 자세히 공유해주세요." name="reviewTextarea" id="reviewTextarea" onkeyup="javascript:fnReviewTextareaLimit(this, 500, 'B');"></textarea>
	                                    <span class="counter"><em>0</em> /500 자</span>
	                                </label>
	                                <p class="txt-star" id="expsN1" style="display: none;">
			                                                    개인별 주관적인 의견으로 인해 상품의 기능 및 효과에 대한
			                                                    오해의 소지가 있을 수 있어 평점만 선택 가능합니다.
	                                </p>                                
	                            </div>
	
	                            <div class="btns">
	                                <button type="button" class="btn gray middle btn-cancel" onclick="fn.addClass('#p_proReview');fn.removeClass('#p_proReviewWrite');">취소</button>
	                                <button type="button" class="btn fill black middle btn-confirm" onclick="fnReviewSave();">확인</button>
	                            </div>
	                        </fieldset>
	                    </form>
	
	                    <div class="infotxt">
	                        <strong>리뷰 작성 안내</strong>
	                        <ul>
	                            <li id="expsY3">권한<br>현대식품관에서 구입한 상품만 가능하며, 배송 완료일 기준 90일까지 작성하실 수 있습니다.</li>
	                            <li id="expsY4">혜택<br>리뷰 작성 혜택은 H.Point로 지급되며 H.Point 통합회원이 아닌 경우 지급받으실 수 없습니다.</li>
	                            <li id="expsY5">텍스트 리뷰 50P / 포토 리뷰 150P</li>
	                            <li id="expsY6">리뷰<br>아래 내용에 해당하는 사유라고  판단되는 경우 작성자 동의 없이 미전시할 수 있으며, 지급된 포인트는 회수됩니다.</li>
	                            <li id="expsY7">부적합한 내용의 작성(허위 사실, 욕설, 비난, 일반식품의 효능, 효과, 해석 불가능한 리뷰, 타 상품에 대한 리뷰 등) 타인의  권리 혹은 개인정보 침해 우려가 있는 경우 (캡처. 제3자 사진 도용 등) 리뷰 작성 후 반품</li>
	                            
	                            <li id="expsN2" style="display: none;">리뷰 작성 후 반품 시 지급된 리뷰 포인트는 회수됩니다.</li>
	                            <li id="expsN3" style="display: none;">포인트는 H.Point로 지급되며 H.Point가 없으신 경우 지급받을 수 없습니다.</li>
	                        </ul>
	                    </div>
	                </section>
	                <!-- //리뷰작성 -->
	
	                <!-- 문의하기// -->
	                <section id="p_proQna" class="tab-contents proqna">
	                    <h3 class="hide">문의하기</h3>
	
	                    <div class="list-top">
	                        <button type="button" class="btn black btn-qna" onclick="fnPDOpenQnaWrite(this);">문의하기</button>
	
	                        <div class="infotxt">
	                            <strong>문의사항에 대해 신속히 답변해드리겠습니다.</strong>
	                            <ul>
	                                <li>구매한 상품의 취소/반품은 마이페이지 구매내역에서 신청 가능합니다.</li>
	                                <li>주문 문의사항(배송, 취소, 교환, 환불, 반품)은 고객센터 내 1:1문의를 이용해 주시기 바랍니다.</li>
	                            </ul>
	                        </div>
	                    </div>
	
	                    <div class="list-sort">
	                        <label><input type="checkbox" name="qnaOnlyPic" id="qnaOnlyPic" onclick="fnQnaAjaxPcList('A')"><span>내 문의보기</span></label>
	
	                        <div class="select">
	                            <select title="문의 유형 선택" id="qnaOption" onchange="fnQnaAjaxPcList('A')">
	                                <option value="">전체 문의 유형</option>
	                                
	                                   <option value="01">APP 설치, 기능</option>    
	                                
	                                   <option value="02">회원가입/탈퇴, 정보변경</option>    
	                                
	                                   <option value="03">포인트 적립/사용</option>    
	                                
	                                   <option value="04">쿠폰/이벤트</option>    
	                                
	                                   <option value="05">클럽웨딩</option>    
	                                
	                                   <option value="06">참여사/제휴처 관련 문의</option>    
	                                
	                                   <option value="07">기타</option>    
	                                 
	                            </select>
	                        <div class="dropdown" tabindex="0"><span class="current">전체 문의 유형</span><div class="list"><ul><li class="option selected" data-value=""><span>전체 문의 유형</span></li><li class="option" data-value="01"><span>APP 설치, 기능</span></li><li class="option" data-value="02"><span>회원가입/탈퇴, 정보변경</span></li><li class="option" data-value="03"><span>포인트 적립/사용</span></li><li class="option" data-value="04"><span>쿠폰/이벤트</span></li><li class="option" data-value="05"><span>클럽웨딩</span></li><li class="option" data-value="06"><span>참여사/제휴처 관련 문의</span></li><li class="option" data-value="07"><span>기타</span></li></ul></div></div></div>
	                    </div>
	                    
	                    <!-- 문의 내용 동적 생성 -->
	                    <div class="qna-list">
	                    </div>
	                    
	                </section>
	                <!-- //문의하기 -->
	
	               <!-- 상품 문의// -->
	                <section id="p_proQnaWrite" class="tab-contents prowrite">
	                    <h3>상품문의</h3>
	                    
	                    <div class="product-list vertical">
	                        <span class="thumb">
	                            <img src="https://tohomeimage.thehyundai.com/PD/PDImages/S/7/1/0/8806079873017_00.jpg" alt="">
	                        </span>
	                        
	                        <!-- data-no: 상품QNA질문번호 -->
	                        <div class="contr" data-no="">
	                            <strong class="txt-ti">[당일수확] 죽향딸기 500g</strong>
	                            <span class="txt-option">수확한 당일 하루만 판매하는 상품입니다.</span>
	                        </div>
	                    </div>
	
	                    <form>
	                        <fieldset>
	                            <legend class="hide">상품 문의</legend>
	
	                            <div class="write-area">
	                                <div class="form-default horizon">
	                                    <strong>문의 유형<span class="need">*<span class="hide">필수</span></span></strong>
	                                    <div class="select">
	                                    <select title="문의유형 선택" id="inqrTypeCd">
	                                        <option value="">유형선택</option>
	                                        
	                                            <option value="01">APP 설치, 기능</option>    
	                                        
	                                            <option value="02">회원가입/탈퇴, 정보변경</option>    
	                                        
	                                            <option value="03">포인트 적립/사용</option>    
	                                        
	                                            <option value="04">쿠폰/이벤트</option>    
	                                        
	                                            <option value="05">클럽웨딩</option>    
	                                        
	                                            <option value="06">참여사/제휴처 관련 문의</option>    
	                                        
	                                            <option value="07">기타</option>    
	                                        
	                                    </select>
	                                    <div class="dropdown" tabindex="0"><span class="current">유형선택</span><div class="list"><ul><li class="option selected" data-value=""><span>유형선택</span></li><li class="option" data-value="01"><span>APP 설치, 기능</span></li><li class="option" data-value="02"><span>회원가입/탈퇴, 정보변경</span></li><li class="option" data-value="03"><span>포인트 적립/사용</span></li><li class="option" data-value="04"><span>쿠폰/이벤트</span></li><li class="option" data-value="05"><span>클럽웨딩</span></li><li class="option" data-value="06"><span>참여사/제휴처 관련 문의</span></li><li class="option" data-value="07"><span>기타</span></li></ul></div></div></div>
	                                </div>
	
	                                <label class="form-default horizon">
	                                    <strong>제목<span class="need">*<span class="hide">필수</span></span></strong>
	                                    <input type="text" name="" title="제목 입력" placeholder="50자 이내 작성" id="qnaTitle" onkeyup="fnQnaTextareaLimit($(this), 50, 'A');">
	                                </label>
	
	                                <label class="form-default horizon">
	                                    <strong>내용<span class="need">*<span class="hide">필수</span></span></strong>
	                                    <div class="form-counter">
	                                        <textarea title="내용 입력" placeholder="이메일, 휴대폰번호, 주민등록번호와 같은 개인정보의 입력은 금지되어 있습니다." id="qnaContents" onkeyup="fnQnaTextareaLimit($(this), 400, 'B');"></textarea>
	                                        <span class="counter"><em>0</em> /400 자</span>
	                                    </div>
	                                </label>
	
	                                <div class="notice">
	                                    <label class="form-default horizon"><input type="checkbox" name="scretYn" id="scretYn"><span>비밀 문의</span></label>
	                                    <label class="form-default horizon"><input type="checkbox" name="answNotfYn" id="answNotfYn"><span>답변 알림받기 <small class="phone">010-1234-5678</small></span></label>
	                                    <div class="infotxt">
	                                        <ul>
	                                            <li>문의하신 글에 답변이 달렸을 때, 고객님의 휴대폰으로 알림 문자를 받으실 수 있습니다.</li>
	                                            <li>휴대폰번호는 마이페이지 &gt; 나의정보 &gt; 회원정보 변경에서 변경 가능합니다.</li>
	                                        </ul>
	                                    </div>
	                                </div>
	                            </div>
	
	                            <div class="btns">
	                                <button type="button" class="btn gray middle btn-cancel" onclick="fn.addClass('#p_proQna');fn.removeClass('#p_proQnaWrite');">취소</button>
	                                <button type="button" class="btn fill black middle btn-confirm" onclick="fnQnaSave();">확인</button>
	                            </div>
	                        </fieldset>
	                    </form>
	
	                    <div class="infotxt">
	                        <strong>상품 문의 안내</strong>
	                        <ul>
		                        <li>구매한 상품의&nbsp;취소/반품은 마이페이지 구매내역에서 신청할 수 있습니다.</li>
		                        <li>주문 관련(배송, 취소, 환불, 반품, 교환) 문의는 고객센터 내 1:1 문의에서 상담받으실 수 있습니다.</li>
		                        <li>해당 상품과 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등 불쾌감을 유발하는 글은 작성자 동의 없이 이동, 노출 제한, 삭제 등의 조치를 취할 수 있습니다.</li>
		                        <li>본인 및 타인의 개인정보가 기록되지 않도록 주의해주시기 바랍니다.</li>
	                        </ul>
	                    </div>
	                </section>
	                <!-- //상품 문의 -->
	            </div>
	            <!--
	            <div class="rightarea" id="bottom_rightarea" style="position: absolute; inset: auto 0px 0px auto;">
	            	<div class="optionarea">
	    				<div class="optionls">
		         			<div>
		         				<strong class="txt-ti">[당일수확] 죽향딸기 500g</strong>
	             				<div class="ea-area" style="display:none">
	             					<input type="number" title="수량 입력" value="1" readonly="">
	             					<button type="button" class="btn-down" onclick="fnOptionEaDown(this);">수량 낮추기</button>
	             					<button type="button" class="btn-up" onclick="fnOptionEaUp(this);">수량 올리기</button>
	             				</div>
	             				<span class="txt-price"><em>28,000</em>원</span>
	             			</div>
             			</div>
             		</div>
					<div class="buybutton">
	    				<p class="txt-total">총 금액 <strong><em>28,000</em>원</strong></p>
	    				<div class="btns">
	    					<button type="button" class="btn darkgray bigger btn-buy" onclick="fnPopupScaleOpenA(this, '#p_popCartAdd');">장바구니 넣어두기</button>
	    					<button type="button" class="btn fill gray bigger btn-buy" onclick="fnPDPopWeightingNight('#p_popWeightingNight');">재입고 알림 신청</button>
	    				</div>
	    			</div>
	    		</div>
	    		 -->
	        </div>
	
	        <!-- 매거진// -->
	        <section class="promagazine" id="promagazine"><h3>이 상품과 관련된 매거진</h3>
	<div class="magazine-list">
	    <a href="/front/dp/dpd/mgzDetail.do?mgzNo=220107100385001">
	        <img src="https://tohomeimage.thehyundai.com/DP/DP018/2022/01/07/113623/fyzac.jpg?RS=720x360" alt="이 상품과 관련된 매거진이미지" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'">
	        <span>
	            <strong>산지의 신선한 오늘을<br>내일 새벽 식탁으로</strong>
	        </span>
	    </a>
	    <a href="/front/dp/dpd/mgzDetail.do?mgzNo=210302101320001">
	        <img src="https://tohomeimage.thehyundai.com/DP/DP018/2021/04/13/111512/tdidw.JPG?RS=720x360" alt="이 상품과 관련된 매거진이미지" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_350x420.jpg'">
	        <span>
	            <strong>장우철 에세이<br>딸기의 자리</strong>
	        </span>
	    </a>
	</div>
	</section>
	        <!-- //매거진 -->
	
	        <!-- 함께 본 상품// -->
	        <section class="prorecom" id="prorecomBig"><h3>다른 고객이 함께 본 상품</h3>
	<ul class="product-list big">
	    <li>
	            <a href="/front/pd/pdd/productDetail.do?slitmCd=S02111094668">
	            <span class="thumb">
	                <img src="https://tohomeimage.thehyundai.com/PD/PDImages/S/3/3/0/2801001077033_00.jpg?RS=232x278" alt="" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_232x278.jpg'">
	            </span>
	            <strong class="txt-ti ellipsis">[중앙해장] 한우1++ 양지곰탕(700g/냉장)</strong>
	            <span class="txt-price"><strong><em>14,400</em>원</strong></span>
	        </a>
	    </li>
	    <li>
	            <a href="/front/pd/pdd/productDetail.do?slitmCd=S02103035800">
	            <span class="thumb">
	                <img src="https://tohomeimage.thehyundai.com/PD/PDImages/S/5/2/7/8806079947725_00.jpg?RS=232x278" alt="" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_232x278.jpg'">
	            </span>
	            <strong class="txt-ti ellipsis">[H-SWEET] 왕 블루베리(국산) 100g</strong>
	            <span class="txt-price"><strong><em>14,800</em>원</strong></span>
	        </a>
	    </li>
	    <li>
	            <a href="/front/pd/pdd/productDetail.do?slitmCd=S02105046700">
	            <span class="thumb">
	                <img src="https://tohomeimage.thehyundai.com/PD/PDImages/S/3/5/1/8806079979153_00.jpg?RS=232x278" alt="" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_232x278.jpg'">
	            </span>
	            <strong class="txt-ti ellipsis">[금돼지식당] 모둠 구이 세트 (전국배송)</strong>
	            <span class="txt-price"><strong><em>65,000</em>원</strong></span>
	        </a>
	    </li>
	    <li>
	            <a href="/front/pd/pdd/productDetail.do?slitmCd=S02201098370">
	            <span class="thumb">
	                <img src="https://tohomeimage.thehyundai.com/PD/PDImages/S/7/6/7/2801001118767_00.jpg?RS=232x278" alt="" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_232x278.jpg'">
	            </span>
	            <strong class="txt-ti ellipsis">[SOUPER] 토마토 바질 크림</strong>
	            <span class="txt-price"><strong><em>5,060</em>원</strong></span>
	        </a>
	    </li>
	    <li>
	            <a href="/front/pd/pdd/productDetail.do?slitmCd=S02110092654">
	            <span class="thumb">
	                <img src="https://tohomeimage.thehyundai.com/PD/PDImages/S/0/5/1/2801001040150_00.jpg?RS=232x278" alt="" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_232x278.jpg'">
	            </span>
	            <strong class="txt-ti ellipsis">[새벽시장] 다다기오이 5입/봉(700g)</strong>
	            <span class="txt-price"><strong><em>7,450</em>원</strong></span>
	        </a>
	    </li>
	    <li>
	            <a href="/front/pd/pdd/productDetail.do?slitmCd=S02101030250">
	            <span class="thumb">
	                <img src="https://tohomeimage.thehyundai.com/PD/PDImages/S/6/8/5/8806079881586_00.jpg?RS=232x278" alt="" onerror="this.src='/UIUX/m/pjtCom/images/common/noimage_232x278.jpg'">
	            </span>
	            <strong class="txt-ti ellipsis">[새벽시장] 천혜향 6입(1kg)</strong>
	            <span class="txt-price"><strong><em>13,900</em>원</strong></span>
	        </a>
	    </li>
	</ul>
	</section>
        <!-- //함께 본 상품 -->
    </div>
</div>


<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Javascript -->
<script>
    /* 레시피 삭제 seop */
    function fnDeleteRecipe() {
        if (confirm("삭제하시겠습니까?")) {
            $('form[name=udform]').attr({action: "app?command=recipe_delete", method: 'post'}).submit();
        }
    }

    /* 레시피 수정 seop */
    function fnUpdateRecipe() {
        if (confirm("수정하시겠습니까?")) {
            $('form[name=udform]').attr({action: "app?command=recipe_update_form", method: 'post'}).submit();
        }
    }
</script>
</html>