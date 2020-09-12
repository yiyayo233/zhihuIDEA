$(function(){
	//鼠标放到关注专栏div，背景颜色变深，移开恢复
	$(".AllDiv .firstDiv div div:first").hover(function(){
		$(this).css({"background-color":"blue"});
	}).mouseout(function(){
		$(this).css("background-color","#0084ff");
	})
	
	//鼠标放到投稿div，添加背景颜色，移开恢复
	$(".AllDiv .firstDiv div div:last").hover(function(){
		$(this).css({"background-color":"#ADD8E6"});
	}).mouseout(function(){
		$(this).css("background-color","#fff");
	})
})
