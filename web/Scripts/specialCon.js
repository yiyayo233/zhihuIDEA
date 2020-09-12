$(function(){
	//点击别克微蓝新能源背景颜色和文字颜色变蓝
	$(".aDiv div:first").click(function(){
		$(this).css({"background-color": "rgba(0, 132, 255, 0.1)","color":"rgb(0, 132, 255)"});
   
		$(".aDiv div:last").css({"background-color":"#F6F6F6","color":"#999"});
		$(".shuOne+h3").addClass("shu");
		$(".shuTwo+h3").removeClass("shu");
	})
	//点击别克在知乎背景颜色和文字颜色变蓝
	$(".aDiv div:last").click(function(){
		
		$(this).css({"background-color": "rgba(0, 132, 255, 0.1)","color":"rgb(0, 132, 255)"});
		$(".aDiv div:first").css({"background-color":"#F6F6F6","color":"#999"});
		$(".shuTwo+h3").addClass("shu");
		$(".shuOne+h3").removeClass("shu");
	})
	
	//点击关注显示已关注
	$(".but").click(function(){
		if($(this).attr("class").indexOf("butD")==-1){
			$(this).text("已关注");
			$(this).removeClass("but").addClass("butD");
		}else{
			$(this).text("关注");
			$(this).removeClass("butD").addClass("but");
			$(this).prepend('<svg class="Zi Zi--Plus" fill="currentColor" viewBox="0 0 24 24" width="13" height="13"><path d="M13.491 10.488s-.012-5.387 0-5.998c-.037-1.987-3.035-1.987-2.997 0-.038 1.912 0 5.998 0 5.998H4.499c-1.999.01-1.999 3.009 0 3.009s5.995-.01 5.995-.01v5.999c0 2.019 3.006 2.019 2.997 0-.01-2.019 0-5.998 0-5.998s3.996.009 6.004.009c2.008 0 2.008-3-.01-3.009h-5.994z" fill-rule="evenodd"></path></svg>');
		}
	})
	
	
	//关注已关注	
	$(".gz").click(function(){
		if($(this).attr('class').indexOf("gzD")==-1){
			$(this).text("已关注");
			$(this).removeClass("gz").addClass("gzD");
		}else{
			$(this).text("关注");
			$(this).removeClass("gzD").addClass("gz");
			
			$(this).prepend('<svg class="Zi Zi--Plus" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M13.491 10.488s-.012-5.387 0-5.998c-.037-1.987-3.035-1.987-2.997 0-.038 1.912 0 5.998 0 5.998H4.499c-1.999.01-1.999 3.009 0 3.009s5.995-.01 5.995-.01v5.999c0 2.019 3.006 2.019 2.997 0-.01-2.019 0-5.998 0-5.998s3.996.009 6.004.009c2.008 0 2.008-3-.01-3.009h-5.994z" fill-rule="evenodd"></path></svg>');
			$(".gz>svg").css("margin-right","3px");
		}
	})
})
