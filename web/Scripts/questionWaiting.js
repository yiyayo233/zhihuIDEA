/*$(function(){
	$("#headDiv div").hover(function(){
		$(this).css("background-color","#00b5e2");
	})
})*/
$(function(){
	$(".QuestionItem").hover(function () {
		$(this).find(".QuestionItem-ignoreButton").css({"visibility":"inherit"});
	},function () {
		$(this).find(".QuestionItem-ignoreButton").removeAttr("style");
	});
	//点击X号删除改行信息
	$(".QuestionItem-ignoreButton").click(function(){
		$(this).parent().remove();
		
	});
});
	
	
