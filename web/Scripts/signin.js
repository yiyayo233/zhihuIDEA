$(function () {
    $(document).on("click",".SignFlow-tab:first-child",function () {
        $(this).siblings().removeClass("SignFlow-tab--active");
        $(this).addClass("SignFlow-tab--active");
        $(".SignFlow-password2").remove();
        $(".SignFlow-submitButton").text("登录").removeClass("zhuche").addClass("Denglu");

    });
    $(document).on("click",".SignFlow-tab:last-child",function () {
        $(this).siblings().removeClass("SignFlow-tab--active");
        $(this).addClass("SignFlow-tab--active");
        $(".SignFlow-password").after('<div class="SignFlow-password SignFlow-password2">\n' +
            '\t\t\t\t\t\t\t\t\t<div class="SignFlowInput SignFlow-passwordInputBox">\n' +
            '\t\t\t\t\t\t\t\t\t\t<label class="SignFlow-passwordInput Input-wrapper">\n' +
            '\t\t\t\t\t\t\t\t\t\t\t<input class="Input" name="userpassZ" type="password" placeholder="再次输入密码">\n' +
            '\t\t\t\t\t\t\t\t\t\t</label>' +
            '                    <div class="SignFlowInput-errorMask SignFlowInput-errorMask--pass2 is-active">\n' +
            '\t\t\t\t\t\t\t\t        请输入相同的密码\n' +
                '\t\t\t\t\t\t\t  </div>\n' +
            '\t\t\t\t\t\t\t\t\t</div>\n' +
            '\t\t\t\t\t\t\t\t</div>');
        $(".SignFlow-submitButton").text("注册").addClass("zhuche").removeClass("Denglu");
    });

    /* 登录 */
    $(document).on("click",".Denglu",function () {
        if ($("[name=userName]").val() == ""){
            // $(".SignFlowInput-errorMask .SignFlowInput-errorMask--account").removeClass("is-active");
            alert("请输入电话或邮箱。");
        }else if ($("[name=userpass]").val() == ""){
            alert("请输入密码。");
            // $(".SignFlowInput-errorMask .SignFlowInput-errorMask--pass").removeClass("is-active");
        }else {
            $.ajax({
                url:"signin",
                type:"post",
                data:{"userName":$("[name=userName]").val(),"userpass":$("[name=userpass]").val()},
                dataType:"text",
                success:function(result){
                    console.log(result);
                    if (result.indexOf("loginTrue") != -1){
                        location.href="/zhihuIDEA_war_exploded/";
                    }else {
                        alert("result");
                    }
                },
                error:function () {
                    alert("喵喵喵");
                }
            });
        }


    });

    /* 注册 */
    $(document).on("click",".zhuche",function () {
        if ($("[name=userName]").val() == ""){
            // $(".SignFlowInput-errorMask .SignFlowInput-errorMask--account").removeClass("is-active");
            alert("请输入电话或邮箱。");
        }else if ($("[name=userpass]").val() == ""){
            // $(".SignFlowInput-errorMask .SignFlowInput-errorMask--pass").removeClass("is-active");
            alert("请输入密码。");

        }else if ($("[name=userpassZ]").val() == ""){
            // $(".SignFlowInput-errorMask .SignFlowInput-errorMask--pass2").removeClass("is-active");
            alert("请输入重新输入密码。");

        }else {
            $.ajax({
                url: "signin",
                type: "post",
                data: {
                    "userName": $("[name=userName]").val(),
                    "userpass": $("[name=userpass]").val(),
                    "userpassZ": $("[name=userpassZ]").val()
                },
                success: function (result) {
                    if (result.indexOf("enrollTrue") != -1) {
                        alert("注册成功，请前往登录。");
                    } else {
                        alert("你的账号或密码有误。");
                    }
                },
                error: function () {
                    alert("喵喵喵");
                }
            });
            }
        });

    /*/!* 错误提示 *!/
    $(document).on("click",".SignFlowInput-errorMask",function () {
        $(".SignFlowInput-errorMask").removeClass("is-active");
        $(this).addClass("is-active");
        if ($(this).attr("class").indexOf("SignFlowInput-errorMask--account") != -1) {

        } else if ($(this).attr("class").indexOf("SignFlowInput-errorMask--pass") != -1) {

        } else if ($(this).attr("class").indexOf("SignFlowInput-errorMask--pass2") != -1) {

        }
    });*/
});