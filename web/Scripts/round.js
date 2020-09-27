$(document).on("click",".gzTable",function () {
    var uId = $("#user").attr("data-user-id");
    var objectId = $(this).attr("data-roundtable-id");
    if ($(this).attr("class").indexOf("is-active") === -1){
        $(this).addClass("is-active").html("已关注");
        addOrDelBynamic("add",uId,objectId,"gz");
    }else {
        $(this).removeClass("is-active").html("关注圆桌");
        addOrDelBynamic("del",uId,objectId,"gz");
    }
});
$(document).on("click",".gzyz",function () {
    var uId = $("#user").attr("data-user-id");
    var objectId = $(this).attr("data-roundtable-id");
    if ($(this).attr("class").indexOf("is-active") === -1){
        $(this).addClass("is-active").html("<svg class=\"Zi Zi--CheckBubble css-15ro776\" fill=\"currentColor\" viewBox=\"0 0 24 24\" width=\"20\" height=\"20\"><path d=\"M11.158 18a.341.341 0 0 1-.067.08L8.68 20.22l-.014.012a.595.595 0 0 1-.84-.077l-.748-2.11A.348.348 0 0 1 7.046 18H6.5a3 3 0 0 1-3-3V8a3 3 0 0 1 3-3h11a3 3 0 0 1 3 3v7a3 3 0 0 1-3 3h-6.342zm3.785-9.502l-3.972 4.413-1.94-1.941a.75.75 0 0 0-1.061 1.06l2.5 2.5a.75.75 0 0 0 1.087-.028l4.5-5a.75.75 0 1 0-1.114-1.004z\" fill-rule=\"evenodd\"></path></svg>已关注");
        addOrDelBynamic("add",uId,objectId,"gz");
    }else {
        $(this).removeClass("is-active").html("<svg class=\"Zi Zi--PlusOneBubble css-15ro776\" fill=\"currentColor\" viewBox=\"0 0 24 24\" width=\"20\" height=\"20\">\n" +
            "<path d=\"M11.158 18a.341.341 0 0 1-.067.08L8.68 20.22l-.014.012a.595.595 0 0 1-.84-.077l-.748-2.11A.348.348 0 0 1 7.046 18H6.5a3 3 0 0 1-3-3V8a3 3 0 0 1 3-3h11a3 3 0 0 1 3 3v7a3 3 0 0 1-3 3h-6.342zm-.533-5.782h2.031v-1.084h-2.031V9H9.526v2.134H7.5v1.084h2.026v2.168h1.099v-2.168zM14.799 15H16V8h-1.21L13.5 9.001v1.18l1.3-.988V15z\" fill-rule=\"evenodd\">\n" +
            "</path>\n" +
            "</svg>想知道");
        addOrDelBynamic("del",uId,objectId,"gz");
    }
})