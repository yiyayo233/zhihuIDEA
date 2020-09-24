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

/**
 * 获取html的名字
 * @returns {string}
 * @constructor
 */
function RethtmlName(){
    /*return window.location.pathname.substring(window.location.pathname.lastIndexOf("/",window.location.pathname.lastIndexOf("/")-1) + 1, window.location.pathname.lastIndexOf("/"));*/
    var htmlurl = window.location.pathname.substring(window.location.pathname.lastIndexOf("/")+1,window.location.pathname.lastIndexOf("."));
    if (htmlurl === "/zhihuIDEA_war_exploded/"){
        htmlurl = window.location.pathname.substring(window.location.pathname.lastIndexOf("/")+1);
    }
    if (htmlurl === ""){
        htmlurl = "qwer";
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

    $(document).on("click",".SearchBar .Button-blue",function () {
        AddQuestion(this);
    });

    $(document).on("click",".AppHeader-profile .button",function () {
        if ($(this).next().length == 0){
            $(this).after('<div class="AppHeaderProfileMenu-container AppHeaderProfileMenu-container-fixed" style="right: 405px;">\n' +
                '                    <span class="Popover-arrow"></span>\n' +
                '                    <div class="AppHeaderProfileMenu">\n' +
                '                        <a href="people" class="button Manu-Item AppHeaderProfileMenu-item button--plain">\n' +
                '                            <svg class="Zi Zi--Profile" fill="currentColor" viewBox="0 0 24 24" width="16" height="16"><path d="M15.417 12.923c-.376.653-.837 1.281-.763 1.863.292 2.273 5.562 1.77 6.78 3.048.566.595.566.664.566 4.164-6.611-.07-13.363 0-20 0 .027-3.5 0-3.478.62-4.164 1.303-1.44 6.581-.715 6.78-3.133.045-.545-.38-1.114-.763-1.778C6.511 9.233 5.697 2 12 2s5.422 7.443 3.417 10.923z" fill-rule="evenodd"></path></svg>\n' +
                '                            我的主页\n' +
                '                        </a>\n' +
                '                        <a href="creator/analytics" class="button Manu-Item AppHeaderProfileMenu-item button--plain">\n' +
                '                            <svg class="Zi Zi--Creator" fill="currentColor" viewBox="0 0 24 24" width="16" height="16"><path d="M15.075 15.388l-3.024 3.024a4.041 4.041 0 0 0-1.014 1.697l-.26.868C7.844 20.986 4.91 21 2 21c.026-3.325 0-3.304.59-3.956 1.237-1.368 6.251-.68 6.44-2.976.043-.518-.36-1.06-.725-1.69C6.285 8.87 5.512 2 11.5 2c5.988 0 5.15 7.072 3.246 10.378-.357.62-.795 1.217-.724 1.77.073.571.477.958 1.053 1.24zm5.402 1.672c.523.55.523.646.523 3.94a535.11 535.11 0 0 0-4.434-.028l3.911-3.912zm-7.88 2.699c.111-.37.312-.705.584-.978l4.76-4.76a.291.291 0 0 1 .412 0l1.626 1.626a.291.291 0 0 1 0 .411l-4.76 4.76c-.272.273-.608.474-.978.585l-1.96.588a.219.219 0 0 1-.272-.272l.589-1.96zm9.157-6.742a.839.839 0 0 1 0 1.187l-.94.94a.28.28 0 0 1-.395 0l-1.563-1.563a.28.28 0 0 1 0-.395l.94-.94a.839.839 0 0 1 1.187 0l.771.771z" fill-rule="evenodd"></path></svg>\n' +
                '                            创作中心\n' +
                '                        </a>\n' +
                '                        <a href="signin?a=exit" class="button Manu-Item AppHeaderProfileMenu-item button--plain">\n' +
                '                            <svg class="Zi Zi--Logout" fill="currentColor" viewBox="0 0 24 24" width="16" height="16"><path d="M2 11.999c0-2.756 1.154-5.417 3.167-7.3a1.266 1.266 0 0 1 1.73 1.847 7.396 7.396 0 0 0-2.367 5.453c0 4.119 3.35 7.47 7.47 7.47 4.119 0 7.47-3.351 7.47-7.47a7.41 7.41 0 0 0-2.279-5.37 1.266 1.266 0 0 1 1.76-1.819A9.923 9.923 0 0 1 22 12c0 5.513-4.486 10-10 10s-10-4.487-10-10zm8.699-.482V3.26a1.26 1.26 0 1 1 2.52 0v8.257a1.26 1.26 0 1 1-2.52 0z" fill-rule="evenodd"></path></svg>\n' +
                '                            退出\n' +
                '                        </a>\n' +
                '                    </div>\n' +
                '                </div>');
        }else {
            $(this).next().remove();
        }
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

/**
 * 获取日期时间
 * @returns {string}
 * @constructor
 */
function CurentTime()
{
    var now = new Date();

    var year = now.getFullYear();       //年
    var month = now.getMonth() + 1;     //月
    var day = now.getDate();            //日

    var hh = now.getHours();            //时
    var mm = now.getMinutes();          //分

    var clock = year + "-";

    if(month < 10)
        clock += "0";

    clock += month + "-";

    if(day < 10)
        clock += "0";

    clock += day + " ";

    if(hh < 10)
        clock += "0";

    clock += hh + ":";
    if (mm < 10) clock += '0';
    clock += mm;
    return(clock);
}

/**
 * 显示提问框
 */
function AddQuestion(button) {
    $(".Modal-wrapper").eq(1).css({"display": "flex"});
    $(".Modal-wrapper").eq(1).animate({"opacity": "1"},300,function () {
        $(".Modal").eq(1).animate({"top":"20px"},20,function () {

        })
    })
}

/**
 * 添加问题
 * @param uId
 * @param title
 * @param text
 */
function addQuestion(button){
    var uid = $("#user").attr("data-user-id");
    var title = $(button).parents(".Ask-footer").prev().find(".Popover textarea").val();
    var text = $(button).parents(".Ask-footer").prev().find(".InputLike.AskDetail-input textarea").val();
    if (title.length <= 0){
        $(".AskFieldTip").text("请输入问题");
    }else {
        addQuestionajax(uid,title,text);
    }
}

/**
 * 添加问题Ajax
 * @param uId
 * @param title
 * @param text
 */
function addQuestionajax(uId,title,text){
    $.ajax({
        url: "question",
        data: {
            "a": "addQuestion",
            "uId": uId,
            "title": title,
            "text": text,
        },
        success: function (result) {
            console.log(result);
            window.open("question?questionId="+ result + "","_blank");
        }
    })
}

/**
 * 添加或删除动态
 * @param addOrDel
 * @param uid
 * @param byBynamicId
 * @param BynamicType
 */
function addOrDelBynamic(addOrDel,uId,byBynamicId,BynamicType) {
    $.ajax({
        url: "bynamic",
        data: {
            "a": addOrDel,
            "uId": uId,
            "byBynamicId": byBynamicId,
            "BynamicType": BynamicType,
        },
        dataType: "JSON",
        success: function () {

        }
    })
}