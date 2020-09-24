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

	<meta charset="UTF-8">
	<title>圆桌</title>
	<link rel="icon" href="images/favicon.ico">
	<link rel="stylesheet" href="css/Header-Head.css" type="text/css" />

	<link type="text/css" rel="stylesheet" href="css/round.css"></head>

<body>
<header class="Header">
	<div class="AppHeader">
		<a href="html/Header.html">
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


<div class="AllDiv">
	<div class="leftDiv">
		<div class="firstDiv">
			<div class="oneDiv">
				<img src="images/roundtable/${Allrt.roundtableImg}" />
			</div>
			<div class="twoDiv" data-yz-id="${Allrt.id}">
				<h1>
					${Allrt.roundtableTitle}
				</h1>
				<div>
					<svg class="Zi Zi--Clock css-1v994a0" fill="currentColor" viewBox="0 0 24 24" width="14" height="14">
						<path d="M12.9 11.433v-5.1a.9.9 0 1 0-1.8 0v6a.9.9 0 0 0 .9.9h4.8a.9.9 0 1 0 0-1.8h-3.9zM2.652 8.246a3.3 3.3 0 0 1 4.43-4.851 10.241 10.241 0 0 0-4.43 4.851zm14.266-4.851a3.3 3.3 0 0 1 4.43 4.851 10.241 10.241 0 0 0-4.43-4.851zM12 21.333a9 9 0 1 1 0-18 9 9 0 0 1 0 18z" fill-rule="evenodd">

						</path>
					</svg>​2 天后开始
				</div>
				<p>${Allrt.roundtableIntro}</p>
				<div>
					<span>${Allrt.browseNum} 万浏览 · ${Allrt.followNum} 关注</span>
					<div data-roundtable-id=${Allrt.id }" class="gzTable">关注圆桌</div>
			</div>
		</div>
	</div>

	<div class="erDiv">
		<div>
			<span>精选议题</span>
			<span>最新提问</span>
			<span>我要提问	</span>
		</div>
		<!-- <div class="threeDiv">
            <p>你在闲暇时间做哪些手工？</p>
            <span>1487 万浏览 · 4.3 万人想知道答案</span>
            <div>
                <svg class="Zi Zi--PlusOneBubble css-15ro776" fill="currentColor" viewBox="0 0 24 24" width="20" height="20">
                    <path d="M11.158 18a.341.341 0 0 1-.067.08L8.68 20.22l-.014.012a.595.595 0 0 1-.84-.077l-.748-2.11A.348.348 0 0 1 7.046 18H6.5a3 3 0 0 1-3-3V8a3 3 0 0 1 3-3h11a3 3 0 0 1 3 3v7a3 3 0 0 1-3 3h-6.342zm-.533-5.782h2.031v-1.084h-2.031V9H9.526v2.134H7.5v1.084h2.026v2.168h1.099v-2.168zM14.799 15H16V8h-1.21L13.5 9.001v1.18l1.3-.988V15z" fill-rule="evenodd">

                    </path>
                </svg>想知道
            </div>
        </div>
        <div class="threeDiv">
            <p>你用过哪些巧妙、简单又有创意的拍照技巧或角度？</p>
            <span>81.5 万浏览 · 1.3 万人想知道答案</span>
            <div>
                <svg class="Zi Zi--PlusOneBubble css-15ro776" fill="currentColor" viewBox="0 0 24 24" width="20" height="20">
                    <path d="M11.158 18a.341.341 0 0 1-.067.08L8.68 20.22l-.014.012a.595.595 0 0 1-.84-.077l-.748-2.11A.348.348 0 0 1 7.046 18H6.5a3 3 0 0 1-3-3V8a3 3 0 0 1 3-3h11a3 3 0 0 1 3 3v7a3 3 0 0 1-3 3h-6.342zm-.533-5.782h2.031v-1.084h-2.031V9H9.526v2.134H7.5v1.084h2.026v2.168h1.099v-2.168zM14.799 15H16V8h-1.21L13.5 9.001v1.18l1.3-.988V15z" fill-rule="evenodd">

                    </path>
                </svg>想知道
            </div>
        </div>
        <div class="threeDiv">
            <p>用烤箱可以做什么好吃简单便宜的美食？</p>
            <span>1001 万浏览 · 6.6 万人想知道答案</span>
            <div>
                <svg class="Zi Zi--PlusOneBubble css-15ro776" fill="currentColor" viewBox="0 0 24 24" width="20" height="20">
                    <path d="M11.158 18a.341.341 0 0 1-.067.08L8.68 20.22l-.014.012a.595.595 0 0 1-.84-.077l-.748-2.11A.348.348 0 0 1 7.046 18H6.5a3 3 0 0 1-3-3V8a3 3 0 0 1 3-3h11a3 3 0 0 1 3 3v7a3 3 0 0 1-3 3h-6.342zm-.533-5.782h2.031v-1.084h-2.031V9H9.526v2.134H7.5v1.084h2.026v2.168h1.099v-2.168zM14.799 15H16V8h-1.21L13.5 9.001v1.18l1.3-.988V15z" fill-rule="evenodd">

                    </path>
                </svg>想知道
            </div>
        </div>
        <div class="threeDiv">
            <p>有哪些「外面卖很贵，在家几块钱搞定」的美食？</p>
            <span>2712 万浏览 · 12.6 万人想知道答案</span>
            <div>
                <svg class="Zi Zi--PlusOneBubble css-15ro776" fill="currentColor" viewBox="0 0 24 24" width="20" height="20">
                    <path d="M11.158 18a.341.341 0 0 1-.067.08L8.68 20.22l-.014.012a.595.595 0 0 1-.84-.077l-.748-2.11A.348.348 0 0 1 7.046 18H6.5a3 3 0 0 1-3-3V8a3 3 0 0 1 3-3h11a3 3 0 0 1 3 3v7a3 3 0 0 1-3 3h-6.342zm-.533-5.782h2.031v-1.084h-2.031V9H9.526v2.134H7.5v1.084h2.026v2.168h1.099v-2.168zM14.799 15H16V8h-1.21L13.5 9.001v1.18l1.3-.988V15z" fill-rule="evenodd">

                    </path>
                </svg>想知道
            </div>
        </div>
        <div class="threeDiv">
            <p>有哪些只有经验丰富的司机才知道的驾驶技巧？</p>
            <span>786 万浏览 · 3.7 万人想知道答案</span>
            <div>
                <svg class="Zi Zi--PlusOneBubble css-15ro776" fill="currentColor" viewBox="0 0 24 24" width="20" height="20">
                    <path d="M11.158 18a.341.341 0 0 1-.067.08L8.68 20.22l-.014.012a.595.595 0 0 1-.84-.077l-.748-2.11A.348.348 0 0 1 7.046 18H6.5a3 3 0 0 1-3-3V8a3 3 0 0 1 3-3h11a3 3 0 0 1 3 3v7a3 3 0 0 1-3 3h-6.342zm-.533-5.782h2.031v-1.084h-2.031V9H9.526v2.134H7.5v1.084h2.026v2.168h1.099v-2.168zM14.799 15H16V8h-1.21L13.5 9.001v1.18l1.3-.988V15z" fill-rule="evenodd">

                    </path>
                </svg>想知道
            </div>
        </div>
        <div class="threeDiv">
            <p>中国传统民间工艺中，有哪些即将要失传的老手艺？</p>
            <span>129 万浏览 · 9985 人想知道答案</span>
            <div>
                <svg class="Zi Zi--PlusOneBubble css-15ro776" fill="currentColor" viewBox="0 0 24 24" width="20" height="20">
                    <path d="M11.158 18a.341.341 0 0 1-.067.08L8.68 20.22l-.014.012a.595.595 0 0 1-.84-.077l-.748-2.11A.348.348 0 0 1 7.046 18H6.5a3 3 0 0 1-3-3V8a3 3 0 0 1 3-3h11a3 3 0 0 1 3 3v7a3 3 0 0 1-3 3h-6.342zm-.533-5.782h2.031v-1.084h-2.031V9H9.526v2.134H7.5v1.084h2.026v2.168h1.099v-2.168zM14.799 15H16V8h-1.21L13.5 9.001v1.18l1.3-.988V15z" fill-rule="evenodd">

                    </path>
                </svg>想知道
            </div>
        </div> -->

	</div>

</div>
<div class="rightDiv">
	<div class="right1">
		<div class="rightI">主办方及主持人</div>
		<div class="rightIn" id="compere">




			<!-- <div class="rightOn">
                <img src="images/round/32.jpg"/>
                <div class="rightOnn">
                    <div>
                        <span>知乎日报</span>
                        <div class="zbfDiv">主办方</div>
                    </div>
                    <div>已认证的官方账号</div>
                </div>
            <div>-->

		</div>
		<div class="lastDiv1">
			<svg class="Zi Zi--Org css-1v994a0" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em">
				<path d="M10.786 8.41a8.938 8.938 0 0 0-3.968-2.528c-.305-1.719.814-3.337 2.442-3.741 1.221-.405 2.646.101 3.46 1.011 1.045 1.38.915 3.64.814 4.348-.102 1.315-1.221 3.034-1.323 3.135-.305-.809-.814-1.517-1.425-2.225zm-2.442 2.832c-1.526.202-3.052 1.01-4.171 2.123-1.12-.404-1.934-1.314-2.137-2.427-.316-2.427 1.526-3.64 2.849-3.842 1.628-.371 2.849.505 4.07 1.415 1.146 1.012 2.035 2.63 2.035 2.73-.916-.202-1.832-.1-2.646 0zm4.986.303c.509-.607.931-1.586 1.12-2.225.318-1.039.61-3.134.203-4.651 1.323-1.011 3.154-1.011 4.477.303 1.235 1.146 1.017 2.933.814 3.438-.663 1.581-1.933 2.326-3.256 2.832-1.221.404-3.256.303-3.358.303zm-2.645 1.011c-.51.607-.916 1.416-1.221 2.326-.407 1.314-.643 3.06-.102 4.55-1.323 1.011-3.256 1.011-4.477-.202-1.198-1.124-1.018-2.932-.814-3.438.599-1.605 1.933-2.326 3.256-2.831.916-.304 3.256-.405 3.358-.405zm9.259-1.82c1.017.404 1.933 1.315 2.035 2.427.233 2.57-1.526 3.64-2.849 3.842-1.526 0-2.85-.505-4.07-1.415-1.018-.81-2.035-2.528-2.035-2.63.916.203 1.831.102 2.645 0 1.628-.404 3.053-1.112 4.274-2.224zm-6.716 4.854c1.065 1.08 2.442 2.022 4.07 2.528.306 1.719-.814 3.235-2.442 3.741-1.22.405-2.645-.101-3.46-1.011-1.1-1.481-1.017-3.54-.915-4.247.102-1.315 1.221-3.034 1.323-3.135.305.708.721 1.44 1.424 2.124z">

				</path>
			</svg>
			<span>圆桌列表</span>
			<a href="<%=path%>/AllRoundTable">查看全部
				<span>
							<svg class="Zi Zi--ArrowRight css-9n3bbc" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em">
								<path d="M9.218 16.78a.737.737 0 0 0 1.052 0l4.512-4.249a.758.758 0 0 0 0-1.063L10.27 7.22a.737.737 0 0 0-1.052 0 .759.759 0 0 0-.001 1.063L13 12l-3.782 3.716a.758.758 0 0 0 0 1.063z" fill-rule="evenodd">

								</path>
							</svg>
						</span>
			</a>
		</div>
	</div>
	<div class="lr">

	</div>
	<div class="right2">
		<div class="rightI">嘉宾</div>
		<div class="rightIn" id="gueste">

			<!-- <div class="rightOn">
                <img src="images/round/33.jpg"/>
                <div class="rightOnn">
                    <div>
                        营养师顾中一

                    </div>
                    <div>清华大学 公共卫生硕士</div>
                </div>
            </div>
            <div class="rightOn">
                <img src="images/round/34.jpg"/>
                <div class="rightOnn">
                    <div>
                        毕导

                    </div>
                    <div>清华大学 化学工程系博士在读</div>
                </div>
            </div>
            <div class="rightOn">
                <img src="images/round/35.jpg"/>
                <div class="rightOnn">
                    <div>
                        添饭小哥哥

                    </div>
                    <div>嘿,吃饭了嘛要不要给你添...</div>
                </div>
            </div> -->
		</div>
	</div>
</div>
</div>
<script type="text/javascript" src="Scripts/jquery-3.5.1.min.js" ></script>
<script type="text/javascript" src="Scripts/Header-Head.js"></script>

<script type="text/javascript" src="Scripts/round.js" ></script>
<script type="text/javascript">
	//圆桌问题
	$.ajax({
		url:"<%=path%>/Roundtable",
		type:"post",
		data:{"yzid":$(".twoDiv").attr("data-yz-id"),"a":"round"},
		dataType:"json"	,
		success:function(result){
			$(".threeDiv").html(" ");
			console.log(result);
			var $qt = $('<div class="threeDiv"></div>');
			$.each(result,function(i,obj){
				$(".threeDiv").html(" ");
				$.each(obj.questionEntitiyList,function(i,objq){
					if(objq!=null){
						var item = $('<p style="line-height:20px"><a href="question?questionId='+ objq.id +'">'+objq.questionTitle+'</a></p>\n'+
								'<span>'+objq.browseNum+' 万浏览 · '+objq.followNum+' 人关注</span>\n'+
								'<div data-roundtable-id='+objq.id+'>\n'+
								'<svg class="Zi Zi--PlusOneBubble css-15ro776" fill="currentColor" viewBox="0 0 24 24" width="20" height="20">\n'+
								'<path d="M11.158 18a.341.341 0 0 1-.067.08L8.68 20.22l-.014.012a.595.595 0 0 1-.84-.077l-.748-2.11A.348.348 0 0 1 7.046 18H6.5a3 3 0 0 1-3-3V8a3 3 0 0 1 3-3h11a3 3 0 0 1 3 3v7a3 3 0 0 1-3 3h-6.342zm-.533-5.782h2.031v-1.084h-2.031V9H9.526v2.134H7.5v1.084h2.026v2.168h1.099v-2.168zM14.799 15H16V8h-1.21L13.5 9.001v1.18l1.3-.988V15z" fill-rule="evenodd">\n'+

								'</path>\n'+
								'</svg>关注\n'+
								'</div>');
						$qt.append(item);
						$(".erDiv").append($qt);
					}
				})
			})

		},
		error:function(){
			alert("服务器异常！");
		}
	})


	//主办方
	$.ajax({
		url:"<%=path%>/RoundCompere",
		type:"post",
		data:{"yzid":$(".twoDiv").attr("data-yz-id"),"b":"compere"},
		dataType:"json"	,
		success:function(result){
			console.log(result);
			var $cp = $('<div class="rightOn"></div>');
			$.each(result,function(i,obj){
				if(obj!=null){
					var item = $('<div>\n'+
							'<img src="images/touxiang/'+obj.chatHead+'"/>\n'+
							'<span class="rightOnn">\n'+
							'<div">\n'+
							'<span>'+obj.name+'</span>\n'+
							'<div class="zbfDiv">主办方</div>\n'+
							'</div>\n'+
							'</span>\n'+
							'</div>');
					$cp.append(item);

				}
			});
			$("#compere").append($cp);
		},
		error:function(){
			alert("服务器异常！");
		}
	})


	//嘉宾
	$.ajax({
		url:"<%=path%>/RoundCompere",
		type:"post",
		data:{"yzid":$(".twoDiv").attr("data-yz-id"),"b":"gueste"},
		dataType:"json"	,
		success:function(result){
			console.log(result);
			var $gt = $('<div class="rightOn"></div>');
			$.each(result,function(i,obj){
				if(obj!=null){
					var item = $('<div>\n'+
							'<img style="margin-top:10px;" src="images/touxiang/'+obj.chatHead+'"/>\n'+
							'<span class="rightOnn">\n'+
							'<span>\n'+
							''+obj.name+'\n'+
							'</span>\n'+

							'</span>\n'+
							'</div>');
					$gt.append(item);

				}
			})
			$("#gueste").append($gt);
		},
		error:function(){
			alert("服务器异常！");
		}
	})


	//根据用户id来查询该用户的个人介绍
	$.ajax({
		url:"<%=path%>/RoundCompere",
		type:"post",
		data:{"yzid":$(".twoDiv").attr("data-yz-id"),"b":"findIntroduce"},
		dataType:"json",
		success:function(result){
			console.log(result);

			$.each(result,function(i,obj){
				if(obj!=null){
					var item = $('<div>'+obj.introduce+'</div>');
					$("#compere .rightOnn").append(item);
				}
			})

		},
		error:function(){
			alert("服务器异常！");
		}
	})
</script>
</body>
</html>
