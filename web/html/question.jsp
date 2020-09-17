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
    <title>${Question.questionTitle} - 知乎</title>
    <link rel="icon" href="images/favicon.ico">
    <link href="css/Header-Head.css" rel="stylesheet" type="text/css">
    <link href="css/Header-Topstory.css" rel="stylesheet" type="text/css">
    <link href="css/User-Topstory.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/Footer.css" type="text/css">

    <link rel="stylesheet" href="css/Question.css">
    <link rel="stylesheet" href="css/Modal.css">
    <link rel="stylesheet" href="css/comments.css">
  </head>
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
                    <a href="#" class="Tabs-link">首页</a>
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
							<label class="Input-wrapper SearchBar-toorlwrapper">
	                            <input type="text" placeholder="搜索你感兴趣的内容...">
	                            <button class="button " type="button" style="">
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
                    <button data-usero-id="<%=uId%>" class="button">
                        <img src="images/user/<%=uChatHead%>" alt="" height="30" width="30"/>
                    </button>
                </div>
            </div>
        </div>
        <div>
            <div class="PageHeader">
                <div class="QuestionHeader-content">
                    <div class="QuestionHeader-main">
                        <h1 class="QuestionHeader-title">
                            ${Question.questionTitle}
                        </h1>
                    </div>
                    <div class="QuestionHeader-side">
                        <div class="QuestionButtonGroup">
                            <c:choose>
                                <c:when test="${isFollowQuestion=='1'}">
                                    <button data-question-id="${Question.id}" type="button" class="button button--primary button--blue is-active" onclick="followQuestion(this)">
                                        已关注
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <button data-question-id="${Question.id}" type="button" class="button button--primary button--blue" onclick="followQuestion(this)">
                                        关注问题
                                    </button>
                                </c:otherwise>
                            </c:choose>
                            <button data-question-id="${Question.id}" type="button" onclick="showAddAnswer(this)" class="button button--blue" >
                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Edit QuestionButton-icon" fill="currentColor" viewBox="0 0 24 24" width="16" height="16"><path d="M4.076 16.966a4.19 4.19 0 0 1 1.05-1.76l8.568-8.569a.524.524 0 0 1 .741 0l2.928 2.927a.524.524 0 0 1 0 .74l-8.568 8.57c-.49.49-1.096.852-1.761 1.051l-3.528 1.058a.394.394 0 0 1-.49-.488l1.06-3.53zM20.558 4.83c.59.59.59 1.546 0 2.136l-1.693 1.692a.503.503 0 0 1-.712 0l-2.812-2.812a.504.504 0 0 1 0-.712l1.693-1.693a1.51 1.51 0 0 1 2.135 0l1.389 1.389z"></path></svg></span>
                                写回答
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <main>
        <div class="Questionmain">
            <div class="QuestionHerder">
                <div class="QuestionHerder-content">
                    <div class="QuestionHerder-main">
                        <div class="QuestionHerder-tags">
                            <div class="QuestionHeader-topics">
                                <div class="Tag QuestionTopic">
                                    <a class="TopicLink" href="#" target="_blank">
                                        iPad
                                    </a>
                                </div>
                                <div class="Tag QuestionTopic">
                                    <a class="TopicLink" href="#" target="_blank">
                                        平板电脑
                                    </a>
                                </div>
                                <div class="Tag QuestionTopic">
                                    <a class="TopicLink" href="#" target="_blank">
                                        二手交易
                                    </a>
                                </div>
                                <div class="Tag QuestionTopic">
                                    <a class="TopicLink" href="#" target="_blank">
                                        淘宝闲鱼
                                    </a>
                                </div>
                                <div class="Tag QuestionTopic">
                                    <a class="TopicLink" href="#" target="_blank">
                                        iPad Pro
                                    </a>
                                </div>
                            </div>
                        </div>
                        <h1 class="QuestionHeader-title">${Question.questionTitle}</h1>
                        <%--<a href="#">
                            <div class="Card QuestionHeaderTopicMeta">
                                <div class="QuestionHeaderTopicMeta-CardMain">
                                    <img src="images/Question/v2-355cdc1aea33dc17ab44fa504e20bfb9_qhd.jpg" alt="">
                                    <div class="QuestionHeaderTopicMeta-Content">
                                        <div class="QuestionHeaderTopicMeta-cardTitlebox">
                                            <h3 class="QuestionHeaderTopicMeta-cardTitle">
                                                iPad Pro
                                            </h3>
                                            <div>
                                                <span class="QuestionHeaderTopicMeta-percentNum">82%</span>
                                                <span>
                                                知友推荐 ·
                                                20,790 人评价
                                            </span>
                                            </div>
                                        </div>
                                        <div class="QuestionHeaderTopicMeta-Info">
                                            iPad Pro是由苹果公司设计、开发及销售的平板电脑，面向专业用户，强调生产力。iPad Pro有两种尺寸，较大者为12.9寸，较小者则从第1代9.7寸到第2代10.5寸再到第3代的11寸。其往往搭载比同时代iPhone更为强大的处理器，并以Pro级规格定位为重点工作，支持Apple Pencil和Smart Keyboard。
                                        </div>
                                        <span class="VotableTopicCard">
                                            <div class="TopicVoteBox TopicVoteBox--recommend">
                                                <input id="topic-recommend" type="checkbox">
                                                <label for="topic-recommend">
                                                    <svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="19" height="19"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg>
                                                </label>
                                            </div>
                                            <div class="TopicVoteBox TopicVoteBox--against">
                                                <input id="topic-against" type="checkbox">
                                                <label for="topic-against">
                                                    <svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="19" height="19"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg>
                                                </label>
                                            </div>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </a>--%>
                        <div>
                            <div class="QuestionHeader-detail">
                                <div class="QuestionRichText">
                                    <span class="ztext">
                                        <p>${Question.questionIntro}</p>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="QuestionHerder-side">
                        <div class="QuestionHeader-follow-status">
                            <div class="QuestionFollowStatus">
                                <button type="button" class="button">
                                    <div class="Numboard-itemInner">
                                        <div class="Numboard-itemName">关注者</div>
                                        <div class="Numboard-itemValue">${Question.followNum}</div>
                                    </div>
                                </button>
                                <div class="Numboard-item">
                                    <div class="Numboard-itemInner">
                                        <div class="Numboard-itemName">被浏览</div>
                                        <div class="Numboard-itemValue">${Question.browseNum+1}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="QuestionHerder-footer">
                    <div class="QuestionHerder-footer-inner">
                        <div class="QuestionHerder-main QuestionHerder-footer-main">
                            <div class="QuestionButtonGroup">
                                <c:choose>
                                    <c:when test="${isFollowQuestion == '1'}">
                                        <button data-question-id="${Question.id}" type="button" class="button button--primary button--blue is-active" onclick="followQuestion(this)">
                                            已关注
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button data-question-id="${Question.id}" type="button" class="button button--primary button--blue" onclick="followQuestion(this)">
                                            关注问题
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                                <button data-question-id="${Question.id}" type="button" class="button button--blue" onclick="showAddAnswer(this)">
                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Edit QuestionButton-icon" fill="currentColor" viewBox="0 0 24 24" width="16" height="16"><path d="M4.076 16.966a4.19 4.19 0 0 1 1.05-1.76l8.568-8.569a.524.524 0 0 1 .741 0l2.928 2.927a.524.524 0 0 1 0 .74l-8.568 8.57c-.49.49-1.096.852-1.761 1.051l-3.528 1.058a.394.394 0 0 1-.49-.488l1.06-3.53zM20.558 4.83c.59.59.59 1.546 0 2.136l-1.693 1.692a.503.503 0 0 1-.712 0l-2.812-2.812a.504.504 0 0 1 0-.712l1.693-1.693a1.51 1.51 0 0 1 2.135 0l1.389 1.389z"></path></svg></span>
                                    写回答
                                </button>
                            </div>
                            <div class="QuestionHeaderActions">
                                <button data-question-id="${Question.id}" type="button" class="button button--grey">
                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Invite Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M4 10V8a1 1 0 1 1 2 0v2h2a1 1 0 0 1 0 2H6v2a1 1 0 0 1-2 0v-2H2a1 1 0 0 1 0-2h2zm10.455 2c-2.21 0-4-1.79-4-4s1.79-4 4-4 4 1.79 4 4-1.79 4-4 4zm-7 6c0-2.66 4.845-4 7.272-4C17.155 14 22 15.34 22 18v1.375c0 .345-.28.625-.625.625H8.08a.625.625 0 0 1-.625-.625V18z" fill-rule="evenodd"></path></svg></span>
                                    邀请回答
                                </button>
                                <div class="GoodQuestionAction">
                                    <c:choose>
                                        <c:when test="${isApproveQuestion == '1'}">
                                            <button data-question-approveNum="${Question.approveNum}" data-question-id="${Question.id}" type="button" class="button GoodQuestionAction-Btn is-active" onclick="GoodQuestionAction_Btn_click(this)">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                好问题 ${Question.approveNum}
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button data-question-approveNum="${Question.approveNum}" data-question-id="${Question.id}" type="button" class="button GoodQuestionAction-Btn" onclick="GoodQuestionAction_Btn_click(this)">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                                好问题 ${Question.approveNum}
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="QuestionHeader-Comment">
                                    <button data-answer-id="${Question.id}" type="button" class="button" onclick="addComments(this)">
                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd"></path></svg></span>
                                        ${CommentNum} 条评论
                                    </button>
                                </div>
                                <div class="Popover ShareManu">
                                    <button data-question-id="${Question.id}" type="button" class="button">
                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd"></path></svg></span>
                                        分享
                                    </button>
                                </div>
                                <div class="Popover">
                                    <button type="button" class="button">
                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Dots Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" fill-rule="evenodd"></path></svg></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="Question-main">
                <div class="Question-mainColum">
                    <div>
                        <div class="QuestionAnswers-statusWrapper" style="display: none">
                            <div class="Card QuestionAnswers-answerAdd">
                                <div class="AnswerAdd">
                                    <div class="AnswerAdd-header">
                                        <div class="AnswerAdd-info">
                                            <a href="user/<%=uId%>" class="UserLink">
                                                <img src="images/user/<%=uChatHead%>" height="38px" width="38px" alt="">
                                            </a>
                                            <div class="AuthorInfo-content">
                                                <div class="AuthorInfo-head">
                                                    <a href="user/<%=uId%>" class="UserLink AuthorInfo-name"><%=uName%></a>
                                                </div>
                                                <div class="AuthorInfo-detail">
                                                    <div class="AuthorInfo-badge">
                                                        <span class="AuthorInfo-bio">程序小白</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="AnswerForm">
                                        <div class="Editable">
                                            <div class="Editable-toolbar Sticky">
                                                <div class="Editable-toolbar-controls">

                                                </div>
                                            </div>
                                            <div class="ztext Editable-content" id="editor" style="min-height: 118px">

                                            </div>
                                            <div class="AnswerForm-footer">
                                                <div class="AnswerForm-footerContent AnswerForm-container">
                                                    <div class="AnswerForm-footerRight">
                                                        <button type="button" data-user-id="<%=uId%>" data-querstion-id="${Question.id}" class="button button--primary button--blue AnswerForm-submit" onclick="addAnswer(this)">提交回答</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="QuestionAnswers-answers">
                            <div class="Card AnswersBox">
                                <div class="list">
                                    <div class="list-header">
                                        <h4 class="list-headerText">
                                            ${fn:length(questionPageList)} 个回答
                                        </h4>
                                        <div class="list-headerOptions">
                                            <div class="Popover">
                                                <button type="button" class="button">
                                                    默认排序
                                                    <svg class="Zi Zi--Select Select-arrow" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M12 16.183l2.716-2.966a.757.757 0 0 1 1.064.001.738.738 0 0 1 0 1.052l-3.247 3.512a.758.758 0 0 1-1.064 0L8.22 14.27a.738.738 0 0 1 0-1.052.758.758 0 0 1 1.063 0L12 16.183zm0-9.365L9.284 9.782a.758.758 0 0 1-1.064 0 .738.738 0 0 1 0-1.052l3.248-3.512a.758.758 0 0 1 1.065 0L15.78 8.73a.738.738 0 0 1 0 1.052.757.757 0 0 1-1.063.001L12 6.818z" fill-rule="evenodd"></path></svg>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="list-items">
                                            <c:forEach var="questionPageItem" items="${questionPageList}">
                                            <div class="list-item">
                                                <div class="ConstantItem-meta">
                                                    <div class="AuthorInfo">
                                                        <div class="userLink">
                                                            <a href="user?userId=${questionPageItem.userEntity.id}" class="userLink-link">
                                                                <img src="images/user/${questionPageItem.userEntity.chatHead}" alt="">
                                                            </a>
                                                        </div>
                                                        <div class="AuthorInfo-content">
                                                            <div class="AuthorInfo-head">
                                                                <span class="AuthorInfo-name">
                                                                    <div class="Popover">
                                                                        <a href="user?userId=${questionPageItem.userEntity.id}">${questionPageItem.userEntity.name}
                                                                        </a>
                                                                    </div>
                                                                </span>
                                                            </div>
                                                            <div class="AuthorInfo-badge">
                                                                <div class="AuthorInfo-badgeText">${questionPageItem.userEntity.industry}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="css-h5al4j">
                                                        <span>
                                                            <span class="Voters">
                                                                <button type="button" class="button">
                                                                    ${questionPageItem.answerEntity.approveNum} 人赞同了该回答
                                                                </button>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="AnswersContent AnswersContent--unescapable">
                                                    <div class="ConstantItem-inner">
                                                        <span class="ztext">
                                                            ${questionPageItem.answerEntity.answerContent}
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <div class="ConstantItem-time">

                                                            <a href="javaScript:void(0)"><span>编辑于 ${fn:substring(questionPageItem.answerEntity.publishTime, 0, 10)}</span></a>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <div class="ContentItem-actions <%--is-Fixed--%>">
                                            <span>
                                                <button data-answer-id="${questionPageItem.answerEntity.id}" class="button VoteButton VoteButton--up"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleUp VoteButton-TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>赞同 ${questionPageItem.answerEntity.approveNum}</button>
                                                <button data-answer-id="${questionPageItem.answerEntity.id}" class="button VoteButton VoteButton--down">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span></button>
                                            </span>
                                                            <button data-answer-id="${questionPageItem.answerEntity.id}" type="button" class="button ContentItem-action">
                                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd"></path></svg></span>
                                                                ${questionPageItem.commentNum} 条评论
                                                            </button>
                                                            <div class="ContentItem-action">
                                                                <button data-answer-id="${questionPageItem.answerEntity.id}" type="button" class="button">
                                                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd"></path></svg></span>
                                                                    分享
                                                                </button>
                                                            </div>
                                                            <button data-answer-id="${questionPageItem.answerEntity.id}" type="button" class="button ContentItem-action">
                                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Star Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd"></path></svg></span>
                                                                收藏
                                                            </button>
                                                            <button data-answer-id="${questionPageItem.answerEntity.id}" type="button" class="button ContentItem-action">
                                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Heart Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2 8.437C2 5.505 4.294 3.094 7.207 3 9.243 3 11.092 4.19 12 6c.823-1.758 2.649-3 4.651-3C19.545 3 22 5.507 22 8.432 22 16.24 13.842 21 12 21 10.158 21 2 16.24 2 8.437z" fill-rule="evenodd"></path></svg></span>
                                                                喜欢
                                                            </button>
                                                            <div class="ContentItem-action">
                                                                <button type="button" class="button">
                                                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Dots Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5 14a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm7 0a2 2 0 1 1 0-4 2 2 0 0 1 0 4z" fill-rule="evenodd"></path></svg></span>
                                                                </button>
                                                            </div>
                                                            <%--<button type="button" class="button Button--plain">
                                                                <span>收起</span>
                                                                <span style="display: inline-flex;align-items: center;">​<svg class="Zi Zi--ArrowDown ContentItem-arrowIcon is-active" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path></svg></span>
                                                            </button>--%>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="Question-sideColum">
                    <div class="Question-sideColum-content">
                        <div class="Card">
                            <div class="Card-header">
                                <div class="Card-headertext">
                                    相关问题
                                </div>
                            </div>
                            <div class="Card-body">
                                <div class="SimilarQuestions-item">
                                    <a href="#" class="button">如何在闲鱼可靠选购二手iPad pro？</a>
                                    11 个回答
                                </div>
                                <div class="SimilarQuestions-item">
                                    <a href="#" class="button">闲鱼有派先生的ipad怎么样？？</a>
                                    11 个回答
                                </div>
                                <div class="SimilarQuestions-item">
                                    <a href="#" class="button">怎样在闲鱼上买到靠谱的 iPad ？</a>
                                    11 个回答
                                </div>
                                <div class="SimilarQuestions-item">
                                    <a href="#" class="button">在闲鱼上能买ipad吗？有什么应该注意的？</a>
                                    11 个回答
                                </div>
                                <div class="SimilarQuestions-item">
                                    <a href="#" class="button">如何才能知道自己在闲鱼买的iPad有没有掉坑？ </a>
                                    11 个回答
                                </div>
                            </div>
                        </div>
                        <div class="Card">
                            <div class="Card-header">
                                <div class="Card-headertext">
                                    相关推荐
                                </div>
                            </div>
                            <div class="Card-body">
                                <a href="#" class="button RelatedCommodtites-item">
                                    <img src="images/Question/v2-b2d2e506315b334e935773c639f68eb7_250x0.jpg" alt="">
                                    <div class="RelatedCommodtites-content">
                                        <div class="RelatedCommodtites-title">怎么让孩子远离电子屏幕？</div>
                                        <div class="RelatedCommodtites-description">叶壮</div>
                                        <div class="RelatedCommodtites-meta">
                                            <div class="RelatedCommodtites-score">
                                                <div class="Rating">
                                                    <svg viewBox="0 0 15 15" fill="currentColor" width="15" height="15"><g fill="#ffab2e" fill-rule="evenodd"><path d="M10.925 14.302c.173.13.408.13.58-.002a.514.514 0 0 0 .175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572a.5.5 0 0 0-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path d="M7.5 1.4a.47.47 0 0 0-.474.354l-1.318 4.29H1.49a.499.499 0 0 0-.467.36.523.523 0 0 0 .185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z"></path></g></svg>
                                                    <svg viewBox="0 0 15 15" fill="currentColor" width="15" height="15"><g fill="#ffab2e" fill-rule="evenodd"><path d="M10.925 14.302c.173.13.408.13.58-.002a.514.514 0 0 0 .175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572a.5.5 0 0 0-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path d="M7.5 1.4a.47.47 0 0 0-.474.354l-1.318 4.29H1.49a.499.499 0 0 0-.467.36.523.523 0 0 0 .185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z"></path></g></svg>
                                                    <svg viewBox="0 0 15 15" fill="currentColor" width="15" height="15"><g fill="#ffab2e" fill-rule="evenodd"><path d="M10.925 14.302c.173.13.408.13.58-.002a.514.514 0 0 0 .175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572a.5.5 0 0 0-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path d="M7.5 1.4a.47.47 0 0 0-.474.354l-1.318 4.29H1.49a.499.499 0 0 0-.467.36.523.523 0 0 0 .185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z"></path></g></svg>
                                                    <svg viewBox="0 0 15 15" fill="currentColor" width="15" height="15"><g fill="#ffab2e" fill-rule="evenodd"><path d="M10.925 14.302c.173.13.408.13.58-.002a.514.514 0 0 0 .175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572a.5.5 0 0 0-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path d="M7.5 1.4a.47.47 0 0 0-.474.354l-1.318 4.29H1.49a.499.499 0 0 0-.467.36.523.523 0 0 0 .185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z"></path></g></svg>
                                                    <svg viewBox="0 0 15 15" fill="currentColor" width="15" height="15"><g fill="#ffab2e" fill-rule="evenodd"><path d="M10.925 14.302c.173.13.408.13.58-.002a.514.514 0 0 0 .175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572a.5.5 0 0 0-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path d="M7.5 1.4a.47.47 0 0 0-.474.354l-1.318 4.29H1.49a.499.499 0 0 0-.467.36.523.523 0 0 0 .185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z"></path></g></svg>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="button RelatedCommodtites-item">
                                    <img src="images/Question/v2-5743576eac664757f4808ea5c5fbea3a_250x0.jpg" alt="">
                                    <div class="RelatedCommodtites-content">
                                        <div class="RelatedCommodtites-title RelatedCommodtites-title-top">2019 笔记本电脑推荐：测评数据+使用体验</div>
                                        <div class="RelatedCommodtites-description"></div>
                                        <div class="RelatedCommodtites-meta">
                                            <div class="RelatedCommodtites-meta">
                                                <div class="RelatedCommodtites-score">
                                                    <div class="Rating">
                                                        <svg viewBox="0 0 15 15" fill="currentColor" width="15" height="15"><g fill="#ffab2e" fill-rule="evenodd"><path d="M10.925 14.302c.173.13.408.13.58-.002a.514.514 0 0 0 .175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572a.5.5 0 0 0-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path d="M7.5 1.4a.47.47 0 0 0-.474.354l-1.318 4.29H1.49a.499.499 0 0 0-.467.36.523.523 0 0 0 .185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z"></path></g></svg>
                                                        <svg viewBox="0 0 15 15" fill="currentColor" width="15" height="15"><g fill="#ffab2e" fill-rule="evenodd"><path d="M10.925 14.302c.173.13.408.13.58-.002a.514.514 0 0 0 .175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572a.5.5 0 0 0-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path d="M7.5 1.4a.47.47 0 0 0-.474.354l-1.318 4.29H1.49a.499.499 0 0 0-.467.36.523.523 0 0 0 .185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z"></path></g></svg>
                                                        <svg viewBox="0 0 15 15" fill="currentColor" width="15" height="15"><g fill="#ffab2e" fill-rule="evenodd"><path d="M10.925 14.302c.173.13.408.13.58-.002a.514.514 0 0 0 .175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572a.5.5 0 0 0-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path d="M7.5 1.4a.47.47 0 0 0-.474.354l-1.318 4.29H1.49a.499.499 0 0 0-.467.36.523.523 0 0 0 .185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z"></path></g></svg>
                                                        <svg viewBox="0 0 15 15" fill="currentColor" width="15" height="15"><g fill="#ffab2e" fill-rule="evenodd"><path d="M10.925 14.302c.173.13.408.13.58-.002a.514.514 0 0 0 .175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572a.5.5 0 0 0-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path d="M7.5 1.4a.47.47 0 0 0-.474.354l-1.318 4.29H1.49a.499.499 0 0 0-.467.36.523.523 0 0 0 .185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z"></path></g></svg>
                                                        <svg viewBox="0 0 15 15" fill="currentColor" width="15" height="15"><g fill="#ffab2e" fill-rule="evenodd"><path d="M10.925 14.302c.173.13.408.13.58-.002a.514.514 0 0 0 .175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572a.5.5 0 0 0-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path d="M7.5 1.4a.47.47 0 0 0-.474.354l-1.318 4.29H1.49a.499.499 0 0 0-.467.36.523.523 0 0 0 .185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z"></path></g></svg>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="button RelatedCommodtites-item">
                                    <img src="images/Question/v2-46915353cc71611925c496286c3ae2eb_250x0.jpg" alt="">
                                    <div class="RelatedCommodtites-content">
                                        <div class="RelatedCommodtites-title">天涯双探 4：双城血案</div>
                                        <div class="RelatedCommodtites-description">七名</div>
                                        <div class="RelatedCommodtites-meta">
                                            <div class="RelatedCommodities-bookMeta">
                                                2 人读过
                                                <span class="RelatedCommodities-bookRead">
                                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Ebook" width="13" height="14" fill="currentColor" viewBox="0 0 24 24"><path d="M16 17.649V2.931a.921.921 0 0 0-.045-.283.943.943 0 0 0-1.182-.604L4.655 5.235A.932.932 0 0 0 4 6.122v14.947c0 .514.421.931.941.931H19.06c.52 0 .941-.417.941-.93V7.292a.936.936 0 0 0-.941-.931h-.773v12.834a.934.934 0 0 1-.83.924L6.464 21.416c-.02.002 2.94-.958 8.883-2.881a.932.932 0 0 0 .653-.886z" fill-rule="evenodd"></path></svg></span>
                                                    阅读
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
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
    </main>

<script src="Scripts/jquery-3.5.1.min.js"></script>
<script src="Scripts/wangEditor.min.js"></script>
<script src="Scripts/Modal.js"></script>
<script src="Scripts/comments.js"></script>
<script src="Scripts/Header-Head.js"></script>
<script src="Scripts/Header-TopstoryRecommend.js"></script>
<script src="Scripts/SideBar.js"></script>
<script src="Scripts/initComment.js"></script>
<script src="Scripts/Question.js"></script>
<script src="Scripts/wangEditorJs.js"></script>

</body>

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

</html>


<%--<button aria-label="粗体" data-tooltip="粗体 (Ctrl+B)" data-tooltip-position="bottom" data-tooltip-will-hide-on-click="true" type="button" class="Button Editable-control Button--plain">
                                                        <svg class="Zi Zi--FormatBold" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                            <path d="M9 17.025V13h4.418c1.19 0 2.415.562 2.415 2.012s-1.608 2.013-2.9 2.013H9zM9 7h4.336c1 0 1.814.888 1.814 2 0 .89-.814 2-1.814 2H9V7zm8.192 1.899a3.893 3.893 0 0 0-3.888-3.889S9.334 5 8.167 5C7 5 7 6.167 7 6.167v11.666C7 19 8.167 19 8.167 19l5.572.01c2.333 0 4.231-1.86 4.231-4.148a4.122 4.122 0 0 0-1.77-3.372 3.873 3.873 0 0 0 .992-2.591z" fill-rule="evenodd"></path>
                                                        </svg>
                                                    </button>
                                                    <button aria-label="斜体" data-tooltip="斜体 (Ctrl+I)" data-tooltip-position="bottom" data-tooltip-will-hide-on-click="true" type="button" class="Button Editable-control Button--plain">
                                                        <svg class="Zi Zi--FormatItalic" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                            <path d="M15.751 5h-5.502a.751.751 0 0 0-.749.75c0 .417.336.75.749.75H12l-2 11H8.249a.751.751 0 0 0-.749.75c0 .417.336.75.749.75h5.502a.751.751 0 0 0 .749-.75.748.748 0 0 0-.749-.75H12l2-11h1.751a.751.751 0 0 0 .749-.75.748.748 0 0 0-.749-.75" fill-rule="evenodd"></path>
                                                        </svg>
                                                    </button>
                                                    <span class="Editable-toolbar-separator"></span>
                                                    <button aria-label="一级标题" data-tooltip="一级标题 (Ctrl+Alt+1)" data-tooltip-position="bottom" data-tooltip-will-hide-on-click="true" type="button" class="Button Editable-control Button--plain">
                                                        <svg class="Zi Zi--FormatHeader" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                            <path d="M7 6.007C7 5.45 7.444 5 8 5c.552 0 1 .45 1 1.007v11.986C9 18.55 8.556 19 8 19c-.552 0-1-.45-1-1.007V6.007zm8 0C15 5.45 15.444 5 16 5c.552 0 1 .45 1 1.007v11.986C17 18.55 16.556 19 16 19c-.552 0-1-.45-1-1.007V6.007zM9 11h6v2H9v-2z" fill-rule="evenodd"></path>
                                                        </svg>
                                                    </button>
                                                    <button aria-label="引用块" data-tooltip="引用块 (Ctrl+Shift+U)" data-tooltip-position="bottom" data-tooltip-will-hide-on-click="true" type="button" class="Button Editable-control Button--plain">
                                                        <svg class="Zi Zi--FormatBlockquote" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                            <path d="M17.975 12.209c.504.454.822 1.05.952 1.792.061.35.055.715-.022 1.096-.075.379-.209.718-.4 1.018-.465.73-1.155 1.175-2.07 1.337-.874.153-1.684-.06-2.432-.638a3.6 3.6 0 0 1-.916-1.043 3.92 3.92 0 0 1-.506-1.336c-.172-.98-.03-2.026.425-3.142.455-1.116 1.155-2.118 2.1-3.007.8-.757 1.456-1.182 1.97-1.273a.72.72 0 0 1 .544.104.656.656 0 0 1 .286.452c.054.31-.095.601-.45.877-.856.67-1.455 1.27-1.796 1.798-.323.513-.467.873-.43 1.079.034.196.21.287.524.274l.191-.001.249-.029a2.436 2.436 0 0 1 1.781.642zm-7.51 0c.504.454.821 1.05.951 1.792.062.35.056.715-.02 1.096-.077.379-.21.718-.401 1.018-.465.73-1.155 1.175-2.07 1.337-.874.153-1.684-.06-2.432-.638a3.6 3.6 0 0 1-.916-1.043 3.92 3.92 0 0 1-.506-1.336c-.172-.98-.03-2.026.424-3.142.455-1.116 1.156-2.118 2.101-3.007.8-.757 1.456-1.182 1.97-1.273a.72.72 0 0 1 .544.104.656.656 0 0 1 .285.452c.055.31-.094.601-.45.877-.855.67-1.454 1.27-1.796 1.798-.322.513-.466.873-.43 1.079.034.196.21.287.525.274l.191-.001.248-.029a2.436 2.436 0 0 1 1.782.642z" fill-rule="evenodd"></path>
                                                        </svg>
                                                    </button>
                                                    <button aria-label="代码块" data-tooltip="代码块 (Ctrl+Alt+C)" data-tooltip-position="bottom" data-tooltip-will-hide-on-click="true" type="button" class="Button Editable-control Button--plain">
                                                        <svg class="Zi Zi--FormatCode" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                            <path d="M19.718 11.559a.961.961 0 0 1 .007 1.352l-2.201 2.033-1.319 1.219a.937.937 0 0 1-1.33-.005.961.961 0 0 1-.001-1.345l2.813-2.576-2.804-2.568a.96.96 0 0 1-.008-1.352.963.963 0 0 1 1.337 0l2.475 2.289 1.031.953zm-7.462-5.567a1.001 1.001 0 0 1 1.16-.818c.544.096.907.616.81 1.165l-2.082 11.804a1.001 1.001 0 0 1-1.16.818 1.003 1.003 0 0 1-.81-1.165l2.082-11.804zM9.123 8.316a.96.96 0 0 1 0 1.345l-2.812 2.575 2.806 2.569a.962.962 0 0 1 .006 1.35.935.935 0 0 1-1.337 0l-2.093-1.934-1.412-1.305a.961.961 0 0 1-.007-1.352l2.833-2.62.685-.634c.345-.35.976-.354 1.331.006z" fill-rule="evenodd"></path>
                                                        </svg>
                                                    </button>
                                                    <button aria-label="有序列表" data-tooltip="有序列表 (Ctrl+Shift+7)" data-tooltip-position="bottom" data-tooltip-will-hide-on-click="true" type="button" class="Button Editable-control Button--plain">
                                                        <svg class="Zi Zi--InsertOrderedList" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                            <path d="M9 6.5c0-.552.456-1 .995-1h8.01c.55 0 .995.444.995 1 0 .552-.456 1-.995 1h-8.01A.995.995 0 0 1 9 6.5zM5.884 7.893v-2.09h-.643L5.402 5h1.285v2.893h-.803zm.898 3.83l-.393.395h.862v.733H5v-.482l1.057-.892c.371-.312.461-.434.463-.566.003-.202-.135-.368-.396-.368-.289 0-.418.206-.418.43H5c0-.642.482-1.073 1.125-1.073s1.125.457 1.125.945c0 .307-.106.516-.468.877zM9 11.5c0-.552.456-1 .995-1h8.01c.55 0 .995.444.995 1 0 .552-.456 1-.995 1h-8.01a.995.995 0 0 1-.995-1zm0 5c0-.552.456-1 .995-1h8.01c.55 0 .995.444.995 1 0 .552-.456 1-.995 1h-8.01a.995.995 0 0 1-.995-1zm-1.759.624c0 .14-.025.27-.076.388a.902.902 0 0 1-.217.309 1.017 1.017 0 0 1-.336.205c-.13.05-.275.074-.437.074-.166 0-.32-.027-.462-.08a1.166 1.166 0 0 1-.367-.217 1.062 1.062 0 0 1-.246-.318.914.914 0 0 1-.1-.38v-.055h.765v.054a.343.343 0 0 0 .367.352c.117 0 .207-.03.27-.09.062-.06.093-.152.093-.277 0-.117-.039-.206-.117-.268a.506.506 0 0 0-.32-.091h-.14v-.516h.144c.117 0 .205-.03.264-.09a.31.31 0 0 0 .087-.226.27.27 0 0 0-.087-.209.332.332 0 0 0-.233-.08c-.107 0-.185.027-.236.08a.275.275 0 0 0-.076.197v.055h-.695v-.055a.915.915 0 0 1 .295-.644c.178-.161.436-.242.775-.242.14 0 .27.021.39.064s.224.102.312.176a.802.802 0 0 1 .207.262c.05.1.075.206.075.318 0 .258-.116.46-.348.605v.008a.625.625 0 0 1 .193.119.777.777 0 0 1 .256.572z" fill-rule="evenodd"></path>
                                                        </svg>
                                                    </button>
                                                    <button aria-label="无序列表" data-tooltip="无序列表 (Ctrl+Shift+8)" data-tooltip-position="bottom" data-tooltip-will-hide-on-click="true" type="button" class="Button Editable-control Button--plain">
                                                        <svg class="Zi Zi--InsertUnorderedList" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                            <path d="M9 7c0-.552.456-1 .995-1h8.01c.55 0 .995.444.995 1 0 .552-.456 1-.995 1h-8.01A.995.995 0 0 1 9 7zM6 8a1 1 0 1 1 0-2 1 1 0 0 1 0 2zm0 5a1 1 0 1 1 0-2 1 1 0 0 1 0 2zm0 5a1 1 0 1 1 0-2 1 1 0 0 1 0 2zm3-6c0-.552.456-1 .995-1h8.01c.55 0 .995.444.995 1 0 .552-.456 1-.995 1h-8.01A.995.995 0 0 1 9 12zm0 5c0-.552.456-1 .995-1h8.01c.55 0 .995.444.995 1 0 .552-.456 1-.995 1h-8.01A.995.995 0 0 1 9 17z" fill-rule="evenodd"></path>
                                                        </svg>
                                                    </button>
                                                    <span class="Editable-toolbar-separator"></span>
                                                    <button aria-label="插入注释" data-tooltip="插入注释 (Ctrl+Shift+9)" data-tooltip-position="bottom" data-tooltip-will-hide-on-click="true" type="button" class="Button Editable-control Button--plain">
                                                        <svg class="Zi Zi--InsertReference" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                            <path d="M8 3.25v1.5a.25.25 0 0 1-.25.25h-2.5a.25.25 0 0 0-.25.25v13.5c0 .138.112.25.25.25h2.5a.25.25 0 0 1 .25.25v1.5a.25.25 0 0 1-.25.25H4a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h3.75a.25.25 0 0 1 .25.25zM20 3a1 1 0 0 1 1 1v16a1 1 0 0 1-1 1h-3.75a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 1 .25-.25h2.5a.25.25 0 0 0 .25-.25V5.25a.25.25 0 0 0-.25-.25h-2.5a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 1 .25-.25H20zm-7.25 4a.25.25 0 0 1 .243.193L13 7.25v9.5a.25.25 0 0 1-.193.243L12.75 17h-1.5a.25.25 0 0 1-.243-.193L11 16.75v-7.5a.25.25 0 0 0-.193-.243L10.75 9H9.32a.25.25 0 0 1-.25-.253l.008-.058.375-1.5a.25.25 0 0 1 .176-.18L9.695 7h3.055z" fill-rule="evenodd"></path>
                                                        </svg>
                                                    </button>
                                                    <button aria-label="插入链接" data-tooltip="插入链接 (Ctrl+K)" data-tooltip-position="bottom" data-tooltip-will-hide-on-click="true" type="button" class="Button Editable-control Button--plain">
                                                        <svg class="Zi Zi--InsertLink" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                            <path d="M13.414 4.222a4.5 4.5 0 1 1 6.364 6.364l-3.005 3.005a.5.5 0 0 1-.707 0l-.707-.707a.5.5 0 0 1 0-.707l3.005-3.005a2.5 2.5 0 1 0-3.536-3.536l-3.005 3.005a.5.5 0 0 1-.707 0l-.707-.707a.5.5 0 0 1 0-.707l3.005-3.005zm-6.187 6.187a.5.5 0 0 1 .638-.058l.07.058.706.707a.5.5 0 0 1 .058.638l-.058.07-3.005 3.004a2.5 2.5 0 0 0 3.405 3.658l.13-.122 3.006-3.005a.5.5 0 0 1 .638-.058l.069.058.707.707a.5.5 0 0 1 .058.638l-.058.069-3.005 3.005a4.5 4.5 0 0 1-6.524-6.196l.16-.168 3.005-3.005zm8.132-3.182a.25.25 0 0 1 .353 0l1.061 1.06a.25.25 0 0 1 0 .354l-8.132 8.132a.25.25 0 0 1-.353 0l-1.061-1.06a.25.25 0 0 1 0-.354l8.132-8.132z"></path>
                                                        </svg>
                                                    </button>
                                                    <button aria-label="上传图片" data-tooltip="上传图片" data-tooltip-position="bottom" data-tooltip-will-hide-on-click="true" type="button" class="Button Editable-control Button--plain">
                                                        <svg class="Zi Zi--Image" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                            <path d="M3.75 4.002L20.078 4c.669 0 .911.07 1.156.2.244.131.436.323.567.567.13.245.2.487.2 1.156v12.154c0 .669-.07.911-.2 1.156-.131.244-.323.436-.567.567-.245.13-.487.2-1.156.2H3.923c-.669 0-.911-.07-1.156-.2a1.363 1.363 0 0 1-.567-.567c-.118-.223-.187-.443-.198-.984L2 5.923c0-.669.07-.911.2-1.156.131-.244.323-.436.567-.567.223-.118.443-.187.984-.198zM19.68 6H4.32c-.111 0-.151.012-.192.033a.227.227 0 0 0-.095.095.27.27 0 0 0-.03.121L4 6.32v11.36c0 .111.012.151.033.192.022.04.054.073.095.095a.27.27 0 0 0 .121.03L4.32 18h15.36c.111 0 .151-.012.192-.033a.227.227 0 0 0 .095-.095.27.27 0 0 0 .03-.121L20 17.68V6.32c0-.111-.012-.151-.033-.192a.227.227 0 0 0-.095-.095.27.27 0 0 0-.121-.03L19.68 6zm-5.176 2.18a.25.25 0 0 1 .088.09l4.195 7.356a.25.25 0 0 1-.217.374H5.44a.25.25 0 0 1-.216-.378l3.235-5.447a.25.25 0 0 1 .426-.006l1.899 2.99a.25.25 0 0 0 .425-.005l2.952-4.89a.25.25 0 0 1 .343-.084z"></path>
                                                        </svg>
                                                    </button>
                                                    <button aria-label="插入视频" data-tooltip="插入视频" data-tooltip-position="bottom" data-tooltip-will-hide-on-click="true" type="button" class="Button Editable-control Button--plain">
                                                        <svg class="Zi Zi--InsertVideo" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                            <path d="M3.75 4.002L20.078 4c.669 0 .911.07 1.156.2.244.131.436.323.567.567.13.245.2.487.2 1.156v12.154c0 .669-.07.911-.2 1.156-.131.244-.323.436-.567.567-.245.13-.487.2-1.156.2H3.923c-.669 0-.911-.07-1.156-.2a1.363 1.363 0 0 1-.567-.567c-.118-.223-.187-.443-.198-.984L2 5.923c0-.669.07-.911.2-1.156.131-.244.323-.436.567-.567.223-.118.443-.187.984-.198zM19.68 6H4.32c-.111 0-.151.012-.192.033a.227.227 0 0 0-.095.095.27.27 0 0 0-.03.121L4 6.32v11.36c0 .111.012.151.033.192.022.04.054.073.095.095a.27.27 0 0 0 .121.03L4.32 18h15.36c.111 0 .151-.012.192-.033a.227.227 0 0 0 .095-.095.27.27 0 0 0 .03-.121L20 17.68V6.32c0-.111-.012-.151-.033-.192a.227.227 0 0 0-.095-.095.27.27 0 0 0-.121-.03L19.68 6zM9.584 8.657a.5.5 0 0 1 .614-.182l.08.043 4.598 3.066a.5.5 0 0 1 .07.775l-.07.057-4.599 3.066a.5.5 0 0 1-.769-.326l-.008-.09V8.934a.5.5 0 0 1 .084-.277z"></path>
                                                        </svg>
                                                    </button>
                                                    <button aria-label="插入公式" data-tooltip="插入公式 (Ctrl+Shift+E)" data-tooltip-position="bottom" data-tooltip-will-hide-on-click="true" type="button" class="Button Editable-control Button--plain">
                                                        <svg class="Zi Zi--InsertFormula" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                            <path d="M18.57 19.862l.75-1.5a.25.25 0 0 0-.225-.362H9.104a.25.25 0 0 1-.177-.427l5.88-5.88a.25.25 0 0 0-.014-.369L9.02 6.441A.25.25 0 0 1 9.182 6h8.568a.25.25 0 0 0 .25-.25v-1.5a.25.25 0 0 0-.25-.25h-13a.25.25 0 0 0-.25.25v.141c0 .07.029.136.08.183l7.237 6.755a.25.25 0 0 1 .012.354l-7.261 7.745a.25.25 0 0 0-.068.17v.152c0 .138.112.25.25.25h13.595a.25.25 0 0 0 .224-.138z"></path>
                                                        </svg>
                                                    </button>
                                                    <button aria-label="插入分割线" data-tooltip="插入分割线 (Ctrl+Shift+S)" data-tooltip-position="bottom" data-tooltip-will-hide-on-click="true" type="button" class="Button Editable-control Button--plain">
                                                        <svg class="Zi Zi--InsertDivider" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                            <path d="M20.75 17a.25.25 0 0 1 .25.25v1.5a.25.25 0 0 1-.25.25H3.25a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 1 .25-.25h17.5zm-13-6a.25.25 0 0 1 .25.25v1.5a.25.25 0 0 1-.25.25h-4.5a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 1 .25-.25h4.5zm6 0a.25.25 0 0 1 .25.25v1.5a.25.25 0 0 1-.25.25h-3.5a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 1 .25-.25h3.5zm7 0a.25.25 0 0 1 .25.25v1.5a.25.25 0 0 1-.25.25h-4.5a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 1 .25-.25h4.5zm0-6a.25.25 0 0 1 .25.25v1.5a.25.25 0 0 1-.25.25H3.25A.25.25 0 0 1 3 6.75v-1.5A.25.25 0 0 1 3.25 5h17.5z"></path>
                                                        </svg>
                                                    </button>
                                                    <span class="Editable-toolbar-separator"></span>
                                                    <button aria-label="清除格式" data-tooltip="清除格式 (Ctrl+\)" data-tooltip-position="bottom" data-tooltip-will-hide-on-click="true" type="button" class="Button Editable-control Button--plain">
                                                        <svg class="Zi Zi--FormatClear" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                            <path d="M20.309 20.309a.25.25 0 0 1 0 .353l-1.061 1.06a.25.25 0 0 1-.354 0l-7.299-7.299L11 18h1.75a.25.25 0 0 1 .25.25v1.5a.25.25 0 0 1-.25.25h-5.5a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 1 .25-.25H9l.881-5.29-4.73-4.73a.25.25 0 0 1-.13-.129L2.277 5.106a.25.25 0 0 1 0-.354l1.06-1.06a.25.25 0 0 1 .301-.041l.053.04L20.31 20.31zM18.75 4a.25.25 0 0 1 .25.25v3.5a.25.25 0 0 1-.25.25h-1.5a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 0-.25-.25H13l-.597 3.575-1.714-1.714L11 6H8.826l-2-2H18.75z"></path>
                                                        </svg>
                                                    </button>
                                                    <button aria-label="上传附件" data-tooltip="上传附件" data-tooltip-position="bottom" data-tooltip-will-hide-on-click="true" type="button" class="Button Editable-control Button--plain">
                                                        <svg class="Zi Zi--Folder" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                            <path d="M9.586 3a1 1 0 0 1 .707.293l1.414 1.414a1 1 0 0 0 .707.293H21a1 1 0 0 1 1 1v13a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h6.586zM4 11v6.75c0 .138.112.25.25.25h15.5a.25.25 0 0 0 .25-.25V11H4zm0-2h16V7.25a.25.25 0 0 0-.25-.25h-8.164a1 1 0 0 1-.707-.293L9.464 5.293A1 1 0 0 0 8.757 5H4.25a.25.25 0 0 0-.25.25V9z"></path>
                                                        </svg>
                                                    </button>--%>
<%--<div class="ztext-cover">
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
                    <span style="display:inline-flex;align-items:center">​<svg class="Zi Zi--InsertLink" fill="currentColor" viewBox="0 0 24 24" width="17" height="17"><path d="M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z" fill-rule="evenodd"></path></svg></span>
                    www.bilibili.com
                </span>
            </span>
            <span class="LinkCard-imageCell LinkCard-image--horizontal">
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
                    <span style="display:inline-flex;align-items:center">​<svg class="Zi Zi--InsertLink" fill="currentColor" viewBox="0 0 24 24" width="17" height="17"><path d="M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z" fill-rule="evenodd"></path></svg></span>
                    item.m.jd.com
                </span>
            </span>
            <span class="LinkCard-imageCell">
                <div>
                    <svg class="Zi Zi--Browser" fill="currentColor" viewBox="0 0 24 24" width="32" height="32"><path d="M11.991 3C7.023 3 3 7.032 3 12s4.023 9 8.991 9C16.968 21 21 16.968 21 12s-4.032-9-9.009-9zm6.237 5.4h-2.655a14.084 14.084 0 0 0-1.242-3.204A7.227 7.227 0 0 1 18.228 8.4zM12 4.836A12.678 12.678 0 0 1 13.719 8.4h-3.438A12.678 12.678 0 0 1 12 4.836zM5.034 13.8A7.418 7.418 0 0 1 4.8 12c0-.621.09-1.224.234-1.8h3.042A14.864 14.864 0 0 0 7.95 12c0 .612.054 1.206.126 1.8H5.034zm.738 1.8h2.655a14.084 14.084 0 0 0 1.242 3.204A7.188 7.188 0 0 1 5.772 15.6zm2.655-7.2H5.772a7.188 7.188 0 0 1 3.897-3.204c-.54.999-.954 2.079-1.242 3.204zM12 19.164a12.678 12.678 0 0 1-1.719-3.564h3.438A12.678 12.678 0 0 1 12 19.164zm2.106-5.364H9.894A13.242 13.242 0 0 1 9.75 12c0-.612.063-1.215.144-1.8h4.212c.081.585.144 1.188.144 1.8 0 .612-.063 1.206-.144 1.8zm.225 5.004c.54-.999.954-2.079 1.242-3.204h2.655a7.227 7.227 0 0 1-3.897 3.204zm1.593-5.004c.072-.594.126-1.188.126-1.8 0-.612-.054-1.206-.126-1.8h3.042c.144.576.234 1.179.234 1.8s-.09 1.224-.234 1.8h-3.042z"></path></svg>
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
                    <span style="display:inline-flex;align-items:center">​<svg class="Zi Zi--InsertLink" fill="currentColor" viewBox="0 0 24 24" width="17" height="17"><path d="M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z" fill-rule="evenodd"></path></svg></span>
                    item.m.jd.com
                </span>
            </span>
            <span class="LinkCard-imageCell">
                <div>
                    <svg class="Zi Zi--Browser" fill="currentColor" viewBox="0 0 24 24" width="32" height="32"><path d="M11.991 3C7.023 3 3 7.032 3 12s4.023 9 8.991 9C16.968 21 21 16.968 21 12s-4.032-9-9.009-9zm6.237 5.4h-2.655a14.084 14.084 0 0 0-1.242-3.204A7.227 7.227 0 0 1 18.228 8.4zM12 4.836A12.678 12.678 0 0 1 13.719 8.4h-3.438A12.678 12.678 0 0 1 12 4.836zM5.034 13.8A7.418 7.418 0 0 1 4.8 12c0-.621.09-1.224.234-1.8h3.042A14.864 14.864 0 0 0 7.95 12c0 .612.054 1.206.126 1.8H5.034zm.738 1.8h2.655a14.084 14.084 0 0 0 1.242 3.204A7.188 7.188 0 0 1 5.772 15.6zm2.655-7.2H5.772a7.188 7.188 0 0 1 3.897-3.204c-.54.999-.954 2.079-1.242 3.204zM12 19.164a12.678 12.678 0 0 1-1.719-3.564h3.438A12.678 12.678 0 0 1 12 19.164zm2.106-5.364H9.894A13.242 13.242 0 0 1 9.75 12c0-.612.063-1.215.144-1.8h4.212c.081.585.144 1.188.144 1.8 0 .612-.063 1.206-.144 1.8zm.225 5.004c.54-.999.954-2.079 1.242-3.204h2.655a7.227 7.227 0 0 1-3.897 3.204zm1.593-5.004c.072-.594.126-1.188.126-1.8 0-.612-.054-1.206-.126-1.8h3.042c.144.576.234 1.179.234 1.8s-.09 1.224-.234 1.8h-3.042z"></path></svg>
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
                    <span style="display:inline-flex;align-items:center">​<svg class="Zi Zi--InsertLink" fill="currentColor" viewBox="0 0 24 24" width="17" height="17"><path d="M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z" fill-rule="evenodd"></path></svg></span>
                    item.m.jd.com
                </span>
            </span>
            <span class="LinkCard-imageCell">
                <div>
                    <svg class="Zi Zi--Browser" fill="currentColor" viewBox="0 0 24 24" width="32" height="32"><path d="M11.991 3C7.023 3 3 7.032 3 12s4.023 9 8.991 9C16.968 21 21 16.968 21 12s-4.032-9-9.009-9zm6.237 5.4h-2.655a14.084 14.084 0 0 0-1.242-3.204A7.227 7.227 0 0 1 18.228 8.4zM12 4.836A12.678 12.678 0 0 1 13.719 8.4h-3.438A12.678 12.678 0 0 1 12 4.836zM5.034 13.8A7.418 7.418 0 0 1 4.8 12c0-.621.09-1.224.234-1.8h3.042A14.864 14.864 0 0 0 7.95 12c0 .612.054 1.206.126 1.8H5.034zm.738 1.8h2.655a14.084 14.084 0 0 0 1.242 3.204A7.188 7.188 0 0 1 5.772 15.6zm2.655-7.2H5.772a7.188 7.188 0 0 1 3.897-3.204c-.54.999-.954 2.079-1.242 3.204zM12 19.164a12.678 12.678 0 0 1-1.719-3.564h3.438A12.678 12.678 0 0 1 12 19.164zm2.106-5.364H9.894A13.242 13.242 0 0 1 9.75 12c0-.612.063-1.215.144-1.8h4.212c.081.585.144 1.188.144 1.8 0 .612-.063 1.206-.144 1.8zm.225 5.004c.54-.999.954-2.079 1.242-3.204h2.655a7.227 7.227 0 0 1-3.897 3.204zm1.593-5.004c.072-.594.126-1.188.126-1.8 0-.612-.054-1.206-.126-1.8h3.042c.144.576.234 1.179.234 1.8s-.09 1.224-.234 1.8h-3.042z"></path></svg>
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
                    <span style="display:inline-flex;align-items:center">​<svg class="Zi Zi--InsertLink" fill="currentColor" viewBox="0 0 24 24" width="17" height="17"><path d="M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z" fill-rule="evenodd"></path></svg></span>
                    item.m.jd.com
                </span>
            </span>
            <span class="LinkCard-imageCell">
                <div>
                    <svg class="Zi Zi--Browser" fill="currentColor" viewBox="0 0 24 24" width="32" height="32"><path d="M11.991 3C7.023 3 3 7.032 3 12s4.023 9 8.991 9C16.968 21 21 16.968 21 12s-4.032-9-9.009-9zm6.237 5.4h-2.655a14.084 14.084 0 0 0-1.242-3.204A7.227 7.227 0 0 1 18.228 8.4zM12 4.836A12.678 12.678 0 0 1 13.719 8.4h-3.438A12.678 12.678 0 0 1 12 4.836zM5.034 13.8A7.418 7.418 0 0 1 4.8 12c0-.621.09-1.224.234-1.8h3.042A14.864 14.864 0 0 0 7.95 12c0 .612.054 1.206.126 1.8H5.034zm.738 1.8h2.655a14.084 14.084 0 0 0 1.242 3.204A7.188 7.188 0 0 1 5.772 15.6zm2.655-7.2H5.772a7.188 7.188 0 0 1 3.897-3.204c-.54.999-.954 2.079-1.242 3.204zM12 19.164a12.678 12.678 0 0 1-1.719-3.564h3.438A12.678 12.678 0 0 1 12 19.164zm2.106-5.364H9.894A13.242 13.242 0 0 1 9.75 12c0-.612.063-1.215.144-1.8h4.212c.081.585.144 1.188.144 1.8 0 .612-.063 1.206-.144 1.8zm.225 5.004c.54-.999.954-2.079 1.242-3.204h2.655a7.227 7.227 0 0 1-3.897 3.204zm1.593-5.004c.072-.594.126-1.188.126-1.8 0-.612-.054-1.206-.126-1.8h3.042c.144.576.234 1.179.234 1.8s-.09 1.224-.234 1.8h-3.042z"></path></svg>
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
                    <span style="display:inline-flex;align-items:center">​<svg class="Zi Zi--InsertLink" fill="currentColor" viewBox="0 0 24 24" width="17" height="17"><path d="M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z" fill-rule="evenodd"></path></svg></span>
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
                    <span style="display:inline-flex;align-items:center">​<svg class="Zi Zi--InsertLink" fill="currentColor" viewBox="0 0 24 24" width="17" height="17"><path d="M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z" fill-rule="evenodd"></path></svg></span>
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
</div>--%>