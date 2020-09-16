<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="zhihu.entity.UserEntity" %>
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
    <title>知乎 - 首页</title>
    <link rel="icon" href="images/favicon.ico">
    <link href="css/Header-Head.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/Header-HotSearchBox.css">
    <link href="css/Header-Topstory.css" rel="stylesheet" type="text/css">
    <link href="css/SideBar.css" rel="stylesheet" type="text/css">
    <link href="css/Footer.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/Modal.css">
    <link rel="stylesheet" href="css/comments.css">
    
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
  <body>
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
            <div>
                <form class="SearchBar-tool">
                    <div>
                        <label class="Input-wrapper SearchBar-toorlwrapper">
                            <input type="text" placeholder="搜索你感兴趣的内容...">
                            <button class="button " type="button">
                                <svg class="Zi Zi--Search SearchBar-searchIcon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M17.068 15.58a8.377 8.377 0 0 0 1.774-5.159 8.421 8.421 0 1 0-8.42 8.421 8.38 8.38 0 0 0 5.158-1.774l3.879 3.88c.957.573 2.131-.464 1.488-1.49l-3.879-3.878zm-6.647 1.157a6.323 6.323 0 0 1-6.316-6.316 6.323 6.323 0 0 1 6.316-6.316 6.323 6.323 0 0 1 6.316 6.316 6.323 6.323 0 0 1-6.316 6.316z" fill-rule="evenodd"></path></svg>
                            </button>
                        </label>
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
                <button data-usero-id="<%=uId%>" class="button" onclick="">
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
<div class="Topstory">
    <div class="Topstory-container">
        <div class="Topstory-main Card">
            <div class="Topstory-mainCard">
                <div class="Topstory-mainCard-head">
                    <ul>
                        <li><a href="#" class="TopstoryTabs-link is-active">推荐</a></li>
                        <li><a href="#" class="TopstoryTabs-link">关注</a></li>
                        <li><a href="#" class="TopstoryTabs-link">热榜</a></li>
                    </ul>
                </div>
                <div class="Topstory-mainCard-body">
                    <div class="Topstory-recommend">
                        <div class="Card TopstoryItem">
                            <div class="ContentItem">
                                <h2 class="ContentItem-title">
                                    <a href="#">2020 iPad Pro史上最全选购配置使用指南</a>
                                </h2>
                                <div class="ContentItem-content is-collapsed">
                                    <div class="ContentItem-content-cover">
                                        <div class="ContentItem-content-cover-inner">
                                            <img src="images/Topstory/v2-85e02316984f4b7f625b9afb20d384e2.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="ContentItem-content-inner">
                                            <span class="text">
                                                Bravos里奥： 长文预警，全文4500字左右，阅读5分钟，建议赞了再收藏之后慢慢看~ 史上最全夸张了，争取最全~！ 以下建议均根据个人体验而提，如有其他建议和想法，欢迎大家在评论区留言讨论！
                                            </span>
                                        <button class="button ContentItem-more" type="button">阅读全文
                                            <span style="display: inline-flex;align-items: center;">
                                                    ​
                                                    <svg class="Zi Zi--ArrowDown ContentItem-arrowIcon" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                        <path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path>
                                                    </svg>
                                                </span>
                                        </button>
                                    </div>
                                    <div class="ContentItem-actions">
                                            <span>
                                                <button class="button VoteButton VoteButton--up"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleUp VoteButton-TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>赞同 1234</button>
                                                <button class="button VoteButton VoteButton--down"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span></button>
                                            </span>
                                        <button type="button" class="button ContentItem-action">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd"></path></svg></span>
                                            4 条评论
                                        </button>
                                        <div class="ContentItem-action">
                                            <button type="button" class="button">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd"></path></svg></span>
                                                分享
                                            </button>
                                        </div>
                                        <button type="button" class="button ContentItem-action">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Star Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd"></path></svg></span>
                                            收藏
                                        </button>
                                        <button type="button" class="button ContentItem-action">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Heart Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2 8.437C2 5.505 4.294 3.094 7.207 3 9.243 3 11.092 4.19 12 6c.823-1.758 2.649-3 4.651-3C19.545 3 22 5.507 22 8.432 22 16.24 13.842 21 12 21 10.158 21 2 16.24 2 8.437z" fill-rule="evenodd"></path></svg></span>
                                            喜欢
                                        </button>
                                        <div class="ContentItem-action">
                                            <button type="button" class="button">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Dots Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" fill-rule="evenodd"></path></svg></span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="Card TopstoryItem">
                            <div class="ContentItem">
                                <h2 class="ContentItem-title">
                                    <a href="#">2020 iPad Pro史上最全选购配置使用指南</a>
                                </h2>
                                <div class="ContentItem-content is-collapsed">
                                    <div class="ContentItem-content-cover">
                                        <div class="ContentItem-content-cover-inner">
                                            <img src="images/Topstory/v2-85e02316984f4b7f625b9afb20d384e2.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="ContentItem-content-inner">
                                            <span class="text">
                                                Bravos里奥： 长文预警，全文4500字左右，阅读5分钟，建议赞了再收藏之后慢慢看~ 史上最全夸张了，争取最全~！ 以下建议均根据个人体验而提，如有其他建议和想法，欢迎大家在评论区留言讨论！
                                            </span>
                                        <button class="button ContentItem-more" type="button">阅读全文
                                            <span style="display: inline-flex;align-items: center;">
                                                    ​
                                                    <svg class="Zi Zi--ArrowDown ContentItem-arrowIcon" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                        <path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path>
                                                    </svg>
                                                </span>
                                        </button>
                                    </div>
                                    <div class="ContentItem-actions">
                                            <span>
                                                <button class="button VoteButton VoteButton--up"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleUp VoteButton-TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>赞同 1234</button>
                                                <button class="button VoteButton VoteButton--down"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span></button>
                                            </span>
                                        <button type="button" class="button ContentItem-action">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd"></path></svg></span>
                                            4 条评论
                                        </button>
                                        <div class="ContentItem-action">
                                            <button type="button" class="button">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd"></path></svg></span>
                                                分享
                                            </button>
                                        </div>
                                        <button type="button" class="button ContentItem-action">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Star Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd"></path></svg></span>
                                            收藏
                                        </button>
                                        <button type="button" class="button ContentItem-action">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Heart Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2 8.437C2 5.505 4.294 3.094 7.207 3 9.243 3 11.092 4.19 12 6c.823-1.758 2.649-3 4.651-3C19.545 3 22 5.507 22 8.432 22 16.24 13.842 21 12 21 10.158 21 2 16.24 2 8.437z" fill-rule="evenodd"></path></svg></span>
                                            喜欢
                                        </button>
                                        <div class="ContentItem-action">
                                            <button type="button" class="button">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Dots Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" fill-rule="evenodd"></path></svg></span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="Card TopstoryItem">
                            <div class="ContentItem">
                                <h2 class="ContentItem-title">
                                    <a href="#">2020 iPad Pro史上最全选购配置使用指南</a>
                                </h2>
                                <div class="ContentItem-content is-collapsed">
                                    <div class="ContentItem-content-cover">
                                        <div class="ContentItem-content-cover-inner">
                                            <img src="images/Topstory/v2-85e02316984f4b7f625b9afb20d384e2.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="ContentItem-content-inner">
                                            <span class="text">
                                                Bravos里奥： 长文预警，全文4500字左右，阅读5分钟，建议赞了再收藏之后慢慢看~ 史上最全夸张了，争取最全~！ 以下建议均根据个人体验而提，如有其他建议和想法，欢迎大家在评论区留言讨论！
                                            </span>
                                        <button class="button ContentItem-more" type="button">阅读全文
                                            <span style="display: inline-flex;align-items: center;">
                                                    ​
                                                    <svg class="Zi Zi--ArrowDown ContentItem-arrowIcon" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                        <path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path>
                                                    </svg>
                                                </span>
                                        </button>
                                    </div>
                                    <div class="ContentItem-actions">
                                            <span>
                                                <button class="button VoteButton VoteButton--up"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleUp VoteButton-TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>赞同 1234</button>
                                                <button class="button VoteButton VoteButton--down"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span></button>
                                            </span>
                                        <button type="button" class="button ContentItem-action">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd"></path></svg></span>
                                            4 条评论
                                        </button>
                                        <div class="ContentItem-action">
                                            <button type="button" class="button">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd"></path></svg></span>
                                                分享
                                            </button>
                                        </div>
                                        <button type="button" class="button ContentItem-action">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Star Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd"></path></svg></span>
                                            收藏
                                        </button>
                                        <button type="button" class="button ContentItem-action">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Heart Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2 8.437C2 5.505 4.294 3.094 7.207 3 9.243 3 11.092 4.19 12 6c.823-1.758 2.649-3 4.651-3C19.545 3 22 5.507 22 8.432 22 16.24 13.842 21 12 21 10.158 21 2 16.24 2 8.437z" fill-rule="evenodd"></path></svg></span>
                                            喜欢
                                        </button>
                                        <div class="ContentItem-action">
                                            <button type="button" class="button">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Dots Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" fill-rule="evenodd"></path></svg></span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--侧栏-->
        <div class="Topstory-sidebar">
            <div class="Sticky">
                <div class="Card NewGlobalWrite">
                    <div class="NewGlobalWrite-anvTop">
                        <a class="NewGlobalWrite-topItem" href="#">
                            <svg width="40" height="40" viewBox="0 0 40 40" class="NewGlobalWrite-navIcon" fill="currentColor"><g fill="#0084FF" fill-rule="evenodd"><circle cx="20" cy="20" r="20" opacity=".12"></circle><path d="M23.487 10.463c1.896 0 2.583.193 3.277.555a3.824 3.824 0 0 1 1.607 1.573c.371.678.569 1.35.569 3.206v8.472c0 1.855-.198 2.527-.569 3.205a3.824 3.824 0 0 1-1.607 1.573c-.694.363-1.381.556-3.277.556h-6.96c-1.895 0-2.583-.193-3.276-.556a3.824 3.824 0 0 1-1.608-1.573c-.37-.678-.568-1.35-.568-3.205v-8.472c0-1.855.197-2.528.568-3.206.37-.678.915-1.21 1.608-1.573.693-.362 1.38-.556 3.277-.556h6.959zm0 2.08h-6.96c-1.407 0-1.836.081-2.273.31a1.72 1.72 0 0 0-.735.72c-.234.427-.317.847-.317 2.224v8.472c0 1.377.083 1.796.317 2.224.172.316.412.551.735.72.437.229.866.31 2.274.31h6.959c1.407 0 1.836-.081 2.274-.31a1.72 1.72 0 0 0 .735-.72c.234-.428.317-.847.317-2.224v-8.472c0-1.377-.083-1.797-.317-2.225a1.72 1.72 0 0 0-.735-.72c-.438-.228-.867-.309-2.274-.309zm-1.991 9.778v1.873h-5.955V22.32h5.955zm2.977-3.328v1.872h-8.932v-1.872h8.932zm0-3.33v1.873h-8.932v-1.872h8.932z" fill-rule="nonzero"></path></g></svg>
                            <div class="NewGlobalWrite-topTitle">回答问题</div>
                        </a>
                        <a class="NewGlobalWrite-topItem" href="#">
                            <svg width="40" height="40" viewBox="0 0 40 40" class="NewGlobalWrite-navIcon" fill="currentColor"><g fill="#FF9607" fill-rule="evenodd"><circle cx="20" cy="20" r="20" opacity=".12"></circle><path d="M24.233 24.777v-9.555c0-.942-.748-1.706-1.67-1.706H13.61c-.922 0-1.67.764-1.67 1.707v9.554c0 .943.748 1.707 1.67 1.707h8.954c.921 0 1.669-.764 1.669-1.707zm3.478-10.349a2.302 2.302 0 0 1 3.297.243c.367.434.57.989.57 1.563v7.532c0 1.32-1.047 2.389-2.337 2.389a2.308 2.308 0 0 1-1.53-.583l-1.475-1.306v.512c0 2.073-1.644 3.753-3.672 3.753H13.61c-2.028 0-3.672-1.68-3.672-3.753v-9.555c0-2.074 1.644-3.754 3.672-3.754h8.954c2.028 0 3.672 1.68 3.672 3.754v.51l1.475-1.305zm-1.475 7.13l2.786 2.466a.33.33 0 0 0 .219.083.338.338 0 0 0 .334-.341v-7.532a.346.346 0 0 0-.082-.223.329.329 0 0 0-.47-.035l-2.787 2.466v3.116z" fill-rule="nonzero"></path></g></svg>
                            <div class="NewGlobalWrite-topTitle">发视频</div>
                        </a>
                        <a class="NewGlobalWrite-topItem" href="#">
                            <svg width="40" height="40" viewBox="0 0 40 40" class="NewGlobalWrite-navIcon" fill="currentColor"><g fill="none" fill-rule="evenodd"><circle cx="20" cy="20" r="20" fill="#F4C807" opacity=".12"></circle><path d="M6 6h28v28H6z"></path><path fill="#F4C807" d="M20.406 11.772l-2.172 2.176h-2.29c-1.438 0-1.875.085-2.322.324-.33.176-.575.422-.751.752-.24.448-.324.886-.324 2.326v7.12c0 1.44.085 1.878.324 2.326.176.33.421.576.75.752.421.225.834.314 2.08.323l7.35.001c1.438 0 1.876-.084 2.323-.324.33-.176.575-.422.751-.752.24-.448.324-.886.324-2.326v-4.905l2.172-2.175v7.08c0 1.94-.202 2.643-.58 3.352a3.95 3.95 0 0 1-1.643 1.645c-.708.379-1.41.58-3.346.58h-7.108c-1.936 0-2.639-.201-3.347-.58a3.95 3.95 0 0 1-1.642-1.645c-.378-.71-.58-1.413-.58-3.352v-7.12c0-1.94.202-2.643.58-3.352a3.95 3.95 0 0 1 1.642-1.645c.708-.379 1.41-.58 3.347-.58h4.462zm6.908-2.053c.384.116.747.338 1.168.759l.188.189c.42.421.642.785.758 1.17a1.98 1.98 0 0 1 0 1.163c-.116.385-.337.749-.758 1.17l-6.9 6.911c-.62.622-.827.81-1.078 1.004-.251.193-.496.34-.784.47-.288.131-.553.226-1.392.48l-1.088.332a1.303 1.303 0 0 1-1.625-1.629l.33-1.09c.255-.84.35-1.104.48-1.393.13-.29.277-.534.47-.785.193-.252.381-.46 1.001-1.081l6.9-6.911c.42-.421.784-.643 1.168-.76a1.97 1.97 0 0 1 1.162 0zm-3.204 4.096l-4.797 4.805c-.547.548-.709.723-.852.91-.112.146-.19.276-.265.443-.097.214-.175.44-.4 1.182l-.094.31.31-.095c.74-.225.965-.303 1.179-.4.167-.076.297-.154.442-.266.187-.143.361-.305.909-.853l4.797-4.805-1.23-1.23zm2.546-2.43c-.109.033-.23.11-.443.324l-.874.875 1.228 1.231.875-.876c.213-.213.29-.334.323-.444a.24.24 0 0 0 0-.153c-.033-.11-.11-.23-.323-.445l-.189-.188c-.213-.214-.334-.291-.443-.325a.238.238 0 0 0-.154 0z" fill-rule="nonzero"></path></g></svg>
                            <div class="NewGlobalWrite-topTitle">写文章</div>
                        </a>
                        <a class="NewGlobalWrite-topItem" href="#">
                            <svg width="40" height="40" viewBox="0 0 40 40" class="NewGlobalWrite-navIcon" fill="currentColor"><g fill="#26BFBF" fill-rule="evenodd"><circle cx="20" cy="20" r="20" opacity=".12"></circle><path d="M21.987 11.686v2.169h-6.125c-1.43 0-1.863.064-2.297.306-.332.128-.574.383-.74.702-.255.447-.332.893-.332 2.297v7.018c0 1.442.09 1.876.332 2.297.166.345.408.587.74.766.434.23.868.319 2.297.319h7.018c1.43 0 1.863-.077 2.297-.32.345-.165.587-.408.766-.74.216-.408.296-.816.305-2.054l.001-6.316.025.025h2.17v6.074c0 1.914-.217 2.616-.587 3.318a3.92 3.92 0 0 1-1.634 1.62c-.689.383-1.403.575-3.317.575h-7.018c-1.915 0-2.616-.204-3.318-.575a3.891 3.891 0 0 1-1.62-1.62c-.384-.702-.575-1.404-.575-3.318v-7.018c0-1.914.204-2.629.574-3.318a3.996 3.996 0 0 1 1.62-1.633c.703-.383 1.404-.574 3.318-.574h6.1zm1.889 6.954c1.059 1.06 1.059 2.807 0 3.88l-.039.038a2.719 2.719 0 0 1-3.879 0l-2.45-2.553a.801.801 0 0 0-1.123 0l-.05.052c-.32.357-.32.893 0 1.212a.75.75 0 0 0 .726.217c.51-.128 1.047.23 1.149.74a.946.946 0 0 1-.727 1.148 2.649 2.649 0 0 1-2.527-.74 2.796 2.796 0 0 1 0-3.905l.038-.025c1.098-1.085 2.808-1.085 3.892 0l2.463 2.488a.764.764 0 0 0 1.11 0l.038-.025a.855.855 0 0 0 0-1.187.876.876 0 0 0-.74-.217c-.51.128-1.02-.204-1.148-.727-.128-.51.204-1.021.727-1.149l.013-.013a2.703 2.703 0 0 1 2.527.766zm4.338-9.315v2.578h2.578v1.722h-2.578v2.59h-1.723v-2.602h-2.59v-1.71h2.59V9.325h1.723z" fill-rule="nonzero"></path></g></svg>
                            <div class="NewGlobalWrite-topTitle">写想法</div>
                        </a>
                    </div>
                    <div class="NewGlobalWrite-anvBottom">
                        <a class="NewGlobalWrite-anvItem" href="#">
                            <div class="NewGlobalWrite-navTitle">
                                稍后答
                            </div>
                        </a>
                        <a class="NewGlobalWrite-anvItem" href="#">
                            <div class="NewGlobalWrite-navTitle">
                                草搞箱
                            </div>
                        </a>
                    </div>
                </div>
                <div class="Card CreatorEntrance">
                    <a href="#" class="CreatorEntrance-link">
                        <div class="CreatorEntrance-hint">
                            <svg class="Zi Zi--Creator CreatorEntrance-creator" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M15.075 15.388l-3.024 3.024a4.041 4.041 0 0 0-1.014 1.697l-.26.868C7.844 20.986 4.91 21 2 21c.026-3.325 0-3.304.59-3.956 1.237-1.368 6.251-.68 6.44-2.976.043-.518-.36-1.06-.725-1.69C6.285 8.87 5.512 2 11.5 2c5.988 0 5.15 7.072 3.246 10.378-.357.62-.795 1.217-.724 1.77.073.571.477.958 1.053 1.24zm5.402 1.672c.523.55.523.646.523 3.94a535.11 535.11 0 0 0-4.434-.028l3.911-3.912zm-7.88 2.699c.111-.37.312-.705.584-.978l4.76-4.76a.291.291 0 0 1 .412 0l1.626 1.626a.291.291 0 0 1 0 .411l-4.76 4.76c-.272.273-.608.474-.978.585l-1.96.588a.219.219 0 0 1-.272-.272l.589-1.96zm9.157-6.742a.839.839 0 0 1 0 1.187l-.94.94a.28.28 0 0 1-.395 0l-1.563-1.563a.28.28 0 0 1 0-.395l.94-.94a.839.839 0 0 1 1.187 0l.771.771z" fill-rule="evenodd"></path></svg>
                            <div class="CreatorEntrance-indexPageTitle">
                                <div class="CreatorEntrance-text">
                                    创建中心
                                    <span class="css-605fnf">
                                            Lv 1
                                        </span>
                                </div>
                            </div>
                            <svg class="Zi Zi--ArrowRight CreatorEntrance-arrow CreatorEntrance-arrow--smallIcon" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M9.218 16.78a.737.737 0 0 0 1.052 0l4.512-4.249a.758.758 0 0 0 0-1.063L10.27 7.22a.737.737 0 0 0-1.052 0 .759.759 0 0 0-.001 1.063L13 12l-3.782 3.716a.758.758 0 0 0 0 1.063z" fill-rule="evenodd"></path></svg>
                        </div>
                        <div class="ProfileSideCreator-analytics">
                            <div class="ProfileSideCreator-readCountItem">
                                <div class="ProfileSideCreator-readCountTitle">
                                    昨日被阅读数
                                </div>
                                <div class="ProfileSideCreator-readCountNum">0</div>
                                <div class="css-u2c28s">
                                    <div class="css-1086365">较前日</div>
                                    <div class="css-1gqb0v0">--</div>
                                </div>
                            </div>
                            <div class="ProfileSideCreator-readCountItem">
                                <div class="ProfileSideCreator-readCountTitle">
                                    昨日被阅读数
                                </div>
                                <div class="ProfileSideCreator-readCountNum">0</div>
                                <div class="css-u2c28s">
                                    <div class="css-1086365">较前日</div>
                                    <div class="css-1gqb0v0">--</div>
                                </div>
                            </div>
                        </div>
                        <div class="css-19mtex">
                            <div class="css-1qzrmsu">
                                瓦力保镖为你的创作提供持续保护
                                <span style="display: inline-flex; align-items: center;">​<svg width="17" height="17" viewBox="0 0 16 16" class="css-14gt3bc" fill="currentColor"><path d="M8 3l.737.339.428.187.377.158.326.127c.15.055.282.1.395.133.55.161 1.297.157 2.237-.014l-.002 3.784c0 3.07-2.52 4.76-4.498 5.286-1.977-.527-4.498-2.216-4.498-5.286L3.5 3.93c.94.17 1.686.175 2.237.014C6.187 3.812 6.941 3.497 8 3zm2.38 3.066L7.599 8.834 6.32 7.566a.4.4 0 0 0-.554.554l1.55 1.55a.5.5 0 0 0 .568 0l3.05-3.05a.4.4 0 0 0-.554-.554z"></path></svg></span>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="Card Topstory-sidebar-category">
                    <ul class="Topstory-sidebar-categoryList">
                        <li class="Topstory-sidebar-categoryItem">
                            <a href="#" class="button"  style="color: #ffcf00">
                                    <span class="Topstory-sidebar-categoryIcon">
                                        <svg class="Zi Zi--Live" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M13.693 10.354l1.634-7.542c.195-.901-.16-1.083-.798-.39l-9.18 9.97c-.638.693-.377 1.254.582 1.254h5.376l-1.634 7.542c-.195.901.16 1.083.798.39l9.18-9.97c.638-.693.377-1.254-.582-1.254h-5.376z"></path></svg>
                                    </span>
                                <span class="Topstory-sidebar-categoryTitle Topstory-sidebar-categoryTitle-Color">
                                        Live
                                    </span>
                            </a>
                        </li>
                        <li class="Topstory-sidebar-categoryItem">
                            <a href="#" class="button"  style="color: #43d480">
                                    <span class="Topstory-sidebar-categoryIcon">
                                        <svg class="Zi Zi--Ebook" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M16 17.649V2.931a.921.921 0 0 0-.045-.283.943.943 0 0 0-1.182-.604L4.655 5.235A.932.932 0 0 0 4 6.122v14.947c0 .514.421.931.941.931H19.06c.52 0 .941-.417.941-.93V7.292a.936.936 0 0 0-.941-.931h-.773v12.834a.934.934 0 0 1-.83.924L6.464 21.416c-.02.002 2.94-.958 8.883-2.881a.932.932 0 0 0 .653-.886z" fill-rule="evenodd"></path></svg>
                                    </span>
                                <span class="Topstory-sidebar-categoryTitle Topstory-sidebar-categoryTitle-Color">
                                        书点
                                    </span>
                            </a>
                        </li>
                        <li class="Topstory-sidebar-categoryItem">
                            <a href="#" class="button"  style="color: #108cff">
                                    <span class="Topstory-sidebar-categoryIcon">
                                        <svg class="Zi Zi--Org" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M10.786 8.41a8.938 8.938 0 0 0-3.968-2.528c-.305-1.719.814-3.337 2.442-3.741 1.221-.405 2.646.101 3.46 1.011 1.045 1.38.915 3.64.814 4.348-.102 1.315-1.221 3.034-1.323 3.135-.305-.809-.814-1.517-1.425-2.225zm-2.442 2.832c-1.526.202-3.052 1.01-4.171 2.123-1.12-.404-1.934-1.314-2.137-2.427-.316-2.427 1.526-3.64 2.849-3.842 1.628-.371 2.849.505 4.07 1.415 1.146 1.012 2.035 2.63 2.035 2.73-.916-.202-1.832-.1-2.646 0zm4.986.303c.509-.607.931-1.586 1.12-2.225.318-1.039.61-3.134.203-4.651 1.323-1.011 3.154-1.011 4.477.303 1.235 1.146 1.017 2.933.814 3.438-.663 1.581-1.933 2.326-3.256 2.832-1.221.404-3.256.303-3.358.303zm-2.645 1.011c-.51.607-.916 1.416-1.221 2.326-.407 1.314-.643 3.06-.102 4.55-1.323 1.011-3.256 1.011-4.477-.202-1.198-1.124-1.018-2.932-.814-3.438.599-1.605 1.933-2.326 3.256-2.831.916-.304 3.256-.405 3.358-.405zm9.259-1.82c1.017.404 1.933 1.315 2.035 2.427.233 2.57-1.526 3.64-2.849 3.842-1.526 0-2.85-.505-4.07-1.415-1.018-.81-2.035-2.528-2.035-2.63.916.203 1.831.102 2.645 0 1.628-.404 3.053-1.112 4.274-2.224zm-6.716 4.854c1.065 1.08 2.442 2.022 4.07 2.528.306 1.719-.814 3.235-2.442 3.741-1.22.405-2.645-.101-3.46-1.011-1.1-1.481-1.017-3.54-.915-4.247.102-1.315 1.221-3.034 1.323-3.135.305.708.721 1.44 1.424 2.124z"></path></svg>
                                    </span>
                                <span class="Topstory-sidebar-categoryTitle Topstory-sidebar-categoryTitle-Color">
                                        圆桌
                                    </span>
                            </a>
                        </li>
                        <li class="Topstory-sidebar-categoryItem">
                            <a href="#" class="button" style="color: #0f88eb">
                                    <span class="Topstory-sidebar-categoryIcon">
                                        <svg class="Zi Zi--Edit" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M4.076 16.966a4.19 4.19 0 0 1 1.05-1.76l8.568-8.569a.524.524 0 0 1 .741 0l2.928 2.927a.524.524 0 0 1 0 .74l-8.568 8.57c-.49.49-1.096.852-1.761 1.051l-3.528 1.058a.394.394 0 0 1-.49-.488l1.06-3.53zM20.558 4.83c.59.59.59 1.546 0 2.136l-1.693 1.692a.503.503 0 0 1-.712 0l-2.812-2.812a.504.504 0 0 1 0-.712l1.693-1.693a1.51 1.51 0 0 1 2.135 0l1.389 1.389z"></path></svg>
                                    </span>
                                <span class="Topstory-sidebar-categoryTitle Topstory-sidebar-categoryTitle-Color">
                                        专栏
                                    </span>
                            </a>
                        </li>
                        <li class="Topstory-sidebar-categoryItem">
                            <a href="#" class="button" style="color: #5478f0">
                                    <span class="Topstory-sidebar-categoryIcon">
                                        <svg class="Zi Zi--Infinity" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M11.267 10.188h-2.69a.26.26 0 0 0-.261.26v.508c0 .149.117.26.262.26h2.896v1.54H8.578a.26.26 0 0 0-.262.259v.508c0 .15.117.26.262.26h2.896v2.31c0 .139.119.257.265.257h.522a.258.258 0 0 0 .265-.257v-2.31h2.896a.26.26 0 0 0 .262-.26v-.508a.257.257 0 0 0-.262-.26h-2.896v-1.54h2.896a.26.26 0 0 0 .262-.26v-.507a.257.257 0 0 0-.262-.26h-2.69l2.51-2.636a.26.26 0 0 0-.004-.366l-.423-.413a.253.253 0 0 0-.36.01L12 9.418 9.545 6.784a.248.248 0 0 0-.36-.011l-.423.413a.264.264 0 0 0-.004.366l2.509 2.636zM12 19.973c-1.101 0-2.16-.15-3.152-.43-.532.18-5.27 2.177-4.743 1.179.527-.998 1.58-2.746.806-3.25C3.11 15.936 2 13.822 2 11.486 2 6.8 6.477 3 12 3s10 3.8 10 8.487-4.477 8.486-10 8.486z"></path></svg>
                                    </span>
                                <span class="Topstory-sidebar-categoryTitle Topstory-sidebar-categoryTitle-Color">
                                        付费咨询
                                    </span>
                            </a>
                        </li>
                        <li class="Topstory-sidebar-categoryItem">
                            <a href="#" class="button" style="color: #5868d1">
                                    <span class="Topstory-sidebar-categoryIcon">
                                        <svg class="Zi Zi--KnowledgeBase" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M21 9.749v9.91c0 .74-.604 1.341-1.35 1.341H4.35C3.604 21 3 20.4 3 19.659V9.319c0-.503.283-.963.733-1.193l4.892-2.5V3.341c0-.74.604-1.341 1.35-1.341.267 0 .527.078.749.225l9.675 6.408c.375.249.601.668.601 1.116zM8.297 8.307L5.372 9.802A.223.223 0 0 0 5.25 10v8.54c0 .124.1.224.225.224h8.586a.223.223 0 1 0 .124-.41l-4.959-3.259a1.339 1.339 0 0 1-.601-1.116V8.506a.224.224 0 0 0-.328-.199z"></path></svg>
                                    </span>
                                <span class="Topstory-sidebar-categoryTitle Topstory-sidebar-categoryTitle-Color">
                                        百科
                                    </span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="Card">
                    <ul class="Topstory-sidebar-navList">
                        <li class="Topstory-sidebar-navItem ">
                            <a class="Topstory-sidebar-navLink button" href="#">
                                <svg class="Zi Zi--Star Topstory-sidebar-navIcon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd"></path></svg>
                                <span class="Topstory-sidebar-navTitle">我的收藏</span>
                                <span class="Topstory-sidebar-navNum">0</span>
                            </a>
                        </li>
                        <li class="Topstory-sidebar-navItem ">
                            <a class="Topstory-sidebar-navLink button" href="#">
                                <svg class="Zi Zi--HelpBubble Topstory-sidebar-navIcon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M5.74 4h12.52c.961 0 1.74.775 1.74 1.73V16.27c0 .955-.779 1.73-1.74 1.73h-3.825l-1.658 2.044a1 1 0 0 1-1.554 0l-1.658-2.044H5.74C4.78 18 4 17.224 4 16.27V5.73C4 4.775 4.778 4 5.74 4zM12 16a.976.976 0 0 0 .705-.287.951.951 0 0 0 .295-.712.954.954 0 0 0-.295-.714A.976.976 0 0 0 12 14a.962.962 0 0 0-.705.295A.961.961 0 0 0 11 15c0 .284.098.522.295.713A.975.975 0 0 0 12 16zm1.278-4.924a36.81 36.81 0 0 0 1.023-.975c.19-.193.354-.422.492-.688.138-.266.207-.575.207-.928 0-.448-.12-.864-.363-1.246a2.517 2.517 0 0 0-1.029-.906C13.164 6.111 12.652 6 12.072 6c-.624 0-1.17.133-1.638.399-.468.265-.824.6-1.068 1.005-.244.405-.366.804-.366 1.2 0 .19.077.368.231.531a.747.747 0 0 0 .567.246c.38 0 .638-.234.774-.703.144-.449.32-.788.528-1.019.208-.23.532-.345.972-.345.376 0 .683.114.921.342.238.229.357.51.357.841 0 .17-.039.328-.117.473a1.782 1.782 0 0 1-.288.396c-.114.118-.3.294-.555.526a9.71 9.71 0 0 0-.696.688c-.172.194-.31.418-.414.673a2.391 2.391 0 0 0-.156.906c0 .278.071.488.213.63a.716.716 0 0 0 .525.211c.4 0 .638-.216.714-.648.044-.203.077-.345.099-.426.022-.081.053-.162.093-.243.04-.081.101-.17.183-.268.082-.098.191-.21.327-.34z" fill-rule="evenodd"></path></svg>
                                <span class="Topstory-sidebar-navTitle">我关注的问题</span>
                                <span class="Topstory-sidebar-navNum">6</span>
                            </a>
                        </li>
                        <li class="Topstory-sidebar-navItem ">
                            <a class="Topstory-sidebar-navLink button" href="#">
                                <svg class="Zi Zi--Invite Topstory-sidebar-navIcon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M4 10V8a1 1 0 1 1 2 0v2h2a1 1 0 0 1 0 2H6v2a1 1 0 0 1-2 0v-2H2a1 1 0 0 1 0-2h2zm10.455 2c-2.21 0-4-1.79-4-4s1.79-4 4-4 4 1.79 4 4-1.79 4-4 4zm-7 6c0-2.66 4.845-4 7.272-4C17.155 14 22 15.34 22 18v1.375c0 .345-.28.625-.625.625H8.08a.625.625 0 0 1-.625-.625V18z" fill-rule="evenodd"></path></svg>
                                <span class="Topstory-sidebar-navTitle">我的邀请</span>
                                <span class="Topstory-sidebar-navNum">128</span>
                            </a>
                        </li>
                        <li class="Topstory-sidebar-navItem ">
                            <a class="Topstory-sidebar-navLink button" href="#">
                                <svg class="Zi Zi--Balance Topstory-sidebar-navIcon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M19 19.5H5a2 2 0 0 1-2-2V7a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2v10.5a2 2 0 0 1-2 2zm0-12a.5.5 0 0 0-.5-.5h-13a.5.5 0 0 0-.5.5v2a.5.5 0 0 0 .5.5h3.75c1 0 1 2 2.75 2s1.75-2 2.75-2h3.75a.5.5 0 0 0 .5-.5v-2z" fill-rule="evenodd"></path></svg>
                                <span class="Topstory-sidebar-navTitle">我的余额</span>
                            </a>
                        </li>
                        <li class="Topstory-sidebar-navItem ">
                            <a class="Topstory-sidebar-navLink button" href="#">
                                <svg class="Zi Zi--Community Topstory-sidebar-navIcon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M5.74 4h12.52c.961 0 1.74.775 1.74 1.73V16.27c0 .955-.779 1.73-1.74 1.73h-3.825l-1.658 2.044a1 1 0 0 1-1.554 0l-1.658-2.044H5.74C4.78 18 4 17.224 4 16.27V5.73C4 4.775 4.778 4 5.74 4zM7 8.98c0 .554.449.996 1.003.996h4.994A.992.992 0 0 0 14 8.981a.997.997 0 0 0-1.003-.995H8.003A.992.992 0 0 0 7 8.98zm0 4c0 .554.446.996.995.996h8.01a.993.993 0 0 0 .995-.995.993.993 0 0 0-.995-.995h-8.01A.993.993 0 0 0 7 12.98z" fill-rule="evenodd"></path></svg>
                                <span class="Topstory-sidebar-navTitle">站务中心</span>
                            </a>
                        </li>
                        <li class="Topstory-sidebar-navItem ">
                            <a class="Topstory-sidebar-navLink button" href="#">
                                <svg width="18" height="18" viewBox="0 0 18 18" class="Topstory-sidebar-navIcon" fill="currentColor"><path d="M9 1.5c2.835 0 5.152 2.195 5.247 4.949l.003.176v.253A2.25 2.25 0 0 1 15.75 9v2.25a2.25 2.25 0 0 1-1.5 2.122v.257c0 .547-.2 1.073-.557 1.482l-.102.109-1.06 1.06a.75.75 0 0 1-1.124-.99l.063-.07 1.06-1.061a.75.75 0 0 0 .213-.432l.007-.098V13.5H12a.75.75 0 0 1-.75-.75V7.5a.75.75 0 0 1 .75-.75h.75v-.125C12.75 4.628 11.076 3 9 3 6.98 3 5.34 4.541 5.254 6.464l-.004.286H6a.75.75 0 0 1 .743.648l.007.102v5.25a.75.75 0 0 1-.648.743L6 13.5H4.5a2.25 2.25 0 0 1-2.245-2.096l-.005-.154V9c0-.98.626-1.814 1.5-2.122v-.253C3.75 3.79 6.105 1.5 9 1.5z" fill-rule="evenodd"></path></svg>
                                <span class="Topstory-sidebar-navTitle">帮助中心</span>
                            </a>
                        </li>
                        <li class="Topstory-sidebar-navItem ">
                            <a class="Topstory-sidebar-navLink button" href="#">
                                <svg class="Zi Zi--Copyright Topstory-sidebar-navIcon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><path d="M16.517 15.815a5.871 5.871 0 0 1-4.481 2.078 5.865 5.865 0 0 1-5.859-5.857 5.865 5.865 0 0 1 5.859-5.859c1.63 0 3.204.7 4.319 1.919.085.093.24.432.209.797a1.086 1.086 0 0 1-.436.779c-.248.193-.516.29-.797.29-.402 0-.7-.198-.814-.314A3.473 3.473 0 0 0 12 8.575a3.464 3.464 0 0 0-3.46 3.461 3.464 3.464 0 0 0 3.46 3.46 3.63 3.63 0 0 0 2.654-1.181c.136-.152.458-.306.806-.306.274 0 .542.095.773.274.35.269.45.588.473.809.032.308-.072.585-.188.723m4.686-7.699C20.67 6.883 19.96 5.82 19.07 4.929c-.891-.89-1.954-1.601-3.188-2.133A9.728 9.728 0 0 0 12 2a9.733 9.733 0 0 0-3.883.796c-1.234.532-2.297 1.243-3.186 2.133-.891.891-1.602 1.954-2.134 3.187A9.713 9.713 0 0 0 2 12a9.752 9.752 0 0 0 .797 3.883c.531 1.233 1.242 2.296 2.134 3.186.89.891 1.953 1.602 3.186 2.134A9.725 9.725 0 0 0 12 22a9.72 9.72 0 0 0 3.883-.797c1.233-.532 2.296-1.243 3.188-2.134.89-.89 1.601-1.953 2.132-3.186A9.73 9.73 0 0 0 22 12a9.69 9.69 0 0 0-.797-3.884" fill-rule="evenodd"></path></svg>
                                <span class="Topstory-sidebar-navTitle">版权服务中心</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <footer class="Footer">
                    <a class="Footer-Item" href="#">刘看山</a>
                    <span class="Footer-dot"></span>
                    <a class="Footer-Item" href="#">知乎指南</a>
                    <span class="Footer-dot"></span>
                    <a class="Footer-Item" href="#">知乎协议</a>
                    <span class="Footer-dot"></span>
                    <a class="Footer-Item" href="#">知乎隐私保护指引</a>
                    <br>
                    <a class="Footer-Item" href="#">应用</a>
                    <span class="Footer-dot"></span>
                    <a class="Footer-Item" href="#">工作</a>
                    <span class="Footer-dot"></span>
                    <button class="Footer-Item">申请开通知乎机构号</button>
                    <br>
                    <a class="Footer-Item" href="#">侵权举报</a>
                    <span class="Footer-dot"></span>
                    <a class="Footer-Item" href="#">网上有害信息举报专区</a>
                    <br>
                    <a class="Footer-Item" href="#">京 ICP 证 ****** 号</a>
                    <br>
                    <a class="Footer-Item" href="#">京 ICP 证 ******** 号 - 1</a>
                    <br>
                    <a class="Footer-Item" href="#">
                        <img src="images/Footer/v2-d0289dc0a46fc5b15b3363ffa78cf6c7.png" alt="">
                        京公网安备 ************* 号
                    </a>
                    <br>
                    <span class="Footer-Item">互联网药品信息服务资格证书<br>（京）- 非经营性 - 2017 - 0067</span>
                    <br>
                    <span class="Footer-Item">违法和不良信息举报：010-82716601</span>
                    <br>
                    <a class="Footer-Item" href="#">儿童色情信息举报专区</a>
                    <br>
                    <a class="Footer-Item" href="#">证照中心</a>
                    <br>
                    <a class="Footer-Item" href="#">联系我们</a>
                    <span> © 2020 知乎</span>
                    <br>
                </footer>
            </div>
        </div>
    </div>
</div>
<script src="Scripts/jquery-3.5.1.min.js"></script>
<script src="Scripts/SideBar.js"></script>
<script src="Scripts/Modal.js"></script>
<script src="Scripts/comments.js"></script>
<script src="Scripts/Header-HotSearchBox.js"></script>
<script src="Scripts/Header-Head.js"></script>
<script src="Scripts/Header-Topstory.js"></script>
<script src="Scripts/Header-TopstoryHot.js"></script>
<script src="Scripts/Header-TopstoryRecommend.js"></script>
<script src="Scripts/initHeader.js"></script>
<script src="Scripts/initComment.js"></script>

<div>
      <div>
          <div>
              <div class="Modal-wrapper">
                  <div class="Modal-backdrop"></div>
                  <div class="Modal Modal--default">
                      <div class="Modal-inner">
                          <div class="Modal-content">
                              <div class="Comments-container">
                                  <div class="Comments Comments-withEditor">
                                      <div class="Topbar CommentTopbar">
                                          <div class="Topbar-title">
                                              33 条评论
                                          </div>
                                          <div class="Topbar-options">
                                              <button class="button" type="button  Button--plain">
                                                  <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Switch Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M13.004 7V4.232c0-.405.35-.733.781-.733.183 0 .36.06.501.17l6.437 5.033c.331.26.376.722.1 1.033a.803.803 0 0 1-.601.264H2.75a.75.75 0 0 1-.75-.75V7.75A.75.75 0 0 1 2.75 7h10.254zm-1.997 9.999v2.768c0 .405-.35.733-.782.733a.814.814 0 0 1-.5-.17l-6.437-5.034a.702.702 0 0 1-.1-1.032.803.803 0 0 1 .6-.264H21.25a.75.75 0 0 1 .75.75v1.499a.75.75 0 0 1-.75.75H11.007z" fill-rule="evenodd"></path></svg></span>
                                                  切换为时间排序
                                              </button>
                                          </div>
                                      </div>
                                      <div class="CommentList">
                                          <ul class="NestComment">
                                              <li class="NestComment-rootComment">
                                                  <div class="CommentItem">
                                                      <div>
                                                          <div class="CommentItem-meta">
                                                            <span class="UserLink CommentItem-avatar">
                                                                <a href="#" class="UserLink-link">
                                                                    <img width="24" height="24" src="images/user/v2-418b708f7ce6d2e2b21aed85c52c3dcb_xs.jpg" alt="">
                                                                </a>
                                                            </span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-time">
                                                                08-08
                                                            </span>
                                                          </div>
                                                          <div class="CommentTiem-metaSibling">
                                                              <div class="CommentRichText CommentItem-content">
                                                                  <div class="ztext">
                                                                      <p>其他语言都在讨论业务逻辑了，C++还在讨论语法。</p>
                                                                  </div>
                                                              </div>
                                                              <div class="CommentItem-footer">
                                                                  <button class="button button--likeBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      5
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z" fill-rule="evenodd"></path></svg></span>
                                                                      回复
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="transform: rotate(180deg); margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      踩
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Report" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z" fill-rule="evenodd"></path></svg></span>
                                                                      举报
                                                                  </button>
                                                              </div>

                                                          </div>
                                                      </div>
                                                  </div>
                                              </li>
                                              <li class="NestComment-child">
                                                  <div class="CommentItem">
                                                      <div>
                                                          <div class="CommentItem-meta">
                                                            <span class="UserLink CommentItem-avatar">
                                                                <a href="#" class="UserLink-link">
                                                                    <img width="24" height="24" src="images/user/v2-418b708f7ce6d2e2b21aed85c52c3dcb_xs.jpg" alt="">
                                                                </a>
                                                            </span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-reply">回复</span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-time">
                                                                08-08
                                                            </span>
                                                          </div>
                                                          <div class="CommentTiem-metaSibling">
                                                              <div class="CommentRichText CommentItem-content">
                                                                  <div class="ztext">
                                                                      <p>其他语言都在讨论业务逻辑了，C++还在讨论语法。</p>
                                                                  </div>
                                                              </div>
                                                              <div class="CommentItem-footer">
                                                                  <button class="button button--likeBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      5
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z" fill-rule="evenodd"></path></svg></span>
                                                                      回复
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="transform: rotate(180deg); margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      踩
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Report" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z" fill-rule="evenodd"></path></svg></span>
                                                                      举报
                                                                  </button>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </li>
                                              <li class="NestComment-child">
                                                  <div class="CommentItem">
                                                      <div>
                                                          <div class="CommentItem-meta">
                                                            <span class="UserLink CommentItem-avatar">
                                                                <a href="#" class="UserLink-link">
                                                                    <img width="24" height="24" src="images/user/v2-418b708f7ce6d2e2b21aed85c52c3dcb_xs.jpg" alt="">
                                                                </a>
                                                            </span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-reply">回复</span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-time">
                                                                08-08
                                                            </span>
                                                          </div>
                                                          <div class="CommentTiem-metaSibling">
                                                              <div class="CommentRichText CommentItem-content">
                                                                  <div class="ztext">
                                                                      <p>其他语言都在讨论业务逻辑了，C++还在讨论语法。</p>
                                                                  </div>
                                                              </div>
                                                              <div class="CommentItem-footer">
                                                                  <button class="button button--likeBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      5
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z" fill-rule="evenodd"></path></svg></span>
                                                                      回复
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="transform: rotate(180deg); margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      踩
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Report" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z" fill-rule="evenodd"></path></svg></span>
                                                                      举报
                                                                  </button>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </li>
                                              <li class="NestComment-child">
                                                  <div class="CommentItem">
                                                      <div>
                                                          <div class="CommentItem-meta">
                                                            <span class="UserLink CommentItem-avatar">
                                                                <a href="#" class="UserLink-link">
                                                                    <img width="24" height="24" src="images/user/v2-418b708f7ce6d2e2b21aed85c52c3dcb_xs.jpg" alt="">
                                                                </a>
                                                            </span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-reply">回复</span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-time">
                                                                08-08
                                                            </span>
                                                          </div>
                                                          <div class="CommentTiem-metaSibling">
                                                              <div class="CommentRichText CommentItem-content">
                                                                  <div class="ztext">
                                                                      <p>其他语言都在讨论业务逻辑了，C++还在讨论语法。</p>
                                                                  </div>
                                                              </div>
                                                              <div class="CommentItem-footer">
                                                                  <button class="button button--likeBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      5
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z" fill-rule="evenodd"></path></svg></span>
                                                                      回复
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="transform: rotate(180deg); margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      踩
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Report" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z" fill-rule="evenodd"></path></svg></span>
                                                                      举报
                                                                  </button>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </li>
                                              <li class="NestComment-child">
                                                  <div class="CommentItem">
                                                      <div>
                                                          <div class="CommentItem-meta">
                                                            <span class="UserLink CommentItem-avatar">
                                                                <a href="#" class="UserLink-link">
                                                                    <img width="24" height="24" src="images/user/v2-418b708f7ce6d2e2b21aed85c52c3dcb_xs.jpg" alt="">
                                                                </a>
                                                            </span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-reply">回复</span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-time">
                                                                08-08
                                                            </span>
                                                          </div>
                                                          <div class="CommentTiem-metaSibling">
                                                              <div class="CommentRichText CommentItem-content">
                                                                  <div class="ztext">
                                                                      <p>其他语言都在讨论业务逻辑了，C++还在讨论语法。</p>
                                                                  </div>
                                                              </div>
                                                              <div class="CommentItem-footer">
                                                                  <button class="button button--likeBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      5
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z" fill-rule="evenodd"></path></svg></span>
                                                                      回复
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="transform: rotate(180deg); margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      踩
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Report" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z" fill-rule="evenodd"></path></svg></span>
                                                                      举报
                                                                  </button>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </li>
                                              <li class="NestComment-child">
                                                  <div class="CommentItem">
                                                      <div>
                                                          <div class="CommentItem-meta">
                                                            <span class="UserLink CommentItem-avatar">
                                                                <a href="#" class="UserLink-link">
                                                                    <img width="24" height="24" src="images/user/v2-418b708f7ce6d2e2b21aed85c52c3dcb_xs.jpg" alt="">
                                                                </a>
                                                            </span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-reply">回复</span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-time">
                                                                08-08
                                                            </span>
                                                          </div>
                                                          <div class="CommentTiem-metaSibling">
                                                              <div class="CommentRichText CommentItem-content">
                                                                  <div class="ztext">
                                                                      <p>其他语言都在讨论业务逻辑了，C++还在讨论语法。</p>
                                                                  </div>
                                                              </div>
                                                              <div class="CommentItem-footer">
                                                                  <button class="button button--likeBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      5
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z" fill-rule="evenodd"></path></svg></span>
                                                                      回复
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="transform: rotate(180deg); margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      踩
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Report" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z" fill-rule="evenodd"></path></svg></span>
                                                                      举报
                                                                  </button>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </li>
                                          </ul>
                                          <ul class="NestComment">
                                              <li class="NestComment-rootComment">
                                                  <div class="CommentItem">
                                                      <div>
                                                          <div class="CommentItem-meta">
                                                            <span class="UserLink CommentItem-avatar">
                                                                <a href="#" class="UserLink-link">
                                                                    <img width="24" height="24" src="images/user/v2-418b708f7ce6d2e2b21aed85c52c3dcb_xs.jpg" alt="">
                                                                </a>
                                                            </span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-time">
                                                                08-08
                                                            </span>
                                                          </div>
                                                          <div class="CommentTiem-metaSibling">
                                                              <div class="CommentRichText CommentItem-content">
                                                                  <div class="ztext">
                                                                      <p>其他语言都在讨论业务逻辑了，C++还在讨论语法。</p>
                                                                  </div>
                                                              </div>
                                                              <div class="CommentItem-footer">
                                                                  <button class="button button--likeBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      5
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z" fill-rule="evenodd"></path></svg></span>
                                                                      回复
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="transform: rotate(180deg); margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      踩
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Report" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z" fill-rule="evenodd"></path></svg></span>
                                                                      举报
                                                                  </button>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </li>
                                              <li class="NestComment-child">
                                                  <div class="CommentItem">
                                                      <div>
                                                          <div class="CommentItem-meta">
                                                            <span class="UserLink CommentItem-avatar">
                                                                <a href="#" class="UserLink-link">
                                                                    <img width="24" height="24" src="images/user/v2-418b708f7ce6d2e2b21aed85c52c3dcb_xs.jpg" alt="">
                                                                </a>
                                                            </span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-reply">回复</span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-time">
                                                                08-08
                                                            </span>
                                                          </div>
                                                          <div class="CommentTiem-metaSibling">
                                                              <div class="CommentRichText CommentItem-content">
                                                                  <div class="ztext">
                                                                      <p>其他语言都在讨论业务逻辑了，C++还在讨论语法。</p>
                                                                  </div>
                                                              </div>
                                                              <div class="CommentItem-footer">
                                                                  <button class="button button--likeBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      5
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z" fill-rule="evenodd"></path></svg></span>
                                                                      回复
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="transform: rotate(180deg); margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      踩
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Report" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z" fill-rule="evenodd"></path></svg></span>
                                                                      举报
                                                                  </button>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </li>
                                              <li class="NestComment-child">
                                                  <div class="CommentItem">
                                                      <div>
                                                          <div class="CommentItem-meta">
                                                            <span class="UserLink CommentItem-avatar">
                                                                <a href="#" class="UserLink-link">
                                                                    <img width="24" height="24" src="images/user/v2-418b708f7ce6d2e2b21aed85c52c3dcb_xs.jpg" alt="">
                                                                </a>
                                                            </span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-reply">回复</span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-time">
                                                                08-08
                                                            </span>
                                                          </div>
                                                          <div class="CommentTiem-metaSibling">
                                                              <div class="CommentRichText CommentItem-content">
                                                                  <div class="ztext">
                                                                      <p>其他语言都在讨论业务逻辑了，C++还在讨论语法。</p>
                                                                  </div>
                                                              </div>
                                                              <div class="CommentItem-footer">
                                                                  <button class="button button--likeBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      5
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z" fill-rule="evenodd"></path></svg></span>
                                                                      回复
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="transform: rotate(180deg); margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      踩
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Report" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z" fill-rule="evenodd"></path></svg></span>
                                                                      举报
                                                                  </button>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </li>
                                          </ul>
                                          <ul class="NestComment">
                                              <li class="NestComment-rootComment">
                                                  <div class="CommentItem">
                                                      <div>
                                                          <div class="CommentItem-meta">
                                                            <span class="UserLink CommentItem-avatar">
                                                                <a href="#" class="UserLink-link">
                                                                    <img width="24" height="24" src="images/user/v2-418b708f7ce6d2e2b21aed85c52c3dcb_xs.jpg" alt="">
                                                                </a>
                                                            </span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-time">
                                                                08-08
                                                            </span>
                                                          </div>
                                                          <div class="CommentTiem-metaSibling">
                                                              <div class="CommentRichText CommentItem-content">
                                                                  <div class="ztext">
                                                                      <p>其他语言都在讨论业务逻辑了，C++还在讨论语法。</p>
                                                                  </div>
                                                              </div>
                                                              <div class="CommentItem-footer">
                                                                  <button class="button button--likeBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      5
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z" fill-rule="evenodd"></path></svg></span>
                                                                      回复
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="transform: rotate(180deg); margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      踩
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Report" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z" fill-rule="evenodd"></path></svg></span>
                                                                      举报
                                                                  </button>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </li>
                                              <li class="NestComment-child">
                                                  <div class="CommentItem">
                                                      <div>
                                                          <div class="CommentItem-meta">
                                                            <span class="UserLink CommentItem-avatar">
                                                                <a href="#" class="UserLink-link">
                                                                    <img width="24" height="24" src="images/user/v2-418b708f7ce6d2e2b21aed85c52c3dcb_xs.jpg" alt="">
                                                                </a>
                                                            </span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-reply">回复</span>
                                                              <span class="UserLink">
                                                                <a class="UserLink-link" href="#">崔贝</a>
                                                            </span>
                                                              <span class="CommentItem-time">
                                                                08-08
                                                            </span>
                                                          </div>
                                                          <div class="CommentTiem-metaSibling">
                                                              <div class="CommentRichText CommentItem-content">
                                                                  <div class="ztext">
                                                                      <p>其他语言都在讨论业务逻辑了，C++还在讨论语法。</p>
                                                                  </div>
                                                              </div>
                                                              <div class="CommentItem-footer">
                                                                  <button class="button button--likeBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      5
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Reply" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M22.959 17.22c-1.686-3.552-5.128-8.062-11.636-8.65-.539-.053-1.376-.436-1.376-1.561V4.678c0-.521-.635-.915-1.116-.521L1.469 10.67a1.506 1.506 0 0 0-.1 2.08s6.99 6.818 7.443 7.114c.453.295 1.136.124 1.135-.501V17a1.525 1.525 0 0 1 1.532-1.466c1.186-.139 7.597-.077 10.33 2.396 0 0 .396.257.536.257.892 0 .614-.967.614-.967z" fill-rule="evenodd"></path></svg></span>
                                                                      回复
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="transform: rotate(180deg); margin-right: 5px;"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                                      踩
                                                                  </button>
                                                                  <button class="button button--hoverBtn" type="button">
                                                                      <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Report" fill="currentColor" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;"><path d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z" fill-rule="evenodd"></path></svg></span>
                                                                      举报
                                                                  </button>
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </li>
                                          </ul>
                                      </div>
                                      <div>
                                          <div class="Commens-footer CommentItem-normal">
                                              <div class="CommentEditor-inputWrap">
                                                  <div class="InputLike CommentEditor-input Editable">
                                                      <div class="CommentEditor-input-content Editable-content ztext">
                                                          <input type="text" placeholder="写下你的评论...">
                                                      </div>
                                                  </div>
                                                  <div></div>
                                              </div>
                                              <button class="button CommentEditor-singleButton" type="button">发布</button>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <button class="button Modal-closeButton" type="button">
                          <svg class="Zi Zi--Close Modal-closeIcon" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M13.486 12l5.208-5.207a1.048 1.048 0 0 0-.006-1.483 1.046 1.046 0 0 0-1.482-.005L12 10.514 6.793 5.305a1.048 1.048 0 0 0-1.483.005 1.046 1.046 0 0 0-.005 1.483L10.514 12l-5.208 5.207a1.048 1.048 0 0 0 .006 1.483 1.046 1.046 0 0 0 1.482.005L12 13.486l5.207 5.208a1.048 1.048 0 0 0 1.483-.006 1.046 1.046 0 0 0 .005-1.482L13.486 12z" fill-rule="evenodd"></path></svg>
                      </button>
                  </div>
              </div>
          </div>
      </div>
  </div>
<div>
      <div>
          <div>
              <div class="Modal-wrapper">
                  <div class="Modal-backdrop"></div>
                  <div class="Modal Modal--large">
                      <div class="Modal-inner">
                          <div class="Modal-content">
                              <form class="Ask-form" novalidate="">
                                  <div>
                                      <div class="Ask-items">
                                          <div class="Ask-item Ask-titleWrapper">
                                              <img class="Avatar Avatar--medium css-1etdczd" width="40" height="40" src="images/user/<%=uChatHead%>">
                                              <div class="Ask-title">
                                                  <div class="AskTitle">
                                                      <div>
                                                          <div class="Popover">
                                                              <label class="AskTitle-input Input-wrapper Input-wrapper--spread Input-wrapper--multiline Input-wrapper--large">
                                                                  <textarea required="" rows="1" autocomplete="off" role="combobox" aria-expanded="false" aria-autocomplete="list" id="Popover40-toggle" aria-haspopup="true" aria-owns="Popover40-content" class="Input" placeholder="写下你的问题，准确地描述问题更容易得到解答" style="font-size: 18px;"></textarea>
                                                              </label>
                                                          </div>
                                                      </div>
                                                  </div>
                                                  <div style="text-align: right; min-height: 1.67em;">
                                                      <span class="AskFieldTip"></span>
                                                  </div>
                                              </div>
                                          </div>
                                          <div class="Ask-item">
                                              <div class="AskDetail">
                                                  <div class="AskDetail-inputWrapper">
                                                      <div class="InputLike AskDetail-input Editable">
                                                          <label class="AskTitle-input Input-wrapper Input-wrapper--spread Input-wrapper--multiline Input-wrapper--large">
                                                              <textarea required="" rows="1" autocomplete="off" role="combobox" aria-expanded="false" aria-autocomplete="list" id="Popover40-toggle" aria-haspopup="true" aria-owns="Popover40-content" class="Input" placeholder="输入问题背景、条件等详细信息（选填）" style="font-size: 13px;min-height: 78px;"></textarea>
                                                          </label>
                                                          <input multiple="" type="file" accept="image/jpg,image/jpeg,image/png,image/gif" style="display: none;">
                                                          <div>

                                                          </div>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>
                                          <div class="Ask-item">
                                              <div class="TagInputAlias TopicInputAlias-tagInput">
                                                  <div class="Tag Tag--removable">
                                                      <span class="Tag-content">
                                                          <a target="_blank" rel="noopener noreferrer" href="//www.zhihu.com/topic/19550429">电影</a>
                                                      </span>
                                                      <button type="button" class="Tag-remove"><svg class="Zi Zi--Close" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M13.486 12l5.208-5.207a1.048 1.048 0 0 0-.006-1.483 1.046 1.046 0 0 0-1.482-.005L12 10.514 6.793 5.305a1.048 1.048 0 0 0-1.483.005 1.046 1.046 0 0 0-.005 1.483L10.514 12l-5.208 5.207a1.048 1.048 0 0 0 .006 1.483 1.046 1.046 0 0 0 1.482.005L12 13.486l5.207 5.208a1.048 1.048 0 0 0 1.483-.006 1.046 1.046 0 0 0 .005-1.482L13.486 12z" fill-rule="evenodd"></path></svg></button>
                                                  </div>
                                                  <button type="button" class="button TopicInputAlias-placeholderButton button--plain button--blue button--withIcon button--withLabel"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Plus Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M13.491 10.488s-.012-5.387 0-5.998c-.037-1.987-3.035-1.987-2.997 0-.038 1.912 0 5.998 0 5.998H4.499c-1.999.01-1.999 3.009 0 3.009s5.995-.01 5.995-.01v5.999c0 2.019 3.006 2.019 2.997 0-.01-2.019 0-5.998 0-5.998s3.996.009 6.004.009c2.008 0 2.008-3-.01-3.009h-5.994z" fill-rule="evenodd"></path></svg></span>添加话题（1/5）</button>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="Ask-footer">
                                      <%--<div>
                                          <div class="AskOptions">
                                              <label for="anonymous-checkbox" class="AskOptions-label">
                                                  <input id="anonymous-checkbox" class="AskOptions-checkbox" type="checkbox">
                                                  匿名提问
                                              </label>
                                          </div>
                                      </div>--%>
                                      <div class="Ask-footer-buttonWrapper">
                                          <button type="button" class="button button--primary button--blue" onclick="addQuestion(this)">发布问题</button>
                                      </div>
                                  </div>
                              </form>
                          </div>
                      </div>
                      <button class="button Modal-closeButton" type="button">
                          <svg class="Zi Zi--Close Modal-closeIcon" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M13.486 12l5.208-5.207a1.048 1.048 0 0 0-.006-1.483 1.046 1.046 0 0 0-1.482-.005L12 10.514 6.793 5.305a1.048 1.048 0 0 0-1.483.005 1.046 1.046 0 0 0-.005 1.483L10.514 12l-5.208 5.207a1.048 1.048 0 0 0 .006 1.483 1.046 1.046 0 0 0 1.482.005L12 13.486l5.207 5.208a1.048 1.048 0 0 0 1.483-.006 1.046 1.046 0 0 0 .005-1.482L13.486 12z" fill-rule="evenodd"></path></svg>
                      </button>
                  </div>
              </div>
          </div>
      </div>
  </div>
<div>
    <div>
        <div>
            <div class="HotHotSearchBox is-Fixed" style="top: 48px;left: 778px;display: none">
                <div class="HotHotSearchBox-title">
                    知乎热搜
                </div>
                <div class="HotHotSearchBox-content">
                    <div class="HotHotSearchItem">
                        <a class="HotHotSearchItem-lick" href="#">
                            梅西离开巴萨
                            <svg class="Zi Zi--Hot SearchBar-hotIcon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><defs><linearGradient id="id-2014200654-a" x1="63.313%" x2="46.604%" y1="-13.472%" y2="117.368%"><stop offset="2.35%" stop-color="#EC471E"></stop><stop offset="100%" stop-color="#FF6DC4"></stop></linearGradient></defs><path fill="url(#id-2014200654-a)" d="M14.553 20.78c.862-.651 1.39-1.792 1.583-3.421.298-2.511-.656-4.904-2.863-7.179.209 2.291.209 3.73 0 4.314-.41 1.143-1.123 1.983-1.91 2.03-1.35.079-2.305-.512-2.863-1.774-.676 1.25-.782 2.556-.318 3.915.31.906.94 1.684 1.89 2.333C7.144 20.131 5 17.336 5 14.022c0-2.144.898-4.072 2.325-5.4.062 2.072.682 3.598 2.13 4.822-.67-1.112-.734-2.11-.734-3.517 0-3.253 2.067-6.007 4.913-6.927a7.35 7.35 0 0 0 2.157 4.918C17.722 9.214 19 11.463 19 14.022c0 3.073-1.844 5.7-4.447 6.758z" fill-rule="evenodd"></path></svg>
                        </a>
                        <a class="HotHotSearchItem-lick" href="#">
                            梅西离开巴萨
                            <svg class="Zi Zi--Hot SearchBar-hotIcon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><defs><linearGradient id="id-2014200654-a" x1="63.313%" x2="46.604%" y1="-13.472%" y2="117.368%"><stop offset="2.35%" stop-color="#EC471E"></stop><stop offset="100%" stop-color="#FF6DC4"></stop></linearGradient></defs><path fill="url(#id-2014200654-a)" d="M14.553 20.78c.862-.651 1.39-1.792 1.583-3.421.298-2.511-.656-4.904-2.863-7.179.209 2.291.209 3.73 0 4.314-.41 1.143-1.123 1.983-1.91 2.03-1.35.079-2.305-.512-2.863-1.774-.676 1.25-.782 2.556-.318 3.915.31.906.94 1.684 1.89 2.333C7.144 20.131 5 17.336 5 14.022c0-2.144.898-4.072 2.325-5.4.062 2.072.682 3.598 2.13 4.822-.67-1.112-.734-2.11-.734-3.517 0-3.253 2.067-6.007 4.913-6.927a7.35 7.35 0 0 0 2.157 4.918C17.722 9.214 19 11.463 19 14.022c0 3.073-1.844 5.7-4.447 6.758z" fill-rule="evenodd"></path></svg>
                        </a>
                        <a class="HotHotSearchItem-lick" href="#">
                            梅西离开巴萨
                            <svg class="Zi Zi--Hot SearchBar-hotIcon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><defs><linearGradient id="id-2014200654-a" x1="63.313%" x2="46.604%" y1="-13.472%" y2="117.368%"><stop offset="2.35%" stop-color="#EC471E"></stop><stop offset="100%" stop-color="#FF6DC4"></stop></linearGradient></defs><path fill="url(#id-2014200654-a)" d="M14.553 20.78c.862-.651 1.39-1.792 1.583-3.421.298-2.511-.656-4.904-2.863-7.179.209 2.291.209 3.73 0 4.314-.41 1.143-1.123 1.983-1.91 2.03-1.35.079-2.305-.512-2.863-1.774-.676 1.25-.782 2.556-.318 3.915.31.906.94 1.684 1.89 2.333C7.144 20.131 5 17.336 5 14.022c0-2.144.898-4.072 2.325-5.4.062 2.072.682 3.598 2.13 4.822-.67-1.112-.734-2.11-.734-3.517 0-3.253 2.067-6.007 4.913-6.927a7.35 7.35 0 0 0 2.157 4.918C17.722 9.214 19 11.463 19 14.022c0 3.073-1.844 5.7-4.447 6.758z" fill-rule="evenodd"></path></svg>
                        </a>
                        <a class="HotHotSearchItem-lick" href="#">
                            梅西离开巴萨
                            <svg class="Zi Zi--Hot SearchBar-hotIcon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><defs><linearGradient id="id-2014200654-a" x1="63.313%" x2="46.604%" y1="-13.472%" y2="117.368%"><stop offset="2.35%" stop-color="#EC471E"></stop><stop offset="100%" stop-color="#FF6DC4"></stop></linearGradient></defs><path fill="url(#id-2014200654-a)" d="M14.553 20.78c.862-.651 1.39-1.792 1.583-3.421.298-2.511-.656-4.904-2.863-7.179.209 2.291.209 3.73 0 4.314-.41 1.143-1.123 1.983-1.91 2.03-1.35.079-2.305-.512-2.863-1.774-.676 1.25-.782 2.556-.318 3.915.31.906.94 1.684 1.89 2.333C7.144 20.131 5 17.336 5 14.022c0-2.144.898-4.072 2.325-5.4.062 2.072.682 3.598 2.13 4.822-.67-1.112-.734-2.11-.734-3.517 0-3.253 2.067-6.007 4.913-6.927a7.35 7.35 0 0 0 2.157 4.918C17.722 9.214 19 11.463 19 14.022c0 3.073-1.844 5.7-4.447 6.758z" fill-rule="evenodd"></path></svg>
                        </a>
                        <a class="HotHotSearchItem-lick" href="#">
                            梅西离开巴萨
                            <svg class="Zi Zi--Hot SearchBar-hotIcon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18"><defs><linearGradient id="id-2014200654-a" x1="63.313%" x2="46.604%" y1="-13.472%" y2="117.368%"><stop offset="2.35%" stop-color="#EC471E"></stop><stop offset="100%" stop-color="#FF6DC4"></stop></linearGradient></defs><path fill="url(#id-2014200654-a)" d="M14.553 20.78c.862-.651 1.39-1.792 1.583-3.421.298-2.511-.656-4.904-2.863-7.179.209 2.291.209 3.73 0 4.314-.41 1.143-1.123 1.983-1.91 2.03-1.35.079-2.305-.512-2.863-1.774-.676 1.25-.782 2.556-.318 3.915.31.906.94 1.684 1.89 2.333C7.144 20.131 5 17.336 5 14.022c0-2.144.898-4.072 2.325-5.4.062 2.072.682 3.598 2.13 4.822-.67-1.112-.734-2.11-.734-3.517 0-3.253 2.067-6.007 4.913-6.927a7.35 7.35 0 0 0 2.157 4.918C17.722 9.214 19 11.463 19 14.022c0 3.073-1.844 5.7-4.447 6.758z" fill-rule="evenodd"></path></svg>
                        </a>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>

<!--<div class="Topstory-recommend">
                            <div class="Card TopstoryItem">
                                <div class="ContentItem">
                                    <h2 class="ContentItem-title">
                                        <a href="#">AMD锐龙7 4700G跑分曝光：多核击败英特尔i9-9900K</a>
                                    </h2>
                                    <div class="ContentItem-content">
                                        <div class="ContentItem-content-cover">
                                            <div class="ContentItem-content-cover-inner">
                                                <img src="images/Topstory/v2-e4517fbb3c92532749901fef943d8a03_400x224.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="ContentItem-content-inner">
                                            <span class="text">
                                                AMD将在今年下半年发布锐龙4000G系列桌面APU，而随着离发布时间越来越近，各类爆料也是纷至沓来。 对于新的4000G系列，想必大家最关心的就是其性能了。 最近有国外网友爆料称自己拿到了拿到…
                                            </span>
                                            <button class="button ContentItem-more" type="button">阅读全文
                                                <span style="display: inline-flex;align-items: center;">
                                                    &#8203;
                                                    <svg class="Zi Zi--ArrowDown ContentItem-arrowIcon" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                        <path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path>
                                                    </svg>
                                                </span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="ContentItem-actions">
                                        <span>
                                            <button class="button VoteButton">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleUp VoteButton-TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>赞同</button>
                                            <button class="button VoteButton">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span></button>
                                        </span>
                                        <button type="button" class="button ContentItem-action">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd"></path></svg></span>
                                            4 条评论
                                        </button>
                                        <div class="ContentItem-action">
                                            <button type="button" class="button">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd"></path></svg></span>
                                                分享
                                            </button>
                                        </div>
                                        <button type="button" class="button ContentItem-action">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Star Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd"></path></svg></span>
                                            收藏
                                        </button>
                                        <button type="button" class="button ContentItem-action">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Heart Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2 8.437C2 5.505 4.294 3.094 7.207 3 9.243 3 11.092 4.19 12 6c.823-1.758 2.649-3 4.651-3C19.545 3 22 5.507 22 8.432 22 16.24 13.842 21 12 21 10.158 21 2 16.24 2 8.437z" fill-rule="evenodd"></path></svg></span>
                                            喜欢
                                        </button>
                                        <div class="ContentItem-action">
                                            <button type="button" class="button">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Dots Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" fill-rule="evenodd"></path></svg></span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>-->
<!--<div class="ContentItem-content is-collapsed">
    <div class="ContentItem-content-cover">
        <div class="ContentItem-content-cover-inner">
            <img src="images/Topstory/v2-8f954b2da3ee0df2b200b11ee8ce6908_400x224.jpg" alt="">
        </div>
    </div>
    <div class="ContentItem-content-inner">
                                            <span class="text">
                                                Bravos里奥： 长文预警，全文4500字左右，阅读5分钟，建议赞了再收藏之后慢慢看~ 史上最全夸张了，争取最全~！ 以下建议均根据个人体验而提，如有其他建议和想法，欢迎大家在评论区留言讨论！
                                            </span>
        <button class="button ContentItem-more" type="button">阅读全文
            <span style="display: inline-flex;align-items: center;">
                                                    &#8203;
                                                    <svg class="Zi Zi&#45;&#45;ArrowDown ContentItem-arrowIcon" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                        <path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path>
                                                    </svg>
                                                </span>
        </button>
    </div>
</div>-->
<!--<div class="ContentItem-content is-collapsed">
                                    <div class="ContentItem-content-cover">
                                        <div class="ContentItem-content-cover-inner">
                                            <img src="images/Topstory/v2-8f954b2da3ee0df2b200b11ee8ce6908_400x224.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="ContentItem-content-inner">
                                            <span class="text">
                                                Bravos里奥： 长文预警，全文4500字左右，阅读5分钟，建议赞了再收藏之后慢慢看~ 史上最全夸张了，争取最全~！ 以下建议均根据个人体验而提，如有其他建议和想法，欢迎大家在评论区留言讨论！
                                            </span>
                                        <button class="button ContentItem-more" type="button">阅读全文
                                            <span style="display: inline-flex;align-items: center;">
                                                    &#8203;
                                                    <svg class="Zi Zi--ArrowDown ContentItem-arrowIcon" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                        <path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path>
                                                    </svg>
                                                </span>
                                        </button>
                                    </div>
                                </div>
                                <div class="ContentItem-actions">
                                        <span>
                                            <button class="button VoteButton">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleUp VoteButton-TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>赞同</button>
                                            <button class="button VoteButton">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span></button>
                                        </span>
                                    <button type="button" class="button ContentItem-action">
                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd"></path></svg></span>
                                        4 条评论
                                    </button>
                                    <div class="ContentItem-action">
                                        <button type="button" class="button">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd"></path></svg></span>
                                            分享
                                        </button>
                                    </div>
                                    <button type="button" class="button ContentItem-action">
                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Star Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd"></path></svg></span>
                                        收藏
                                    </button>
                                    <button type="button" class="button ContentItem-action">
                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Heart Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2 8.437C2 5.505 4.294 3.094 7.207 3 9.243 3 11.092 4.19 12 6c.823-1.758 2.649-3 4.651-3C19.545 3 22 5.507 22 8.432 22 16.24 13.842 21 12 21 10.158 21 2 16.24 2 8.437z" fill-rule="evenodd"></path></svg></span>
                                        喜欢
                                    </button>
                                    <div class="ContentItem-action">
                                        <button type="button" class="button">
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Dots Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" fill-rule="evenodd"></path></svg></span>
                                        </button>
                                    </div>
                                </div>-->
<!--
回复框
<div class="CommentItem-editor">
    <div class="CommentEditor-inputWrap">
        <div class="InputLike CommentEditor-input Editable">
            <div class="CommentEditor-input-content Editable-content ztext">
                <input type="text" placeholder="回复xxx">
            </div>
        </div>
    </div>
    <button class="button CommentEditor-singleButton" type="button">发布</button>
</div>-->
<!--<div class="Card TopstoryItem">
&lt;!&ndash;<div class="ContentItem">
<h2 class="ContentItem-title">
<a href="#">2020 iPad Pro史上最全选购配置使用指南</a>
</h2>
<div class="ConstantItem-meta">
<span class="userLink">
<a class="userLink-link" href="#">
<img src="images/touxiang/v2-ab950b3059d10127384525299dfc0216_xs.jpg" alt="">
</a>
</span>
<div class="AuthorInfo-content">
<div class="AuthorInfo-head">
<span class="AuthorInfo-name">
<div class="Popover">
<a href="#">Bravos里奥</a>
</div>
</span>
</div>
<div class="AuthorInfo-badge">
<div class="AuthorInfo-badgeText">没有实现的梦想慢慢来</div>
</div>
</div>
</div>
<div class="ContentItem-content">
<div class="ConstantItem-voters">
<sqan>
<sqan class="Voters">
<button type="button" class="button">
10,515 人
赞同了改回答
</button>
</sqan>
</sqan>
</div>
<div class="ConstantItem-inner">
<span class="ztext">
<div class="ztext-cover">
<img class="ztext-cover-content" src="images/Topstory/v2-8f954b2da3ee0df2b200b11ee8ce6908_hd.jpg" alt="">
</div>
<div class="ztext-content">
<blockquote>
长文预警，全文4500字左右，阅读5分钟，建议赞了再收藏之后慢慢看~
<br>史上最全夸张了，争取最全~！
<br>以下建议均根据个人体验而提，如有其他建议和想法，欢迎大家在评论区留言讨论！
</blockquote>

<h2><b><i><说在前面></i></b></h2>
<p><b><i>2020款iPad Pro横空出世，Apple放出豪言：“你的下一台电脑，何必是电脑？！”</i></b></p>
<p><b><i>究竟是什么，让Apple有这样的底气口出狂言？那当然是 iPadOS ！</i></b></p>
<p><b><i>它是为 iPad 量身打造的操作系统，只为尽显 iPad 本色！</i></b></p>
<p><b><i>它让宽大的多点触控显示屏、超快性能、多款强大 app 都能发挥到淋漓尽致。</i></b></p>
<p><b><i>现在更支持触控板，为 iPad 打开了崭新的互动体验。</i></b></p>

<h2><b><i><目录></i></b></h2>
<p><b><i>一、主屏幕设置</i></b></p>
<p><b><i>二、侧拉和分屏浏览（视频演示）</i></b></p>
<p><b><i>三、iPad OS触控板支持</i></b></p>
<p><b><i>四、配件建议：Care、Apple pencil等</i></b></p>
<p><b><i>五、软件赠送及推荐（600多款正版软件）</i></b></p>
<p><b><i>六、选购建议（11寸or12.9寸）</i></b></p>

<hr>

<h2>一、主屏幕设置</h2>
<figure class="ztext-img">
<img class="ztext-img-content" src="images/Topstory/v2-c87c9392978a43d163f0c1a0fc961797_720w.jpg" alt="">
</figure>
<blockquote>
<i>6.20更：很多朋友都想要这张壁纸，私聊我噢，给你发原图~</i>
</blockquote>

<h2>推荐固定的小组件软件</h2>
<ul><li><b>1 MY WEATHER</b></li></ul>
<p>界面简洁颜值高，系统自带的也不错</p>
<ul><li><b>2 系统日历</b></li></ul>
<p>有助于规划日程</p>
<ul><li><b>3 电池小组件</b></li></ul>
<p>得先连接一个蓝牙设备才能显示在小组件内才能显示</p>
<figure class="ztext-img">
<img class="ztext-img-content" src="images/Topstory/v2-914860533e19a72642082a42f410ad30_720w.jpg" alt="">
</figure>
<ul><li><b>4 SYS BOX</b></li></ul>
<p>显示<b>常用软件</b>，<b>磁盘容量</b>，<b>内存占用</b>和<b>常用应用</b>，最重要的是能<b>显示网速</b>！这个只要1元，买不了吃亏，买不了上当。</p>
<figure class="ztext-img">
<img class="ztext-img-content" src="images/Topstory/v2-975ba499889814f2c6f64e4b2e4d4094_720w.jpg" alt="">
</figure>

<hr>

<h2>二、侧拉和分屏</h2>
<h2>2.1 侧拉</h2>
<h2>2.2 分屏浏览</h2>
<figure class="ztext-img">
<img class="ztext-img-content" src="images/Topstory/v2-8dab19b9e4a0868c6dadf33dff85bca1_720w.jpg" alt="">
</figure>
<P>侧拉功能，让你常用的各款 App 随时待命</P>
<P>你可以将同一个 app 在多个空间窗口中打开</P>
<P>然后只需在程序坞中轻点某个 app 图标，即可查看所有打开了这个 app 的空间窗口</P>
<P><b>以下是本人亲自动手制作的演示视频，欢迎点赞！</b></P>
<p><b>视频也放在了B站，后期会有其他的更新也会更新在B站，欢迎三连关注</b></p>
<a class="LinkCard" href="#">
<span class="LinkCard-backdrop" style="background-image:url(images/Topstory/v2-5d31206092fcfe4b728b30d0f9d86066_180x120.jpg)"></span>
<span class="LinkCard-content">
<span class="LinkCard-text">
<span class="LinkCard-title">
你真的会用iPad的分屏侧拉吗？？？_哔哩哔哩 (゜-゜)つロ 干杯~-bilibili
</span>
<span class="LinkCard-meta">
<span style="display:inline-flex;align-items:center">​<svg class="Zi Zi&#45;&#45;InsertLink" fill="currentColor" viewBox="0 0 24 24" width="17" height="17"><path d="M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z" fill-rule="evenodd"></path></svg></span>
www.bilibili.com
</span>
</span>
<span class="LinkCard-imageCell LinkCard-image&#45;&#45;horizontal">
<img src="images/Topstory/v2-5d31206092fcfe4b728b30d0f9d86066_180x120.jpg" alt="">
</span>
</span>
</a>

<div class="VideoLinkCard">
<div class="VideoLinkCard-video">
<video class="VideoLinkCard-video-content" src="images/Topstory/video/e227e69c-b535-11ea-a76a-3aa14924a230.mp4" controls="controls"></video>
</div>
<a href="#" class="VideoLinkCard-link">
<div class="VideoLinkCard-title">
iPadOS分屏侧拉视频演示
</div>
<div class="VideoLinkCard-author">
<img src="images/touxiang/v2-ab950b3059d10127384525299dfc0216_xs.jpg" alt="">
<div>Bravos里奥的视频</div>
<div>&nbsp;·&nbsp;6169 播放</div>
</div>
</a>
</div>

<h2>2.3 文本编辑新手势</h2>
<ul>
<li>现在除触控手势以外，还可以使用触控板或鼠标来进行操控。</li>
<li>三指向左轻扫撤销操作；</li>
<li>把光标精准拖放到想要的位置；</li>
<li>用手指在一段文本上拖动，快速选中这个段落；</li>
<li>轻点两下选中一个词，三下选中一句话，四下选中一整段。</li>
</ul>

<hr>

<h2>三、iPad OS 触控板支持</h2>
<p>现在除触控手势以外，还可以使用触控板或鼠标来进行操控。</p>
<p>这个是iPad Pro迈向生产力的关键一步，但是一个能买入门级iPad价格的键盘是否真的值得呢？下文配件的选购中有个人的一点建议。</p>
<figure class="ztext-img">
<img class="ztext-img-content" src="images/Topstory/v2-eb381e8628d97884b6ebfccc25b3983c_720w.jpg" alt="">
</figure>
<h2>3.1 光标</h2>
<p>随内容自动调整光标可根据按钮、app 图标和文本等内容灵活变化形态，个人体验感觉还不错，这个小点点有点点可爱。</p>
<h2>3.2 触控板</h2>
<ul><li><b>轻扫切换APP</b></li></ul>
<p>使用三指左右轻扫，即可在APP之间切换</p>
<ul><li><b>APP切换器</b></li></ul>
<p>三指向上轻扫并停住，可显示APP切换器</p>
<ul><li><b>返回主屏幕</b></li></ul>
<p>三指向上扫，即可从iPadOS的任意位置回到主屏幕</p>
<ul><li><b>滚动</b></li></ul>
<p>双指在触控板或单指在妙控鼠标上轻扫，可快速浏览网页和文档</p>
<ul><li><b>点按右键</b></li></ul>
<p>双指点按触控板或点按鼠标右键可调出上下文菜单</p>

<hr>

<h2>四、配件建议：Care、Apple pencil、保护壳、膜、键盘、鼠标</h2>

<h2>4.1 Apple Care+（以下简称AC+）</h2>
<p>在直营店工作的朋友极力推荐买，原因有以下几点：</p>
<ul>
<li>原因1：还是那个原因，iPad 容易弯；</li>
<li>原因2：AC+不仅保iPad，还有配件，例如Apple pencil和妙控键盘；</li>
<li>原因3：维修费用昂贵，有了AC+花300多就可以换新；</li>
<li>原因4：AC+可以退，按天计费。</li>
</ul>
<blockquote>
不太推荐大家买了AC+，两年快到了自己搞一搞破坏去换个全新的官换，不过合理利用规则也是可以的。个人看法仅供参考，电子产品是个玄学，在你手里面两年没坏说明质量还不错，换个官换就说不定了，毕竟近年来苹果的品控不如以前（这个是偶然看到一个大哥在某个回答中提到，观点比较一致所以在此提出，他就是一个朋友用了两年换了官换，后面出问题继续更换了两次才好的）。还有AirPods Pro推荐大家买AC+，因为电池两年肯定是80%健康度以下的，只能换新，这个还不错。
</blockquote>

<h2>4.2 Apple pencil</h2>
<ul><li><b>1 工具切换</b></li></ul>
<p>如果使用Goodnotes和Notability做笔记的话，选择在当前工具和橡皮擦之间切换能大大提高效率！</p>
<ul><li><b>2 截屏</b></li></ul>
<p>使用Apple pencil 从屏幕角落往中间拉就能实现截屏操作</p>
<p>官方展示的视频如下，还有其他操作，我之前。</p>
<div class="VideoLinkCard">
<div class="VideoLinkCard-video">
<video class="VideoLinkCard-video-content" src="images/Topstory/video/83c54734-9f28-11ea-ad8f-46eb7a410147.mp4" controls="controls"></video>
</div>
<a href="#" class="VideoLinkCard-link">
<div class="VideoLinkCard-title">
iPad OS
</div>
<div class="VideoLinkCard-author">
<img src="images/touxiang/v2-ab950b3059d10127384525299dfc0216_xs.jpg" alt="">
<div>Bravos里奥的视频</div>
<div>&nbsp;·&nbsp;1975 播放</div>
</div>
</a>
</div>

<h2>4.2 壳</h2>
<ul><li><b>建议1：买硬壳</b></li></ul>
<p>不要买软壳，iPad特别容易弯这个弯过的都知道；</p>
<ul><li><b>建议2：买能包住四周的</b></li></ul>
<p>像官网的smart cover保护不了四周，容易产生划痕。</p>

<h2>4.3 膜</h2>
<ul><li><b>建议1：不是特别推荐类纸膜。</b></li></ul>
<p>除非你对书写体验有极强的要求，贴上类纸膜真的是暴殄天物，浪费了世界上最优秀的一块Magic玻璃；</p>
<blockquote>
<b><i>6.15更：</i></b>
<i>评论区有画师说，任何一个画师都不会同意这个观点。这个就是看你自己更注重哪方面了，是牺牲屏幕观感还是手绘的舒适体验，这个自己可以试试。</i>
</blockquote>
<ul><li><b>建议2：推荐钢化膜。</b></li></ul>
<p>强迫症不能接受屏幕有划痕，钢化膜不怎么影响屏幕观感；</p>
<ul><li><b>建议3：推荐笔尖套。</b></li></ul>
<p>这个可以提升书写体验，而且白菜价；</p>
<ul><li><b>建议4：裸奔体验最佳。</b></li></ul>
<p>前提是，你买了AC+，能接受屏幕有细微的划痕。</p>
<p>总结一句话，电子产品是用来消费的，不是用来供着的，裸奔的手感和屏幕的观感都是最佳的，如果不考虑以后出二手或者对细微划痕不在意，裸奔吧，这才是个人体验科技的极致！</p>

<h2>4.5 妙控键盘</h2>
<ul><li><b>建议1：考虑清楚是否需要；</b></li></ul>
<blockquote>
如果你不是重度iPad办公使用者，做的只是一些基础的文稿编辑类的工作，妙控键盘对你来说意义不大，妙控键盘虽然是iPad转向生产力的重要一步，但是高昂的价格是否对得起它的实际价值，这个目前看来还是不成正比的，所以你的下一台电脑，还得是电脑；
</blockquote>
<ul><li><b>建议2：12.9寸买，11寸不买；</b></li></ul>
<blockquote>
12.9寸的iPad Pro更面向专业人士，根据朋友的体验来看，11寸的妙控键盘的触控板还是太小了，而且键盘布局更为紧凑，12.9的稍微大些操作更便捷；
</blockquote>
<ul><li><b>建议3：蓝牙键盘+妙控板2。</b></li></ul>
<blockquote>
乔大大说了，iPad的定位是介于iPhone和Mac之间。个人买iPad主要是看中可以手持并且屏幕比iPhone大，可以写写画画触摸抱着玩儿，所以任何约束于iPad的配件个人都不是很认同。如果办公，更推荐的是配一个无线蓝牙鼠标，比如众多朋友在用的罗技K380和妙控板2，总价大概1000。不用约束iPad，而且触控板面积大，使用过Mac的触控板就知道有多强大了，这2件还可以搭配其他的使用，比如，当我的Mac外接显示屏的时候也能用上。罗技K380主要是小巧便携，在办公室长久使用的话还是推荐其他的键盘。另外不推荐手小的朋友买罗技的Master 2s和3s系列，太大了握持感不太好。
</blockquote>
<ul><li><b>建议4：官网购买体验14天</b></li></ul>
<blockquote>
建议通过官网购买，自己体验14天再做决定，不满意了还可以退。
</blockquote>

<h2>4.6 外接显示屏</h2>
<p>iPad Pro改成了C接口，可以外接显示屏，太香了！</p>
<p>
本人自用MacBook Pro13寸，iPad Pro11寸。iPad Pro 11寸抱着看视频或者记笔记，大小刚刚好，带出去方便。MacBook讲真自己用的时候还是感觉小了点，但是更在意的是便携并且没有16寸那么强的性能需求，但是，如果你买16寸仅仅是为了追求大屏幕，外接显示屏不香么？<b>6寸再大也只有16寸</b>，这里27寸4k显示屏推荐几个。
</p>
<p><b>b>几点建议：</b></p>
<ul><li><b>建议1：分辨率4k以上；</b></li></ul>
<p>2k字体会发虚，影响观感，iPad和Mac都是</p>
<ul><li><b>建议2：预算充足买有type-C接口的；</b></li></ul>
<p>这样就不需要转接线；</p>
<ul><li><b>建议3：预算充足买可以反向充电的；</b></li></ul>
<p>Mac低配和iPad接口分别是2个和1个，当然也够用，能够一根线连接显示屏并充电留出一个备用当然更好；</p>
<ul><li><b>建议4：理性消费。</b></li></ul>
<p>显示屏倒差不差，个人用的AOC那款已经感觉很舒服了，性价比高。</p>
<p>以下推荐一般都是微边框，支持旋转升降壁挂，色准也不错，所以这些特点不赘述。</p>

<p><b>推荐1：DELL U2720QM 价格：4199（随时变动，后同）</b></p>
<p>2020年3月新款，原U2718Q的升级版27寸<br>接口为type-C ，支持90W供电</p>
<a class="LinkCard" href="#">
<span class="LinkCard-content">
<span class="LinkCard-text">
<span class="LinkCard-title">戴尔（DELL）27英寸4K超清 IPS Type-C 90W反向充电 HDR400 旋转升降 四边微边框 电脑显示器 U2720QM
</span>
<span class="LinkCard-meta">
<span style="display:inline-flex;align-items:center">​<svg class="Zi Zi&#45;&#45;InsertLink" fill="currentColor" viewBox="0 0 24 24" width="17" height="17"><path d="M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z" fill-rule="evenodd"></path></svg></span>
item.m.jd.com
</span>
</span>
<span class="LinkCard-imageCell">
<div>
<svg class="Zi Zi&#45;&#45;Browser" fill="currentColor" viewBox="0 0 24 24" width="32" height="32"><path d="M11.991 3C7.023 3 3 7.032 3 12s4.023 9 8.991 9C16.968 21 21 16.968 21 12s-4.032-9-9.009-9zm6.237 5.4h-2.655a14.084 14.084 0 0 0-1.242-3.204A7.227 7.227 0 0 1 18.228 8.4zM12 4.836A12.678 12.678 0 0 1 13.719 8.4h-3.438A12.678 12.678 0 0 1 12 4.836zM5.034 13.8A7.418 7.418 0 0 1 4.8 12c0-.621.09-1.224.234-1.8h3.042A14.864 14.864 0 0 0 7.95 12c0 .612.054 1.206.126 1.8H5.034zm.738 1.8h2.655a14.084 14.084 0 0 0 1.242 3.204A7.188 7.188 0 0 1 5.772 15.6zm2.655-7.2H5.772a7.188 7.188 0 0 1 3.897-3.204c-.54.999-.954 2.079-1.242 3.204zM12 19.164a12.678 12.678 0 0 1-1.719-3.564h3.438A12.678 12.678 0 0 1 12 19.164zm2.106-5.364H9.894A13.242 13.242 0 0 1 9.75 12c0-.612.063-1.215.144-1.8h4.212c.081.585.144 1.188.144 1.8 0 .612-.063 1.206-.144 1.8zm.225 5.004c.54-.999.954-2.079 1.242-3.204h2.655a7.227 7.227 0 0 1-3.897 3.204zm1.593-5.004c.072-.594.126-1.188.126-1.8 0-.612-.054-1.206-.126-1.8h3.042c.144.576.234 1.179.234 1.8s-.09 1.224-.234 1.8h-3.042z"></path></svg>
</div>
</span>
</span>
</a>

<p><b>推荐2：LG 27UL850-W 价格：3099</b></p>
<p>内置音箱，自带USB Type-C接口，同时传输4k画质和MacBook供电，60W</p>
<a class="LinkCard" href="#">
<span class="LinkCard-content">
<span class="LinkCard-text">
<span class="LinkCard-title">LG 27英寸 UHD 4K超高清 HDR400 Type-C可60W反向充电 微边 IPS 内置音箱 适用PS4 设计师 显示器 27UL850-W</span>
<span class="LinkCard-meta">
<span style="display:inline-flex;align-items:center">​<svg class="Zi Zi&#45;&#45;InsertLink" fill="currentColor" viewBox="0 0 24 24" width="17" height="17"><path d="M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z" fill-rule="evenodd"></path></svg></span>
item.m.jd.com
</span>
</span>
<span class="LinkCard-imageCell">
<div>
<svg class="Zi Zi&#45;&#45;Browser" fill="currentColor" viewBox="0 0 24 24" width="32" height="32"><path d="M11.991 3C7.023 3 3 7.032 3 12s4.023 9 8.991 9C16.968 21 21 16.968 21 12s-4.032-9-9.009-9zm6.237 5.4h-2.655a14.084 14.084 0 0 0-1.242-3.204A7.227 7.227 0 0 1 18.228 8.4zM12 4.836A12.678 12.678 0 0 1 13.719 8.4h-3.438A12.678 12.678 0 0 1 12 4.836zM5.034 13.8A7.418 7.418 0 0 1 4.8 12c0-.621.09-1.224.234-1.8h3.042A14.864 14.864 0 0 0 7.95 12c0 .612.054 1.206.126 1.8H5.034zm.738 1.8h2.655a14.084 14.084 0 0 0 1.242 3.204A7.188 7.188 0 0 1 5.772 15.6zm2.655-7.2H5.772a7.188 7.188 0 0 1 3.897-3.204c-.54.999-.954 2.079-1.242 3.204zM12 19.164a12.678 12.678 0 0 1-1.719-3.564h3.438A12.678 12.678 0 0 1 12 19.164zm2.106-5.364H9.894A13.242 13.242 0 0 1 9.75 12c0-.612.063-1.215.144-1.8h4.212c.081.585.144 1.188.144 1.8 0 .612-.063 1.206-.144 1.8zm.225 5.004c.54-.999.954-2.079 1.242-3.204h2.655a7.227 7.227 0 0 1-3.897 3.204zm1.593-5.004c.072-.594.126-1.188.126-1.8 0-.612-.054-1.206-.126-1.8h3.042c.144.576.234 1.179.234 1.8s-.09 1.224-.234 1.8h-3.042z"></path></svg>
</div>
</span>
</span>
</a>

<p><b>推荐3：AOC U2790PC 价格：1999</b></p>
<p>性价比很高</p>
<a class="LinkCard" href="#">
<span class="LinkCard-content">
<span class="LinkCard-text">
<span class="LinkCard-title">AOC 27英寸 4K高清 升级HDR Type-C接口 IPS微框 99%sRGB 电脑办公 低蓝光旋转升降PS4液晶显示器 U2790PC</span>
<span class="LinkCard-meta">
<span style="display:inline-flex;align-items:center">​<svg class="Zi Zi&#45;&#45;InsertLink" fill="currentColor" viewBox="0 0 24 24" width="17" height="17"><path d="M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z" fill-rule="evenodd"></path></svg></span>
item.m.jd.com
</span>
</span>
<span class="LinkCard-imageCell">
<div>
<svg class="Zi Zi&#45;&#45;Browser" fill="currentColor" viewBox="0 0 24 24" width="32" height="32"><path d="M11.991 3C7.023 3 3 7.032 3 12s4.023 9 8.991 9C16.968 21 21 16.968 21 12s-4.032-9-9.009-9zm6.237 5.4h-2.655a14.084 14.084 0 0 0-1.242-3.204A7.227 7.227 0 0 1 18.228 8.4zM12 4.836A12.678 12.678 0 0 1 13.719 8.4h-3.438A12.678 12.678 0 0 1 12 4.836zM5.034 13.8A7.418 7.418 0 0 1 4.8 12c0-.621.09-1.224.234-1.8h3.042A14.864 14.864 0 0 0 7.95 12c0 .612.054 1.206.126 1.8H5.034zm.738 1.8h2.655a14.084 14.084 0 0 0 1.242 3.204A7.188 7.188 0 0 1 5.772 15.6zm2.655-7.2H5.772a7.188 7.188 0 0 1 3.897-3.204c-.54.999-.954 2.079-1.242 3.204zM12 19.164a12.678 12.678 0 0 1-1.719-3.564h3.438A12.678 12.678 0 0 1 12 19.164zm2.106-5.364H9.894A13.242 13.242 0 0 1 9.75 12c0-.612.063-1.215.144-1.8h4.212c.081.585.144 1.188.144 1.8 0 .612-.063 1.206-.144 1.8zm.225 5.004c.54-.999.954-2.079 1.242-3.204h2.655a7.227 7.227 0 0 1-3.897 3.204zm1.593-5.004c.072-.594.126-1.188.126-1.8 0-.612-.054-1.206-.126-1.8h3.042c.144.576.234 1.179.234 1.8s-.09 1.224-.234 1.8h-3.042z"></path></svg>
</div>
</span>
</span>
</a>
<p>预算不足或不需要Type-c，推荐下面这款，并配合转接线</p>

<p><b>推荐4：AOC U2790PQU 价格：1799</b></p>
<a class="LinkCard" href="#">
<span class="LinkCard-content">
<span class="LinkCard-text">
<span class="LinkCard-title">
AOC 27英寸 4K高清 IPS广视角 微框 99% sRGB 商用办公节能 低蓝光不闪旋转升降PS4液晶显示器 U2790PQU
</span>
<span class="LinkCard-meta">
<span style="display:inline-flex;align-items:center">​<svg class="Zi Zi&#45;&#45;InsertLink" fill="currentColor" viewBox="0 0 24 24" width="17" height="17"><path d="M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z" fill-rule="evenodd"></path></svg></span>
item.m.jd.com
</span>
</span>
<span class="LinkCard-imageCell">
<div>
<svg class="Zi Zi&#45;&#45;Browser" fill="currentColor" viewBox="0 0 24 24" width="32" height="32"><path d="M11.991 3C7.023 3 3 7.032 3 12s4.023 9 8.991 9C16.968 21 21 16.968 21 12s-4.032-9-9.009-9zm6.237 5.4h-2.655a14.084 14.084 0 0 0-1.242-3.204A7.227 7.227 0 0 1 18.228 8.4zM12 4.836A12.678 12.678 0 0 1 13.719 8.4h-3.438A12.678 12.678 0 0 1 12 4.836zM5.034 13.8A7.418 7.418 0 0 1 4.8 12c0-.621.09-1.224.234-1.8h3.042A14.864 14.864 0 0 0 7.95 12c0 .612.054 1.206.126 1.8H5.034zm.738 1.8h2.655a14.084 14.084 0 0 0 1.242 3.204A7.188 7.188 0 0 1 5.772 15.6zm2.655-7.2H5.772a7.188 7.188 0 0 1 3.897-3.204c-.54.999-.954 2.079-1.242 3.204zM12 19.164a12.678 12.678 0 0 1-1.719-3.564h3.438A12.678 12.678 0 0 1 12 19.164zm2.106-5.364H9.894A13.242 13.242 0 0 1 9.75 12c0-.612.063-1.215.144-1.8h4.212c.081.585.144 1.188.144 1.8 0 .612-.063 1.206-.144 1.8zm.225 5.004c.54-.999.954-2.079 1.242-3.204h2.655a7.227 7.227 0 0 1-3.897 3.204zm1.593-5.004c.072-.594.126-1.188.126-1.8 0-.612-.054-1.206-.126-1.8h3.042c.144.576.234 1.179.234 1.8s-.09 1.224-.234 1.8h-3.042z"></path></svg>
</div>
</span>
</span>
</a>
<p>只比上面的少了200，还是买上面的吧。</p>
<p>此处放一张MacBook Pro和iPad Pro外接显示屏的图。解放双眼，极度舒适！</p>
<p>iPad目前对显示屏全面显示的支持还有待完善，期待iPadOS后面能解决这个问题</p>
<figure>
<img class="ztext-img-content" src="images/Topstory/v2-c0c4cbc9c6c46c65a6d852bb4b0d9e0e_720w.jpg" alt="">
</figure>
<figure>
<img class="ztext-img-content" src="images/Topstory/v2-9c5244c4ef5290f02265f87c25052382_720w.jpg" alt="">
</figure>

<hr>

<h2>五、软件赠送与推荐（总价值5000）</h2>
<h2>5.1 软件赠送</h2>
<p>iPad app 600多款正版软件：工作效率类、笔记类和绘画类等。</p>
<p>适用于各种类型的iPad。</p>
<p>Goodnotes5，Notability，Procreate，Lumafusion，Marginnote，Anki等等。</p>
<h2>送给大家！！！</h2>
<p>PS：建议笔记类的大家自己下载体验过后自己购买正版，以防自己的笔记丢失。</p>
<p>消息太多，晚点都会统一发给大家！</p>

<h2>5.2 软件推荐</h2>
<p>软件知乎很多朋友都有推，常用的就先不说了</p>
<p>更多的推荐请收藏</p>
<a class="LinkCard" href="#">
<span class="LinkCard-backdrop" style="background-image:url(images/Topstory/v2-826b0e91f4a28255e21eb663ac1484e0_ipico.jpg)"></span>
<span class="LinkCard-content">
<span class="LinkCard-text">
<span class="LinkCard-title">
https://zhuanlan.zhihu.com/p/151811038
</span>
<span class="LinkCard-meta">
<span style="display:inline-flex;align-items:center">​<svg class="Zi Zi&#45;&#45;InsertLink" fill="currentColor" viewBox="0 0 24 24" width="17" height="17"><path d="M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z" fill-rule="evenodd"></path></svg></span>
zhuanlan.zhihu.com
</span>
</span>
<span class="LinkCard-imageCell">
<img src="images/Topstory/v2-826b0e91f4a28255e21eb663ac1484e0_ipico.jpg" alt="">
</span>
</span>
</a>
<ul><li><b>1 Goodnotes和Notability</b></li></ul>
<p>二者选其一，录音功能需求的选Notability。</p>
<p>个人购买的Goodnotes，原因很简单，因为APP更美观。</p>
<ul><li><b>2 模糊HQ</b></li></ul>
<p>可以将壁纸图片进行任意模糊处理，这样的好处，就是突出了APP视图，个人感觉还是很舒服的，下图有模糊前后的对比图。</p>
<figure>
<img class="ztext-img-content" src="images/Topstory/v2-bd8daa2673ceee73d9e67395b7929304_720w.jpg" alt="">
</figure>
<figure>
<img class="ztext-img-content" src="images/Topstory/v2-8f954b2da3ee0df2b200b11ee8ce6908_720w.jpg" alt="">
</figure>
<figure>
<img class="ztext-img-content" src="images/Topstory/v2-539bdd97d7db367630e8bec593c3755e_720w.jpg" alt="">
</figure>

<hr>

<h2>六、选购建议</h2>

<h2>问题1：你真的需要一个iPad Pro么？</h2>
<p>作为一个果粉，必须得说苹果的东西确实体验很好，作为一个不称职的果粉，也必须得说，苹果营销的魔力真的是丧心病狂，相信大家已经感受到了，看了铺天盖地的苹果广告，媒体宣传微博热搜，朋友圈好友晒图，即使你不太需要，还是心心念念，即使一个月工资只有几千，还是想买Pro。最近刚好在看《乔布斯传》，这股庞大的侵蚀你心得力量根植于苹果公司的文化，在这里劝大家控制好自己的大脑，理性消费，疫情过后，发现还是多挣钱存钱还是很有必要的。</p>
<p>没有iPad Pro，你也是后浪……</p>
<p>买之前，问问自己是否真的需要它，毕竟价格不低，而且对于大多数人来说，购买iPad Pro说实在的其实有点浪费，高性能都不一定用得上。之前有一个iPad Air2，用了大概4年，依旧很流畅，但是平时学习工作就顾不上了，放在那儿吃灰也挺久，19年二手转了。当然，iPad Pro的颜值，Face ID的加成，四扬声器和120hz的屏幕确实让人垂涎三尺，也对得起Pro这个。另外还有Air 3、17年的Pro（二手平台）可以尝试，体验也不差。<b>最最最重要的就是，如果你妄图用它替代PC办公，还是放弃吧！你的下一台电脑，还得是电脑！</b></p>
<p>如果你还在纠结，看看这篇文章。</p>
<a class="LinkCard" href="#">
<span class="LinkCard-backdrop" style="background-image:url(images/Topstory/zhihu-card-default_ipico.jpg)"></span>
<span class="LinkCard-content">
<span class="LinkCard-text">
<span class="LinkCard-title">消费主义是如何通过伪造文化来欺骗年轻人的？
</span>
<span class="LinkCard-meta">
<span style="display:inline-flex;align-items:center">​<svg class="Zi Zi&#45;&#45;InsertLink" fill="currentColor" viewBox="0 0 24 24" width="17" height="17"><path d="M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z" fill-rule="evenodd"></path></svg></span>
www.zhihu.com
</span>
</span>
<span class="LinkCard-imageCell">
<img src="images/Topstory/zhihu-card-default_ipico.jpg" alt="">
</span>
</span>
</a>

<h2>问题2：12.9寸 or 11寸?</h2>
<p>选购建议大家也给了很多，我也看了很多，在此个人不太建议无脑选12.9寸。大屏幕是挺爽，但是还是那句话，12.9寸再大也只有12.9寸。最重要的还是自己需求，是否更注重便携小巧，个人比较推荐11寸，用钟亦凡的话来说就是，省出来的1000多买排骨！</p>
<p>简而言之，有绘画需求，重度依靠iPad学习办公的选12.9寸，追求便携，轻度办公（主要是码字）选11寸。最好的还是去直营店体验一下，自己做决定，这个极其依赖于个人体验，如人饮水冷暖自知。</p>
<blockquote>
<i>6.15更：文章反复强调的一点就是自己体验，因为每个人的感受是不同的，所以我的建议也只能是建议，最后做决定的还是你，就像评论区有位朋友原打算买11寸，看了文章以后去直营店体验过后转而买了12.9寸。</i>
</blockquote>

<h2>问题3：蜂窝版 or WiFi版</h2>
<p>仅代表个人观点，有的翻车只是个概率事件。</p>
<p>现在有一个消费观念，也是自己在不断强化的是，买产品并不只是产品本身，还有其带的服务，在你经济允许的情况下。</p>
<ul><li><b>最推荐的是：官网或者直营店</b></li></ul>
<p><b>没有翻车的风险。</b>首先官网产品的质量肯定是众多平台中最靠谱的。因为即使质量有问题，14天内可以无理由退换，而且这个政策，适合冲动消费的人群，当十来天以后发现Pro也不过如此，体验过了还可以全额退款。当然，官网买就是原价，或者教育优惠也能省一些，能免息就免息，免息分期算一算其实便宜不少了。官网还有一个就是可以买到官网翻新iPad，官网翻新其实和全新的差不多，不过款式不多，一般都是蜂窝版，但是性价比还不错，所以预算有限，可以考虑，都买翻新了，就别去其他地方折腾了。</p>
<ul><li><b>其次推荐：京东自营or授权经销商</b></li></ul>
<p>虽说不是亲生的，官方授权的经销商品质还是很有保证的，只是激活后不能退货。</p>
<ul><li><b>最后推荐：没有推荐</b></li></ul>
<p>几大千都花了，为了省几百去某夕夕，冒着翻车的风险，个人认为不值得。</p>
<p>有朋友翻过车，iPhone和iPad都有过，所以，还是多花点钱买个放心吧！</p>

<hr>

<p>大家想了解的都可以在评论区提一下！</p>
<p>感谢支持，您的点赞和关注是我创作的最大动力！</p>
<figure>
<img src="images/Topstory/v2-2eda93e55f25b0e29088069092ded63c_720w.jpg" alt="">
</figure>
<p></p>
</div>


</span>
</div>
<div>
<div class="ConstantItem-time">
<a href="#"><span>编辑于 06-14</span></a>
</div>
</div>
<div>
<div class="ContentItem-actions is-Fixed">
<span>
<button class="button VoteButton">
<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;TriangleUp VoteButton-TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>赞同</button>
<button class="button VoteButton">
<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span></button>
</span>
<button type="button" class="button ContentItem-action">
<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd"></path></svg></span>
4 条评论
</button>
<div class="ContentItem-action">
<button type="button" class="button">
<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd"></path></svg></span>
分享
</button>
</div>
<button type="button" class="button ContentItem-action">
<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;Star Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd"></path></svg></span>
收藏
</button>
<button type="button" class="button ContentItem-action">
<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;Heart Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2 8.437C2 5.505 4.294 3.094 7.207 3 9.243 3 11.092 4.19 12 6c.823-1.758 2.649-3 4.651-3C19.545 3 22 5.507 22 8.432 22 16.24 13.842 21 12 21 10.158 21 2 16.24 2 8.437z" fill-rule="evenodd"></path></svg></span>
喜欢
</button>
<div class="ContentItem-action">
<button type="button" class="button">
<span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;Dots Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" fill-rule="evenodd"></path></svg></span>
</button>
</div>
<button type="button" class="button Button&#45;&#45;plain">
<span>收起</span>
<span style="display: inline-flex;align-items: center;">​<svg class="Zi Zi&#45;&#45;ArrowDown ContentItem-arrowIcon is-active" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path></svg></span>
</button>
</div>
</div>
</div>
</div>&ndash;&gt;
<div class="ContentItem-content is-collapsed">
<h2 class="ContentItem-title">
<a href="#">2020 iPad Pro史上最全选购配置使用指南</a>
</h2>
<div class="ContentItem-content-cover">
<div class="ContentItem-content-cover-inner">
<img src="images/Topstory/v2-8f954b2da3ee0df2b200b11ee8ce6908_400x224.jpg" alt="">
</div>
</div>
<div class="ContentItem-content-inner">
<span class="text">
Bravos里奥： 长文预警，全文4500字左右，阅读5分钟，建议赞了再收藏之后慢慢看~ 史上最全夸张了，争取最全~！ 以下建议均根据个人体验而提，如有其他建议和想法，欢迎大家在评论区留言讨论！
</span>
<button class="button ContentItem-more" type="button">阅读全文
<span style="display: inline-flex;align-items: center;">
&#8203;
<svg class="Zi Zi&#45;&#45;ArrowDown ContentItem-arrowIcon" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
<path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path>
</svg>
</span>
</button>
</div>
</div>
</div>-->