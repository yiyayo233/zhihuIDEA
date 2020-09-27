<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>创作中心 - 知乎</title>
      <link rel="icon" href="images/favicon.ico">
    <link rel="stylesheet" href="css/Header-Head.css">
    <link rel="stylesheet" href="css/Header-Topstory.css">
    <link rel="stylesheet" href="css/questionWaiting.css">


    <link rel="stylesheet" href="css/creator.css">

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
  <body>
  <input id="user" type="hidden" data-user-id="<%=uId%>" data-user-name="<%=uName%>" data-user-ChatHead="<%=uChatHead%>">
    <header class="Header">
        <div class="AppHeader">
            <a href="/zhihuIDEA_war_exploded/">
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
                    <a href="creator" class="CreatorSide-Lick is-active">
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
                    <a href="creator/analytics" class="CreatorSide-Lick">
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
                <div class="CreatorHome">
                    <div class="Card CreatorHomeGeneralCard">
                        <div class="CreatorHomeLevelInfo">
                            <img class="CreatorHomeLevelInfo-LevelImage" src="images/Creator/V2.5ae65d27.jpg"/>
                            <div class="CreatorHomeLevelInfo-Level">
                                <a href="#">
                                    <div class="CreatorHomeLevelInfo-LevelTitle CreatorHomeLevelInfo-LevelTitle--2">
                                        创作等级：Lv 2
                                        <div class="CreatorHomeLevelInfo-levelTitleHint">每周四更新</div>
                                    </div>
                                    <div class="CreatorHomeLevelBar-Box CreatorHomeLevelBar-Box--2">
                                        <div class="CreatorHomeLevelBar CreatorHomeLevelBar--2">
                                            <div class="CreatorHomeLevelBar-background"></div>
                                            <div class="CreatorHomeLevelBar-progressContainer">
                                                <div class="CreatorHomeLevelBar-progress" style="width: calc(0% - 0px)">
                                                    <div class="CreatorHomeLevelBar-progressEnd"></div>
                                                    <div class="CreatorHomeLevelBar-progressEndPopover">
                                                        <div class="CreatorHomeLevelBar-progressEndPopoverToggler"></div>
                                                    </div>

                                                </div>
                                                <div class="CreatorHomeLevelBar-percentInfoWrapper" style="margin-left: calc(0% - 18px)">
                                                    <div class="CreatorHomeLevelBar-percentInfoWrapper--arrow"></div>
                                                    <div class="CreatorHomeLevelBar-percentInfoWrapper--info">
                                                        0%
                                                    </div>
                                                </div>
                                                <div class="CreatorHomeLevelBar-endpoint">
                                                    <div class="CreatorHomeLevelBar-endpointLevel">Lv 3</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <div class="Popover GrowthGuide">
                                    <span class="GrowthGuide-info">
                                        <span class="GrowthGuide-info-text">创作分</span>
                                        <span class="GrowthGuide-info-percent">102 / 500</span>
                                        <span class="GrowthGuide-info-icon">
                                            <span data-za-detail-view-path-module="Content" data-za-extra-module="{}" style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Help css-9n3bbc" fill="currentColor" viewBox="0 0 24 24" width="12" height="12"><path d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0-3.681a1.17 1.17 0 0 1-.846-.344 1.143 1.143 0 0 1-.354-.856c0-.328.118-.61.354-.847.236-.235.518-.353.846-.353.328 0 .61.115.846.344.236.23.354.515.354.856 0 .342-.118.626-.354.856-.236.229-.518.344-.846.344zm2.761-7.398c-.228.232-.637.621-1.227 1.17-.163.154-.295.29-.393.407a1.643 1.643 0 0 0-.22.32 1.614 1.614 0 0 0-.111.293c-.026.097-.066.267-.119.512-.09.518-.377.777-.857.777a.86.86 0 0 1-.63-.254c-.17-.17-.255-.421-.255-.755 0-.419.062-.78.187-1.087.125-.307.29-.576.497-.808.206-.231.485-.506.835-.825.307-.28.53-.49.666-.632.137-.142.252-.3.346-.474.093-.175.14-.364.14-.568 0-.399-.143-.735-.428-1.01-.286-.273-.655-.41-1.106-.41-.528 0-.917.138-1.166.414-.25.277-.46.684-.634 1.222-.163.563-.472.845-.928.845a.896.896 0 0 1-.68-.295c-.185-.197-.278-.41-.278-.64 0-.473.147-.952.44-1.438.292-.486.72-.888 1.28-1.207C10.683 6.16 11.339 6 12.087 6c.696 0 1.31.133 1.844.4a3.02 3.02 0 0 1 1.234 1.087c.291.459.436.957.436 1.495 0 .423-.083.794-.248 1.113a3.413 3.413 0 0 1-.59.826z" fill-rule="evenodd"></path></svg></span>
                                        </span>
                                    </span>
                                </div>
                                <div class="CreatorHomeLevelInfo-rights CreatorHomeLevelInfo-rights--2">
                                    <div class="CreatorHomeLevelInfo-rightsHint CreatorHomeLevelInfo-rightsHint--2">已解锁权益：</div>
                                    <div class="CreatorHomeLevelInfo-RinghtsIconContainer">
                                        <div class="Popover">
                                            <span>
                                                <a href="#" class="CreatorHomeLevelInfo-RinghtsIconLick">
                                                    <svg class="Zi Zi--Statistics css-1ntg9ig" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M4.594 7.506l2.595-1.153a3.576 3.576 0 0 1 3.292.201l.652.391a2 2 0 0 0 1.923.074l5.828-2.913a1 1 0 0 1 .84-.025l.36.154a.744.744 0 0 1 .383.994l-.172.374a1 1 0 0 1-.461.477l-6.071 3.036a3.363 3.363 0 0 1-3.235-.125l-.691-.415a2 2 0 0 0-1.841-.112L4.703 9.927A.5.5 0 0 1 4 9.47V8.42a1 1 0 0 1 .594-.914zm6.301 3.528l.294.177a2.202 2.202 0 0 0 2.118.081l.357-.179a.5.5 0 0 1 .724.448V19a1 1 0 0 1-1 1h-2.25a1 1 0 0 1-1-1v-7.538a.5.5 0 0 1 .757-.429zm-2.645-.1V19a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-6.297a1 1 0 0 1 .594-.914l2.953-1.312a.5.5 0 0 1 .703.457zm12.276-2.35V19a1 1 0 0 1-1 1h-2.25a1 1 0 0 1-1-1v-8.48a1 1 0 0 1 .553-.895l2.973-1.487a.5.5 0 0 1 .724.447z" fill-rule="evenodd"></path></svg>
                                                </a>
                                            </span>
                                        </div>
                                        <div class="Popover">
                                            <span>
                                                <a href="#" class="CreatorHomeLevelInfo-RinghtsIconLick">
                                                    <svg class="Zi Zi--Copyright css-1ntg9ig" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M16.517 15.815a5.871 5.871 0 0 1-4.481 2.078 5.865 5.865 0 0 1-5.859-5.857 5.865 5.865 0 0 1 5.859-5.859c1.63 0 3.204.7 4.319 1.919.085.093.24.432.209.797a1.086 1.086 0 0 1-.436.779c-.248.193-.516.29-.797.29-.402 0-.7-.198-.814-.314A3.473 3.473 0 0 0 12 8.575a3.464 3.464 0 0 0-3.46 3.461 3.464 3.464 0 0 0 3.46 3.46 3.63 3.63 0 0 0 2.654-1.181c.136-.152.458-.306.806-.306.274 0 .542.095.773.274.35.269.45.588.473.809.032.308-.072.585-.188.723m4.686-7.699C20.67 6.883 19.96 5.82 19.07 4.929c-.891-.89-1.954-1.601-3.188-2.133A9.728 9.728 0 0 0 12 2a9.733 9.733 0 0 0-3.883.796c-1.234.532-2.297 1.243-3.186 2.133-.891.891-1.602 1.954-2.134 3.187A9.713 9.713 0 0 0 2 12a9.752 9.752 0 0 0 .797 3.883c.531 1.233 1.242 2.296 2.134 3.186.89.891 1.953 1.602 3.186 2.134A9.725 9.725 0 0 0 12 22a9.72 9.72 0 0 0 3.883-.797c1.233-.532 2.296-1.243 3.188-2.134.89-.89 1.601-1.953 2.132-3.186A9.73 9.73 0 0 0 22 12a9.69 9.69 0 0 0-.797-3.884" fill-rule="evenodd"></path></svg>
                                                </a>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="Popover">
                                        <span>
                                            <a href="#" class="CreatorHomeLevelInfo-RinghtsIconLick CreatorHomeLevelInfo-AddRinghts">
                                                <div class="CreatorHomeLevelInfo-AddRinghtsHint">V4 将解锁权益：</div>
                                                <svg class="Zi Zi--Star css-q2un8s" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd"></path></svg>
                                            </a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="CreatorHomeGeneralCard-statisticsArea">
                            <div class="CreatorHomeDeltaCount CreatorHomeGeneralCard-statisticsDeltaCount">
                                <div class="CreatorHomeDeltaCount-compareTitle CreatorHomeDeltaCount-compareTitle--withHint">
                                    阅读总数
                                    <svg class="Zi Zi--Help HelpTooltip CreatorHomeDeltaCount-compareTitleTip" data-tooltip="数据来源于回答和文章" data-tooltip-position="bottom" data-tooltip-preset="white" data-tooltip-classname="HelpTooltip-tooltip" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0-3.681a1.17 1.17 0 0 1-.846-.344 1.143 1.143 0 0 1-.354-.856c0-.328.118-.61.354-.847.236-.235.518-.353.846-.353.328 0 .61.115.846.344.236.23.354.515.354.856 0 .342-.118.626-.354.856-.236.229-.518.344-.846.344zm2.761-7.398c-.228.232-.637.621-1.227 1.17-.163.154-.295.29-.393.407a1.643 1.643 0 0 0-.22.32 1.614 1.614 0 0 0-.111.293c-.026.097-.066.267-.119.512-.09.518-.377.777-.857.777a.86.86 0 0 1-.63-.254c-.17-.17-.255-.421-.255-.755 0-.419.062-.78.187-1.087.125-.307.29-.576.497-.808.206-.231.485-.506.835-.825.307-.28.53-.49.666-.632.137-.142.252-.3.346-.474.093-.175.14-.364.14-.568 0-.399-.143-.735-.428-1.01-.286-.273-.655-.41-1.106-.41-.528 0-.917.138-1.166.414-.25.277-.46.684-.634 1.222-.163.563-.472.845-.928.845a.896.896 0 0 1-.68-.295c-.185-.197-.278-.41-.278-.64 0-.473.147-.952.44-1.438.292-.486.72-.888 1.28-1.207C10.683 6.16 11.339 6 12.087 6c.696 0 1.31.133 1.844.4a3.02 3.02 0 0 1 1.234 1.087c.291.459.436.957.436 1.495 0 .423-.083.794-.248 1.113a3.413 3.413 0 0 1-.59.826z" fill-rule="evenodd"></path></svg>
                                </div>
                                <div class="CreatorHomeDeltaCount-compare">${BrowseAllNum}</div>
                                <div class="CreatorHomeDeltaCount-origin">
                                    <div class="CreatorHomeDeltaCount-originTitle">昨日阅读数</div>
                                    <c:choose>
                                        <c:when test="${BrowseAllUpNum > 0}">
                                            <div class="CreatorHomeDeltaCount-originNumber CreatorHomeDeltaCount-originNumber--up">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--BackToTop CreatorHomeDeltaCount-upIcon" fill="currentColor" viewBox="0 0 24 24" width="12" height="12"><path d="M16.036 19.59a1 1 0 0 1-.997.995H9.032a.996.996 0 0 1-.997-.996v-7.005H5.03c-1.1 0-1.36-.633-.578-1.416L11.33 4.29a1.003 1.003 0 0 1 1.412 0l6.878 6.88c.782.78.523 1.415-.58 1.415h-3.004v7.005z"></path></svg></span>
                                                ${BrowseAllUpNum}
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="CreatorHomeDeltaCount-originNumber">
                                                0
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="CreatorHomeDeltaCount CreatorHomeGeneralCard-statisticsDeltaCount">
                                <div class="CreatorHomeDeltaCount-compareTitle CreatorHomeDeltaCount-compareTitle--withHint">
                                    赞同总数
                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Help HelpTooltip CreatorHomeDeltaCount-compareTitleTip" data-tooltip="数据来源于回答和文章" data-tooltip-position="bottom" data-tooltip-preset="white" data-tooltip-classname="HelpTooltip-tooltip" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zm0-3.681a1.17 1.17 0 0 1-.846-.344 1.143 1.143 0 0 1-.354-.856c0-.328.118-.61.354-.847.236-.235.518-.353.846-.353.328 0 .61.115.846.344.236.23.354.515.354.856 0 .342-.118.626-.354.856-.236.229-.518.344-.846.344zm2.761-7.398c-.228.232-.637.621-1.227 1.17-.163.154-.295.29-.393.407a1.643 1.643 0 0 0-.22.32 1.614 1.614 0 0 0-.111.293c-.026.097-.066.267-.119.512-.09.518-.377.777-.857.777a.86.86 0 0 1-.63-.254c-.17-.17-.255-.421-.255-.755 0-.419.062-.78.187-1.087.125-.307.29-.576.497-.808.206-.231.485-.506.835-.825.307-.28.53-.49.666-.632.137-.142.252-.3.346-.474.093-.175.14-.364.14-.568 0-.399-.143-.735-.428-1.01-.286-.273-.655-.41-1.106-.41-.528 0-.917.138-1.166.414-.25.277-.46.684-.634 1.222-.163.563-.472.845-.928.845a.896.896 0 0 1-.68-.295c-.185-.197-.278-.41-.278-.64 0-.473.147-.952.44-1.438.292-.486.72-.888 1.28-1.207C10.683 6.16 11.339 6 12.087 6c.696 0 1.31.133 1.844.4a3.02 3.02 0 0 1 1.234 1.087c.291.459.436.957.436 1.495 0 .423-.083.794-.248 1.113a3.413 3.413 0 0 1-.59.826z" fill-rule="evenodd"></path></svg></span>
                                </div>
                                <div class="CreatorHomeDeltaCount-compare">${ztAllNum}</div>
                                <div class="CreatorHomeDeltaCount-origin">
                                    <div class="CreatorHomeDeltaCount-originTitle">昨日赞同数</div>
                                    <c:choose>
                                        <c:when test="${ztAlUpNum > 0}">
                                            <div class="CreatorHomeDeltaCount-originNumber CreatorHomeDeltaCount-originNumber--up">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--BackToTop CreatorHomeDeltaCount-upIcon" fill="currentColor" viewBox="0 0 24 24" width="12" height="12"><path d="M16.036 19.59a1 1 0 0 1-.997.995H9.032a.996.996 0 0 1-.997-.996v-7.005H5.03c-1.1 0-1.36-.633-.578-1.416L11.33 4.29a1.003 1.003 0 0 1 1.412 0l6.878 6.88c.782.78.523 1.415-.58 1.415h-3.004v7.005z"></path></svg></span>
                                                    ${ztAlUpNum}
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="CreatorHomeDeltaCount-originNumber">
                                                0
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="CreatorHomeDeltaCount CreatorHomeGeneralCard-statisticsDeltaCount">
                                <div class="CreatorHomeDeltaCount-compareTitle CreatorHomeDeltaCount-compareTitle--withHint">
                                    关注者总数
                                </div>
                                <div class="CreatorHomeDeltaCount-compare">0</div>
                                <div class="CreatorHomeDeltaCount-origin">
                                    <div class="CreatorHomeDeltaCount-originTitle">昨日新增关注者</div>
                                    <div class="CreatorHomeDeltaCount-originNumber">0</div>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="button CreatorHomeGeneralCard-analyticsButton">
                            数据详情
                            <svg class="Zi Zi--ArrowRight" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M9.218 16.78a.737.737 0 0 0 1.052 0l4.512-4.249a.758.758 0 0 0 0-1.063L10.27 7.22a.737.737 0 0 0-1.052 0 .759.759 0 0 0-.001 1.063L13 12l-3.782 3.716a.758.758 0 0 0 0 1.063z" fill-rule="evenodd"></path></svg>
                        </a>
                    </div>
                    <div class="Card CreatorHomeAnalyticsData">
                        <div class="CreatorHomeAnalyticsData-title">
                            近期创作数据
                            <div class="CreatorHomeAnalyticsData-titleHint">
                                截止至昨日
                            </div>
                        </div>

                        <div class="CreatorHomeAnalyticsData-dataBox">
                            <c:forEach var="item" items="${CreatorHomeAnalyticsDataItems}">

                                <div class="CreatorHomeAnalyticsDataItem">
                                    <c:choose>
                                        <c:when test="${item.type == 'hd'}">
                                            <div class="CreatorHomeAnalyticsDataItem-type">回答</div>
                                            <a href="answer?answerId=${item.object.id}" class="CreatorHomeAnalyticsDataItem-text">
                                                <div class="CreatorHomeAnalyticsDataItem-title">${item.questionTitle}</div>
                                                <div class="CreatorHomeAnalyticsDataItem-content CreatorHomeAnalyticsDataItem-content--withTielt">${item.object.answerContent}</div>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="CreatorHomeAnalyticsDataItem-type">文章</div>
                                            <a href="p?pId=${item.object.id}" class="CreatorHomeAnalyticsDataItem-text">
                                                <div class="CreatorHomeAnalyticsDataItem-title">${item.object.id}</div>
                                                <div class="CreatorHomeAnalyticsDataItem-content CreatorHomeAnalyticsDataItem-content--withTielt">${item.object.id}</div>
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="CreatorHomeAnalyticsDataItem-column" style="width: 80px;">
                                        <div class="CreatorHomeAnalyticsDataItem-columnTitle">阅读</div>
                                        <div class="CreatorHomeAnalyticsDataItem-columnNumder">${item.llNum}</div>
                                    </div>
                                    <div class="CreatorHomeAnalyticsDataItem-column" style="width: 64px;">
                                        <div class="CreatorHomeAnalyticsDataItem-columnTitle">评论</div>
                                        <div class="CreatorHomeAnalyticsDataItem-columnNumder">${item.plNum}</div>
                                    </div>
                                    <div class="CreatorHomeAnalyticsDataItem-column" style="width: 64px;">
                                        <div class="CreatorHomeAnalyticsDataItem-columnTitle">赞同</div>
                                        <div class="CreatorHomeAnalyticsDataItem-columnNumder">${item.ztNum}</div>
                                    </div>
                                    <a class="CreatorHomeAnalyticsDataItem-hint" href="creator/analytics">详细分析</a>

                                </div>
                            </c:forEach>
                        </div>
                        <a class="CreatorHomeAnalyticsData-analyticsButton" href="creator/analytics">
                            更多创作数据
                            <svg class="Zi Zi--ArrowRight" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M9.218 16.78a.737.737 0 0 0 1.052 0l4.512-4.249a.758.758 0 0 0 0-1.063L10.27 7.22a.737.737 0 0 0-1.052 0 .759.759 0 0 0-.001 1.063L13 12l-3.782 3.716a.758.758 0 0 0 0 1.063z" fill-rule="evenodd"></path></svg>
                        </a>
                    </div>

                    <div class="Card CreatorHomeUpgradeGuide">
                        <div class="CreatorHomeUpgradeGuide-title">成长进阶指南</div>
                        <div class="CreatorHomeUpgradeGuide-guideList">
                            <div class="CreatorHomeUpgradeGuide-guide">
                                <img src="images/Creator/icon_guide_1.aba6c4bb.png" alt="">
                                <div class="CreatorHomeUpgradeGuide-guideText">
                                    如何在知乎创作一篇高质量回答？
                                </div>
                            </div>
                            <div class="CreatorHomeUpgradeGuide-guide">
                                <img src="images/Creator/icon_guide_2.aba6c4bb.png" alt="">
                                <div class="CreatorHomeUpgradeGuide-guideText">
                                    属于「知乎官方指南」的问答有哪些？
                                </div>
                            </div>
                            <div class="CreatorHomeUpgradeGuide-guide">
                                <img src="images/Creator/icon_guide_3.ae42ad5d.png" alt="">
                                <div class="CreatorHomeUpgradeGuide-guideText">
                                    小视频拍摄锦囊——入门必读
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
    <script src="Scripts/questionWaiting.js"></script>
    <script src="Scripts/intoCreator.js"></script>

</body>
</html>


<%--
<div class="Card CreatorHomeRecommendQuestion">
    <div class="CreatorHomeRecommendQuestion-title">
        为你推荐的问题
    </div>
    <div class="CreatorHomeRecommendQuestion-QuestionItemBox">
        <div class="QuestionItem">
            <div class="QuestionItem-title">
                <a href="#">
                    大学生手机32g够用吗？
                </a>
            </div>
            <div class="QuestionItem-content">
                <a href="#" class="button QuestionItem-footer--writeAnswerButton">
									<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Edit Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path
                                            d="M4.076 16.966a4.19 4.19 0 0 1 1.05-1.76l8.568-8.569a.524.524 0 0 1 .741 0l2.928 2.927a.524.524 0 0 1 0 .74l-8.568 8.57c-.49.49-1.096.852-1.761 1.051l-3.528 1.058a.394.394 0 0 1-.49-.488l1.06-3.53zM20.558 4.83c.59.59.59 1.546 0 2.136l-1.693 1.692a.503.503 0 0 1-.712 0l-2.812-2.812a.504.504 0 0 1 0-.712l1.693-1.693a1.51 1.51 0 0 1 2.135 0l1.389 1.389z"/></svg></span>
                    写回答
                </a>
                <div class="ContentItem-statusBox">
                    <div class="ContentItem-status">
                                            <span class="ContentItem-statusItem">
                                                6,579 回答
                                            </span>
                        <span class="ContentItem-statusItem">
                                                6,579 关注
                                            </span>
                    </div>
                </div>
            </div>
            <button type="button" class="button QuestionItem-ignoreButton">
								<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Close Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path
                                        d="M13.486 12l5.208-5.207a1.048 1.048 0 0 0-.006-1.483 1.046 1.046 0 0 0-1.482-.005L12 10.514 6.793 5.305a1.048 1.048 0 0 0-1.483.005 1.046 1.046 0 0 0-.005 1.483L10.514 12l-5.208 5.207a1.048 1.048 0 0 0 .006 1.483 1.046 1.046 0 0 0 1.482.005L12 13.486l5.207 5.208a1.048 1.048 0 0 0 1.483-.006 1.046 1.046 0 0 0 .005-1.482L13.486 12z"
                                        fill-rule="evenodd"/></svg></span>
            </button>
        </div>
        <div class="QuestionItem">
            <div class="QuestionItem-title">
                <a href="#">
                    大学生手机32g够用吗？
                </a>
            </div>
            <div class="QuestionItem-content">
                <a href="#" class="button QuestionItem-footer--writeAnswerButton">
									<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Edit Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path
                                            d="M4.076 16.966a4.19 4.19 0 0 1 1.05-1.76l8.568-8.569a.524.524 0 0 1 .741 0l2.928 2.927a.524.524 0 0 1 0 .74l-8.568 8.57c-.49.49-1.096.852-1.761 1.051l-3.528 1.058a.394.394 0 0 1-.49-.488l1.06-3.53zM20.558 4.83c.59.59.59 1.546 0 2.136l-1.693 1.692a.503.503 0 0 1-.712 0l-2.812-2.812a.504.504 0 0 1 0-.712l1.693-1.693a1.51 1.51 0 0 1 2.135 0l1.389 1.389z"/></svg></span>
                    写回答
                </a>
                <div class="ContentItem-statusBox">
                    <div class="ContentItem-status">
                                            <span class="ContentItem-statusItem">
                                                6,579 回答
                                            </span>
                        <span class="ContentItem-statusItem">
                                                6,579 关注
                                            </span>
                    </div>
                </div>
            </div>
            <button type="button" class="button QuestionItem-ignoreButton">
								<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Close Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path
                                        d="M13.486 12l5.208-5.207a1.048 1.048 0 0 0-.006-1.483 1.046 1.046 0 0 0-1.482-.005L12 10.514 6.793 5.305a1.048 1.048 0 0 0-1.483.005 1.046 1.046 0 0 0-.005 1.483L10.514 12l-5.208 5.207a1.048 1.048 0 0 0 .006 1.483 1.046 1.046 0 0 0 1.482.005L12 13.486l5.207 5.208a1.048 1.048 0 0 0 1.483-.006 1.046 1.046 0 0 0 .005-1.482L13.486 12z"
                                        fill-rule="evenodd"/></svg></span>
            </button>
        </div>
        <div class="QuestionItem">
            <div class="QuestionItem-title">
                <a href="#">
                    大学生手机32g够用吗？
                </a>
            </div>
            <div class="QuestionItem-content">
                <a href="#" class="button QuestionItem-footer--writeAnswerButton">
									<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Edit Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path
                                            d="M4.076 16.966a4.19 4.19 0 0 1 1.05-1.76l8.568-8.569a.524.524 0 0 1 .741 0l2.928 2.927a.524.524 0 0 1 0 .74l-8.568 8.57c-.49.49-1.096.852-1.761 1.051l-3.528 1.058a.394.394 0 0 1-.49-.488l1.06-3.53zM20.558 4.83c.59.59.59 1.546 0 2.136l-1.693 1.692a.503.503 0 0 1-.712 0l-2.812-2.812a.504.504 0 0 1 0-.712l1.693-1.693a1.51 1.51 0 0 1 2.135 0l1.389 1.389z"/></svg></span>
                    写回答
                </a>
                <div class="ContentItem-statusBox">
                    <div class="ContentItem-status">
                                            <span class="ContentItem-statusItem">
                                                6,579 回答
                                            </span>
                        <span class="ContentItem-statusItem">
                                                6,579 关注
                                            </span>
                    </div>
                </div>
            </div>
            <button type="button" class="button QuestionItem-ignoreButton">
								<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Close Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path
                                        d="M13.486 12l5.208-5.207a1.048 1.048 0 0 0-.006-1.483 1.046 1.046 0 0 0-1.482-.005L12 10.514 6.793 5.305a1.048 1.048 0 0 0-1.483.005 1.046 1.046 0 0 0-.005 1.483L10.514 12l-5.208 5.207a1.048 1.048 0 0 0 .006 1.483 1.046 1.046 0 0 0 1.482.005L12 13.486l5.207 5.208a1.048 1.048 0 0 0 1.483-.006 1.046 1.046 0 0 0 .005-1.482L13.486 12z"
                                        fill-rule="evenodd"/></svg></span>
            </button>
        </div>

    </div>
    <a class="CreatorHomeRecommendQuestion-analyticsButton" href="#">
        更多问题推荐
        <svg class="Zi Zi--ArrowRight" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M9.218 16.78a.737.737 0 0 0 1.052 0l4.512-4.249a.758.758 0 0 0 0-1.063L10.27 7.22a.737.737 0 0 0-1.052 0 .759.759 0 0 0-.001 1.063L13 12l-3.782 3.716a.758.758 0 0 0 0 1.063z" fill-rule="evenodd"></path></svg>
    </a>
</div>--%>
