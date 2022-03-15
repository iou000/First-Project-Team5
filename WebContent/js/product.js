/**
* --------------------------------
* PRODUCT JS
* --------------------------------
*/

$(window).on('load', function(){
	var path = $("#wrap").attr('class').split(" ") || "";

	//선물하기 메인, 선물하기 목록 lnb
	if ( $(".lnbarea").length){
		//lnb active 초기화
		if($(".lnb-depth1").hasClass("active")){
			$(".lnb-depth1.active").find(".lnb-depth2").show();
		}

		//lnb 클릭
		$(".lnb-depth1 > a").click(function(){
			var obj = $(this).closest(".lnb-depth1");
			obj.toggleClass("active");
			if(obj.hasClass("active")){
				obj.find(".lnb-depth2").stop().slideDown();
			} else {
				obj.find(".lnb-depth2").stop().slideUp();
			}
		});
	}

	switch (path[1]) {
		//category
		case "category" :
			//filterNav
			fn.filterNav();
		break;

		//detail
		case "detail" :
			//propicbig zoom
			$('.propicbig img').ezPlus({
				gallery: 'P_picSmall',
				borderSize: 0,
				lensBorderSize: 0,
				minZoomLevel: 0.5,
                zoomLens: false,
                lensOpacity: 0,
				imageCrossfade: true,
				zoomWindowWidth: 604,
				zoomWindowHeight: 624,
				zoomWindowOffsetX: 80,
				zoomWindowAlwaysShow: true,
				scrollZoom: true,
//				cursor: 'crosshair',
				zIndex: 20
			});
            if ( $(".propicsmallswiper .swiper-slide").length > 5 ){
                //propicsmall swiper
                var propicsmallSwiper = new Swiper(".propicsmallswiper", {
                    slidesPerView: 5,
                    loop: false,
                    navigation: {
                        nextEl: ".swiper-button-next-propic",
                        prevEl: ".swiper-button-prev-propic",
                    },
                });
                $(".swiper-button-next-propic, .swiper-button-prev-propic").css("opacity", "1");
                $(".propicsmallswiper").css("opacity", "1");
            }else{
                $(".propicsmallswiper .swiper-wrapper").css("display", "inline-block");
                $(".propicsmallswiper").css("opacity", "1");
            }
			//spic click
            $(".swiper-pagination-propic .current").html("1");
            $(".swiper-pagination-propic .total").html($(".propicsmallswiper .swiper-slide").length);
			$(".propicsmallswiper .swiper-slide:eq(0) a").addClass("active");
			if($(".propicsmallswiper .swiper-slide:eq(0)").hasClass("video")) {
				$("body").addClass("zoom-off");
			}
			$(".propicsmallswiper .swiper-slide a").click(function(e){
				e.preventDefault();
				$("body").removeClass(".zoom-off");
                $(".propicsmallswiper .swiper-slide a").removeClass("active");
                $(this).addClass("active");
                $(".swiper-pagination-propic .current").html($(this).parent().index()+1);
				if ( $(this).attr("data-zoom-image") ){
					$(".propicbig img").attr("data-zoom-image", $(this).attr("data-zoom-image"));
					$(".propicbig .videobox").fadeOut();
					$(".ZoomContainer").css({"opacity":"1"});
				}else if ( $(this).parent().hasClass("video") ){
					$(".propicbig img").attr("src", $(this).attr("data-image"));
					$(".propicbig img").attr("data-zoom-image", "");
					$(".propicbig .videobox").fadeIn();
					$(".ZoomContainer").css({"opacity":"0"});
				}else{
					$(".propicbig img").attr("src", $(this).attr("data-image"));
					$(".propicbig img").attr("data-zoom-image", "");
					$(".propicbig .videobox").fadeOut();
					$(".ZoomContainer").css({"opacity":"0"});
				}
			});
			//scroll fixed
			var $bodyhei = $(document).height(),
                $protabs = $(".protabs"),
				tabstop = $protabs.offset().top,
				inittabstop = $protabs.css("top").replace("px", ""),
                $proinfobuybutton = $(".proinfo .buybutton"),
				$prodetailcont = $(".prodetailcont"),
				$rightarea = $(".rightarea"),
                $buybutton = $(".rightarea .buybutton");

            $protabs.find("a").css("width", + (100/$(".product.detail .protabs a").length) +"%");
            $prodetailcont.css("min-height", +($rightarea.outerHeight()+Number($prodetailcont.css("padding-top").replace("px", ""))+Number($prodetailcont.css("padding-bottom").replace("px", "")))+"px");

			//페이지 진입시 제휴쿠폰 다운로드 팝업 노출된 경우
			$(document).on("click", ".popcouponpartner .btn-close", function(){
				tabstop = $protabs.offset().top;
			})
			function productScroll(){
				var st = $(this).scrollTop();

				if ( $bodyhei != $(document).height() ){
					$bodyhei = $(document).height();
					tabstop = $protabs.offset().top;
				}

				$prodetailcont = $(".prodetailcont");
				var leftendtop = tabstop + $prodetailcont.outerHeight() - $protabs.outerHeight();
				var rightendtop = tabstop + $prodetailcont.outerHeight() - $rightarea.outerHeight();
				var leftgab = ($(window).width() - $(".innercon").outerWidth())/2 < 0 ? 0 : ($(window).width() - $(".innercon").outerWidth())/2;

				if ( st < ($proinfobuybutton.offset().top + $proinfobuybutton.outerHeight()) ) {
					$buybutton.css({"opacity": "0", "visibility":"hidden"});
				}else{
					$buybutton.css({"opacity": "1", "visibility":"visible"});
				}
				if ( st < tabstop ) {
					$rightarea.css({"position":"absolute", "top":"0", "left":"auto", "right":"0", "bottom":"auto"});
				} else if ( st < rightendtop ) {
					$rightarea.css({"position":"fixed", "top":"0", "left":+(leftgab+($(".innercon").outerWidth()-$(".rightarea").outerWidth()))+"px", "right":"auto", "bottom":"auto"});
				} else {
					$rightarea.css({"position":"absolute", "top":"auto", "left":"auto", "right":"0", "bottom":"0"});
				}
				if ( st < tabstop ) {
					$protabs.css({"position":"absolute", "top":"0", "left":"0", "right":"auto", "bottom":"auto"});
				} else if ( st < leftendtop ) {
					$protabs.css({"position":"fixed", "top":"0", "left":+(leftgab)+"px", "right":"auto", "bottom":"auto"});
				} else {
					$protabs.css({"position":"absolute", "top":"auto", "left":"0", "right":"auto", "bottom":"0"});
				}
			}
			$(window).scroll(function(){
				if (!($("body").hasClass("pop-open"))) {//팝업 오픈 시 호출 X
                    productScroll();
				}
			}).trigger("scroll");
			$(window).resize(function(){
				if (!($("body").hasClass("pop-open"))) {//팝업 오픈 시 호출 X
                    productScroll();
				}
			});
            //tab click
			$(".protabs a").click(function(e){
                e.preventDefault();
				var scrolltop = $(".prodetailcont").offset().top;
                $("html, body").animate({"scrollTop": ( scrolltop ) });
                productScroll();
                if ( $(this).attr("href") == "#p_proReview" ){
                    setTimeout(function(){
                        fn.reviewInit();
                    }, 100);
                }
			});

		break;

		//promisemain
		case "promisemain" :
			//category selected
			$(".poppromisecate .catelist button").click(function(){
				$(".btn-selectdiv").text($(this).find(".txt-cate").text());
			});
		break;

		//search
		case "search" :
			//filterNav
			fn.filterNav();

			//select type2
			var obj = $(".search-result .select.type2");
			obj.each(function(){
				if ( !$(this).find("span").hasClass("dropdown") ){
					var parSel = $(this);
					if ( $(this).find("option:selected").text() == "추천순" ){
						parSel.parent().find(".recominfo").css({"display":"inline-block"});
					}else{
						parSel.parent().find(".recominfo").css({"display":"none"});
					}

					parSel.find("select").change(function(){
						if ( $(this).find("option:selected").text() == "추천순" ){
							parSel.parent().find(".recominfo").css({"display":"inline-block"});
						}else{
							parSel.parent().find(".recominfo").css({"display":"none"});
						}
					});
				}
			});
		break;

		//gift
		case 'giftmain' :
			//mainbanner
            var $giftbannerswiperObj = $(".giftbannerswiper");
            if ( $giftbannerswiperObj.find(".swiper-slide").length > 1 ){
                var prowaitpicSwiper = new Swiper('.giftbannerswiper', {
					slidesPerView: 'auto',
					spaceBetween: 0,
					pagination: {
						el: '.swiper-pagination-banner',
						type: 'bullets',
					}
                });
			}

            //hotbestswiper
            var $hotbestswiperObj = $(".hotbestswiper");
            if ( $hotbestswiperObj.find(".swiper-slide").length > 1 ){
                var prowaitpicSwiper = new Swiper('.hotbestswiper', {
					slidesPerView: 'auto',
					spaceBetween: 20,
					navigation: {
						nextEl: ".swiper-button-next-hotbest",
						prevEl: ".swiper-button-prev-hotbest",
					},
                });
			}

		break;

	}
});