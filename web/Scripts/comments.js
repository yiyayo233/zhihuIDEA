/**
 * 渲染回复框
 * @constructor
 */
function CommentItem_editor(name){
    name = name.replace(/(^\s*)|(\s*$)/g, "");
    var html = $('<div class="CommentItem-editor">\n' +
        '    <div class="CommentEditor-inputWrap">\n' +
        '        <div class="InputLike CommentEditor-input Editable">\n' +
        '            <div class="CommentEditor-input-content Editable-content ztext">\n' +
        '                <input type="text" placeholder="回复'+name+'">\n' +
        '            </div>\n' +
        '        </div>\n' +
        '    </div>\n' +
        '    <button class="button CommentEditor-singleButton" type="button">发布</button>\n' +
        '</div>')
    // $("<input type='text' placeholder='回复{name}'/>")
    /*var html = '<div class="CommentItem-editor">\n' +
        '           <div class="CommentEditor-inputWrap">\n' +
        '               <div class="InputLike CommentEditor-input Editable">\n' +
        '                   <div class="CommentEditor-input-content Editable-content ztext">\n' +
        '                       <input type="text" placeholder="回复';
    html = html + name +'">\n' +
        '                   </div>\n' +
        '               </div>\n' +
        '           </div>\n' +
        '           <button class="button CommentEditor-singleButton" type="button">发布</button>\n' +
        '       </div>';
    */
    return html;
}

/**
 * 单击回复按钮
 * @param button
 * @constructor
 */
function CommentItem_footer_buttonChild2(button){
    if ($(button).attr("class").indexOf("button--hoverBtn") === -1){
        $(button).addClass("button--hoverBtn").html('<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z" fill-rule="evenodd"></path></svg></span>\n回复').next().addClass("button--hoverBtn");
        $(button).parent().next().remove();

    }else {
        $(button).removeClass("button--hoverBtn").html('<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z" fill-rule="evenodd"></path></svg></span>\n取消回复').next().removeClass("button--hoverBtn");
        var name = $(button).parent().parent().prev().find(".UserLink:nth-child(2)>.UserLink-link").text();
        $(button).parent().after(CommentItem_editor(name));

    }
}

/**
 * 渲染评论
 * @param chatHead
 * @param name
 * @param receiveName
 * @param text
 * @param tiem
 * @returns {jQuery|HTMLElement}
 * @constructor
 */
function RenderComment(commentreplyRId,commentId,uid,uname,uChatHead,ruId,ruName,text,time) {
    var html;
    if (commentreplyRId !== "commentreplyRId"){
        html = $('<li class="NestComment-child">\n' +
            '        <div class="CommentItem">\n' +
            '            <div>\n' +
            '                <div class="CommentItem-meta">\n' +
            '                    <span class="UserLink CommentItem-avatar">\n' +
            '                        <a href="user/'+ uid +'" class="UserLink-link">\n' +
            '                            <img width="24" height="24"\n' +
            '                                 src="images/user/'+uChatHead+'"\n' +
            '                                 alt=""/>\n' +
            '                        </a>\n' +
            '                    </span>\n' +
            '                    <span class="UserLink">\n' +
            '                        <a class="UserLink-link" href="user/'+ uid +'">' + uname + '</a>\n' +
            '                    </span>\n' +
            '                    <span class="CommentItem-reply">回复</span>\n' +
            '                    <span class="UserLink">\n' +
            '                        <a class="UserLink-link" href="user/'+ruId+'">'+ ruName +'</a>\n' +
            '                    </span>\n' +
            '                    <span class="CommentItem-time">\n' +
            '                        '+ time +'\n' +
            '                    </span>\n' +
            '                </div>\n' +
            '                <div class="CommentTiem-metaSibling">\n' +
            '                    <div class="CommentRichText CommentItem-content">\n' +
            '                        <div class="ztext">\n' +
            '                            <p>'+ text +'</p>\n' +
            '                        </div>\n' +
            '                    </div>\n' +
            '                    <div class="CommentItem-footer">\n' +
            '                        <button approvenum="0" data-commentreply-rid="'+ commentreplyRId +'" data-commentreply-id="'+ commentId +'" class="button button--likeBtn" type="button">\n' +
            '                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like"\n' +
            '                                                                                           fill="currentColor"\n' +
            '                                                                                           viewBox="0 0 24 24"\n' +
            '                                                                                           width="16" height="16"\n' +
            '                                                                                           style="margin-right: 5px;"><path\n' +
            '                                d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z"\n' +
            '                                fill-rule="evenodd"></path></svg></span>\n' +
            '                            0\n' +
            '                        </button>\n' +
            '                        <button data-commentreply-rid="'+ commentreplyRId +'" data-commentreply-id="'+ commentId +'" class="button button--hoverBtn" type="button">\n' +
            '                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply"\n' +
            '                                                                                           fill="currentColor"\n' +
            '                                                                                           viewBox="0 0 24 24"\n' +
            '                                                                                           width="16" height="16"\n' +
            '                                                                                           style="margin-right: 5px;"><path\n' +
            '                                d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z"\n' +
            '                                fill-rule="evenodd"></path></svg></span>\n' +
            '                            回复\n' +
            '                        </button>\n' +
            '                        <button class="button button--hoverBtn" type="button">\n' +
            '                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like"\n' +
            '                                                                                           fill="currentColor"\n' +
            '                                                                                           viewBox="0 0 24 24"\n' +
            '                                                                                           width="16" height="16"\n' +
            '                                                                                           style="transform: rotate(180deg); margin-right: 5px;"><path\n' +
            '                                d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z"\n' +
            '                                fill-rule="evenodd"></path></svg></span>\n' +
            '                            踩\n' +
            '                        </button>\n' +
            '                        <button class="button button--hoverBtn" type="button">\n' +
            '                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Report"\n' +
            '                                                                                           fill="currentColor"\n' +
            '                                                                                           viewBox="0 0 24 24"\n' +
            '                                                                                           width="16" height="16"\n' +
            '                                                                                           style="margin-right: 5px;"><path\n' +
            '                                d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z"\n' +
            '                                fill-rule="evenodd"></path></svg></span>\n' +
            '                            举报\n' +
            '                        </button>\n' +
            '                    </div>\n' +
            '                </div>\n' +
            '            </div>\n' +
            '        </div>\n' +
            '    </li>');
    }else {
        html = $('<ul class="NestComment">' +
            '<li class="NestComment-rootComment">\n' +
            '        <div class="CommentItem">\n' +
            '            <div>\n' +
            '                <div class="CommentItem-meta">\n' +
            '                    <span class="UserLink CommentItem-avatar">\n' +
            '                        <a href="user/'+ uid +'" class="UserLink-link">\n' +
            '                            <img width="24" height="24"\n' +
            '                                 src="images/user/'+uChatHead+'"\n' +
            '                                 alt=""/>\n' +
            '                        </a>\n' +
            '                    </span>\n' +
            '                    <span class="UserLink">\n' +
            '                        <a href="user/'+ uid +'" class="UserLink-link">' + uname + '</a>\n' +
            '                    </span>\n' +
            '                    <span class="CommentItem-time">\n' +
            '                        '+ time +'\n' +
            '                    </span>\n' +
            '                </div>\n' +
            '                <div class="CommentTiem-metaSibling">\n' +
            '                    <div class="CommentRichText CommentItem-content">\n' +
            '                        <div class="ztext">\n' +
            '                            <p>'+ text +'</p>\n' +
            '                        </div>\n' +
            '                    </div>\n' +
            '                    <div class="CommentItem-footer">\n' +
            '                        <button approvenum="0" data-comment-id="'+ commentId +'" data-commentreply-id="'+ commentId +'" class="button button--likeBtn" type="button">\n' +
            '                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like"\n' +
            '                                                                                           fill="currentColor"\n' +
            '                                                                                           viewBox="0 0 24 24"\n' +
            '                                                                                           width="16" height="16"\n' +
            '                                                                                           style="margin-right: 5px;"><path\n' +
            '                                d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z"\n' +
            '                                fill-rule="evenodd"></path></svg></span>\n' +
            '                            0\n' +
            '                        </button>\n' +
            '                        <button data-comment-id="'+ commentId +'" data-commentreply-id="'+ commentId +'" class="button button--hoverBtn" type="button">\n' +
            '                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply"\n' +
            '                                                                                           fill="currentColor"\n' +
            '                                                                                           viewBox="0 0 24 24"\n' +
            '                                                                                           width="16" height="16"\n' +
            '                                                                                           style="margin-right: 5px;"><path\n' +
            '                                d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z"\n' +
            '                                fill-rule="evenodd"></path></svg></span>\n' +
            '                            回复\n' +
            '                        </button>\n' +
            '                        <button class="button button--hoverBtn" type="button">\n' +
            '                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like"\n' +
            '                                                                                           fill="currentColor"\n' +
            '                                                                                           viewBox="0 0 24 24"\n' +
            '                                                                                           width="16" height="16"\n' +
            '                                                                                           style="transform: rotate(180deg); margin-right: 5px;"><path\n' +
            '                                d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z"\n' +
            '                                fill-rule="evenodd"></path></svg></span>\n' +
            '                            踩\n' +
            '                        </button>\n' +
            '                        <button class="button button--hoverBtn" type="button">\n' +
            '                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Report"\n' +
            '                                                                                           fill="currentColor"\n' +
            '                                                                                           viewBox="0 0 24 24"\n' +
            '                                                                                           width="16" height="16"\n' +
            '                                                                                           style="margin-right: 5px;"><path\n' +
            '                                d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z"\n' +
            '                                fill-rule="evenodd"></path></svg></span>\n' +
            '                            举报\n' +
            '                        </button>\n' +
            '                    </div>\n' +
            '                </div>\n' +
            '            </div>\n' +
            '        </div>\n' +
            '    </li>' +
            '</ul>');
    }


    return html;
}



/**
 * 发评论
 * @param button
 * @constructor
 */
function AddComment(button){
    var text = $(button).prev().find("input").val();
    if (text.length > 0){
        var num = parseInt(Math.random() * (10000000 - 99999999 + 10000000));
        var commentreplyRId = "pr"+(num>0?num*1:num*-1);
        num = parseInt(Math.random() * (10000000 - 99999999 + 10000000));
        var commentId = "pl"+(num>0?num*1:num*-1);

        var uid = $("#user").attr("data-user-id");
        var uname = $("#user").attr("data-user-name");
        var uChatHead = $("#user").attr("data-user-chathead");


        var dataTiem = CurentTime();
        var data = dataTiem.substring(0,dataTiem.indexOf(" "));
        var time = dataTiem.substring(dataTiem.indexOf(" ",dataTiem.lastIndexOf(".")));

        if ($(button).parent().attr("class").indexOf("Commens-footer") === -1){
            var ruName = $(button).parents(".CommentTiem-metaSibling").prev().find(".UserLink:nth-child(2)>.UserLink-link").text();
            var ruId = $(button).parents(".CommentTiem-metaSibling").prev().find(".UserLink:nth-child(2)>.UserLink-link").attr("href").substring($(button).parents(".CommentTiem-metaSibling").prev().find(".UserLink:nth-child(2)>.UserLink-link").attr("href").lastIndexOf("/")+1);
            commentId = $(button).parents(".CommentItem-editor").prev().find(".button:nth-child(1)").attr("data-commentreply-id");
            if (commentId == undefined){
                commentId = $(button).parents(".CommentItem-editor").prev().find(".button:nth-child(1)").attr("data-comment-id");
            }

            $(button).parents(".NestComment-child,.NestComment-rootComment").after(
                RenderComment(commentreplyRId,commentId,uid,uname,uChatHead,ruId,ruName,text,time)
            );
            AddCommentAjax(commentreplyRId,commentId,uid,ruId,text,dataTiem,"answerId","affiliationId");
            $(button).prev().find("[type='text']").val("");
        }else {
            var answerId = $(".CommentTopbar").attr("data-answer-id");
            var affiliationId = answerId;
            $(button).parents(".Commens-footer.CommentItem-normal").parent().prev().append(
                RenderComment("commentreplyRId",commentId,uid,uname,uChatHead,"ruId","ruName",text,time)
            );
            AddCommentAjax(-1,commentId,uid,"",text,dataTiem,answerId,affiliationId);
            $(button).prev().find("[type='text']").val("");
        }
    }else {
        alert("请先输入内容");
    }

}

/**
 * 发评论ajax
 * @param commentreplyRId
 * @param commentId
 * @param uid
 * @param ruId
 * @param text
 * @param dataTiem
 * @param answerId
 * @param affiliationId
 * @constructor
 */
function AddCommentAjax(commentreplyRId,commentId,uid,ruId,text,dataTiem,answerId,affiliationId) {
    if (commentreplyRId == -1) {
        $.post("comment", {
            "a": "comment",
            "commentId": commentId,
            "answerId": answerId,
            "uid": uid,
            "affiliationId": affiliationId,
            "text": text,
            "approveNum": 0,
            "commentTime": dataTiem
        }, function () {

        })
    }else {
        $.post("comment", {
            "a": "commentReply",
            "commentreplyRId": commentreplyRId,
            "commentId": commentId,
            "uid": uid,
            "ruId": ruId,
            "text": text,
            "approveNum": 0,
            "commentTime": dataTiem
        }, function () {

        })
    }



}

/**
 * 评论点赞
 * @constructor
 */
function LikebuttonLikeBtn(button){
    var svg = "<span style=\"display: inline-flex; align-items: center;\">​<svg class=\"Zi Zi--Like\" fill=\"currentColor\" viewBox=\"0 0 24 24\" width=\"16\" height=\"16\" style=\"margin-right: 5px;\"><path d=\"M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z\" fill-rule=\"evenodd\"></path></svg></span>";
    var num = Number($(button).attr("approveNum"));
    if ($(button).attr("class").indexOf("is-link") == -1){
        $(button).addClass("is-link");
        num++;
        if ($(button).attr("data-commentreply-rid") != undefined) {
            $.post("approveNum", {
                "a": "+",
                "tableName": "commentreply",
                "id": $(button).attr("data-commentreply-rid")
            }, function () {

            })
        }else {
            $.post("approveNum", {
                "a": "+",
                "tableName": "comment",
                "id": $(button).attr("data-comment-id")
            }, function () {

            })
        }

    }else {
        $(button).removeClass("is-link");
        num--;
        if ($(button).attr("data-commentreply-rid") != undefined) {
            $.post("approveNum", {
                "a": "-",
                "tableName": "commentreply",
                "id": $(button).attr("data-commentreply-rid")
            }, function () {

            })
        }else {
            $.post("approveNum", {
                "a": "-",
                "tableName": "comment",
                "id": $(button).attr("data-comment-id")
            }, function () {

            })
        }
    }
    $(button).html(svg+num).attr("approveNum",num);

}

$(function () {
    $(document).on("mouseover",".NestComment-rootComment,.NestComment-child",function () {

        $(this).find(".button.button--hoverBtn").css({"opacity":"1"});
    });
    $(document).on("mouseout",".NestComment-rootComment,.NestComment-child",function () {

        $(this).find(".button.button--hoverBtn").css({"opacity":"0"});
    });

    $(document).on("click",".CommentItem-footer>button:nth-child(2)",function () {
        CommentItem_footer_buttonChild2(this);
    });

    $(document).on("click",".CommentEditor-singleButton",function () {
        AddComment(this);
    });

    $(document).on("click",".CommentItem-footer .button--likeBtn",function () {
        LikebuttonLikeBtn(this);
    });
})
