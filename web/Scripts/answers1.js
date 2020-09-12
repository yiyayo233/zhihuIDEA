var FollowButton_IsClick = 1;
var gznum = $(".wzDiv").text();


var num = parseInt(gznum.split(',').join(""));


$(".FollowButton").click(function(){
    //点击取消关注显示成关注问题
    if (FollowButton_IsClick==0) {
        $(this).removeClass("up").addClass("Button--blue");
        var num1 = num;
        var numarr = num1.toString().split("");
        var nums ="";
        /*for (var i = 0,j = 0; i > numarr.length; i++,j++) {

        }*/
        for (var i = numarr.length,j = 1; i > 0; i--,j++) {
            nums = nums + numarr[i-1];
            if(j%3==0&&j!=0){
                nums= nums + ',';
            }
        }
        numarr = nums.split('').reverse();
        if (numarr[0]==',') {
            var index = numarr.indexOf(',')
            numarr.splice(index,1);
        }
        nums = numarr.join("");

        $(".wzDiv").text(nums);


        $(this).text("关注他");
        $(this).prepend('<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Plus FollowButton-icon" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M13.491 10.488s-.012-5.387 0-5.998c-.037-1.987-3.035-1.987-2.997 0-.038 1.912 0 5.998 0 5.998H4.499c-1.999.01-1.999 3.009 0 3.009s5.995-.01 5.995-.01v5.999c0 2.019 3.006 2.019 2.997 0-.01-2.019 0-5.998 0-5.998s3.996.009 6.004.009c2.008 0 2.008-3-.01-3.009h-5.994z" fill-rule="evenodd"></path></svg></span>');
        FollowButton_IsClick=1;
    } else{
        //点击关注问题显示成已关注
        $(".FollowButton-icon").remove();
        $(this).addClass("up").removeClass("Button--blue");
        $(this).text("取消关注");
        var num1 = num+1;
        var numarr = num1.toString().split("");
        var nums ="";
        /*for (var i = 0,j = 0; i > numarr.length; i++,j++) {

        }*/
        for (var i = numarr.length,j = 1; i > 0; i--,j++) {
            nums = nums + numarr[i-1];
            if(j%3==0&&j!=0){
                nums= nums + ',';
            }
        }
        numarr = nums.split('').reverse();
        if (numarr[0]==',') {
            var index = numarr.indexOf(',')
            numarr.splice(index,1);
        }
        nums = numarr.join("");

        $(".wzDiv").text(nums);

        FollowButton_IsClick=0;

    }
})

//鼠标放到已关注变成取消关注
$(document).on("mousemove",".FollowButton.up",function(){
    $(this).text("取消关注");

}).on("mouseout",".FollowButton.up",function(){
    $(this).text("已关注");

})
