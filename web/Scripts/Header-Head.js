/*头js*/
var toorlwrapper_setInterval;

function Toggle_IsShown(scrollTop, scrollTopNum) {
    var p=0,t=0;
    if (scrollTop > scrollTopNum){
        $(".PageHeader,.AppHeader").addClass("is-shown");
        p = scrollTop;
        if(t<=p){//向下滚
            $(".PageHeader, .AppHeader").addClass("is-shown");
        }else{//向上滚
            $(".PageHeader, .AppHeader").removeClass("is-shown");
        }
        setTimeout(function(){t = p;},0);
    }else {
        $(".PageHeader, .AppHeader").removeClass("is-shown");
    }
}

function RethtmlName(){
    /*return window.location.pathname.substring(window.location.pathname.lastIndexOf("/",window.location.pathname.lastIndexOf("/")-1) + 1, window.location.pathname.lastIndexOf("/"));*/
    var htmlurl = window.location.pathname.substring(window.location.pathname.lastIndexOf("/")+1,window.location.pathname.lastIndexOf("."));
    if (htmlurl === "/zhihuIDEA_war_exploded/"){
        // todo 获取页面地址有误
        htmlurl = window.location.pathname.substring(window.location.pathname.lastIndexOf("/")+1);
    }
    return htmlurl;
}



function windowScroll() {
    $(window).scroll(function() {
        /**
         * 监听滚动条高度
         * @type {*|jQuery}
         */
        var scrollTop = $(this).scrollTop();
        var windowheight = $(this).height();
        if(scrollTop > 0){
            $(".Header").addClass("is-Fixed").css({"top":"0","left":"0","width":"100%"});
            $(".Topstory").css({"margin-top":"52px"});
        }
        if(scrollTop === 0){
            $(".Header").removeClass("is-Fixed");
            $(".Topstory").css({"margin-top":"0px"});
        }

        var htmlurl = RethtmlName();
        if (htmlurl === "header" || htmlurl === "explore"){
            Toggle_IsShown(scrollTop, 65);
        }else if (htmlurl === "people"){
            Toggle_IsShown(scrollTop, 400);
        }else if (htmlurl === "question" || htmlurl === "answer"){
            Toggle_IsShown(scrollTop, 250);
        }
    });

}

/**
 * 搜索框获取焦点失去焦点
 * @param button 输入框
 * @param i 判断是否获取焦点
 * @constructor
 */
function SearchBar_toorlwrapper_IsFocus(button,i){
    if (i === 0){
        $(button).parent().parent().parent().parent().next().css({"transform":"scale(0)","margin-left": "-50px"});
        toorlwrapper_setInterval = setInterval('toorlwrapper_setIntervalF($(".SearchBar-toorlwrapper>input"))',100);
    }else {
        if ($(button).val().length <= 0){
            $(button).next().removeAttr("style");
        }
        $(button).parent().parent().parent().parent().next().removeAttr("style");
        clearInterval(toorlwrapper_setInterval);
    }
}

/**
 * 定时时间
 * @param button
 */
function toorlwrapper_setIntervalF(button) {
    if ($(button).val().length > 0){
        $(button).next().css({"color":"#fff","background-color": "#0084ff"});
    }else {
        $(button).next().css({"color":"#0084ff","background-color": "transparent"});
    }
}

$(function() {

    windowScroll();
    $(window).scrollTop($(this).scrollTop()-1);

    $(document).on("focus","input",function () {
        $(this).parent("label.Input-wrapper").addClass("is-Focus");
    }).on("blur","input",function () {
        $(this).parent("label.Input-wrapper").removeClass("is-Focus");
    });

    $(document).on("focus",".SearchBar-toorlwrapper>input",function () {
        SearchBar_toorlwrapper_IsFocus(this, 0);
        Header_HotSearchBox_IsFocus(0);
    }).on("blur",".SearchBar-toorlwrapper>input",function (){
        SearchBar_toorlwrapper_IsFocus(this, 1);
        Header_HotSearchBox_IsFocus(1);
    });

});

/**
 * 生成随机数
 * @param s
 * @returns {*}
 * @constructor
 */
function ProduceRandomNumder(s) {
    var num = parseInt(Math.random() * (10000000 - 99999999 + 10000000));
    return  s+(num>0?num*1:num*-1);
}

/**
 * 修改赞同数ajax
 * @param a
 * @param tableName
 * @param id
 */
function updateApproveNum(a,tableName,id) {
    $.post("approveNum", {
        "a": a,
        "tableName": tableName,
        "id": id
    }, function () {
    })
}