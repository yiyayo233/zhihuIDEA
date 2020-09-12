/**
 * 关闭按钮
 * @constructor
 */
function Modal_closeButtonClick(button){

    $(".ContentItem-actions>.button.ContentItem-action.is-active").html(ZbuttonHtml).removeClass("is-active")
    $(button).parents(".Modal-wrapper").animate({"opacity": "0"},300,function () {
        $(".Modal-wrapper").css({"display": "none"});
        $(".Modal").animate({"top":"50px"},200,function () {

        })

    })
}
$(document).on("click",".Modal-closeButton",function () {
    Modal_closeButtonClick(this);
});
