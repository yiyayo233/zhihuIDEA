/**
 * 初始化首页
 */
var questionItems;
function hraderinit(){
    $.ajax({
        url:"header",
        type:"post",
        data:{"a":"init"},
        dataType:"json",
        success:function (result) {
            questionItems = result;
            console.info(result);
            var div = $("<div></div>");
             $.each(result,function(i,obj){
                 var answerId = obj.answerEntity.id;
                 var questionId = obj.questionEntity.id;
                 var url = "?questionId="+questionId+"&answerId="+answerId;
                 var questionTitle = obj.questionEntity.questionTitle;
                 var answerContentHtml = obj.answerEntity.answerContent;
                 var answerContentText = answerContentHtml.replace(/<.*?>/ig,"");
                 var approveNum = obj.answerEntity.approveNum;
                 var commentNum = obj.CommentNum;
                 var item = $('                        <div class="Card TopstoryItem">\n' +
                     '                            <div class="ContentItem">\n' +
                     '                                <h2 class="ContentItem-title">\n' +
                     '                                    <a target="_blank" href="question'+ url +'">'+ questionTitle +'</a>\n' +
                     '                                </h2>\n' +
                     '                                <div data-answer-id="'+ answerId +'" data-user-id="'+ obj.userEntity.id +'" class="ContentItem-content is-collapsed">\n' +
                     '                                    <div class="ContentItem-content-inner">\n' +
                     '                                            <span class="text">\n' +
                     '                                                  '+ answerContentText +'\n' +
                     '                                            </span>\n' +
                     '                                        <button class="button ContentItem-more" type="button">阅读全文\n' +
                     '                                            <span style="display: inline-flex;align-items: center;">\n' +
                     '                                                    ​\n' +
                     '                                                    <svg class="Zi Zi--ArrowDown ContentItem-arrowIcon" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">\n' +
                     '                                                        <path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path>\n' +
                     '                                                    </svg>\n' +
                     '                                                </span>\n' +
                     '                                        </button>\n' +
                     '                                    </div>\n' +
                     '                                    <div class="ContentItem-actions">\n' +
                     '                                            <span>\n' +
                     '                                                <button data-answer-id="'+ answerId +'" class="button VoteButton VoteButton--up"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleUp VoteButton-TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>赞同 '+ approveNum +'</button>\n' +
                     '                                                <button data-answer-id="'+ answerId +'" class="button VoteButton VoteButton--down"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span></button>\n' +
                     '                                            </span>\n' +
                     '                                        <button data-answer-id="'+ answerId +'" type="button" class="button ContentItem-action">\n' +
                     '                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd"></path></svg></span>\n' +
                     '                                            '+ commentNum +' 条评论\n' +
                     '                                        </button>\n' +
                     '                                        <div class="ContentItem-action">\n' +
                     '                                            <button data-answer-id="'+ answerId +'" type="button" class="button">\n' +
                     '                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd"></path></svg></span>\n' +
                     '                                                分享\n' +
                     '                                            </button>\n' +
                     '                                        </div>\n' +
                     '                                        <button data-answer-id="'+ answerId +'" type="button" class="button ContentItem-action">\n' +
                     '                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Star Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd"></path></svg></span>\n' +
                     '                                            收藏\n' +
                     '                                        </button>\n' +
                     '                                        <button data-answer-id="'+ answerId +'" type="button" class="button ContentItem-action">\n' +
                     '                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Heart Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2 8.437C2 5.505 4.294 3.094 7.207 3 9.243 3 11.092 4.19 12 6c.823-1.758 2.649-3 4.651-3C19.545 3 22 5.507 22 8.432 22 16.24 13.842 21 12 21 10.158 21 2 16.24 2 8.437z" fill-rule="evenodd"></path></svg></span>\n' +
                     '                                            喜欢\n' +
                     '                                        </button>\n' +
                     '                                        <div class="ContentItem-action">\n' +
                     '                                            <button type="button" class="button">\n' +
                     '                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Dots Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" fill-rule="evenodd"></path></svg></span>\n' +
                     '                                            </button>\n' +
                     '                                        </div>\n' +
                     '                                    </div>\n' +
                     '                                </div>\n' +
                     '                            </div>\n' +
                     '                        </div>\n');
                 div.append(item);
             });
            $(".Topstory-recommend").html(div);

        }

    });
}

$(function () {
    hraderinit()
})



/*var div = $('                        <div class="Card TopstoryItem">\n' +
    '                            <div class="ContentItem">\n' +
    '                                <h2 class="ContentItem-title">\n' +
    '                                    <a href="#">'+ obj.questionTitle +'</a>\n' +
    '                                </h2>\n' +
    '                                <div class="ContentItem-content is-collapsed">\n' +
    '                                    <div class="ContentItem-content-cover">\n' +
    '                                        <div class="ContentItem-content-cover-inner">\n' +
    '                                            <img src="images/Topstory/v2-85e02316984f4b7f625b9afb20d384e2.jpg" alt="">\n' +
    '                                        </div>\n' +
    '                                    </div>\n' +
    '                                    <div class="ContentItem-content-inner">\n' +
    '                                            <span class="text">\n' +
    '                                                Bravos里奥： 长文预警，全文4500字左右，阅读5分钟，建议赞了再收藏之后慢慢看~ 史上最全夸张了，争取最全~！ 以下建议均根据个人体验而提，如有其他建议和想法，欢迎大家在评论区留言讨论！\n' +
    '                                            </span>\n' +
    '                                        <button class="button ContentItem-more" type="button">阅读全文\n' +
    '                                            <span style="display: inline-flex;align-items: center;">\n' +
    '                                                    ​\n' +
    '                                                    <svg class="Zi Zi--ArrowDown ContentItem-arrowIcon" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">\n' +
    '                                                        <path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path>\n' +
    '                                                    </svg>\n' +
    '                                                </span>\n' +
    '                                        </button>\n' +
    '                                    </div>\n' +
    '                                    <div class="ContentItem-actions">\n' +
    '                                            <span>\n' +
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
    '                                            </button>\n' +
    '                                        </div>\n' +
    '                                    </div>\n' +
    '                                </div>\n' +
    '                            </div>\n' +
    '                        </div>\n')
divElement.append(div);*/
