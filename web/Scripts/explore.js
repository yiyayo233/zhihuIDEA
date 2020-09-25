$(function(){
	/*var guanZhuZhuanTibackc_IsClick = 1;
	//点击  关注专题 变成  已关注
	$(".GuanZhuZhuanTi").click(function(){
		if(guanZhuZhuanTibackc_IsClick==0){
			$(this).text("关注专题");
			$(this).removeClass("bgc").addClass("GuanZhuZhuanTibackc");
			guanZhuZhuanTibackc_IsClick=1;
		}else{
			$(this).text("已关注");
			$(this).removeClass("GuanZhuZhuanTibackc").addClass("bgc");
			guanZhuZhuanTibackc_IsClick=0;
		}
		
	})*/
	
	//点击  关注专题 变成  已关注
	$(".GuanZhuZhuanTi").click(function(){
		if ($(this).attr("class").indexOf("ExploreFollowButton--colored")==-1) {
			$(this).text("已关注");
			$(this).removeClass("GuanZhuZhuanTibackc").addClass("bgc");
			$(this).addClass("ExploreFollowButton--colored");
		} else{
			$(this).text("关注专题");
			$(this).addClass("GuanZhuZhuanTibackc").removeClass("bgc");
			$(this).removeClass("ExploreFollowButton--colored");
		}
	})
	 
	//点击  关注圆桌 变成  已关注	并且  关注人数发生改变
	$(document).on("click",".yuanzhuo-button-color",function () {
		var jieQu = $(this).parent().prev().find(".yuanzhuo-header-count").find("span");
		var num = parseInt(jieQu.text().substring(0,jieQu.text().indexOf(" ")));
		var uId = $("#user").attr("data-user-id");
		var objectid = $(this).attr("data-roundtable-id");
		if ($(this).attr("class").indexOf("ExploreFollowButton--isFollowing")==-1) {
			$(this).text("已关注");
			$(this).addClass("yuanzhuo-addcolor");
			$(this).addClass("ExploreFollowButton--isFollowing");

			//var num= parseInt($(this).parent().prev().find(".yuanzhuo-header-count").find("span").text().substring(0,$(this).parent().prev().find(".yuanzhuo-header-count").find("span").text().indexOf(" ")));
			jieQu.text(num+1+" 人关注");
			addOrDelBynamic("add",uId,objectid,"gz");
		} else{
			$(this).text("关注圆桌");
			$(this).removeClass("yuanzhuo-addcolor");
			$(this).removeClass("ExploreFollowButton--isFollowing");
			//var num= parseInt($(this).parent().prev().find(".yuanzhuo-header-count").find("span").text().substring(0,$(this).parent().prev().find(".yuanzhuo-header-count").find("span").text().indexOf(" ")));
			//$(this).parent().prev().find(".yuanzhuo-header-count").find("span").text(num-1+" 人关注");
			jieQu.text(num-1+" 人关注");
			addOrDelBynamic("del",uId,objectid,"gz");

		}
	})
})
