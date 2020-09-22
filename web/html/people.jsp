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
    <meta charset="UTF-8">
    <title>${userEntity.name} - 知乎</title>
    <link rel="icon" href="images/favicon.ico">
    <link href="css/Header-Head.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/SideBar.css">
    <link rel="stylesheet" href="css/Header-Topstory.css">
    <link rel="stylesheet" href="css/Footer.css">
    <link rel="stylesheet" href="css/Modal.css">
    <link rel="stylesheet" href="css/comments.css">

    <link href="css/User-Topstory.css" rel="stylesheet" type="text/css">
	
  </head>

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
                                <button class="button " type="button">
                                    <svg class="Zi Zi--Search SearchBar-searchIcon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18" data-darkreader-inline-fill="" style="--darkreader-inline-fill:currentColor;"><path d="M17.068 15.58a8.377 8.377 0 0 0 1.774-5.159 8.421 8.421 0 1 0-8.42 8.421 8.38 8.38 0 0 0 5.158-1.774l3.879 3.88c.957.573 2.131-.464 1.488-1.49l-3.879-3.878zm-6.647 1.157a6.323 6.323 0 0 1-6.316-6.316 6.323 6.323 0 0 1 6.316-6.316 6.323 6.323 0 0 1 6.316 6.316 6.323 6.323 0 0 1-6.316 6.316z" fill-rule="evenodd"></path></svg>
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
                    <button class="button">
                        <img src="images/user/${userEntity.chatHead}" alt="" height="30" width="30"/>
                    </button>
                </div>
            </div>
        </div>
        <div>
            <div class="PageHeader">
                <div class="userMain-header">
                    <div class="userMain-avatar">
                        <img class="Avatar" width="38" height="38" src="images/user/${userEntity.chatHead}" alt="">
                    </div>
                    <ul class="Tabs-items userMain-tabs">
                        <li class="Tabs-item">
                            <a class="Tabs-link is-active" href="#">
                                动态
                            </a>
                        </li>
                        <li class="Tabs-item">
                            <a class="Tabs-link" href="#">
                                回答<span class="Tabs-meta">6</span>
                            </a>
                        </li>
                        <li class="Tabs-item">
                            <a class="Tabs-link" href="#">
                                视频<span class="Tabs-meta">0</span>
                            </a>
                        </li>
                        <li class="Tabs-item">
                            <a class="Tabs-link" href="#">
                                问题<span class="Tabs-meta">0</span>
                            </a>
                        </li>
                        <li class="Tabs-item">
                            <a class="Tabs-link" href="#">
                                文章<span class="Tabs-meta">1</span>
                            </a>
                        </li>
                        <li class="Tabs-item">
                            <a class="Tabs-link" href="#">
                                专栏<span class="Tabs-meta">0</span>
                            </a>
                        </li>
                        <li class="Tabs-item">
                            <a class="Tabs-link" href="#">
                                想法<span class="Tabs-meta">0</span>
                            </a>
                        </li>
                        <li class="Tabs-item">
                            <div class="Tabs-link" href="#">
                                <button type="button" class="button userMain-menuButton">更多
                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--ArrowDown" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path></svg></span>
                                </button>
                            </div>
                        </li>
                    </ul>
                    <div class="userMain-button">
                        <button type="button" class="button">编辑个人资料</button>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <main>
        <div>
            <div class="userHeader">
                <div class="Card">
                    <div class="userHeader-userCover">
                        <div class="userCover-wrapper">
                            <input class="userCover-input" type="file" accept="image/png,image/jpeg"/>
                            <button type="button" class="button userCover-button">
                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Camera" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M20.094 6S22 6 22 8v10.017S22 20 19 20H4.036S2 20 2 18V7.967S2 6 4 6h3s1-2 2-2h6c1 0 2 2 2 2h3.094zM12 16a3.5 3.5 0 1 1 0-7 3.5 3.5 0 0 1 0 7zm0 1.5a5 5 0 1 0-.001-10.001A5 5 0 0 0 12 17.5zm7.5-8a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" fill-rule="evenodd"></path></svg></span>
                                编辑封面图片
                            </button>
                        </div>
                        <div class="userCover">
                            <c:choose>
                                <c:when test="${userEntity.personalExperience == ''}">    <!--如果 -->
                                    ${userEntity.personalExperience}
                                    <img class="userCover-img" src="images/user/v2-2a6b7437fa7fcfc7d917c85cad05e24b_r%20(1).jpg" alt="">
                                </c:when>
                                <c:otherwise>  <!--否则 -->
                                    <img class="userCover-img" src="images/user/${userEntity.personalExperience}" alt="">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="userHeader-wrapper">
                        <div class="userHeader-main">
                            <div class="userHeader-avatar">
                                <div class="userAvatar">
                                    <img width="160" height="160" src="images/user/${userEntity.chatHead}" alt="">
                                </div>
                                <label class="userPicture" for="">
                                    <input class="userCover-input" type="file" accept="image/png,image/jpeg"/>
                                    <div class="userPictureEditor-mask mask-hidden">
                                        <div class="userPictureEditor-masklInner"></div>
                                        <div class="userPictureEditor-masklcontent">
                                            <svg class="Zi Zi--Camera UserAvatarEditor-cameraIcon" fill="currentColor" viewBox="0 0 24 24" width="36" height="36"><path d="M20.094 6S22 6 22 8v10.017S22 20 19 20H4.036S2 20 2 18V7.967S2 6 4 6h3s1-2 2-2h6c1 0 2 2 2 2h3.094zM12 16a3.5 3.5 0 1 1 0-7 3.5 3.5 0 0 1 0 7zm0 1.5a5 5 0 1 0-.001-10.001A5 5 0 0 0 12 17.5zm7.5-8a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" fill-rule="evenodd"></path></svg>
                                            <div class="userPictureEditor-masklcontentText">修改我的头像</div>
                                        </div>
                                    </div>
                                </label>
                            </div>
                            <div class="userHeader-content">
                                <div class="userHeader-contentHead">
                                    <h1 class="userHeader-title">
                                        <span class="userHeader-name">${userEntity.name}</span>
                                        <span class="userHeader-headline">${userEntity.introduce}</span>
                                    </h1>
                                </div>
                                <div class="userHeader-contentBody">
                                    <div class="userHeader-infos">
                                        <c:if test="${userEntity.industry != ''}">
                                            <div class="userHeader-infoItem">
                                                <div class="userHeader-iconBox"><span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Company" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M17 6.998h3.018c1.098 0 1.975.89 1.982 2.002v10a1.993 1.993 0 0 1-1.987 2H3.98A1.983 1.983 0 0 1 2 19l.009-10.003c0-1.11.873-1.999 1.971-1.999L7 7V5c.016-1.111.822-2 2-2h6c.98 0 1.86.889 2 2v1.998zM9 7h6V5.5s0-.5-.5-.5h-5c-.504 0-.5.5-.5.5V7z" fill-rule="evenodd"></path></svg></span></div>
                                                ${userEntity.industry}
                                            </div>
                                        </c:if>

                                        <c:choose>
                                            <c:when test="${userEntity.sex == '男'}">    <!--如果 -->
                                                <div class="userHeader-infoItem">
                                                    <div class="userHeader-iconBox">
                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Male" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M8.025 15.641a3.5 3.5 0 1 1 4.95-4.95 3.5 3.5 0 0 1-4.95 4.95zm10.122-9.369a.759.759 0 0 0-.753-.753L13.322 5a.738.738 0 0 0-.744.744.757.757 0 0 0 .751.752l2.127.313c-.95.954-1.832 1.83-1.832 1.83a5.502 5.502 0 0 0-7.013 8.416 5.5 5.5 0 0 0 8.415-7.016l1.842-1.819.303 2.116a.758.758 0 0 0 .752.753.738.738 0 0 0 .744-.744l-.52-4.073z" fill-rule="evenodd"></path></svg></span>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>  <!--否则 -->
                                                <div class="userHeader-infoItem">
                                                    <div class="userHeader-iconBox">
                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Female" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M12 4a5.5 5.5 0 0 0-1.015 10.907c-.003.702.011 1.087.011 1.087H9C7.667 16 7.667 18 9 18s1.996-.006 1.996-.006v1c0 1.346 2.004 1.346 1.998 0-.006-1.346 0-1 0-1s.664.006 2.003.006 1.339-2-.006-2.006h-1.996s-.003-.548-.003-1.083A5.501 5.501 0 0 0 12 4zM8.25 9.55a3.75 3.75 0 1 1 7.5 0 3.75 3.75 0 0 1-7.5 0z" fill-rule="evenodd"></path></svg></span>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>


                                    </div>
                                </div>
                                <div class="userHeader-contentFooter">
                                    <button type="button" class="button">
                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--ArrowDown" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path></svg></span>
                                        查看详细资料
                                    </button>
                                    <div class="userHeader-DataUpdate">
                                        <button type="button" class="button">编辑个人资料</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="user-main">
                <div class="user-mainColumn">
                    <div class="Card userMain">
                        <div class="userMain-header">
                            <ul class="Tabs-items userMain-tabs">
                                <li class="Tabs-item">
                                    <a class="Tabs-link is-active" href="people">
                                        动态
                                    </a>
                                </li>
                                <li class="Tabs-item">
                                    <a class="Tabs-link" href="people/answers">
                                        回答<span class="Tabs-meta">6</span>
                                    </a>
                                </li>
                                <li class="Tabs-item">
                                    <a class="Tabs-link" href="people/zvideos">
                                        视频<span class="Tabs-meta">0</span>
                                    </a>
                                </li>
                                <li class="Tabs-item">
                                    <a class="Tabs-link" href="people/asks">
                                        问题<span class="Tabs-meta">0</span>
                                    </a>
                                </li>
                                <li class="Tabs-item">
                                    <a class="Tabs-link" href="people/posts">
                                        文章<span class="Tabs-meta">1</span>
                                    </a>
                                </li>
                                <li class="Tabs-item">
                                    <a class="Tabs-link" href="people/columns">
                                        专栏<span class="Tabs-meta">0</span>
                                    </a>
                                </li>
                                <li class="Tabs-item">
                                    <a class="Tabs-link" href="people/pins">
                                        想法<span class="Tabs-meta">0</span>
                                    </a>
                                </li>
                                <li class="Tabs-item">
                                    <a class="Tabs-link" href="people/following">
                                        关注<span class="Tabs-meta">0</span>
                                    </a>
                                </li>
                                <li class="Tabs-item">
                                    <div class="Tabs-link" href="#">
                                        <button type="button" class="button userMain-menuButton">更多
                                            <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--ArrowDown" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path></svg></span>
                                        </button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="userMain-body">
                            <div class="userMain-bodyTitle">
                                <h4 class="userMain-bodyText">
                                    <span>我的动态</span>
                                </h4>
                                <div class="userMain-bodyOptions"></div>
                            </div>
                            <div class="userMain-bodyitems">
                                <c:forEach var="bynamicContainerEntity" items="${bynamicContainerEntityList}">
                                    <c:choose>
                                        <c:when test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'wt'}">
                                            <c:if test="${bynamicContainerEntity.bynamicEntity.bynamicType != 'zt'}">
                                                <div class="list-item">
                                                    <div class="list-itemMata">
                                                        <div class="ActivityItem-meta">
                                                            <c:choose>
                                                                <c:when test="${bynamicContainerEntity.bynamicEntity.bynamicType == 'gz'}">
                                                                    <span class="ActivityItem-metaTitle">关注了问题</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:if test="${bynamicContainerEntity.bynamicEntity.bynamicType == 'fb'}">
                                                                        <span class="ActivityItem-metaTitle">发布了问题</span>
                                                                    </c:if>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <span>${fn:substring(bynamicContainerEntity.bynamicEntity.bynamicTime, 0, 10)}</span>
                                                        </div>
                                                    </div>
                                                    <div class="ConstantItem">
                                                        <h2 class="ContentItem-title">
                                                            <a target="_blank" href="question?questionId=${bynamicContainerEntity.questionEntity.id}">${bynamicContainerEntity.questionEntity.questionTitle}</a>
                                                        </h2>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'hd'}">
                                                <div class="list-item">
                                                    <div class="list-itemMata">
                                                        <div class="ActivityItem-meta">
                                                            <c:choose>
                                                                <c:when test="${bynamicContainerEntity.bynamicEntity.bynamicType == 'fb'}">
                                                                    <span class="ActivityItem-metaTitle">发布了回答</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:if test="${bynamicContainerEntity.bynamicEntity.bynamicType == 'zt'}">
                                                                        <span class="ActivityItem-metaTitle">赞同了回答</span>
                                                                    </c:if>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <span>${fn:substring(bynamicContainerEntity.bynamicEntity.bynamicTime, 0, 10)}</span>
                                                        </div>
                                                    </div>
                                                    <div class="ConstantItem">
                                                        <h2 class="ContentItem-title">
                                                            <a target="_blank" href="question?questionId=${bynamicContainerEntity.headerPage.questionEntity.id}">${bynamicContainerEntity.headerPage.questionEntity.questionTitle}</a>
                                                        </h2>
                                                        <div class="ConstantItem-meta">
                                                            <div class="AuthorInfo">
                                                                <div class="userLink">
                                                                    <a target="_blank" href="people?userId=${bynamicContainerEntity.headerPage.userEntity.id}" class="userLink-link">
                                                                        <img src="images/user/${bynamicContainerEntity.headerPage.userEntity.chatHead}" alt="">
                                                                    </a>
                                                                </div>
                                                                <div class="AuthorInfo-content">
                                                                    <div class="AuthorInfo-head">
                                                                        <span class="AuthorInfo-name">
                                                                            <div class="Popover">
                                                                                <a target="_blank" href="people?userId=${bynamicContainerEntity.headerPage.userEntity.id}">
                                                                                    ${bynamicContainerEntity.headerPage.userEntity.name}
                                                                                </a>
                                                                            </div>
                                                                        </span>
                                                                    </div>
                                                                    <div class="AuthorInfo-badge">
                                                                        <div class="AuthorInfo-badgeText">${bynamicContainerEntity.headerPage.userEntity.introduce}</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="css-h5al4j">
                                                                <span>
                                                                    <span class="Voters">
                                                                        <button type="button" class="button">
                                                                            ${bynamicContainerEntity.headerPage.answerEntity.approveNum} 人赞同了该回答
                                                                        </button>
                                                                    </span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div data-answer-id="${bynamicContainerEntity.headerPage.answerEntity.id}" data-user-id="${bynamicContainerEntity.headerPage.userEntity.id}" class="ContentItem-content is-collapsed">
                                                            <div class="ContentItem-content-inner">
                                                                <span class="text">${bynamicContainerEntity.headerPage.answerEntity.answerContent}</span>
                                                            <button type="button" class="button ContentItem-more">
                                                                阅读全文
                                                                <span style="display: inline-flex;align-items: center;">
                                                                    <svg class="Zi Zi--ArrowDown ContentItem-arrowIcon" fill="currentColor" viewBox="0 0 24 24" width="24" height="24">
                                                                        <path d="M12 13L8.285 9.218a.758.758 0 0 0-1.064 0 .738.738 0 0 0 0 1.052l4.249 4.512a.758.758 0 0 0 1.064 0l4.246-4.512a.738.738 0 0 0 0-1.052.757.757 0 0 0-1.063 0L12.002 13z" fill-rule="evenodd"></path>
                                                                    </svg>
                                                                </span>
                                                            </button>
                                                        </div>
                                                        <div class="ContentItem-actions">
                                                            <span>
                                                                <c:choose>
                                                                    <c:when test="${bynamicContainerEntity.bynamicEntity.bynamicType == 'zt'}">
                                                                        <button data-answer-id="${bynamicContainerEntity.headerPage.answerEntity.id}" class="button VoteButton VoteButton--up is-active ">
                                                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleUp VoteButton-TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>赞同 ${bynamicContainerEntity.headerPage.answerEntity.approveNum}</button>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <button data-answer-id="${bynamicContainerEntity.headerPage.answerEntity.id}" class="button VoteButton VoteButton--up">
                                                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleUp VoteButton-TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>赞同 ${bynamicContainerEntity.headerPage.answerEntity.approveNum}</button>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <button data-answer-id="${bynamicContainerEntity.headerPage.answerEntity.id}" class="button VoteButton VoteButton--down">
                                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span></button>
                                                            </span>
                                                            <button data-answer-id="${bynamicContainerEntity.headerPage.answerEntity.id}" type="button" class="button ContentItem-action">
                                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd"></path></svg></span>
                                                                ${bynamicContainerEntity.headerPage.commentNum} 条评论
                                                            </button>
                                                            <div class="ContentItem-action">
                                                                <button data-answer-id="${bynamicContainerEntity.headerPage.answerEntity.id}" type="button" class="button">
                                                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd"></path></svg></span>
                                                                    分享
                                                                </button>
                                                            </div>
                                                            <button data-answer-id="${bynamicContainerEntity.headerPage.answerEntity.id}" type="button" class="button ContentItem-action">
                                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Star Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd"></path></svg></span>
                                                                收藏
                                                            </button>
                                                            <button data-answer-id="${bynamicContainerEntity.headerPage.answerEntity.id}" type="button" class="button ContentItem-action">
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
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="user-side">
                    <div class="Card CreatorEntrance">
                        <a href="creator" class="CreatorEntrance-link">
                            <div class="CreatorEntrance-hint usermainCreator-CreatorEntrance">
                                <img class="CreatorEntrance-img" src="images/user/creator_entrance.a883e0a5.png" alt="">
                                <div class="CreatorEntrance-text">
                                    <div class="CreatorEntrance-title">
                                        创作中心
                                        <span class="css-605fnf">
                                            Lv 2
                                        </span>
                                    </div>
                                    <div class="CreatorEntrance-Message">
                                        查看详情
                                    </div>
                                </div>
                                <svg class="Zi Zi--ArrowRight CreatorEntrance-arrow" fill="currentColor" viewBox="0 0 24 24" width="24" height="24"><path d="M9.218 16.78a.737.737 0 0 0 1.052 0l4.512-4.249a.758.758 0 0 0 0-1.063L10.27 7.22a.737.737 0 0 0-1.052 0 .759.759 0 0 0-.001 1.063L13 12l-3.782 3.716a.758.758 0 0 0 0 1.063z" fill-rule="evenodd"></path></svg>
                            </div>
                            <div class="ProfileSideCreator-analytics">
                                <div class="ProfileSideCreator-readCountItem">
                                    <div class="ProfileSideCreator-readCountTitle">
                                        昨日被阅读数
                                    </div>
                                    <div class="ProfileSideCreator-readCountNum">--</div>
                                    <div class="css-u2c28s">
                                        <div class="css-1086365">较前日</div>
                                        <div class="css-1gqb0v0">
                                            <span class="css-1ntg9ig">
                                                <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--BackToTop" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M16.036 19.59a1 1 0 0 1-.997.995H9.032a.996.996 0 0 1-.997-.996v-7.005H5.03c-1.1 0-1.36-.633-.578-1.416L11.33 4.29a1.003 1.003 0 0 1 1.412 0l6.878 6.88c.782.78.523 1.415-.58 1.415h-3.004v7.005z"></path></svg></span>
                                            </span>
                                            <span class="css-qcbo30">
                                                --
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="ProfileSideCreator-readCountItem">
                                    <div class="ProfileSideCreator-readCountTitle">
                                        昨日被阅读数
                                    </div>
                                    <div class="ProfileSideCreator-readCountNum">--</div>
                                    <div class="css-u2c28s">
                                        <div class="css-1086365">较前日</div>
                                        <div class="css-1gqb0v0">--</div>
                                    </div>
                                </div>
                            </div>
                            <div class="css-rswm4q">
                                <div class="css-19mtex">
                                    <div class="css-1qzrmsu">
                                        瓦力保镖为你的创作提供持续保护
                                        <span style="display: inline-flex; align-items: center;">​<svg width="17" height="17" viewBox="0 0 16 16" class="css-14gt3bc" fill="currentColor"><path d="M8 3l.737.339.428.187.377.158.326.127c.15.055.282.1.395.133.55.161 1.297.157 2.237-.014l-.002 3.784c0 3.07-2.52 4.76-4.498 5.286-1.977-.527-4.498-2.216-4.498-5.286L3.5 3.93c.94.17 1.686.175 2.237.014C6.187 3.812 6.941 3.497 8 3zm2.38 3.066L7.599 8.834 6.32 7.566a.4.4 0 0 0-.554.554l1.55 1.55a.5.5 0 0 0 .568 0l3.05-3.05a.4.4 0 0 0-.554-.554z"></path></svg></span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="Card Succeed">
                        <div class="Succeed-header">
                            个人成就
                        </div>
                        <div class="css-122fspz">
                            <div class="css-12ofpn8">
                                <div class="css-1pbw4sw">
                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M14.445 9h5.387s2.997.154 1.95 3.669c-.168.51-2.346 6.911-2.346 6.911s-.763 1.416-2.86 1.416H8.989c-1.498 0-2.005-.896-1.989-2v-7.998c0-.987.336-2.032 1.114-2.639 4.45-3.773 3.436-4.597 4.45-5.83.985-1.13 3.2-.5 3.037 2.362C15.201 7.397 14.445 9 14.445 9zM3 9h2a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1z" fill-rule="evenodd"></path></svg></span>
                                </div>
                                <div class="css-vurnku">
                                    获取 2 次赞同
                                </div>
                            </div>
                            <div class="css-12ofpn8">
                                <div class="css-1pbw4sw">
                                    <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--EditCircle" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em"><path d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm4.043-15.524a.745.745 0 0 0-1.053.017l-6.857 7.071 2.237 2.17 6.857-7.071a.743.743 0 0 0-.016-1.052l-1.168-1.135zm-9.028 9.476l-.348 1.381 1.37-.39 1.274-.36-1.973-1.916-.323 1.285z" fill-rule="evenodd"></path></svg></span>
                                </div>
                                <div class="css-vurnku">
                                    参与 4 次公共编辑
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="Card FollowshipCard">
                        <div class="FollowshipCard-counts">
                            <a class="button NumderBoard-item" href="#">
                                <div class="NumderBoard-itemInner">
                                    <div class="NumderBoard-itemName">关注了</div>
                                    <div class="NumderBoard-itemValue">6</div>
                                </div>
                            </a>
                            <a class="button NumderBoard-item" href="#">
                                <div class="NumderBoard-itemInner">
                                    <div class="NumderBoard-itemName">关注者</div>
                                    <div class="NumderBoard-itemValue">0</div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="user-side-attentionList">
                        <a href="#" class="user-side-attentionItem">
                            <span class="user-side-attentionItemName">关注的话题</span>
                            <span class="user-side-attentionItemValue">0</span>
                        </a>
                        <a href="#" class="user-side-attentionItem">
                            <span class="user-side-attentionItemName">关注的专栏</span>
                            <span class="user-side-attentionItemValue">0</span>
                        </a>
                        <a href="#" class="user-side-attentionItem">
                            <span class="user-side-attentionItemName">关注的问题</span>
                            <span class="user-side-attentionItemValue">8</span>
                        </a>
                        <a href="#" class="user-side-attentionItem">
                            <span class="user-side-attentionItemName">关注的收藏夹</span>
                            <span class="user-side-attentionItemValue">0</span>
                        </a>
                    </div>
                    <div class="user-side-browseNum">
                        个人主页被浏览 130 次
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
    </main>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/Modal.js"></script>
    <script src="Scripts/comments.js"></script>
    <script src="Scripts/Header-Head.js"></script>
    <script src="Scripts/Header-TopstoryRecommend.js"></script>
    <script src="Scripts/User.js"></script>
    <script src="Scripts/analytics.js"></script>
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
</body>
</html>

<%--<div class="list-item">
        <div class="list-itemMata">
            <div class="ActivityItem-meta">
                <c:choose>
                    <c:when test="${bynamicContainerEntity.bynamicEntity.bynamicType == 'gz'}">
                        <c:choose>
                            <c:when test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'wt'}">
                                <span class="ActivityItem-metaTitle">关注了问题</span>
                            </c:when>
                            <c:otherwise>  <!--否则 -->
                                <c:if test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'zl'}">
                                    <span class="ActivityItem-metaTitle">关注了专栏</span>
                                </c:if>
                                <c:if test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'ht'}">
                                    <span class="ActivityItem-metaTitle">关注了话题</span>
                                </c:if>
                                <c:if test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'sc'}">
                                    <span class="ActivityItem-metaTitle">关注了收藏</span>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${bynamicContainerEntity.bynamicEntity.bynamicType == 'fb'}">
                            <c:when test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'wt'}">
                                <span class="ActivityItem-metaTitle">发布了问题</span>
                            </c:when>
                            <c:otherwise>
                                <c:if test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'hd'}">
                                    <span class="ActivityItem-metaTitle">发布了回答</span>
                                </c:if>
                                <c:if test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'sp'}">
                                    <span class="ActivityItem-metaTitle">发布了视频</span>
                                </c:if>
                                <c:if test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'wz'}">
                                    <span class="ActivityItem-metaTitle">发布了文章</span>
                                </c:if>
                                <c:if test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'xf'}">
                                    <span class="ActivityItem-metaTitle">发布了想法</span>
                                </c:if>
                            </c:otherwise>
                        </c:if>
                        <c:if test="${bynamicContainerEntity.bynamicEntity.bynamicType == 'zt'}">
                            <c:when test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'wt'}">
                                <span class="ActivityItem-metaTitle">赞同了问题</span>
                            </c:when>
                            <c:otherwise>
                                <c:if test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'hd'}">
                                    <span class="ActivityItem-metaTitle">赞同了回答</span>
                                </c:if>
                                <c:if test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'sp'}">
                                    <span class="ActivityItem-metaTitle">赞同了视频</span>
                                </c:if>
                                <c:if test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'wz'}">
                                    <span class="ActivityItem-metaTitle">赞同了文章</span>
                                </c:if>
                                <c:if test="${fn:substring(bynamicContainerEntity.bynamicEntity.byBynamicId, 0, 2) == 'xf'}">
                                    <span class="ActivityItem-metaTitle">赞同了想法</span>
                                </c:if>
                            </c:otherwise>
                        </c:if>
                    </c:otherwise>
                </c:choose>
                <span>${fn:substring(bynamicContainerEntity.bynamicEntity.bynamicTime, 0, 10)}</span>
            </div>
        </div>
        <div class="ConstantItem">
            <h2 class="ContentItem-title">
                <a href="#">选择大学是 专业＞城市＞学校 吗？</a>
            </h2>
        </div>
    </div>--%>
<%--<div class="list-item">
    <div class="list-itemMata">
        <div class="ActivityItem-meta">
            <span class="ActivityItem-metaTitle">赞同了回答</span>
            <span>07-22</span>
        </div>
    </div>
    <div class="ConstantItem">
        <h2 class="ContentItem-title">
            <a href="#">对电话销售需要礼貌回复吗？</a>
        </h2>
        <div class="ConstantItem-meta">
            <div class="AuthorInfo">
                <div class="userLink">
                    <a href="#" class="userLink-link">
                        <img src="images/touxiang/v2-c9df8ce90f8fdd4b402c22cb041e0cce_xs.jpg" alt="">
                    </a>
                </div>
                <div class="AuthorInfo-content">
                    <div class="AuthorInfo-head">
                    <span class="AuthorInfo-name">
                        <div class="Popover">
                            <a href="#">
                                Justin Lee
                            </a>
                        </div>
                    </span>
                    </div>
                    <div class="AuthorInfo-badge">
                        <div class="AuthorInfo-badgeText">公众号：1、政经纵论；2、浮世逆旅</div>
                    </div>
                </div>
            </div>
            <div class="css-h5al4j">
                <span>
                    <span class="Voters">
                        <button type="button" class="button">
                            12,053 人也赞同了该回答
                        </button>
                    </span>
                </span>
            </div>
        </div>
    </div>
    <div class="ContentItem-content is-collapsed">
        <div class="ContentItem-content-inner">
            <span class="text">问过做电话销售的人，他们公司80人，20个电销，每人每天有100个电话指标。 100个看起来不算多，是因为他们公司要求高，被人接起来的才记入指标，如果电话没打通，你需要根据实际情况在系统里点击“未接通”或“号码错误”按钮，号码错了会有专人去核实，未接通这个号码之后还会换个时间跳出来，让他再次打。 打通的100个号码，大概有…</span>
            <button type="button" class="button ContentItem-more">
                阅读全文
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
</div>--%>