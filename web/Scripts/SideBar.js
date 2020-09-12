/**
 * 侧栏定位
 * */

/**
 * 调整侧栏高度
 * @param windowheight 窗体高度
 * @param scrollTop 滚动条Top
 * @param SideClassName
 * @param windowheightNums
 * @param scrollTopNums
 * @param TopNums
 */
function Side__is_Fixed(windowheight, scrollTop, SideClassName, windowheightNums, scrollTopNums, TopNums) {
    SideClassName = "." + SideClassName;
    if (windowheight > windowheightNums[0]){
        if(scrollTop > scrollTopNums[0]){
            $(SideClassName).addClass("is-Fixed").css({"top":TopNums[0]+"px"});
        }else {
            $(SideClassName).removeClass("is-Fixed");
        }
    }else if(windowheight > windowheightNums[1]){
        if(scrollTop > scrollTopNums[1]){
            $(SideClassName).addClass("is-Fixed").css({"top":TopNums[1]+"px"});
        }else {
            $(SideClassName).removeClass("is-Fixed");
        }
    }else {
        if(scrollTop > scrollTopNums[2]){
            $(SideClassName).addClass("is-Fixed").css({"top":TopNums[2]+"px"});
        }else {
            $(SideClassName).removeClass("is-Fixed");
        }
    }
}

function Side_ifHtmlName(windowheight, scrollTop) {
    var windowheightNums;
    var scrollTopNums;
    var TopNums;
    var htmlName = RethtmlName();
    if ("html" === htmlName){
        windowheightNums = [925, 690];
        scrollTopNums = [350, 550, 850];
        TopNums = [-316, -499, -805];
        Side__is_Fixed(windowheight, scrollTop, "Sticky", windowheightNums, scrollTopNums, TopNums);
    } else if ("question" === htmlName){
        windowheightNums = [925, 690];
        scrollTopNums = [581, 550, 850];
        TopNums = [-271, -607, -607];
        Side__is_Fixed(windowheight, scrollTop, "Question-sideColum-content", windowheightNums, scrollTopNums, TopNums);
    }else if ("waiting" === htmlName){
        windowheightNums = [925, 690];
        scrollTopNums = [110, 550, 627];
        TopNums = [-110, -499, -627];
        Side__is_Fixed(windowheight, scrollTop, "Sticky", windowheightNums, scrollTopNums, TopNums);
    }



}
/**
 * 开关分类标题颜色
 * */
function Topstory_sidebar_categoryTitle__ToggleColor(){
    $(".Topstory-sidebar-categoryItem .button").hover(function () {
        $(this).children(".Topstory-sidebar-categoryTitle").removeClass(
            "Topstory-sidebar-categoryTitle-Color");
    },function () {
        $(this).children(".Topstory-sidebar-categoryTitle").addClass(
            "Topstory-sidebar-categoryTitle-Color");
    });
}


$(function () {
    Topstory_sidebar_categoryTitle__ToggleColor();
});
$(window).scroll(
    function () {
        var scrollTop = $(this).scrollTop();
        var windowheight = $(this).height();

        Side_ifHtmlName(windowheight,scrollTop);
    }
).resize(
    function () {
        var scrollTop = $(this).scrollTop();
        var windowheight = $(this).height();

        Side_ifHtmlName(windowheight,scrollTop);
    }
);