<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<meta charset="utf-8" />
	<title>等你来答</title>
	<link rel="stylesheet" href="css/Header-Head.css">
	<link rel="stylesheet" href="css/SideBar.css">
	<link rel="stylesheet" href="css/Footer.css">
	<link rel="icon" href="images/favicon.ico">

	<link type="text/css" href="css/questionWaiting.css" rel="stylesheet"/>
</head>

<body>
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
				<a href="html/explore.jsp" class="Tabs-link">发现</a>
			</li>
			<li class="Tabs-item">
				<a href="<%=path %>/Question" class="Tabs-link is-active">等你来答</a>
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
				<button class="button">
					<img src="images/touxiang/6d6f2275d27e12ddf9deac2fd47a511344c9125d.png" alt="" height="30" width="30"/>
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
	<div class="QuestionWaiting">
		<div id="AllDiv">
			<div id="headDiv">
				<div class="headDiv-Topper"></div>
				<div class="headDiv-types">
					<a href="#">
						<div class="QuestionType--active">
							<svg class="Zi Zi--Fire QuestionType-icon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18">
								<path d="M14.553 20.78c.862-.651 1.39-1.792 1.583-3.421.298-2.511-.656-4.904-2.863-7.179.209 2.291.209 3.73 0 4.314-.41 1.143-1.123 1.983-1.91 2.03-1.35.079-2.305-.512-2.863-1.774-.676 1.25-.782 2.556-.318 3.915.31.906.94 1.684 1.89 2.333C7.144 20.131 5 17.336 5 14.022c0-2.144.898-4.072 2.325-5.4.062 2.072.682 3.598 2.13 4.822-.67-1.112-.734-2.11-.734-3.517 0-3.253 2.067-6.007 4.913-6.927a7.35 7.35 0 0 0 2.157 4.918C17.722 9.214 19 11.463 19 14.022c0 3.073-1.844 5.7-4.447 6.758z" fill-rule="evenodd">
								</path>
							</svg>人气问题
						</div>
					</a>

					<a href="#">
						<div>
							<svg class="Zi Zi--Seed QuestionType-icon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18">
								<path d="M10.558 9.842c.745 1.423 1.148 2.996 1.283 4.574a14.663 14.663 0 0 1 .052 1.125 16.067 16.067 0 0 1-.491 4.078l-.028.104a.232.232 0 0 1-.295.155l-.94-.302a.221.221 0 0 1-.148-.277l.018-.055a13.683 13.683 0 0 0 .234-.852 14.827 14.827 0 0 0 .4-2.89.225.225 0 0 0-.176-.223 11.89 11.89 0 0 1-1.383-.42 11.508 11.508 0 0 1-1.806-.86 10.681 10.681 0 0 1-2.98-2.581A10.213 10.213 0 0 1 3.23 9.784 10.388 10.388 0 0 1 2.49 8a10.772 10.772 0 0 1-.406-1.87 9.95 9.95 0 0 1-.062-1.922.229.229 0 0 1 .29-.2c1.707.321 3.366.97 4.806 1.964a10.75 10.75 0 0 1 3.44 3.87zm12.04-2.252l.01.002c.117.03.19.147.165.266a8.966 8.966 0 0 1-1.274 3.592 8.552 8.552 0 0 1-1.204 1.521 8.724 8.724 0 0 1-1.53 1.212 8.872 8.872 0 0 1-3.674 1.233c-.235.027-.47.045-.705.056a.225.225 0 0 0-.207.256c.034.262.084.522.148.778a.223.223 0 0 1-.162.269l-.859.218a.223.223 0 0 1-.273-.177 8.418 8.418 0 0 1-.102-2.458c.05-.469.14-.932.27-1.384a7.868 7.868 0 0 1 2.234-3.63c.062-.057.123-.114.189-.167l.193-.161c.065-.053.133-.103.2-.153.13-.104.273-.194.41-.289.144-.086.284-.178.432-.255.144-.084.296-.155.445-.229.152-.067.303-.136.46-.194.309-.118.625-.22.946-.296a8.357 8.357 0 0 1 1.947-.23 8.143 8.143 0 0 1 1.941.22z">

								</path>
							</svg>
							潜力好问
						</div>

					</a>
					<a href="#">
						<div>
							<svg class="Zi Zi--New QuestionType-icon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18">
								<path d="M3.111 2.667H20.89c.614 0 1.111.497 1.111 1.11v14.091c0 .45-.272.857-.689 1.028l-8.73 3.585c-.462.19-.98.187-1.441-.007L2.679 18.9A1.111 1.111 0 0 1 2 17.876V3.778c0-.614.497-1.111 1.111-1.111zm2.503 10.75v-2.753h.064l2.024 2.753h.977V8.573H7.51v2.725h-.064L5.429 8.573h-.983v4.844h1.168zm7.526-.99h-2.088v-.99h1.964v-.907h-1.964v-.967h2.088v-.99H9.82v4.844h3.32v-.99zm3.992-1.978h.06l.809 2.968h1.155l1.265-4.844h-1.269l-.634 3.212h-.06l-.803-3.212h-.987l-.775 3.212h-.06l-.645-3.212h-1.28l1.266 4.844h1.162l.796-2.968z" fill-rule="evenodd">

								</path>
							</svg>
							新问题
						</div>

					</a>
					<a href="#">
						<div>
							<svg class="Zi Zi--Creator QuestionType-icon" fill="currentColor" viewBox="0 0 24 24" width="18" height="18">
								<path d="M15.075 15.388l-3.024 3.024a4.041 4.041 0 0 0-1.014 1.697l-.26.868C7.844 20.986 4.91 21 2 21c.026-3.325 0-3.304.59-3.956 1.237-1.368 6.251-.68 6.44-2.976.043-.518-.36-1.06-.725-1.69C6.285 8.87 5.512 2 11.5 2c5.988 0 5.15 7.072 3.246 10.378-.357.62-.795 1.217-.724 1.77.073.571.477.958 1.053 1.24zm5.402 1.672c.523.55.523.646.523 3.94a535.11 535.11 0 0 0-4.434-.028l3.911-3.912zm-7.88 2.699c.111-.37.312-.705.584-.978l4.76-4.76a.291.291 0 0 1 .412 0l1.626 1.626a.291.291 0 0 1 0 .411l-4.76 4.76c-.272.273-.608.474-.978.585l-1.96.588a.219.219 0 0 1-.272-.272l.589-1.96zm9.157-6.742a.839.839 0 0 1 0 1.187l-.94.94a.28.28 0 0 1-.395 0l-1.563-1.563a.28.28 0 0 1 0-.395l.94-.94a.839.839 0 0 1 1.187 0l.771.771z" fill-rule="evenodd">

								</path>
							</svg>
							人人答
						</div>
					</a>
				</div>

			</div>
			<div id="bigDiv">

				<c:forEach var="qtw" items="${qtwLt }">
					<div class="QuestionItem">
						<div class="QuestionItem-head">
							<img class="QuestionItem-head--icon" src="images/Question/v2-1849ec14093682aa571ffdaa2a52e2e4_1440w.png" alt="">
							<div class="QuestionItem-head--reason">
								最近 ${qtw.browseNum }人看过
							</div>
						</div>
						<div class="QuestionItem-title">
							<a href="question?questionId=${qtw.id }">
									${qtw.questionTitle }
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
                                                ${qtw.followNum } 关注
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
				</c:forEach>


				<!-- <div class="QuestionItem">
                    <div class="QuestionItem-head">
                        <img class="QuestionItem-head--icon" src="images/Question/v2-1849ec14093682aa571ffdaa2a52e2e4_1440w.png" alt="">
                        <div class="QuestionItem-head--reason">
                            最近 1.7 万人看过
                        </div>
                    </div>
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
                    <div class="QuestionItem-head">
                        <img class="QuestionItem-head--icon" src="images/Question/v2-1849ec14093682aa571ffdaa2a52e2e4_1440w.png" alt="">
                        <div class="QuestionItem-head--reason">
                            最近 1.7 万人看过
                        </div>
                    </div>
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
                    <div class="QuestionItem-head">
                        <img class="QuestionItem-head--icon" src="images/Question/v2-1849ec14093682aa571ffdaa2a52e2e4_1440w.png" alt="">
                        <div class="QuestionItem-head--reason">
                            最近 1.7 万人看过
                        </div>
                    </div>
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
                    <div class="QuestionItem-head">
                        <img class="QuestionItem-head--icon" src="images/Question/v2-1849ec14093682aa571ffdaa2a52e2e4_1440w.png" alt="">
                        <div class="QuestionItem-head--reason">
                            最近 1.7 万人看过
                        </div>
                    </div>
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
                    <div class="QuestionItem-head">
                        <img class="QuestionItem-head--icon" src="images/Question/v2-1849ec14093682aa571ffdaa2a52e2e4_1440w.png" alt="">
                        <div class="QuestionItem-head--reason">
                            最近 1.7 万人看过
                        </div>
                    </div>
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
                    <div class="QuestionItem-head">
                        <img class="QuestionItem-head--icon" src="images/Question/v2-1849ec14093682aa571ffdaa2a52e2e4_1440w.png" alt="">
                        <div class="QuestionItem-head--reason">
                            最近 1.7 万人看过
                        </div>
                    </div>
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
                    <div class="QuestionItem-head">
                        <img class="QuestionItem-head--icon" src="images/Question/v2-1849ec14093682aa571ffdaa2a52e2e4_1440w.png" alt="">
                        <div class="QuestionItem-head--reason">
                            最近 1.7 万人看过
                        </div>
                    </div>
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
                    <div class="QuestionItem-head">
                        <img class="QuestionItem-head--icon" src="images/Question/v2-1849ec14093682aa571ffdaa2a52e2e4_1440w.png" alt="">
                        <div class="QuestionItem-head--reason">
                            最近 1.7 万人看过
                        </div>
                    </div>
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
                    <div class="QuestionItem-head">
                        <img class="QuestionItem-head--icon" src="images/Question/v2-1849ec14093682aa571ffdaa2a52e2e4_1440w.png" alt="">
                        <div class="QuestionItem-head--reason">
                            最近 1.7 万人看过
                        </div>
                    </div>
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
                </div> -->


			</div>
		</div>
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
</main>

<script src="Scripts/jquery-3.5.1.min.js"></script>
<script src="Scripts/Header-Head.js"></script>
<script src="Scripts/SideBar.js"></script>


<script src="Scripts/questionWaiting.js"></script>
</body>
</html>
