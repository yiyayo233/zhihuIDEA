$(function(){
	
	$(".dis").hide();
	
	//点击任意位置隐藏下拉框，除.Button
	$(document).click(function(){
    	$(".dis").hide();
	});
	
	//点击技能习得按钮显示下拉框,或者隐藏
	$(".Select-button").click(function(event){
    	event.stopPropagation();
    	if($(".dis").css("display") == "none") {　　　　　　　　　　
	        $(".dis").show();　　　　　　　　
	    } else {　　　　　　　　　　
	        $(".dis").hide();　　　　　　　　
	    }　　　　　　　　
	});

	
	/*$('.Select-button').on("click", function(e) {　　　　　　　　
	    if($(".dis").css("display") == "none") {　　　　　　　　　　
	        $(".dis").show();　　　　　　　　
	    } else {　　　　　　　　　　
	        $(".dis").hide();　　　　　　　　
	    }　　　　　　　　
	    e = e || event;
	    stopFunc(e);　　　　　　
	});*/
	/*//默认背景颜色
	$("#Select1-0").addClass("optionH");
	//离开删除该背景色
	$("#Select1-0").mouseleave(function(){
		$(this).removeClass("optionH");
	})*/
	//鼠标放到listbox中显示背景颜色
	$(".Select-option").mouseover(function(){
		$(this).addClass("optionH");
	}).mouseout(function(){
		$(this).removeClass("optionH");
	})
	$(".Select-option").click(function(){
		var name = $(this).text();
		$(".Select-button").text(name);
		var svg = '<span style="display: inline-flex; align-items: center;"><svg class="Zi Zi--Select Select-arrow" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M12 16.183l2.716-2.966a.757.757 0 0 1 1.064.001.738.738 0 0 1 0 1.052l-3.247 3.512a.758.758 0 0 1-1.064 0L8.22 14.27a.738.738 0 0 1 0-1.052.758.758 0 0 1 1.063 0L12 16.183zm0-9.365L9.284 9.782a.758.758 0 0 1-1.064 0 .738.738 0 0 1 0-1.052l3.248-3.512a.758.758 0 0 1 1.065 0L15.78 8.73a.738.738 0 0 1 0 1.052.757.757 0 0 1-1.063.001L12 6.818z" fill-rule="evenodd"></path></svg></span>';
		$(".Select-button").append(svg);
		var $str= $("Select-popoverTarget").find().attr("id");
		$str.addClass("optionH");
	})
})
