/**
 * 主页内容
 * */

/**
 * 展开渲染作者信息
 * @param uId
 * @param uName
 * @param uChatHead
 * @param industry
 * @returns {string}
 * @constructor
 */
function ConstantItem_meta_html(uId,uName,uChatHead,industry) {
    var html = '<div class="ConstantItem-meta">\n' +
        '                                        <span class="userLink">\n' +
        '                                            <a class="userLink-link" href="user/'+ uId +'">\n' +
        '                                                <img src="images/user/'+ uChatHead +'" alt="">\n' +
        '                                            </a>\n' +
        '                                        </span>\n' +
        '                                    <div class="AuthorInfo-content">\n' +
        '                                        <div class="AuthorInfo-head">\n' +
        '                                                <span class="AuthorInfo-name">\n' +
        '                                                    <div class="Popover">\n' +
        '                                                        <a href="#">'+ uName +'</a>\n' +
        '                                                    </div>\n' +
        '                                                </span>\n' +
        '                                        </div>\n' +
        '                                        <div class="AuthorInfo-badge">\n' +
        '                                            <div class="AuthorInfo-badgeText">'+ industry +'</div>\n' +
        '                                        </div>\n' +
        '                                    </div>\n' +
        '                                </div>';
    return html;
}


/**
 * 渲染收起内容
 * @constructor
 */
function ContentItem_content__is_collapsed_Html(actions,text) {
    text = text.replace(/<.*?>/ig,"");
    var html = '                             <div class="ContentItem-content-inner">\n' +
        '                                            <span class="text">\n' +
        '                                                '+ text +'\n' +
        '                                           </span>\n' +
        '                                        <button class="button ContentItem-more" type="button">阅读全文\n' +
        '                                            <span style="display: inline-flex;align-items: center;">\n' +
        '                                                    ​\n' +
        '                                                    <svg class="Zi Zi--ArrowDown ContentItem-arrowIcon" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">\n' +
        '                                                        <path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path>\n' +
        '                                                    </svg>\n' +
        '                                                </span>\n' +
        '                                        </button>\n' +
        '                                    </div>\n' +
        '                                    <div class="ContentItem-actions">\n';
    html = html + actions;
/*        '                                            <span>\n' +
        '                                                <button class="button VoteButton VoteButton--up"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleUp VoteButton-TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>赞同 1234</button>\n' +
        '                                                <button class="button VoteButton VoteButton--down"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span></button>\n' +
        '                                            </span>\n' +
        '                                        <button type="button" class="button ContentItem-action">\n' +
        '                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd"></path></svg></span>\n' +
        '                                            4 条评论\n' +
        '                                        </button>\n' +
        '                                        <div class="ContentItem-action">\n' +
        '                                            <button type="button" class="button">\n' +
        '                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd"></path></svg></span>\n' +
        '                                                分享\n' +
        '                                            </button>\n' +
        '                                        </div>\n' +
        '                                        <button type="button" class="button ContentItem-action">\n' +
        '                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Star Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd"></path></svg></span>\n' +
        '                                            收藏\n' +
        '                                        </button>\n' +
        '                                        <button type="button" class="button ContentItem-action">\n' +
        '                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Heart Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2 8.437C2 5.505 4.294 3.094 7.207 3 9.243 3 11.092 4.19 12 6c.823-1.758 2.649-3 4.651-3C19.545 3 22 5.507 22 8.432 22 16.24 13.842 21 12 21 10.158 21 2 16.24 2 8.437z" fill-rule="evenodd"></path></svg></span>\n' +
        '                                            喜欢\n' +
        '                                        </button>\n' +
        '                                        <div class="ContentItem-action">\n' +
        '                                            <button type="button" class="button">\n' +
        '                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Dots Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" fill-rule="evenodd"></path></svg></span>\n' +
        '                                            </button>\n' +*/
        html = html +'                                        </div>\n' +
        '                                    </div>\n';

    return html;
}

/**
 * 渲染展开内容
 * @param actions   工具栏
 * @returns {string}
 * @constructor
 */

function ContentItem_content_Html(actions,text,approveNum,editTime) {
    editTime = editTime.substring(0,editTime.indexOf(" "));
    var html = '<div class="ConstantItem-voters">\n' +
        '                                        <sqan>\n' +
        '                                            <sqan class="Voters">\n' +
        '                                                <button type="button" class="button">\n' +
        '                                                    '+ approveNum +' 人\n' +
        '                                                    赞同了该回答\n' +
        '                                                </button>\n' +
        '                                            </sqan>\n' +
        '                                        </sqan>\n' +
        '                                    </div>\n' +
        '                                    <div class="ConstantItem-inner">\n' +
        '                                        <span class="ztext">\n' +
        '                                               '+ text +'\n' +
        '                                        </span>\n' +
        '                                    </div>\n' +
        '                                    <div>\n' +
        '                                        <div class="ConstantItem-time">\n' +
        '                                            <a href="#"><span>编辑于 '+ editTime +'</span></a>\n' +
        '                                        </div>\n' +
        '                                    </div>\n' +
        '                                    <div>\n' +
        '                                        <div class="ContentItem-actions is-Fixed">\n';

    html = html + actions + CollapsdButton;

    html = html + '                                        </div>\n' +
        '                                    </div>';

    return html;
}

var tiemhtml = "<div>\n" +
    "               <div class=\"ConstantItem-time\">\n" +
    "                   <a href=\"#\"><span>编辑于 06-14</span></a>\n" +
    "               </div>\n" +
    "           </div> ";

var AnswersContent_buttonhtml = "\n" +
    "                                                <button type=\"button\" class=\"button\">\n" +
    "                                                    展开阅读全文\n" +
    "                                                    <span style=\"display: inline-flex; align-items: center;\">​<svg class=\"Zi Zi--ArrowDown ContentItem-arrowIcon\" fill=\"currentColor\" viewBox=\"0 0 24 24\" width=\"24\" height=\"24\"><path d=\"M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z\" fill-rule=\"evenodd\"></path></svg></span>\n" +
    "                                                </button>";
/**
 * 收起按钮
 * @type {string}
 */
var CollapsdButton = "<button type=\"button\" class=\"button Button--plain\">\n" +
    "                                                            <span>收起</span>\n" +
    "                                                            <span style=\"display: inline-flex;align-items: center;\">​<svg class=\"Zi Zi--ArrowDown ContentItem-arrowIcon is-active\" fill=\"currentColor\" viewBox=\"0 0 24 24\" width=\"24\" height=\"24\"><path d=\"M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z\" fill-rule=\"evenodd\"></path></svg></span>\n" +
    "                                                        </button>";

/**
 * 保存文章收起内容
 */
var ContentItem_content_inner;
/**
 * 保存文章收起菜单
 */
var ContentItem_actions;


/**
 * 主页展开
 * @constructor
 */
function ContentItem_content_inner_link(){
    $(document).on("click",".ContentItem-content-inner,.ContentItem-content-cover",function () {

        var actions = $(this).siblings(".ContentItem-actions").html();
        ContentItem_content_inner = $(this).parent().html();
        ContentItem_actions = $(this).parent().find(".ContentItem-actions").html();
        if (RethtmlName().indexOf("qwer") != -1){
            if ($(this).attr("class").indexOf("ContentItem-content-inner") !== -1 || $(this).attr("class").indexOf("ContentItem-content-cover") !== -1) {
                var parent = $(this).parent().parent().parent();
                ContentItemScroll(parent);
                // $(this).parent().removeClass("is-collapsed").html(ContentItem_content_Html(actions)).before(ConstantItem_meta_html);
                var index;
                var item = $(this).parents(".TopstoryItem").index();
                $(".ContentItem-content-inner").each(function (i, obj) {
                    console.log($(item == i));
                    if (item == i) {
                        index = i;
                    }
                })

                var industry;
                var id = $(this).parent().attr("data-user-id");
                $.ajax({
                    url: "header",
                    type: "post",
                    async: false,
                    data: {"a": "userIndustry", "id": id},
                    dataType: "json",
                    success: function (result) {
                        console.info(result);
                        //TODO 获取对象的值
                        industry = result.industry;
                    }
                });
                $(this).parent().removeClass("is-collapsed").html(ContentItem_content_Html(
                    actions,
                    questionItems[index].answerEntity.answerContent,
                    questionItems[index].answerEntity.approveNum,
                    questionItems[index].answerEntity.editTime)
                ).before(ConstantItem_meta_html(questionItems[index].userEntity.id, questionItems[index].userEntity.name, questionItems[index].userEntity.chatHead, industry));
            }
        }else if (RethtmlName().indexOf("people") !== -1){
            var parent = $(this).parent().parent().parent();
            ContentItemScroll(parent);
            var button = $(this);
            var id = $(button).parent().attr("data-answer-id");
            $.ajax({
                url: "answer",
                type: "post",
                data: {"a": "answerItem", "answerId": id},
                dataType: "json",
                success: function (result) {
                    console.info(result);
                    var editTime = result.editTime;
                    editTime = editTime.substring(0,editTime.indexOf(" "));
                    var html = '<div class="ConstantItem-inner">\n' +
                        '                                        <span class="ztext">\n' +
                        '                                               '+result.answerContent+'\n' +
                        '                                        </span>\n' +
                        '                                    </div>' +
                        '                                    <div>\n' +
                        '                                        <div class="ConstantItem-time">\n' +
                        '                                            <a href="#"><span>编辑于 '+ editTime +'</span></a>\n' +
                        '                                        </div>\n' +
                        '                                    </div>' +
                    '                                        <div>\n' +
                    '                                        <div class="ContentItem-actions is-Fixed">\n';
                    html = html + actions + CollapsdButton;
                    html = html + '                                        </div>\n' +
                        '                                    </div>';
                    $(button).parent().removeClass("is-collapsed").html(html);
                }
            });
        }
    });
}

/**
 * 主页、用户页收起
 * @param button 被点击的收起按钮
 * @constructor
 */
function Button_plain_link (button) {
    console.log("Button_plain_link");
    var actions = $(button).parent().html().substr(0,$(button).parent().html().indexOf("<button type=\"button\" class=\"button Button--plain\">"));
    if (RethtmlName().indexOf("qwer") != -1){
        var index;
        var ContentItem_content = $(button).parents(".TopstoryItem");
        var num=$(ContentItem_content).index();

        $(".ContentItem-content").each(function (i,obj) {
            if (num==i){
                index = i;
                console.log(index)
            }
        })

        $(button).parent().parent().parent().addClass("is-collapsed").html(ContentItem_content__is_collapsed_Html(actions,questionItems[index].answerEntity.answerContent)).parent().find(".ConstantItem-meta").remove();
    }else if(RethtmlName().indexOf("people") !== -1){
        $(button).parents(".ContentItem-content").addClass("is-collapsed").html(ContentItem_content_inner);
        $(button).parents(".ContentItem-content").find(".ContentItem-actions").html(actions);
    }
    }

/**
 * 按钮菜单 浮动
 * @param Content
 * @constructor
 */
function ContentItemScroll(Content) {
    console.log(console)
    $(window).scroll(function () {
        var scrollTop = $(this).scrollTop();

        var contentOffTop = $(Content).offset().top;
        var contentHeigth = Content.height();
        if (contentOffTop + 50 < scrollTop){
            $(Content).find(".ContentItem-actions").addClass("is-Fixed");
        }else {

            $(Content).find(".ContentItem-actions").removeClass("is-Fixed");
        }
        /*if ($(Content).offset().top + Content.innerHeight() - 452-(50*(Content.index()+1)) < scrollTop){
            $(Content).find(".ContentItem-actions").removeClass("is-Fixed");
            //alert("2323");
            console.log($(Content).offset().top+"+"+Content.innerHeight()+"-"+(50*(Content.index()+1))+"-"+(Content.index()+1)+"-----"+(($(Content).offset().top) + Content.height()));
        }*/

        if (contentOffTop + contentHeigth - 1000 < scrollTop){
            $(Content).find(".ContentItem-actions").removeClass("is-Fixed");
            //alert("2323");
            // console.log($(Content).offset().top+"+"+Content.height()+"<"+(scrollTop-1000)+"-"+(50*(Content.index()+1))+"-"+(Content.index()+1)+"-----"+(($(Content).offset().top) + Content.height()));
        }

    });
}

/**
 * 收起回答
 * @param button 被点击的收起按钮
 */
function question_isCollapsed(button) {
    $(button).parent().removeClass("is-Fixed").parent().prev().prev().css({"max-height":"400px"}).parent().addClass("is-collapsed");
    $(button).parent().parent().prev().remove();
    $(button).parent().parent().before(AnswersContent_buttonhtml);

    $(button).remove();

}

/**
 * 展开回答
 * @param button 被点击的展开按钮、文章内容
 */
function questionCollapse(button){
    var buttonName = $(button).attr("class");
    if ("ConstantItem-inner" === buttonName){

        $(button).css("max-height","none").parent().removeClass("is-collapsed");
    }
    $(button).next().remove();
    $(button).after(tiemhtml);
    $(button).next().next().find(".ContentItem-actions").append(CollapsdButton);

    var htmls = $(button).parents();
    for (let i = 0; i < htmls.length ; i++) {
        if (htmls[i].className === "Card AnswersBox"){
            $(button).next().next().find(".ContentItem-actions").addClass("is-Fixed");
        }
    }
}

/**
 * 获取赞同数
 * @param button
 * @returns {number}
 */
function getNumdrer(button) {
    var numTextarr = $(button).text().split(' ');
    var index = numTextarr.length;
    var number = numTextarr[numTextarr.length-1];
    if (number.indexOf(',') !== -1){
        number = number.split(',').join('');
    }
    return  parseInt(number);
}

/**
 * 赞同切换
 * @param button
 * @constructor
 */
function VoteButtom_IsActive(button){
    var uId = $("#user").attr("data-user-id");
    var id = $(button).attr("data-answer-id");
    var text = "<span style=\"display: inline-flex; align-items: center;\">​<svg class=\"Zi Zi--TriangleUp VoteButton-TriangleUp\" fill=\"currentColor\" viewBox=\"0 0 24 24\" width=\"10\" height=\"10\"><path d=\"M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z\" fill-rule=\"evenodd\"></path></svg></span>";
    if ($(button).attr("class").indexOf("VoteButton--up") !== -1){
        var button_down = $(button).next();
        $(button_down).removeClass("is-active");
        if ($(button).attr("class").indexOf("is-active") === -1){
            $(button).addClass("is-active");

            text = text + "已赞同 " + (getNumdrer(button)+1);

            updateApproveNum("+","answer",id);
            //todo 动态表添加动态
            addOrDelBynamic("add",uId,id,"zt");
        }else {
            $(button).removeClass("is-active");
            text = text + "赞同 " + (getNumdrer(button)-1);
            updateApproveNum("-","answer",id);
            addOrDelBynamic("del",uId,id,"zt");
        }
        $(button).html(text);
    }else {
        var button_up = $(button).prev();
        if ($(button_up).attr("class").indexOf("is-active") !== -1){
            $(button_up).removeClass("is-active");
            text = text + "赞同 " + (getNumdrer(button_up)-1);

            $(button_up).html(text);
        }
        if ($(button).attr("class").indexOf("is-active") === -1){
            $(button).addClass("is-active");
            updateApproveNum("-","answer",id);
            addOrDelBynamic("del",uId,id,"zt");
        }else {
            $(button).removeClass("is-active");
            updateApproveNum("+","answer",id);
            addOrDelBynamic("add",uId,id,"zt");
        }
    }

}

var ZbuttonHtml = '';

/**
 * 弹出评论框
 * @param button
 */
function addComments(button){
    initComment(button);
    var buttonHtml = '<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd"></path></svg></span>关闭评论';
    ZbuttonHtml = $(button).html();
    $(button).html(buttonHtml).addClass("is-active");
    // 还要 渲染 评论框
    $(".Modal-wrapper").eq(0).css({"display": "flex"});
    $(".Modal-wrapper").eq(0).animate({"opacity": "1"},300,function () {
        $(".Modal").eq(0).animate({"top":"20px"},20,function () {

        })
    })

}

$(function () {
    ContentItem_content_inner_link();
    $(document).on("click",".ContentItem-actions .Button--plain",function (){
        var htmlname = RethtmlName();
        console.log(htmlname);
        if ("people" === htmlname || "html" === htmlname || "qwer" === htmlname){
            Button_plain_link(this);
        }else if ("question" === htmlname || "answer" === htmlname){
            question_isCollapsed(this);
        }
    });
    $(document).on("click", ".AnswersContent.is-collapsed .ConstantItem-inner, .AnswersContent.is-collapsed>.button", function () {
        var htmlname = RethtmlName();
        console.log(htmlname)
        if ("people" === htmlname || "html" === htmlname){
        }else if ("question" === htmlname || "answer" === htmlname){
            questionCollapse(this);
        }
    });
    $(document).on("click",".VoteButton",function () {
        VoteButtom_IsActive(this);
    });
    /* 展开评论 */
    $(document).on("click",".ContentItem-actions>.button.ContentItem-action:nth-child(2)",function () {
        addComments(this);
    });
});
