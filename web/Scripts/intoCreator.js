/*
$(function () {
    var uId = $("#user").attr("data-user-id");
    $.ajax({
        url:"creator",
        type:"post",
        data:{
            "a":"intoCreator",
            "uId":uId,
        },
        dataType:"json",
        success:function () {

        }
    });
});*/

$(".CreatorHomeAnalyticsDataItem-content.CreatorHomeAnalyticsDataItem-content--withTielt").each(function (i,obj) {
    $(this).html($(this).html().replace(/<.*?>/ig,"").substring(0,200));
})
