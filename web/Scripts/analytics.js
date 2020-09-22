function infoanalyt() {
    $.ajax({
        url: "header",
        type: "post",
        data: {"a":"getAyerData","uId":$("#user").attr("data-user-id")},
        dataType: "json",
        success: function (result) {
            console.log(result);
            var item = $('                            <div class="ProfileSideCreator-readCountItem">\n' +
                '                                <div class="ProfileSideCreator-readCountTitle">\n' +
                '                                    昨日被阅读数\n' +
                '                                </div>\n' +
                '                                <div class="ProfileSideCreator-readCountNum">' + result["objLlNum1"] + '</div>\n' +
                '                                <div class="css-u2c28s">\n' +
                '                                    <div class="css-1086365">较前日</div>\n' +
                '                                    <div class="css-1gqb0v0 css-1gqb0v0-ll">' +
                '                                       <span class="css-1ntg9ig"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--BackToTop" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M16.036 19.59a1 1 0 0 1-.997.995H9.032a.996.996 0 0 1-.997-.996v-7.005H5.03c-1.1 0-1.36-.633-.578-1.416L11.33 4.29a1.003 1.003 0 0 1 1.412 0l6.878 6.88c.782.78.523 1.415-.58 1.415h-3.004v7.005z"></path></svg></span></span>' +
                '                                       ' + result["objLlNumUp"] + '%</div>\n' +
                '                                </div>\n' +
                '                            </div>\n' +
                '                            <div class="ProfileSideCreator-readCountItem">\n' +
                '                                <div class="ProfileSideCreator-readCountTitle">\n' +
                '                                    昨日被赞同数\n' +
                '                                </div>\n' +
                '                                <div class="ProfileSideCreator-readCountNum">' + result["objZtNum1"] + '</div>\n' +
                '                                <div class="css-u2c28s">\n' +
                '                                    <div class="css-1086365">较前日</div>\n' +
                '                                    <div class="css-1gqb0v0 css-1gqb0v0-zt">' +
                '                                       <span class="css-1ntg9ig"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--BackToTop" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M16.036 19.59a1 1 0 0 1-.997.995H9.032a.996.996 0 0 1-.997-.996v-7.005H5.03c-1.1 0-1.36-.633-.578-1.416L11.33 4.29a1.003 1.003 0 0 1 1.412 0l6.878 6.88c.782.78.523 1.415-.58 1.415h-3.004v7.005z"></path></svg></span></span>' +
                '                                       ' + result["objZtNumUp"] + '%</div>\n' +
                '                                </div>\n' +
                '                            </div>');

            $(".ProfileSideCreator-analytics").html(item);
            if (result["objllNumUp"] > 0) {
                $(".css-1gqb0v0-ll").html('' +
                    '<span class="css-1ntg9ig"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--BackToTop" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M16.036 19.59a1 1 0 0 1-.997.995H9.032a.996.996 0 0 1-.997-.996v-7.005H5.03c-1.1 0-1.36-.633-.578-1.416L11.33 4.29a1.003 1.003 0 0 1 1.412 0l6.878 6.88c.782.78.523 1.415-.58 1.415h-3.004v7.005z"></path></svg></span></span>' +
                    '' + result["objZtNumUp"] + '%');
            } else if (result["objllNumUp"] < 0) {
                $(".css-1gqb0v0-ll").html('' +
                    '<span class="css-2ntg9ig"><svg class="Zi Zi--SolidArrowDown" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M16.036 4.994a1 1 0 0 0-.997-.995H9.032a.996.996 0 0 0-.997.996V12H5.03c-1.1 0-1.36.633-.578 1.416l6.878 6.878c.39.39 1.026.385 1.412 0l6.878-6.88c.782-.78.523-1.415-.58-1.415h-3.004V4.994z"></path></svg><svg class="Zi Zi--SolidArrowDown" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M16.036 4.994a1 1 0 0 0-.997-.995H9.032a.996.996 0 0 0-.997.996V12H5.03c-1.1 0-1.36.633-.578 1.416l6.878 6.878c.39.39 1.026.385 1.412 0l6.878-6.88c.782-.78.523-1.415-.58-1.415h-3.004V4.994z"></path></svg></span></span>' +
                    '' + result["objZtNumUp"] + '%');
            } else {
                $(".css-1gqb0v0-ll").html("--")
            }

            if (result["objZtNumUp"] > 0) {
                $(".css-1gqb0v0-zt").html('' +
                    '<span class="css-1ntg9ig"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--BackToTop" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M16.036 19.59a1 1 0 0 1-.997.995H9.032a.996.996 0 0 1-.997-.996v-7.005H5.03c-1.1 0-1.36-.633-.578-1.416L11.33 4.29a1.003 1.003 0 0 1 1.412 0l6.878 6.88c.782.78.523 1.415-.58 1.415h-3.004v7.005z"></path></svg></span></span>' +
                    '' + result["objZtNumUp"] + '%');
            } else if (result["objZtNumUp"] < 0) {
                $(".css-1gqb0v0-zt").html('' +
                    '<span class="css-2ntg9ig"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--SolidArrowDown" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M16.036 4.994a1 1 0 0 0-.997-.995H9.032a.996.996 0 0 0-.997.996V12H5.03c-1.1 0-1.36.633-.578 1.416l6.878 6.878c.39.39 1.026.385 1.412 0l6.878-6.88c.782-.78.523-1.415-.58-1.415h-3.004V4.994z"></path></svg></span></span>' +
                    '' + result["objZtNumUp"] + '%');
            } else {
                $(".css-1gqb0v0-zt").html("--");
            }
        }
    });
}