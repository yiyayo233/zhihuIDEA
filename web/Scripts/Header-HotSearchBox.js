function Header_HotSearchBox_IsFocus(is) {
    if(is === 1){
        $(".HotHotSearchBox").animate({"opacity":"0","top":"30px"},200,function () {
            $(this).css({"display": "none","top":"48px"});
        })
    }else {
        $(".HotHotSearchBox").css({"display": "block"});
        $(".HotHotSearchBox").animate({"opacity":"1"},200)
    }
}
