
function myChartFction(data) {
    // 基于准备好的dom，初始化echarts实例
    var myChart /*echarts.init(document.getElementById('main'))*/;


// 指定图表的配置项和数据
var option = {
    dataset:{
        source: data,
    },
    tooltip:{
        triggerOn: 'mousemove|click',
        trigger: 'axis',           // 触发类型，默认数据触发，见下图，可选为：'item' ¦ 'axis'
        transitionDuration : .5,  // 动画变换时间，单位s
        animationEasingUpdate: 'exponentialOut',
        backgroundColor: 'rgba(255,255,255,.0)',     // 提示背景颜色，默认为透明度为0.7的黑色
        borderRadius: 2,    // 提示边框圆角，单位px，默认为4
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'line',         // 默认为直线，可选为：'line' | 'shadow'
            lineStyle : {          // 直线指示器样式设置
                color: '#d9d9d9',
                width: 2,
                type: 'dotted',
            },
            shadowStyle : {                       // 阴影指示器样式设置
                width: 5,                   // 阴影大小
                color: 'rgba(150,150,150,0.3)'  // 阴影颜色
            }
        },
        textStyle:{
            color:'#000'
        },
        confine: true,
        formatter : function (params,ticket,callback) {
            var param ='';
            var xName ='';
            var seriesName ='';
            var value ='';
            var items = '';

            var html ='<div class="AnalyticsChart-tooltip">\n' +
            '           <div class="AnalyticsChart-tooltipHeader">';
            for (var i = 0;i < params.length;i++){
                param = params[i];
                xName = param.name;
                html = html + xName;
                break;
            }
            html= html+ '</div>\n' +
                '           <ul class="AnalyticsChart-tooltipLineList">\n';
            for (var i = 0;i < params.length;i++){
                param = params[i];
                xName = param.name;
                seriesName = param.seriesName;
                value = param.value;


                items = items + '<li class="AnalyticsChart-tooltipLineItem">\n' +
                    '                <div class="AnalyticsChart-tooltipLineItem--title">'+seriesName+'</div>\n' +
                    '                <div class="AnalyticsChart-tooltipLineItem--value" style="color: '+ param.color +'">'+value[i+1]+'</div>\n' +
                    '    </li>\n';

            }
            html = html + items +'</ul>\n' +
            '          </div>';
            return html;
        },
    },
    xAxis: {
        type: 'category',
        axisLine: {
            lineStyle: {
                width: 2,
                color: '#ccc',
            },
        },
        axisTick: {
            alignWithLabel: true,
            interval: 1,
            length: 10,
        },
        axisLabel:{
            interval: 1,
            color: '#333',
            margin: 12.5,
            fontSize: 13,
        },
    },
    yAxis: {
        splitNumber: 4,
        axisLine: {
            show: false
        },
        axisTick: {
            show: false
        },
        splitLine: {
            lineStyle: {
                color: '#F0F0F0',
                width: 2,
            },
        },
    },
    legend:{
        inactiveColor:'#bfbfbf',
        orient: 'horizontal',      // 布局方式，默认为水平布局，可选为：
        // 'horizontal' ¦ 'vertical'
        x: 'center',               // 水平安放位置，默认为全图居中，可选为：
                                   // 'center' ¦ 'left' ¦ 'right'
                                   // ¦ {number}（x坐标，单位px）
        y: 'bottom',                  // 垂直安放位置，默认为全图顶端，可选为：
        // 'top' ¦ 'bottom' ¦ 'center'
        // ¦ {number}（y坐标，单位px）
        backgroundColor: 'rgba(0,0,0,0)',
        borderColor: '#ccc',       // 图例边框颜色
        borderWidth: 0,            // 图例边框线宽，单位px，默认为0（无边框）
        padding: 5,                // 图例内边距，单位px，默认各方向内边距为5，
                                   // 接受数组分别设定上右下左边距，同css
        itemGap: 20,               // 各个item之间的间隔，单位px，默认为10，
                                   // 横向布局时为水平间隔，纵向布局时为纵向间隔
        itemWidth: 20,             // 图例图形宽度
        itemHeight: 14,            // 图例图形高度
        textStyle: {
            color: '#8590a6',          // 图例文字颜色
            fontSize: 14,
            padding: [3,0,0,0],
        },
        icon: "path://M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-2.762-5.37c.243.246.452.37.78.37.33 0 .576-.203.827-.443.25-.24 7.052-7.054 7.052-7.054a.988.988 0 0 0-.311-1.354.973.973 0 0 0-1.345.315l-6.222 6.077-2.31-2.418a.971.971 0 0 0-1.368-.19.988.988 0 0 0-.188 1.377s2.841 3.074 3.085 3.32z",
        selected : {
            '阅读量':true,
            '评论数':false,
            '赞同数':false,
            '喜欢数':false,
            '收藏数':false,
        },
    },
    series: [{
        name: '阅读量',
        type: 'line',
        color: '#4289E8',
    },{
        name: '评论数',
        type: 'line',
        color: '#6AAD53',
    },{
        name: '赞同数',
        type: 'line',
        color: '#F4C32C',
    },{
        name: '喜欢数',
        type: 'line',
        color: '#5CBAD9',
    },{
        name: '收藏数',
        type: 'line',
        color: '#D1DA3C',
    }],
};

    if(myChart == undefined){
        myChart = echarts.init(document.getElementById("main"));
    }else{
        myChart.clear();
    }
    myChart.setOption(option,true);
}

function refreshData(data){
    var option = myChart.getOption();
    option.series[0].data = data;
    myChart.setOption(option);
}


// 使用刚指定的配置项和数据显示图表。
//myChart.setOption(option);