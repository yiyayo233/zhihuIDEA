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


/**
 * 添加回答
 * @param button
 */
function addAnswer(button) {
    var uid = $(button).attr("data-user-id");
    var text = $(button).parents(".AnswerForm-footer").prev().html();
    var questionId = $(button).attr("data-querstion-id");
    addAnswerAjax(uid,text);
}

function addAnswerAjax(uId,text) {
    $.ajax({
        url:"answer",
        data:{
            "uId":uId,
            "text":text,
            "questionId":questionId,
        },
        dataType:"JSON",
        success:function () {

        }
    })
}

