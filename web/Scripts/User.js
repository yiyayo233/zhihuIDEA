var userHeader_infos_html = "<div class=\"userHeader-infos\">\n" +
    "                                        <div class=\"userHeader-infoItem\">\n" +
    "                                            <div class=\"userHeader-iconBox\"><span style=\"display: inline-flex; align-items: center;\">​<svg class=\"Zi Zi--Company\" fill=\"currentColor\" viewBox=\"0 0 24 24\" width=\"1.2em\" height=\"1.2em\"><path d=\"M17 6.998h3.018c1.098 0 1.975.89 1.982 2.002v10a1.993 1.993 0 0 1-1.987 2H3.98A1.983 1.983 0 0 1 2 19l.009-10.003c0-1.11.873-1.999 1.971-1.999L7 7V5c.016-1.111.822-2 2-2h6c.98 0 1.86.889 2 2v1.998zM9 7h6V5.5s0-.5-.5-.5h-5c-.504 0-.5.5-.5.5V7z\" fill-rule=\"evenodd\"></path></svg></span></div>\n" +
    "                                            计算机软件\n" +
    "                                        </div>\n" +
    "                                        <div class=\"userHeader-infoItem\">\n" +
    "                                            <div class=\"userHeader-iconBox\">\n" +
    "                                                <span style=\"display: inline-flex; align-items: center;\">​<svg class=\"Zi Zi--Male\" fill=\"currentColor\" viewBox=\"0 0 24 24\" width=\"24\" height=\"24\"><path d=\"M8.025 15.641a3.5 3.5 0 1 1 4.95-4.95 3.5 3.5 0 0 1-4.95 4.95zm10.122-9.369a.759.759 0 0 0-.753-.753L13.322 5a.738.738 0 0 0-.744.744.757.757 0 0 0 .751.752l2.127.313c-.95.954-1.832 1.83-1.832 1.83a5.502 5.502 0 0 0-7.013 8.416 5.5 5.5 0 0 0 8.415-7.016l1.842-1.819.303 2.116a.758.758 0 0 0 .752.753.738.738 0 0 0 .744-.744l-.52-4.073z\" fill-rule=\"evenodd\"></path></svg></span>\n" +
    "                                            </div>\n" +
    "                                        </div>\n" +
    "                                    </div>";
var userHeader_dateItems_html = "<div class=\"userHeader-dateItems\">\n" +
    "                                        <div class=\"userHeader-dateItem\">\n" +
    "                                            <span class=\"userHeader-datetitle\">所在行业</span>\n" +
    "                                            <div class=\"userHeader-datetext\">计算机软件</div>\n" +
    "                                        </div>\n" +
    "                                        <div class=\"userHeader-dateItem\">\n" +
    "                                            <span class=\"userHeader-datetitle\">个人简介</span>\n" +
    "                                            <div class=\"userHeader-datetext\">test</div>\n" +
    "                                        </div>\n" +
    "                                    </div>";

function AuthorInfo_head_hi(){
    if ($(".AuthorInfo-badgeText").text().length <= 0){
        $(".AuthorInfo-badgeText").parent().prev().css({"height":"100%"});
    }else {
        $(".AuthorInfo-badgeText").parent().prev().css({"height":"auto"});
    }
}


$(function () {

    //查看详细按钮
    let i = 1;
    $(document).on("click",".userHeader-contentFooter>button",function () {
        if (i === 1){
            $(".userHeader-contentBody").css({"height":"86"}).html(userHeader_dateItems_html);
            $(this).html("<span style=\"display: inline-flex; align-items: center;\">​<svg class=\"Zi Zi--ArrowUp\" fill=\"currentColor\" viewBox=\"0 0 24 24\" width=\"24\" height=\"24\"><path d=\"M12 11l-3.716 3.782a.758.758 0 0 1-1.064 0 .738.738 0 0 1 0-1.052l4.249-4.512a.758.758 0 0 1 1.064 0l4.246 4.512a.738.738 0 0 1 0 1.052.757.757 0 0 1-1.063 0L12.002 11z\" fill-rule=\"evenodd\"></path></svg></span> 收起详细资料");
            i = 0;
        }else {
            $(".userHeader-contentBody").css({"height":"52"}).html(userHeader_infos_html);
            $(this).html("<span style=\"display: inline-flex; align-items: center;\">​<svg class=\"Zi Zi--ArrowDown\" fill=\"currentColor\" viewBox=\"0 0 24 24\" width=\"24\" height=\"24\"><path d=\"M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z\" fill-rule=\"evenodd\"></path></svg></span> 查看详细资料");
            i = 1;
        }
    });

    AuthorInfo_head_hi();
});