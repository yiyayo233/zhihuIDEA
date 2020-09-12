$(function(){
	$(".showDiv").hide();
	
	//点击更多显示全部内容
	$(".smallerDiv").click(function(){
		$(".hideDiv").hide();
		$(".showDiv").show();
	})
	
	//关注已关注	
	$(".gz").click(function(){
		if($(this).attr('class').indexOf("gzD")==-1){
			$(this).text("已关注");
			$(this).removeClass("gz").addClass("gzD");
		}else{
			$(this).text("关注");
			$(this).removeClass("gzD").addClass("gz");
			$(this).prepend('<svg viewBox="0 0 40 40" height="12" width="12" fill="currentColor" size="12" class="UserCell-icon-oN5QL"><path fill-rule="evenodd" d="M22 18h16a2 2 0 1 1 0 4H22v16a2 2 0 1 1-4 0V22H2a2 2 0 1 1 0-4h16V2a2 2 0 1 1 4 0v16z"></path></svg>');
			$(this).find("svg").css("margin-right","3px");
		}
	})
})
