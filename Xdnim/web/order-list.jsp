<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/9/22
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script type="text/javascript" src="./js/jquery-3.5.1.min.js"></script>
</head>

<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">演示</a>
                <a>
                    <cite>导航元素</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form action="question" method="post" class="layui-form layui-col-space5">
                        <input name="a" value="select" type="hidden">
                        <div class="layui-input-inline layui-show-xs-block">
                            <input class="layui-input" placeholder="开始日" name="minTime" id="start"></div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <input class="layui-input" placeholder="截止日" name="maxTime" id="end"></div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <select name="isFond">
                                <option value="-1">折叠状态</option>
                                <option value="1">折叠</option>
                                <option value="0">未折叠</option>
                            </select>
                        </div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <input type="text" name="id" placeholder="请输入问题编号" autocomplete="off" class="layui-input"></div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <a href="javascript:;" onclick="goPage(1);" class="layui-btn">
                                <i class="layui-icon">&#xe615;</i></a>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <%--<button class="layui-btn layui-btn-danger" onclick="delAll()">
                        <i class="layui-icon"></i>批量删除</button>
                    <button class="layui-btn" onclick="xadmin.open('添加用户','./order-add.html',800,600)">
                        <i class="layui-icon"></i>添加</button>--%></div>
                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" name="" lay-skin="primary">
                            </th>
                            <th>问题编号</th>
                            <th>作者Id</th>
                            <th>问题标题</th>
                            <th>问题简介</th>
                            <th>好问题数(点赞数)</th>
                            <th>被浏览数</th>
                            <th>关注者数</th>
                            <th>提出时间</th>
                            <th>折叠状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="question" items="${questionEntityList}" >
                                <tr>
                                    <td>
                                        <input type="checkbox" name="" lay-skin="primary"></td>
                                    <td>${question.object.id}</td>
                                    <td>${question.object.authorId}</td>
                                    <td>${question.object.questionTitle}</td>
                                    <td>${question.object.questionIntro}</td>
                                    <td>${question.ztNum}</td>
                                    <td>${question.llNum}</td>
                                    <td>${question.gzNum}</td>
                                    <td>${question.object.publishTime}</td>
                                    <td>
                                        <div class="layui-table-cell laytable-cell-1-0-4">
                                            <c:choose>
                                                <c:when test="${question.object.isFold == 1}">
                                                    <input type="checkbox" name="isFold" value="${question.object.id}" lay-skin="switch" lay-text="折叠|未折叠" lay-filter="sexDemo" checked="checked">
                                                    <div class="layui-unselect layui-form-switch layui-form-onswitch is-active" lay-skin="_switch">
                                                        <em>折叠</em>
                                                        <i></i>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="checkbox" name="isFold" value="${question.object.id}" lay-skin="switch" lay-text="折叠|未折叠" lay-filter="sexDemo">
                                                    <div class="layui-unselect layui-form-switch" lay-skin="_switch">
                                                        <em>不折叠</em>
                                                        <i></i>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                    </td>
                                    <td class="td-manage">
                                        <a title="查看" data-object-id="${question.object.id}" onclick="xadmin.open('编辑','order-view.html')" href="javascript:;">
                                            <i class="layui-icon">&#xe63c;</i></a>
<%--                                        <a title="删除" data-object-id="${question.object.id}" onclick="member_del(this,'要删除的id')" href="javascript:;">--%>
<%--                                            <i class="layui-icon">&#xe640;</i></a>--%>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="layui-card-body ">
                    <div class="page">
                        <div>
                            <a class="123" href="javascript:;" onclick="goPage(1);" >&lt;&lt;</a>
                            <a class="prev" href="javascript:;" ></a>
                            <span class="current"></span>
                            <a class="next" href="javascript:;" ></a>
                            <a class="last" href="javascript:;" >&gt;&gt;</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>

<script>layui.use(['laydate', 'form'],
    function() {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });

    });

/*用户-停用*/
function member_stop(obj, id) {
    layer.confirm('确认要停用吗？',
        function(index) {

            if ($(obj).attr('title') == '启用') {

                //发异步把用户状态进行更改
                $(obj).attr('title', '停用');
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!', {
                    icon: 5,
                    time: 1000
                });

            } else {
                $(obj).attr('title', '启用');
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!', {
                    icon: 5,
                    time: 1000
                });
            }

        });
}

/*用户-删除*/
function member_del(obj, id) {
    layer.confirm('确认要删除吗？',
        function(index) {
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {
                icon: 1,
                time: 1000
            });
        });
}

function delAll(argument) {

    var data = tableCheck.getData();

    layer.confirm('确认要删除吗？' + data,
        function(index) {
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {
                icon: 1
            });
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
}
</script>
</html>
<script>
    $(document).on("click",".layui-unselect.layui-form-switch",function () {
        isFold(this);
    });
    function isFold(button) {
        var id = $(button).prev().attr("value");
        var is = 0;
        if($(button).attr("class").indexOf("layui-form-onswitch") == -1){
            $(button).addClass("layui-form-onswitch").find("em").html("折叠");
            is = 1;
        }else {
            $(button).removeClass("layui-form-onswitch").find("em").html("未折叠");

            is = 0;
        }
        $.ajax({
            url:"question",
            type:"post",
            data:{"a":"updateIsFold","is":is,"id":id},
            dataType:"json",
            success:function (result) {

            }
        });

    }
    $(function () {
        goPage(1);
    });
    function goPage(curr) {
        var id = $("[name='id']").val();
        var minTime = $("[name='minTime']").val();
        var maxTime = $("[name='maxTime']").val();
        var isFond = $("[name='isFond']").val();
        $.ajax({
            url: "question",
            type: "post",
            data: {"a": "select", "id": id, "minTime": minTime, "maxTime": maxTime, "isFond": isFond, "curr": curr},
            dataType: "json",
            success: function (result) {
                console.log(result);
                $(".layui-table.layui-form tbody").html("");
                $.each(result.questionEntityList, function (i, obj) {
                    var item = '<tr><td>                                        <input type="checkbox" name="" lay-skin="primary"><div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i class="layui-icon layui-icon-ok"></i></div></td>\n' +
                        '                                    <td>' + obj.object.id + '</td>\n' +
                        '                                    <td>' + obj.object.authorId + '</td>\n' +
                        '                                    <td>' + obj.object.questionTitle + '</td>\n' +
                        '                                    <td>' + obj.object.questionIntro + '\n' +
                        '                                    <td>' + obj.ztNum + '</td>\n' +
                        '                                    <td>' + obj.llNum + '</td>\n' +
                        '                                    <td>' + obj.gzNum + '</td>\n' +
                        '                                    <td>' + obj.object.publishTime + '</td>\n' +
                        '                                    <td>\n' +
                        '                                        <div class="layui-table-cell laytable-cell-1-0-4">';
                    console.log(obj.object.isFold);
                    if (obj.object.isFold === 1) {
                        item = item+'                               <input type="checkbox" name="isFold" value="' + obj.object.id + '" lay-skin="switch" lay-text="折叠|未折叠" lay-filter="sexDemo" checked="checked">' +
                            '                                       <div class="layui-unselect layui-form-switch layui-form-onswitch" lay-skin="_switch"><em>折叠</em><i></i></div>\n';
                    } else {
                        item = item+'                               <input type="checkbox" name="isFold" value="' + obj.object.id + '" lay-skin="switch" lay-text="折叠|未折叠" lay-filter="sexDemo" >' +
                            '                                       <div class="layui-unselect layui-form-switch" lay-skin="_switch"><em>未折叠</em><i></i></div>\n';
                    }
                    item = item+'' +
                        '                                       </div>\n' +
                        '                                    </td>\n' +
                        '                                    <td class="td-manage">\n' +
                        '                                        <a title="查看" data-object-id="' + obj.object.id + '" onclick="xadmin.open(\'编辑\',\'order-view.html\')" href="javascript:;">\n' +
                        '                                            <i class="layui-icon"></i></a>\n' +
                        '                                    </td>\n' +
                        '                                </tr>';
                    $(".layui-table.layui-form tbody").append(item);
                });
                $(".prev").html(result.perv).attr("onclick", "goPage(" + result.perv + ")");
                $(".current").html(result.curr);
                var next = result.next;
                $(".next").html(next).attr("onclick", "goPage(" + next + ")");
                $(".next1").html(next + 1).attr("onclick", "goPage(" + (next + 1) + ")");
                $(".last").attr("onclick", "goPage(" + result.last + ")");
                $(".layui-btn").attr("onclick", "goPage(1)");
            },
            error: function (result) {
                console.log("error");
            }
        });
    }
</script>


