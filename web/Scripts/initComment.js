/**
 * 初始化(渲染)评论框
 * @param button
 */
function initComment(button) {
    var myDate = new Date();
    var date = myDate.getFullYear()+"-"+myDate.getMonth()+1+"-"+myDate.getDate();

    $(".CommentTopbar .Topbar-title").text("0 条评论");
    $(".CommentTopbar").attr("data-answer-Id",$(button).attr("data-answer-id"));

    console.info($(button).attr("data-answer-id"));
    $.ajax({
        url:"comment",
        type:"post",
        data:{"a":"Comment","affiliationId":$(button).attr("data-answer-id")},
        dataType:"json",
        success:function (result) {
            console.info(result);
            var div = $("<div></div>")

            var commentNum = 0;
            $.each(result,function (i,obj) {
                commentNum++;
                var userId = obj.userEntity.id;
                var chatHead = obj.userEntity.chatHead;
                var userName = obj.userEntity.name;
                var commentId = obj.commentEntity.id;
                var commentTime = obj.commentEntity.commentTime;
                if (commentTime.substring(0,commentTime.indexOf(" ")).indexOf(date) === -1){
                    commentTime = commentTime.substring(0,commentTime.indexOf(" "));
                }else {
                    commentTime = commentTime.substring(commentTime.indexOf(" ",commentTime.lastIndexOf(".")));
                }
                var commentContent = obj.commentEntity.commentContent;
                var approveNum = obj.commentEntity.approveNum;
                var answerId = obj.commentEntity.answerId;
                var itemBox = $('<ul class="NestComment"></ul>')
                var item = $('<li class="NestComment-rootComment">\n' +
                    '                                                <div class="CommentItem">\n' +
                    '                                                    <div>\n' +
                    '                                                        <div class="CommentItem-meta">\n' +
                    '                                                            <span class="UserLink CommentItem-avatar">\n' +
                    '                                                                <a href="user/'+ userId +'" class="UserLink-link">\n' +
                    '                                                                    <img width="24" height="24" src="images/user/'+ chatHead +'" alt="">\n' +
                    '                                                                </a>\n' +
                    '                                                            </span>\n' +
                    '                                                            <span class="UserLink">\n' +
                    '                                                                <a class="UserLink-link"  href="user/'+ userId +'">'+ userName +'</a>\n' +
                    '                                                            </span>\n' +
                    '                                                            <span class="CommentItem-time">\n' +
                    '                                                                '+ commentTime +'\n' +
                    '                                                            </span>\n' +
                    '                                                        </div>\n' +
                    '                                                        <div class="CommentTiem-metaSibling">\n' +
                    '                                                            <div class="CommentRichText CommentItem-content">\n' +
                    '                                                                <div class="ztext">\n' +
                    '                                                                    <p>'+ commentContent +'</p>\n' +
                    '                                                                </div>\n' +
                    '                                                            </div>\n' +
                    '                                                            <div class="CommentItem-footer">\n' +
                    '                                                                <button approveNum="'+ approveNum +'" data-comment-id="'+ commentId +'" class="button button--likeBtn" type="button">\n' +
                    '                                                                    <span style="display: inline-flex; align-items: center;"><svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>\n' +
                    '                                                                    '+ approveNum +'\n' +
                    '                                                                </button>\n' +
                    '                                                                <button data-comment-id="'+ commentId +'" data-user-id="'+ userId +'" class="button button--hoverBtn" type="button" style="opacity: 0;">\n' +
                    '                                                                    <span style="display: inline-flex; align-items: center;"><svg class="Zi Zi--Reply" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z" fill-rule="evenodd"></path></svg></span>\n' +
                    '                                                                    回复\n' +
                    '                                                                </button>\n' +
                    '                                                                <button class="button button--hoverBtn" type="button" style="opacity: 0;">\n' +
                    '                                                                    <span style="display: inline-flex; align-items: center;"><svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="transform: rotate(180deg); margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>\n' +
                    '                                                                    踩\n' +
                    '                                                                </button>\n' +
                    '                                                                <button class="button button--hoverBtn" type="button" style="opacity: 0;">\n' +
                    '                                                                    <span style="display: inline-flex; align-items: center;"><svg class="Zi Zi--Report" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z" fill-rule="evenodd"></path></svg></span>\n' +
                    '                                                                    举报\n' +
                    '                                                                </button>\n' +
                    '                                                            </div>\n' +
                    '\n' +
                    '                                                        </div>\n' +
                    '                                                    </div>\n' +
                    '                                                </div>\n' +
                    '                                            </li>');
                itemBox.append(item);

                $.each(obj.commentReplyContainerEntityList,function (ir,objr) {
                    commentNum++;
                    var commentReplyRId = objr.commentReplyEntity.rId;
                    var commentReplyId = objr.commentReplyEntity.id;
                    var userName = objr.userEntity.name;
                    var userId = objr.userEntity.id;
                    var userReplyName = objr.userReplyEntity.name;
                    var userReplyImg = objr.userReplyEntity.chatHead;
                    var userReplyId = objr.userReplyEntity.id;
                    var commentReplyTime = objr.commentReplyEntity.commentTime;
                    if (commentReplyTime.substring(0,commentReplyTime.indexOf(" ")).indexOf(date) === -1){
                        commentReplyTime = commentReplyTime.substring(0,commentReplyTime.indexOf(" "));
                    }else {
                        commentReplyTime = commentReplyTime.substring(commentReplyTime.indexOf(" ",commentReplyTime.lastIndexOf(".")));
                    }
                    var commentReplyContent = objr.commentReplyEntity.content;
                    var commentReplyapproveNum = objr.commentReplyEntity.approveNum;


                    if (commentReplyId == commentId) {

                        var itemReply = $('<li class="NestComment-child">\n' +
                            '                                                <div class="CommentItem">\n' +
                            '                                                    <div>\n' +
                            '                                                        <div class="CommentItem-meta">\n' +
                            '                                                            <span class="UserLink CommentItem-avatar">\n' +
                            '                                                                <a href="user/'+ userReplyId +'" class="UserLink-link">\n' +
                            '                                                                    <img width="24" height="24" src="images/user/'+ userReplyImg +'" alt="">\n' +
                            '                                                                </a>\n' +
                            '                                                            </span>\n' +
                            '                                                            <span class="UserLink">\n' +
                            '                                                                <a class="UserLink-link"  href="user/'+ userReplyId +'">'+ userReplyName +'</a>\n' +
                            '                                                            </span>\n' +
                            '                                                            <span class="CommentItem-reply">回复</span>\n' +
                            '                                                            <span class="UserLink">\n' +
                            '                                                                <a class="UserLink-link"  href="user/'+ userId +'">'+ userName +'</a>\n' +
                            '                                                            </span>\n' +
                            '                                                            <span class="CommentItem-time">\n' +
                            '                                                                '+ commentReplyTime +'\n' +
                            '                                                            </span>\n' +
                            '                                                        </div>\n' +
                            '                                                        <div class="CommentTiem-metaSibling">\n' +
                            '                                                            <div class="CommentRichText CommentItem-content">\n' +
                            '                                                                <div class="ztext">\n' +
                            '                                                                    <p>'+ commentReplyContent +'</p>\n' +
                            '                                                                </div>\n' +
                            '                                                            </div>\n' +
                            '                                                            <div class="CommentItem-footer">\n' +
                            '                                                                <button approveNum="'+ commentReplyapproveNum +'" data-commentReply-rid="'+ commentReplyRId +'" data-commentReply-id="'+ commentReplyId +'" class="button button--likeBtn" type="button">\n' +
                            '                                                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>\n' +
                            '                                                                    '+ commentReplyapproveNum +'\n' +
                            '                                                                </button>\n' +
                            '                                                                <button data-commentReply-rid="'+ commentReplyRId +'"  data-commentReply-id="'+ commentReplyId +'" class="button button--hoverBtn" type="button">\n' +
                            '                                                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z" fill-rule="evenodd"></path></svg></span>\n' +
                            '                                                                    回复\n' +
                            '                                                                </button>\n' +
                            '                                                                <button class="button button--hoverBtn" type="button">\n' +
                            '                                                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="transform: rotate(180deg); margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>\n' +
                            '                                                                    踩\n' +
                            '                                                                </button>\n' +
                            '                                                                <button class="button button--hoverBtn" type="button">\n' +
                            '                                                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Report" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z" fill-rule="evenodd"></path></svg></span>\n' +
                            '                                                                    举报\n' +
                            '                                                                </button>\n' +
                            '                                                            </div>\n' +
                            '                                                        </div>\n' +
                            '                                                    </div>\n' +
                            '                                                </div>\n' +
                            '                                            </li>');

                        itemBox.append(itemReply);
                    }
                })

                div.append(itemBox);
                $(".CommentTopbar .Topbar-title").text(commentNum+" 条评论")
                $(".CommentTopbar").attr("data-answer-Id",$(button).attr("data-answer-id"));
            })
            $(".CommentList").html(div);
        }

    });
}