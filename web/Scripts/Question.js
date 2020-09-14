/**
 * 点赞 问题
 * @param button
 * @constructor
 */
function GoodQuestionAction_Btn_click(button) {
    var qid = $(button).attr("data-question-id");
    var num = Number($(button).attr("data-question-approveNum"));
    if ($(button).attr("class").indexOf("is-active") === -1){
        $(button).addClass("is-active");
        num++;
        updateApproveNum("+","question",qid);
    }else {
        $(button).removeClass("is-active");
        num--;
        updateApproveNum("-","question",qid);
    }
    $(button).html("<span style=\"display: inline-flex; align-items: center;\">​<svg class=\"Zi Zi--Like Button-zi\" fill=\"currentColor\" viewBox=\"0 0 24 24\" width=\"1.2em\" height=\"1.2em\"><path d=\"M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z\" fill-rule=\"evenodd\"></path></svg></span>好问题 "+num);
    $(button).attr("data-question-approveNum",num);
}


function showAddAnswer(button) {
    if ($(button).attr("class").indexOf("is-active") === -1){
        $(button).addClass("is-active");
        $(".QuestionAnswers-statusWrapper").show();
    }else {
        $(button).removeClass("is-active");
        $(".QuestionAnswers-statusWrapper").hide();
    }
}
/**
 * 添加回答
 * @param button
 */
function addAnswer(button) {
    var uid = $("#user").attr("data-user-id");
    var uname = $("#user").attr("data-user-name");
    var uchathead = $("#user").attr("data-user-chathead");
    var uintroduce = $("#user").attr("data-user-introduce");
    var text = $(".AnswerForm .ztext.Editable-content .w-e-text").html();
    var questionId = $(button).attr("data-querstion-id");
    var answerId = ProduceRandomNumder("hd");
    var dataTime = CurentTime();
    var data = dataTime.substring(0,dataTime.indexOf(" "));
    var html = $('<c:forEach var="questionPageItem" items="${questionPageList}">\n' +
        '                                            <div class="list-item">\n' +
        '                                                <div class="ConstantItem-meta">\n' +
        '                                                    <div class="AuthorInfo">\n' +
        '                                                        <div class="userLink">\n' +
        '                                                            <a href="user?userId='+ uid +'" class="userLink-link">\n' +
        '                                                                <img src="images/user/'+ uchathead +'" alt="">\n' +
        '                                                            </a>\n' +
        '                                                        </div>\n' +
        '                                                        <div class="AuthorInfo-content">\n' +
        '                                                            <div class="AuthorInfo-head">\n' +
        '                                                                <span class="AuthorInfo-name">\n' +
        '                                                                    <div class="Popover">\n' +
        '                                                                        <a href="user?userId='+ uid +'">'+ uname +'\n' +
        '                                                                        </a>\n' +
        '                                                                    </div>\n' +
        '                                                                </span>\n' +
        '                                                            </div>\n' +
        '                                                            <div class="AuthorInfo-badge">\n' +
        '                                                                <div class="AuthorInfo-badgeText">'+ uintroduce +'</div>\n' +
        '                                                            </div>\n' +
        '                                                        </div>\n' +
        '                                                    </div>\n' +
        '                                                    <div class="css-h5al4j">\n' +
        '                                                        <span>\n' +
        '                                                            <span class="Voters">\n' +
        '                                                                <button type="button" class="button">\n' +
        '                                                                    0 人赞同了该回答\n' +
        '                                                                </button>\n' +
        '                                                            </span>\n' +
        '                                                        </span>\n' +
        '                                                    </div>\n' +
        '                                                </div>\n' +
        '                                                <div class="AnswersContent AnswersContent--unescapable">\n' +
        '                                                    <div class="ConstantItem-inner">\n' +
        '                                                        <span class="ztext">\n' +
        '                                                            '+ text +'\n' +
        '                                                        </span>\n' +
        '                                                    </div>\n' +
        '                                                    <div>\n' +
        '                                                        <div class="ConstantItem-time">\n' +
        '\n' +
        '                                                            <a href="javaScript:void(0)"><span>编辑于 '+ data +'</span></a>\n' +
        '                                                        </div>\n' +
        '                                                    </div>\n' +
        '                                                    <div>\n' +
        '                                                        <div class="ContentItem-actions">\n' +
        '                                            <span>\n' +
        '                                                <button data-answer-id="'+ answerId +'" class="button VoteButton VoteButton--up"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleUp VoteButton-TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>赞同 0</button>\n' +
        '                                                <button data-answer-id="'+ answerId +'" class="button VoteButton VoteButton--down">\n' +
        '                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span></button>\n' +
        '                                            </span>\n' +
        '                                                            <button data-answer-id="${questionPageItem.answerEntity.id}" type="button" class="button ContentItem-action">\n' +
        '                                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd"></path></svg></span>\n' +
        '                                                                0 条评论\n' +
        '                                                            </button>\n' +
        '                                                            <div class="ContentItem-action">\n' +
        '                                                                <button data-answer-id="'+ answerId +'" type="button" class="button">\n' +
        '                                                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd"></path></svg></span>\n' +
        '                                                                    分享\n' +
        '                                                                </button>\n' +
        '                                                            </div>\n' +
        '                                                            <button data-answer-id="'+ answerId +'" type="button" class="button ContentItem-action">\n' +
        '                                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Star Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd"></path></svg></span>\n' +
        '                                                                收藏\n' +
        '                                                            </button>\n' +
        '                                                            <button data-answer-id="'+ answerId +'" type="button" class="button ContentItem-action">\n' +
        '                                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Heart Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2 8.437C2 5.505 4.294 3.094 7.207 3 9.243 3 11.092 4.19 12 6c.823-1.758 2.649-3 4.651-3C19.545 3 22 5.507 22 8.432 22 16.24 13.842 21 12 21 10.158 21 2 16.24 2 8.437z" fill-rule="evenodd"></path></svg></span>\n' +
        '                                                                喜欢\n' +
        '                                                            </button>\n' +
        '                                                            <div class="ContentItem-action">\n' +
        '                                                                <button type="button" class="button">\n' +
        '                                                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Dots Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" fill-rule="evenodd"></path></svg></span>\n' +
        '                                                                </button>\n' +
        '                                                            </div>\n' +
        '                                                        </div>\n' +
        '                                                    </div>\n' +
        '\n' +
        '                                                </div>\n' +
        '                                            </div>');
        $(".list-items").prepend(html);

    addAnswerAjax(answerId,uid,text,questionId);
}

function addAnswerAjax(answerId,uId,text,questionId) {
    $.ajax({
        url:"answer",
        data:{
            "a":"addAnswer",
            "answerId":answerId,
            "uId":uId,
            "text":text,
            "questionId":questionId,
        },
        dataType:"JSON",
        success:function () {

        }
    })
}

