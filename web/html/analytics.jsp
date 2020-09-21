<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
    <meta charset="UTF-8">
    <title>知乎 - 内容分析</title>
    <link rel="icon" href="images/favicon.ico">

    <link rel="stylesheet" href="css/Header-Head.css">
    <link rel="stylesheet" href="css/creator.css">
    <link rel="stylesheet" href="css/echarts.css">

    <link rel="stylesheet" href="css/answers.css">
      <%
          Cookie[] Cookies = request.getCookies();
          String uId = "";
          String uName = "";
          String uChatHead ="";
          boolean f = false;

          for (Cookie cookie: Cookies) {
              if (cookie.getName().equals("uId")){
                  uId = cookie.getValue();
                  f = true;
              }else if (cookie.getName().equals("uName")){
                  uName = cookie.getValue();
                  f = true;
              }else if(cookie.getName().equals("uChatHead")||cookie.getName().equals("user")){
                  uChatHead = cookie.getValue();
                  f = true;
              }
          }
          if (!f) {
              response.sendRedirect("html/signin.jsp");
              return;
          }else {
              System.out.println("jsp    uId:"+uId+"\tuName:"+uName+"\tuChatHead:"+uChatHead);
          }
      %>
  </head>

  <input id="user" type="hidden" data-user-id="<%=uId%>" data-user-name="<%=uName%>" data-user-ChatHead="<%=uChatHead%>">
  <header class="Header">
    <div class="AppHeader">
        <a href="Header.html">
            <svg viewBox="0 0 200 91" fill="#0084FF" width="64" height="30">
                <path d="M53.29 80.035l7.32.002 2.41 8.24 13.128-8.24h15.477v-67.98H53.29v67.978zm7.79-60.598h22.756v53.22h-8.73l-8.718 5.473-1.587-5.46-3.72-.012v-53.22zM46.818 43.162h-16.35c.545-8.467.687-16.12.687-22.955h15.987s.615-7.05-2.68-6.97H16.807c1.09-4.1 2.46-8.332 4.1-12.708 0 0-7.523 0-10.085 6.74-1.06 2.78-4.128 13.48-9.592 24.41 1.84-.2 7.927-.37 11.512-6.94.66-1.84.785-2.08 1.605-4.54h9.02c0 3.28-.374 20.9-.526 22.95H6.51c-3.67 0-4.863 7.38-4.863 7.38H22.14C20.765 66.11 13.385 79.24 0 89.62c6.403 1.828 12.784-.29 15.937-3.094 0 0 7.182-6.53 11.12-21.64L43.92 85.18s2.473-8.402-.388-12.496c-2.37-2.788-8.768-10.33-11.496-13.064l-4.57 3.627c1.363-4.368 2.183-8.61 2.46-12.71H49.19s-.027-7.38-2.372-7.38zm128.752-.502c6.51-8.013 14.054-18.302 14.054-18.302s-5.827-4.625-8.556-1.27c-1.874 2.548-11.51 15.063-11.51 15.063l6.012 4.51zm-46.903-18.462c-2.814-2.577-8.096.667-8.096.667s12.35 17.2 12.85 17.953l6.08-4.29s-8.02-11.752-10.83-14.33zM199.99 46.5c-6.18 0-40.908.292-40.953.292v-31.56c1.503 0 3.882-.124 7.14-.376 12.773-.753 21.914-1.25 27.427-1.504 0 0 3.817-8.496-.185-10.45-.96-.37-7.24 1.43-7.24 1.43s-51.63 5.153-72.61 5.64c.5 2.756 2.38 5.336 4.93 6.11 4.16 1.087 7.09.53 15.36.277 7.76-.5 13.65-.76 17.66-.76v31.19h-41.71s.88 6.97 7.97 7.14h33.73v22.16c0 4.364-3.498 6.87-7.65 6.6-4.4.034-8.15-.36-13.027-.566.623 1.24 1.977 4.496 6.035 6.824 3.087 1.502 5.054 2.053 8.13 2.053 9.237 0 14.27-5.4 14.027-14.16V53.93h38.235c3.026 0 2.72-7.432 2.72-7.432z" fill-rule="evenodd">
                </path>
            </svg>
        </a>
        <ul class="tabs">
            <li class="Tabs-item">
                <a href="#" class="Tabs-link is-active">首页</a>
            </li>
            <li class="Tabs-item">
                <a href="#" class="Tabs-link">发现</a>
            </li>
            <li class="Tabs-item">
                <a href="#" class="Tabs-link">等你来答</a>
            </li>
        </ul>
        <div class="SearchBar">
            <div class="SearchBar-toorlwrapper">
                <form class="SearchBar-tool">
                    <div>
                        <label>
                            <input type="text" >
                        </label>
                        <button class="button " type="button">
                            <svg class="Zi Zi--Search SearchBar-searchIcon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M17.068 15.58a8.377 8.377 0 0 0 1.774-5.159 8.421 8.421 0 1 0-8.42 8.421 8.38 8.38 0 0 0 5.158-1.774l3.879 3.88c.957.573 2.131-.464 1.488-1.49l-3.879-3.878zm-6.647 1.157a6.323 6.323 0 0 1-6.316-6.316 6.323 6.323 0 0 1 6.316-6.316 6.323 6.323 0 0 1 6.316 6.316 6.323 6.323 0 0 1-6.316 6.316z" fill-rule="evenodd"></path></svg>
                        </button>
                    </div>
                </form>
            </div>
            <button class="Button-blue" type="button">提问</button>
        </div>
        <div class="AppHeader-userInfo">
            <div class="Popover">
                <button id="Popover16-toggle" aria-haspopup="true" aria-expanded="false" aria-owns="Popover16-content" type="button" class="button AppHeader-notifications css-79elbk Button--plain">
                        <span style="display: inline-flex; align-items: center;">​
                            <svg class="Zi Zi--Bell" fill="currentColor" viewBox="0 0 24 24" width="22" height="22">
                                <path d="M4.523 15.076l.804-6.757a6.753 6.753 0 0 1 4.945-5.7 1.823 1.823 0 0 1 3.623 0 6.753 6.753 0 0 1 4.945 5.7l.804 6.757a2.293 2.293 0 0 0 1.712 2.108 1.093 1.093 0 0 1-.297 2.15H3.108a1.093 1.093 0 0 1-.297-2.15 2.293 2.293 0 0 0 1.712-2.108zM12.083 23a2.758 2.758 0 0 1-2.753-2.509.229.229 0 0 1 .232-.24h5.043a.229.229 0 0 1 .232.24 2.759 2.759 0 0 1-2.753 2.51z">

                                </path>
                            </svg>
                        </span>
                    <!--                        <div class="css-ybodb">2</div>-->
                </button>
            </div>
            <div class="Popover">
                <button type="button" class="button">
                        <span style="display: inline-flex; align-items: center;">​
                            <svg class="Zi Zi--Comments" fill="currentColor" viewBox="0 0 24 24" width="22" height="22">
                                <path d="M11 2c5.571 0 9 4.335 9 8 0 6-6.475 9.764-11.481 8.022-.315-.07-.379-.124-.78.078-1.455.54-2.413.921-3.525 1.122-.483.087-.916-.25-.588-.581 0 0 .677-.417.842-1.904.064-.351-.14-.879-.454-1.171A8.833 8.833 0 0 1 2 10c0-3.87 3.394-8 9-8zm10.14 9.628c.758.988.86 2.009.86 3.15 0 1.195-.619 3.11-1.368 3.938-.209.23-.354.467-.308.722.12 1.073.614 1.501.614 1.501.237.239-.188.562-.537.5-.803-.146-1.495-.42-2.546-.811-.29-.146-.336-.106-.563-.057-2.043.711-4.398.475-6.083-.927 5.965-.524 8.727-3.03 9.93-8.016z" fill-rule="evenodd">

                                </path>
                            </svg>
                        </span>
                </button>
            </div>
            <div class="AppHeader-profile">
                <button class="button">
                    <img src="images/user/<%=uChatHead%>" alt="" height="30" width="30"/>
                </button>
            </div>
        </div>
    </div>
    <div>
        <div class="PageHeader">
            <div class="TopstoryPageHeader">
                <div class="TopstoryPageHeader-main">
                    <a href="#">
                        <svg viewBox="0 0 200 91" fill="#0084FF" width="64" height="30"><path d="M53.29 80.035l7.32.002 2.41 8.24 13.128-8.24h15.477v-67.98H53.29v67.978zm7.79-60.598h22.756v53.22h-8.73l-8.718 5.473-1.587-5.46-3.72-.012v-53.22zM46.818 43.162h-16.35c.545-8.467.687-16.12.687-22.955h15.987s.615-7.05-2.68-6.97H16.807c1.09-4.1 2.46-8.332 4.1-12.708 0 0-7.523 0-10.085 6.74-1.06 2.78-4.128 13.48-9.592 24.41 1.84-.2 7.927-.37 11.512-6.94.66-1.84.785-2.08 1.605-4.54h9.02c0 3.28-.374 20.9-.526 22.95H6.51c-3.67 0-4.863 7.38-4.863 7.38H22.14C20.765 66.11 13.385 79.24 0 89.62c6.403 1.828 12.784-.29 15.937-3.094 0 0 7.182-6.53 11.12-21.64L43.92 85.18s2.473-8.402-.388-12.496c-2.37-2.788-8.768-10.33-11.496-13.064l-4.57 3.627c1.363-4.368 2.183-8.61 2.46-12.71H49.19s-.027-7.38-2.372-7.38zm128.752-.502c6.51-8.013 14.054-18.302 14.054-18.302s-5.827-4.625-8.556-1.27c-1.874 2.548-11.51 15.063-11.51 15.063l6.012 4.51zm-46.903-18.462c-2.814-2.577-8.096.667-8.096.667s12.35 17.2 12.85 17.953l6.08-4.29s-8.02-11.752-10.83-14.33zM199.99 46.5c-6.18 0-40.908.292-40.953.292v-31.56c1.503 0 3.882-.124 7.14-.376 12.773-.753 21.914-1.25 27.427-1.504 0 0 3.817-8.496-.185-10.45-.96-.37-7.24 1.43-7.24 1.43s-51.63 5.153-72.61 5.64c.5 2.756 2.38 5.336 4.93 6.11 4.16 1.087 7.09.53 15.36.277 7.76-.5 13.65-.76 17.66-.76v31.19h-41.71s.88 6.97 7.97 7.14h33.73v22.16c0 4.364-3.498 6.87-7.65 6.6-4.4.034-8.15-.36-13.027-.566.623 1.24 1.977 4.496 6.035 6.824 3.087 1.502 5.054 2.053 8.13 2.053 9.237 0 14.27-5.4 14.027-14.16V53.93h38.235c3.026 0 2.72-7.432 2.72-7.432z" fill-rule="evenodd"></path></svg>
                    </a>
                    <div class="TopstoryPageHeader-tabs">
                        <a href="#" class="TopstoryTabs-link is-active">推荐</a>
                        <a href="#" class="TopstoryTabs-link">关注</a>
                        <a href="#" class="TopstoryTabs-link">热榜</a>
                    </div>
                </div>
                <div class="TopstoryPageHeader-aside">
                    <form action="#">
                        <label>
                            <input type="text" alt="">
                            <button type="button" class="button">
                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Search" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M17.068 15.58a8.377 8.377 0 0 0 1.774-5.159 8.421 8.421 0 1 0-8.42 8.421 8.38 8.38 0 0 0 5.158-1.774l3.879 3.88c.957.573 2.131-.464 1.488-1.49l-3.879-3.878zm-6.647 1.157a6.323 6.323 0 0 1-6.316-6.316 6.323 6.323 0 0 1 6.316-6.316 6.323 6.323 0 0 1 6.316 6.316 6.323 6.323 0 0 1-6.316 6.316z" fill-rule="evenodd"></path></svg></span>
                            </button>
                        </label>
                    </form>
                    <button type="button" class="button">
                        提问
                    </button>
                </div>
            </div>
        </div>
    </div>
</header>
    <main>
        <div class="Creator">
            <div class="Creator-side">
                <div class="CreatorSide-item">
                    <div class="CreatorSide-itemTitle">
                        <span class="CreatorSide-Icon"><svg class="Zi Zi--Creator" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M15.075 15.388l-3.024 3.024a4.041 4.041 0 0 0-1.014 1.697l-.26.868C7.844 20.986 4.91 21 2 21c.026-3.325 0-3.304.59-3.956 1.237-1.368 6.251-.68 6.44-2.976.043-.518-.36-1.06-.725-1.69C6.285 8.87 5.512 2 11.5 2c5.988 0 5.15 7.072 3.246 10.378-.357.62-.795 1.217-.724 1.77.073.571.477.958 1.053 1.24zm5.402 1.672c.523.55.523.646.523 3.94a535.11 535.11 0 0 0-4.434-.028l3.911-3.912zm-7.88 2.699c.111-.37.312-.705.584-.978l4.76-4.76a.291.291 0 0 1 .412 0l1.626 1.626a.291.291 0 0 1 0 .411l-4.76 4.76c-.272.273-.608.474-.978.585l-1.96.588a.219.219 0 0 1-.272-.272l.589-1.96zm9.157-6.742a.839.839 0 0 1 0 1.187l-.94.94a.28.28 0 0 1-.395 0l-1.563-1.563a.28.28 0 0 1 0-.395l.94-.94a.839.839 0 0 1 1.187 0l.771.771z" fill-rule="evenodd"></path></svg></span>
                        <div class="CreatorSide-itemText">创作中心</div>
                    </div>
                    <a href="creator" class="CreatorSide-Lick">
                        主页
                    </a>
                    <a href="#" class="CreatorSide-Lick">
                        活动中心
                    </a>
                </div>
                <div class="CreatorSide-item">
                    <div class="CreatorSide-itemTitle">
                        <span class="CreatorSide-Icon"><svg class="Zi Zi--Edit" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M4.076 16.966a4.19 4.19 0 0 1 1.05-1.76l8.568-8.569a.524.524 0 0 1 .741 0l2.928 2.927a.524.524 0 0 1 0 .74l-8.568 8.57c-.49.49-1.096.852-1.761 1.051l-3.528 1.058a.394.394 0 0 1-.49-.488l1.06-3.53zM20.558 4.83c.59.59.59 1.546 0 2.136l-1.693 1.692a.503.503 0 0 1-.712 0l-2.812-2.812a.504.504 0 0 1 0-.712l1.693-1.693a1.51 1.51 0 0 1 2.135 0l1.389 1.389z"></path></svg></span>
                        <div class="CreatorSide-itemText">创作</div>
                    </div>
                    <a href="#" class="CreatorSide-Lick">
                        问题推荐
                    </a>
                    <a href="#" class="CreatorSide-Lick">
                        上传视频
                    </a>
                    <a href="#" class="CreatorSide-Lick">
                        创作手册
                    </a>
                    <a href="#" class="CreatorSide-Lick">
                        圆桌手册
                    </a>
                </div>
                <div class="CreatorSide-item">
                    <div class="CreatorSide-itemTitle">
                        <span class="CreatorSide-Icon"><svg class="Zi Zi--Statistics" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M4.594 7.506l2.595-1.153a3.576 3.576 0 0 1 3.292.201l.652.391a2 2 0 0 0 1.923.074l5.828-2.913a1 1 0 0 1 .84-.025l.36.154a.744.744 0 0 1 .383.994l-.172.374a1 1 0 0 1-.461.477l-6.071 3.036a3.363 3.363 0 0 1-3.235-.125l-.691-.415a2 2 0 0 0-1.841-.112L4.703 9.927A.5.5 0 0 1 4 9.47V8.42a1 1 0 0 1 .594-.914zm6.301 3.528l.294.177a2.202 2.202 0 0 0 2.118.081l.357-.179a.5.5 0 0 1 .724.448V19a1 1 0 0 1-1 1h-2.25a1 1 0 0 1-1-1v-7.538a.5.5 0 0 1 .757-.429zm-2.645-.1V19a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-6.297a1 1 0 0 1 .594-.914l2.953-1.312a.5.5 0 0 1 .703.457zm12.276-2.35V19a1 1 0 0 1-1 1h-2.25a1 1 0 0 1-1-1v-8.48a1 1 0 0 1 .553-.895l2.973-1.487a.5.5 0 0 1 .724.447z" fill-rule="evenodd"></path></svg></span>
                        <div class="CreatorSide-itemText">创作数据</div>
                    </div>
                    <a href="creator/analytics" class="CreatorSide-Lick is-active">
                        内容分析
                    </a>
                    <a href="#" class="CreatorSide-Lick">
                        创作榜单
                    </a>
                </div>
                <div class="CreatorSide-item">
                    <div class="CreatorSide-itemTitle">
                        <span class="CreatorSide-Icon"><svg class="Zi Zi--Star" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd"></path></svg></span>
                        <div class="CreatorSide-itemText">更多曝光</div>
                    </div>
                    <a href="#" class="CreatorSide-Lick">
                        内容自推
                    </a>
                    <a href="#" class="CreatorSide-Lick">
                        自定义推广
                    </a>
                    <a href="#" class="CreatorSide-Lick">
                        圆桌主持人
                    </a>
                    <a href="#" class="CreatorSide-Lick">
                        专题主持人
                    </a>
                </div>
                <div class="CreatorSide-item">
                    <div class="CreatorSide-itemTitle">
                        <span class="CreatorSide-Icon"><svg class="Zi Zi--Wheat" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M14.185 8.965c-.393 0-1.74-1.36-1.74-3.04 0-1.679 1.347-3.04 1.74-3.04s1.74 1.361 1.74 3.04c0 1.68-1.347 3.04-1.74 3.04zm-3.492 3.473c-.393 0-1.74-1.361-1.74-3.04 0-1.68 1.347-3.04 1.74-3.04s1.74 1.36 1.74 3.04c0 1.679-1.346 3.04-1.74 3.04zm3.145 3.909c.428 0 .444.408.152.702-2.097 2.096-5.892.08-8.549 2.739-.78.779-2.082 2.085-2.082 2.085a.435.435 0 0 1-.616 0l-.615-.616a.435.435 0 0 1 0-.615s1.31-1.298 2.09-2.076c2.66-2.655.642-6.445 2.742-8.54.293-.292.702-.275.702.153 0 2.188 1.518 3.374 1.262 4.78a.107.107 0 0 0 .127.128c1.408-.256 2.596 1.26 4.787 1.26zm-2.268-3.038c0-.393 1.363-1.737 3.045-1.737 1.681 0 3.045 1.344 3.045 1.737s-1.364 1.737-3.045 1.737c-1.682 0-3.045-1.344-3.045-1.737zm3.478-3.473c0-.392 1.363-1.736 3.045-1.736 1.681 0 3.045 1.344 3.045 1.736 0 .393-1.364 1.737-3.045 1.737-1.682 0-3.045-1.344-3.045-1.737zm2.341-3.19c-.288-.29-.275-2.288.955-3.529 1.23-1.24 3.214-1.252 3.502-.962.288.29.276 2.289-.955 3.53-1.23 1.24-3.214 1.251-3.502.961z"></path></svg></span>
                        <div class="CreatorSide-itemText">内容创收</div>
                    </div>
                    <a href="#" class="CreatorSide-Lick">
                        赞赏功能
                    </a>
                    <a href="#" class="CreatorSide-Lick">
                        知乎 Live
                    </a>
                    <a href="#" class="CreatorSide-Lick">
                        品牌任务
                    </a>
                </div>
                <div class="CreatorSide-item">
                    <div class="CreatorSide-itemTitle">
                        <span class="CreatorSide-Icon"><svg class="Zi Zi--Profile" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M15.417 12.923c-.376.653-.837 1.281-.763 1.863.292 2.273 5.562 1.77 6.78 3.048.566.595.566.664.566 4.164-6.611-.07-13.363 0-20 0 .027-3.5 0-3.478.62-4.164 1.303-1.44 6.581-.715 6.78-3.133.045-.545-.38-1.114-.763-1.778C6.511 9.233 5.697 2 12 2s5.422 7.443 3.417 10.923z" fill-rule="evenodd"></path></svg></span>
                        <div class="CreatorSide-itemText">账号</div>
                    </div>
                    <a href="#" class="CreatorSide-Lick">
                        创作者等级
                    </a>
                    <a href="#" class="CreatorSide-Lick">
                        权益中心
                    </a>
                    <a href="#" class="CreatorSide-Lick">
                        账号信息
                    </a>
                    <a href="#" class="CreatorSide-Lick">
                        常见问题
                    </a>
                </div>
                <div class="CreatorSide-item">
                    <div class="CreatorSide-itemTitle">
                        <span class="CreatorSide-Icon"><svg class="Zi Zi--Help" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0-3.681a1.17 1.17 0 0 1-.846-.344 1.143 1.143 0 0 1-.354-.856c0-.328.118-.61.354-.847.236-.235.518-.353.846-.353.328 0 .61.115.846.344.236.23.354.515.354.856 0 .342-.118.626-.354.856-.236.229-.518.344-.846.344zm2.761-7.398c-.228.232-.637.621-1.227 1.17-.163.154-.295.29-.393.407a1.643 1.643 0 0 0-.22.32 1.614 1.614 0 0 0-.111.293c-.026.097-.066.267-.119.512-.09.518-.377.777-.857.777a.86.86 0 0 1-.63-.254c-.17-.17-.255-.421-.255-.755 0-.419.062-.78.187-1.087.125-.307.29-.576.497-.808.206-.231.485-.506.835-.825.307-.28.53-.49.666-.632.137-.142.252-.3.346-.474.093-.175.14-.364.14-.568 0-.399-.143-.735-.428-1.01-.286-.273-.655-.41-1.106-.41-.528 0-.917.138-1.166.414-.25.277-.46.684-.634 1.222-.163.563-.472.845-.928.845a.896.896 0 0 1-.68-.295c-.185-.197-.278-.41-.278-.64 0-.473.147-.952.44-1.438.292-.486.72-.888 1.28-1.207C10.683 6.16 11.339 6 12.087 6c.696 0 1.31.133 1.844.4a3.02 3.02 0 0 1 1.234 1.087c.291.459.436.957.436 1.495 0 .423-.083.794-.248 1.113a3.413 3.413 0 0 1-.59.826z" fill-rule="evenodd"></path></svg></span>
                        <div class="CreatorSide-itemText">其他</div>
                    </div>
                    <a href="#" class="CreatorSide-Lick">
                        瓦力保镖
                    </a>
                    <a href="#" class="CreatorSide-Lick">
                        版权服务
                    </a>
                </div>
            </div>
            <div class="Creator-main">
                <div class="Card">
                    <div class="AnalyticsWork">
                        <div class="AnalyticsWork-TabsBox">
                            <ul class="Tabs">
                                <li class="Tabs-item">
                                    <a href="creator/analytics" class="Tabs-link is-active">回答</a>
                                </li>
                                <li class="Tabs-item">
                                    <a href="javaScript:void(0)" class="Tabs-link">文章</a>
                                </li>
                                <li class="Tabs-item">
                                    <a href="javaScript:void(0)" class="Tabs-link">想法</a>
                                </li>
                                <%--<li class="Tabs-item">
                                    <a href="javaScript:void(0)" class="Tabs-link">视频</a>
                                </li>--%>
                            </ul>
                        </div>
                        <div class="AnalyticsWork-dataUpdateHint">
                            每天上午更新昨日数据，「--」表示暂无数据
                            <div class="Popover">
                                <div class="AnalyticsWork-TooltipHelpIcon">
                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Help" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0-3.681a1.17 1.17 0 0 1-.846-.344 1.143 1.143 0 0 1-.354-.856c0-.328.118-.61.354-.847.236-.235.518-.353.846-.353.328 0 .61.115.846.344.236.23.354.515.354.856 0 .342-.118.626-.354.856-.236.229-.518.344-.846.344zm2.761-7.398c-.228.232-.637.621-1.227 1.17-.163.154-.295.29-.393.407a1.643 1.643 0 0 0-.22.32 1.614 1.614 0 0 0-.111.293c-.026.097-.066.267-.119.512-.09.518-.377.777-.857.777a.86.86 0 0 1-.63-.254c-.17-.17-.255-.421-.255-.755 0-.419.062-.78.187-1.087.125-.307.29-.576.497-.808.206-.231.485-.506.835-.825.307-.28.53-.49.666-.632.137-.142.252-.3.346-.474.093-.175.14-.364.14-.568 0-.399-.143-.735-.428-1.01-.286-.273-.655-.41-1.106-.41-.528 0-.917.138-1.166.414-.25.277-.46.684-.634 1.222-.163.563-.472.845-.928.845a.896.896 0 0 1-.68-.295c-.185-.197-.278-.41-.278-.64 0-.473.147-.952.44-1.438.292-.486.72-.888 1.28-1.207C10.683 6.16 11.339 6 12.087 6c.696 0 1.31.133 1.844.4a3.02 3.02 0 0 1 1.234 1.087c.291.459.436.957.436 1.495 0 .423-.083.794-.248 1.113a3.413 3.413 0 0 1-.59.826z" fill-rule="evenodd"></path></svg></span>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="AnalyticsWork-entityPage">
                                <div class="AnalyticsWork-countBox">
                                    <div class="AnalyticsCount AnalyticsWorkAnswers-Count">
                                        <div class="AnalyticsCount-title">回答总数</div>
                                        <div class="AnalyticsCount-content">
                                            <div class="AnalyticsCount-number">${objNum}</div>
                                        </div>
                                    </div>
                                    <div class="AnalyticsCount AnalyticsWorkAnswers-Count">
                                        <div class="AnalyticsCount-title">阅读总数
                                            <div class="AnalyticsCount-subtitle">
                                                （2018/01/01 至今）
                                            </div>
                                        </div>
                                        <div class="AnalyticsCount-content">
                                            <div class="AnalyticsCount-number">${objLlNum}</div>
                                        </div>
                                    </div>
                                    <div class="AnalyticsCount AnalyticsWorkAnswers-Count">
                                        <div class="AnalyticsCount-title">赞同总数</div>
                                        <div class="AnalyticsCount-content">
                                            <div class="AnalyticsCount-number">${objZtNum}</div>
                                        </div>
                                    </div>
                                    <div class="AnalyticsCount AnalyticsWorkAnswers-Count">
                                        <div class="AnalyticsCount-title">昨日阅读数</div>
                                        <div class="AnalyticsCount-content">
                                            <div class="AnalyticsCount-number">${objLlNum1}</div>
                                            <div class="AnalyticsCount-number-origin">
                                                <div class="AnalyticsCount-number-originTitle">
                                                    较前日
                                                </div>
                                                <c:choose>
                                                    <c:when test="${objLlNumUp == 0}">
                                                        <div class="AnalyticsCount-number-originNumber ">
                                                            <span class="AnalyticsCount-number-origin-percent">
                                                        --
                                                    </span>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:if test="${objLlNumUp > 0}">
                                                            <div class="AnalyticsCount-number-originNumber AnalyticsCount-number-originNumber--up">
                                                    <span class="AnalyticsCount-number-origin-icon">
                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--BackToTop" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path
                                                                d="M16.036 19.59a1 1 0 0 1-.997.995H9.032a.996.996 0 0 1-.997-.996v-7.005H5.03c-1.1 0-1.36-.633-.578-1.416L11.33 4.29a1.003 1.003 0 0 1 1.412 0l6.878 6.88c.782.78.523 1.415-.58 1.415h-3.004v7.005z"/></svg></span>
                                                    </span>
                                                                <span class="AnalyticsCount-number-origin-percent">
                                                        ${objLlNumUp}%
                                                    </span>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${objLlNumUp < 0}">
                                                            <div class="AnalyticsCount-number-originNumber AnalyticsCount-number-originNumber--down">
                                                    <span class="AnalyticsCount-number-origin-icon">
                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--SolidArrowDown" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M16.036 4.994a1 1 0 0 0-.997-.995H9.032a.996.996 0 0 0-.997.996V12H5.03c-1.1 0-1.36.633-.578 1.416l6.878 6.878c.39.39 1.026.385 1.412 0l6.878-6.88c.782-.78.523-1.415-.58-1.415h-3.004V4.994z"></path></svg></span>
                                                    </span>
                                                                <span class="AnalyticsCount-number-origin-percent">
                                                        ${objLlNumUp*-1}%
                                                    </span>
                                                            </div>
                                                        </c:if>

                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="AnalyticsCount AnalyticsWorkAnswers-Count">
                                        <div class="AnalyticsCount-title">昨日赞同数</div>
                                        <div class="AnalyticsCount-content">
                                            <div class="AnalyticsCount-number">${objZtNum1}</div>
                                            <div class="AnalyticsCount-number-origin">
                                                <div class="AnalyticsCount-number-originTitle">
                                                    较前日
                                                </div>
                                                <c:choose>
                                                    <c:when test="${objZtNumUp == 0}">
                                                        <div class="AnalyticsCount-number-originNumber">
                                                            <span class="AnalyticsCount-number-origin-percent">
                                                        --
                                                    </span>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:if test="${objZtNumUp > 0}">
                                                            <div class="AnalyticsCount-number-originNumber AnalyticsCount-number-originNumber--up">
                                                    <span class="AnalyticsCount-number-origin-icon">
                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--BackToTop" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M16.036 19.59a1 1 0 0 1-.997.995H9.032a.996.996 0 0 1-.997-.996v-7.005H5.03c-1.1 0-1.36-.633-.578-1.416L11.33 4.29a1.003 1.003 0 0 1 1.412 0l6.878 6.88c.782.78.523 1.415-.58 1.415h-3.004v7.005z"/></svg></span>
                                                    </span>
                                                                <span class="AnalyticsCount-number-origin-percent">
                                                        ${objZtNumUp}%
                                                    </span>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${objZtNumUp < 0}">
                                                            <div class="AnalyticsCount-number-originNumber AnalyticsCount-number-originNumber--down">
                                                    <span class="AnalyticsCount-number-origin-icon">
                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--SolidArrowDown" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M16.036 4.994a1 1 0 0 0-.997-.995H9.032a.996.996 0 0 0-.997.996V12H5.03c-1.1 0-1.36.633-.578 1.416l6.878 6.878c.39.39 1.026.385 1.412 0l6.878-6.88c.782-.78.523-1.415-.58-1.415h-3.004V4.994z"></path></svg></span>
                                                    </span>
                                                                <span class="AnalyticsCount-number-origin-percent">
                                                        ${objZtNumUp*-1}%
                                                    </span>
                                                            </div>
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="CreatorSection AnalyticsWork-CreatorSection AnalyticsWork-metaChart">
                                    <div class="CreatorSection-header">
                                        <div class="AnalyticsWork-detailCountHeader">
                                            <div class="AnalyticsWork-detailCountMenu">
                                                <div class="CreatorSectionItem CreatorSectionItem--clickable is-active">
                                                    <div class="CreatorSectionItem--name">
                                                        所有回答
                                                    </div>
                                                    <div class="Popover">
                                                        <div class="CreatorSectionItem-TooltipIconContainer">
                                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Help" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0-3.681a1.17 1.17 0 0 1-.846-.344 1.143 1.143 0 0 1-.354-.856c0-.328.118-.61.354-.847.236-.235.518-.353.846-.353.328 0 .61.115.846.344.236.23.354.515.354.856 0 .342-.118.626-.354.856-.236.229-.518.344-.846.344zm2.761-7.398c-.228.232-.637.621-1.227 1.17-.163.154-.295.29-.393.407a1.643 1.643 0 0 0-.22.32 1.614 1.614 0 0 0-.111.293c-.026.097-.066.267-.119.512-.09.518-.377.777-.857.777a.86.86 0 0 1-.63-.254c-.17-.17-.255-.421-.255-.755 0-.419.062-.78.187-1.087.125-.307.29-.576.497-.808.206-.231.485-.506.835-.825.307-.28.53-.49.666-.632.137-.142.252-.3.346-.474.093-.175.14-.364.14-.568 0-.399-.143-.735-.428-1.01-.286-.273-.655-.41-1.106-.41-.528 0-.917.138-1.166.414-.25.277-.46.684-.634 1.222-.163.563-.472.845-.928.845a.896.896 0 0 1-.68-.295c-.185-.197-.278-.41-.278-.64 0-.473.147-.952.44-1.438.292-.486.72-.888 1.28-1.207C10.683 6.16 11.339 6 12.087 6c.696 0 1.31.133 1.844.4a3.02 3.02 0 0 1 1.234 1.087c.291.459.436.957.436 1.495 0 .423-.083.794-.248 1.113a3.413 3.413 0 0 1-.59.826z" fill-rule="evenodd"></path></svg></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="CreatorSectionItem CreatorSectionItem--clickable">
                                                    <div class="CreatorSectionItem--name">
                                                        单片回答分析
                                                    </div>
                                                    <div class="Popover">
                                                        <div class="CreatorSectionItem-TooltipIconContainer">
                                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Help" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0-3.681a1.17 1.17 0 0 1-.846-.344 1.143 1.143 0 0 1-.354-.856c0-.328.118-.61.354-.847.236-.235.518-.353.846-.353.328 0 .61.115.846.344.236.23.354.515.354.856 0 .342-.118.626-.354.856-.236.229-.518.344-.846.344zm2.761-7.398c-.228.232-.637.621-1.227 1.17-.163.154-.295.29-.393.407a1.643 1.643 0 0 0-.22.32 1.614 1.614 0 0 0-.111.293c-.026.097-.066.267-.119.512-.09.518-.377.777-.857.777a.86.86 0 0 1-.63-.254c-.17-.17-.255-.421-.255-.755 0-.419.062-.78.187-1.087.125-.307.29-.576.497-.808.206-.231.485-.506.835-.825.307-.28.53-.49.666-.632.137-.142.252-.3.346-.474.093-.175.14-.364.14-.568 0-.399-.143-.735-.428-1.01-.286-.273-.655-.41-1.106-.41-.528 0-.917.138-1.166.414-.25.277-.46.684-.634 1.222-.163.563-.472.845-.928.845a.896.896 0 0 1-.68-.295c-.185-.197-.278-.41-.278-.64 0-.473.147-.952.44-1.438.292-.486.72-.888 1.28-1.207C10.683 6.16 11.339 6 12.087 6c.696 0 1.31.133 1.844.4a3.02 3.02 0 0 1 1.234 1.087c.291.459.436.957.436 1.495 0 .423-.083.794-.248 1.113a3.413 3.413 0 0 1-.59.826z" fill-rule="evenodd"></path></svg></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="AnalyticsDetailRangPicker AnalyticsWork-detailRangPicker">
                                                <div class="AnalyticsDetailRangPicker-dateLast">
                                                    <button class="button AnalyticsDetailRangPicker-dateButton is-active" data-dayNum="7" type="button">最近 7 天</button>
                                                    <button class="button AnalyticsDetailRangPicker-dateButton" data-dayNum="14" type="button">最近 14 天</button>
                                                    <button class="button AnalyticsDetailRangPicker-dateButton" data-dayNum="30" type="button">最近 30 天</button>
                                                    <button class="button AnalyticsDetailRangPicker-dateButton" data-dayNum="90" type="button">最近 90 天</button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="CreatorSection-body">
                                    <!--<div class="AnalyticsWork-detailCount">
                                            <div class="AnalyticsWork-detailCountBodyHeader">
                                                <div class="AnalyticsWork-detailCountBodyHeaderTitle">
                                                    数据趋势
                                                </div>
                                            </div>
                                            <div class="AnalyticsChart AnalyticsWork-detailCountChart">
                                                <div id="main" style="width: 100%;height: 440px;"></div>

                                            </div>
                                        </div>
                                        <div class="AnalyticsWork-detailCount">
                                            <div class="AnalyticsWork-detailCountBodyHeader">
                                                <div class="AnalyticsWork-detailCountBodyHeaderTitle">
                                                    分日报表
                                                </div>
                                                <div class="AnalyticsWork-detailCountBodyHeaderTool">
                                                    <div class="AnalyticsWork-detailCountBodyHeaderToolButton">
                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;Download" fill="currentColor" viewBox="0 0 24 24" width="16" height="16"><path d="M13.5 12.09l3.486-3.196a1.5 1.5 0 1 1 2.028 2.212l-6 5.5a1.5 1.5 0 0 1-2.028 0l-6-5.5a1.5 1.5 0 1 1 2.028-2.212L10.5 12.09V3.5a1.5 1.5 0 0 1 3 0v8.59zM6.5 22a1.5 1.5 0 0 1 0-3h11a1.5 1.5 0 0 1 0 3h-11z"></path></svg></span>
                                                        导出 Excel
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="CreatorTable">
                                                <div class="CreatorTable-tableBox">
                                                    <table class="CreatorTable-table" cellspacing="0" cellpadding="0">
                                                        <thead>
                                                        <tr class="CreatorTable-tableRow CreatorTable-tableRow&#45;&#45;header">
                                                            <th class="CreatorTable-tableHead" style="width: 102px">发布时间
                                                                <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>
                                                            </th>
                                                            <th class="CreatorTable-tableHead" style="width: 102px">阅读数
                                                                <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>
                                                            </th>
                                                            <th class="CreatorTable-tableHead" style="width: 80px">评论数
                                                                <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>
                                                            </th>
                                                            <th class="CreatorTable-tableHead" style="width: 80px">赞同数
                                                                <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>
                                                            </th>
                                                            <th class="CreatorTable-tableHead" style="width: 80px">喜欢数
                                                                <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>
                                                            </th>
                                                            <th class="CreatorTable-tableHead" style="width: 80px">收藏数
                                                                <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>
                                                            </th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr class="CreatorTable-tableRow">
                                                            <td class="CreatorTable-tableDate">
                                                                2020/01/03
                                                            </td>
                                                            <td class="CreatorTable-tableDate">
                                                                5
                                                            </td>
                                                            <td class="CreatorTable-tableDate">
                                                                0
                                                            </td>
                                                            <td class="CreatorTable-tableDate">
                                                                0
                                                            </td>
                                                            <td class="CreatorTable-tableDate">
                                                                0
                                                            </td>
                                                            <td class="CreatorTable-tableDate">
                                                                0
                                                            </td>
                                                        </tr>
                                                        <tr class="CreatorTable-tableRow">
                                                            <td class="CreatorTable-tableDate">
                                                            </td>
                                                            <td class="CreatorTable-tableDate">
                                                            </td>
                                                            <td class="CreatorTable-tableDate">
                                                            </td>
                                                            <td class="CreatorTable-tableDate">
                                                            </td>
                                                            <td class="CreatorTable-tableDate">
                                                            </td>
                                                            <td class="CreatorTable-tableDate">
                                                            </td>
                                                        </tr>
                                                        
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="CreatorPagination CreatorTable-Pagination">
                                                    <button class="button CreatorPagination-Button CreatorPagination-Button&#45;&#45;disabled CreatorPagination-lastButton" type="button">
                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>
                                                    </button>
                                                    <div class="CreatorPagination-pageNumber">
                                                        1
                                                        /
                                                        1
                                                    </div>
                                                    <button class="button CreatorPagination-Button CreatorPagination-Button&#45;&#45;disabled CreatorPagination-nextButton" type="button">
                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>
                                                    </button>
                                                    <label class="CreatorPagination-Input Input-wrapper">
                                                        <input type="text" value="1">
                                                    </label>
                                                    <button class="button CreatorPagination-Button CreatorPagination-Button&#45;&#45;skip" type="button">跳转</button>
                                                </div>
                                            </div>

                                        </div>-->
                                    <!--
                                        <div class="AnalyticsWork-detailCount">
                                            <div class="AnalyticsWork-detailCountBodyHeader">
                                                <div class="AnalyticsWork-detailCountBodyHeaderTitle">
                                                    统计详情
                                                </div>
                                                <div class="AnalyticsWork-detailCountBodyHeaderTool">
                                                    <div class="AnalyticsWork-detailCountBodyHeaderToolButton">
                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;Download" fill="currentColor" viewBox="0 0 24 24" width="16" height="16"><path d="M13.5 12.09l3.486-3.196a1.5 1.5 0 1 1 2.028 2.212l-6 5.5a1.5 1.5 0 0 1-2.028 0l-6-5.5a1.5 1.5 0 1 1 2.028-2.212L10.5 12.09V3.5a1.5 1.5 0 0 1 3 0v8.59zM6.5 22a1.5 1.5 0 0 1 0-3h11a1.5 1.5 0 0 1 0 3h-11z"></path></svg></span>
                                                        导出 Excel
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="CreatorTable">
                                                <div class="CreatorTable-tableBox">
                                                    <table class="CreatorTable-table" cellspacing="0" cellpadding="0">
                                                        <thead>
                                                            <tr class="CreatorTable-tableRow CreatorTable-tableRow&#45;&#45;header">
                                                                <th class="CreatorTable-tableHead AnalyticsWork-titleColumn">回答内容</th>
                                                                <th class="CreatorTable-tableHead" style="width: 102px">发布时间
                                                                    <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>
                                                                </th>
                                                                <th class="CreatorTable-tableHead" style="width: 102px">阅读数
                                                                    <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>
                                                                </th>
                                                                <th class="CreatorTable-tableHead" style="width: 80px">评论数
                                                                    <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>
                                                                </th>
                                                                <th class="CreatorTable-tableHead" style="width: 80px">赞同数
                                                                    <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>
                                                                </th>
                                                                <th class="CreatorTable-tableHead" style="width: 80px">喜欢数
                                                                    <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>
                                                                </th>
                                                                <th class="CreatorTable-tableHead" style="width: 80px">收藏数
                                                                    <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>
                                                                </th>
                                                                <th class="CreatorTable-tableHead" style="width: 80px">操作</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr class="CreatorTable-tableRow">
                                                                <td class="CreatorTable-tableDate AnalyticsWork-titleColumn">
                                                                    <a href="#" class="Creator-entityLink">当然是《樱花庄》啦，吹爆我真白！！ [图片]</a>
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                    2020/01/03
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                    5
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                    0
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                    0
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                    0
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                    0
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                    <div class="AnalyticsWork-detailExpand Creator-internalLink">
                                                                        详细分析
                                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="6" height="6"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr class="CreatorTable-tableRow">
                                                                <td class="CreatorTable-tableDate AnalyticsWork-titleColumn">
                                                                    <a href="#" class="Creator-entityLink">当然是《樱花庄》啦，吹爆我真白！！ [图片]</a>
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                    2020/01/03
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                    5
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                    0
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                    0
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                    0
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                    0
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                    <div class="AnalyticsWork-detailExpand Creator-internalLink">
                                                                        详细分析
                                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="6" height="6"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            &lt;!&ndash;<tr class="CreatorTable-tableRow CreatorTable-tableRowExpanded">
                                                                <td class="CreatorTable-tableDate" colspan="8">
                                                                    <div class="AnalyticsWork-expandRowBox">
                                                                        <div class="DateLimitSelector AnalyticsWork-DateLimitSelector">
                                                                            <button class="Creator-ButtonGroupButton ButtonGroupButton-select">
                                                                                最近
                                                                                14
                                                                                天
                                                                            </button>
                                                                            <button class="Creator-ButtonGroupButton">
                                                                                最近
                                                                                30
                                                                                天
                                                                            </button>
                                                                            <button class="Creator-ButtonGroupButton">
                                                                                最近
                                                                                90
                                                                                天
                                                                            </button>
                                                                        </div>
                                                                        <div class="AnalyticsChart AnalyticsWork-expandRowChart">
                                                                            <div id="main" style="width: 100%;height: 440px;"></div>

                                                                        </div>
                                                                    </div>

                                                                </td>
                                                            </tr>&ndash;&gt;
                                                            <tr class="CreatorTable-tableRow">
                                                                <td class="CreatorTable-tableDate AnalyticsWork-titleColumn">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                            </tr>
                                                            <tr class="CreatorTable-tableRow">
                                                                <td class="CreatorTable-tableDate AnalyticsWork-titleColumn">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                            </tr>
                                                            <tr class="CreatorTable-tableRow">
                                                                <td class="CreatorTable-tableDate AnalyticsWork-titleColumn">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                            </tr>
                                                            <tr class="CreatorTable-tableRow">
                                                                <td class="CreatorTable-tableDate AnalyticsWork-titleColumn">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                            </tr>
                                                            <tr class="CreatorTable-tableRow">
                                                                <td class="CreatorTable-tableDate AnalyticsWork-titleColumn">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                            </tr>
                                                            <tr class="CreatorTable-tableRow">
                                                                <td class="CreatorTable-tableDate AnalyticsWork-titleColumn">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                            </tr>
                                                            <tr class="CreatorTable-tableRow">
                                                                <td class="CreatorTable-tableDate AnalyticsWork-titleColumn">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                            </tr>
                                                            <tr class="CreatorTable-tableRow">
                                                                <td class="CreatorTable-tableDate AnalyticsWork-titleColumn">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                                <td class="CreatorTable-tableDate">
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="CreatorPagination CreatorTable-Pagination">
                                                    <button class="button CreatorPagination-Button CreatorPagination-Button&#45;&#45;disabled CreatorPagination-lastButton" type="button">
                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>
                                                    </button>
                                                    <div class="CreatorPagination-pageNumber">
                                                        1
                                                        /
                                                        1
                                                    </div>
                                                    <button class="button CreatorPagination-Button CreatorPagination-Button&#45;&#45;disabled CreatorPagination-nextButton" type="button">
                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>
                                                    </button>
                                                    <label class="CreatorPagination-Input Input-wrapper">
                                                        <input type="text" value="1">
                                                    </label>
                                                    <button class="button CreatorPagination-Button CreatorPagination-Button&#45;&#45;skip" type="button">跳转</button>
                                                </div>
                                            </div>
                                        </div>-->
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/Header-Head.js"></script>
    <script src="Scripts/echarts.min.js"></script>

    <script src="Scripts/test.js"></script>
    <script src="Scripts/answers.js"></script>

</body>
</html>
