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
	<title>书店</title>
		
	<link rel="stylesheet" href="css/Header-Head.css">
	<link rel="stylesheet" href="css/Header-Topstory.css">

	<link type="text/css" rel="stylesheet" href="css/book.css" />
  </head>
  <body>
		<div class="AllDiv">
			<div class="boxMain">
				<div class="Card BasirInfo">
					<div class="leftDiv">

						<div class="left1">
							<img src="images/book/36.webp" alt=""/>
							<span>电子书</span>
						</div>

						<div class="left2">
							<div class="left2_1">
								<span>摆渡人</span>
								<span>
						<svg xmlns="http://www.w3.org/2000/svg" width="22" height="20" viewBox="0 0 24 20" class="AddToShelf"><title></title>
							<g>
								<path fill="#D8D8D8" fill-rule="evenodd" d="M10.12 15.385H8.3c-.442 0-.8-.383-.8-.855V.855C7.5.383 7.858 0 8.3 0h2.4c.441 0 .8.383.8.855v1.652a.726.726 0 0 1 .176-.077l2.307-.661c.424-.122.878.162 1.014.633l1.097 3.827a7.985 7.985 0 0 0-3.598 1.965L11.5 4.72v4.615A7.964 7.964 0 0 0 10 14c0 .472.04.935.12 1.385zm.43 1.538a7.991 7.991 0 0 0 1.184 2.051H1a1 1 0 0 1-1-1v-.05a1 1 0 0 1 1-1h9.55zM2.3 15.385c-.442 0-.8-.39-.8-.868V4.97c0-.478.358-.867.8-.867h2.4c.441 0 .8.389.8.867v9.547c0 .479-.359.868-.8.868H2.3zM18 20a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm.676-5.236h1.492v-1.181h-1.492V12h-1.188v1.583H16v1.181h1.488v1.615h1.188v-1.615z">

								</path>
							</g>
						</svg>
						<svg width="22" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg" class="QrCode">
							<title></title>
							<g><title>QRcode</title><g fill="none" fill-rule="evenodd">
								<path d="M8 5h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V1a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v4zm5-5h4a1 1 0 0 1 1 1v4a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1V1a1 1 0 0 1 1-1zM1 10h6a1 1 0 0 1 1 1v6a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1v-6a1 1 0 0 1 1-1zm14 5v-2a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v4a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1v-1a1 1 0 0 1 1-1h2zm-4-5h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1v-1a1 1 0 0 1 1-1zm5-3h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1V8a1 1 0 0 1 1-1zM2 2v4h4V2H2zm12 0v2h2V2h-2zM2 12v4h4v-4H2zm1-9h2v2H3V3zm0 10h2v2H3v-2z" fill="#D8D8D8">

							</path>
							</g>
						</svg>
					</span>
							</div>
							<p>克莱儿·麦克福尔 著</p>
							<span>
						<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15">
							<g fill-rule="evenodd">
								<path fill="#ffab2e" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

								</path>
							</g>
						</svg>
						<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15">
							<g fill-rule="evenodd">
								<path fill="#ffab2e" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

								</path>
							</g>
						</svg>
						<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15">
							<g fill-rule="evenodd">
								<path fill="#ffab2e" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

								</path>
							</g>
						</svg>
						<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15"><g fill-rule="evenodd"><path fill="#d7d8d9" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

						</path></g></svg>
						<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15"><g fill-rule="evenodd"><path fill="#d7d8d9" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#d7d8d9" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

						</path></g></svg>
						<span class="sp">452 条评价·12K 人读过</span>
						<div class="flDiv">
							<div>小说</div>
							<div>白马时光出版</div>
							<div>知乎电子书</div>
						</div>
					</span>
							<div class="divLast">
								<span>¥9.99</span>
								<button>试读</button>
								<button>立即购买</button>
							</div>
						</div>
					</div>
					<div class="threeDiv">
				<span>
				<svg class="Zi Zi--Like" fill="currentColor" viewBox="0 0 24 24" width="18" height="18">
					<path d="M2.718 10.024c-.718 0-.718.63-.718.63l.996 9.693c0 .703.718.649.718.649h1.45c.916 0 .847-.649.847-.649v-9.554c-.09-.879-.854-.791-.847-.791l-2.446.022zm11.727-.05s.756-1.577 1.156-4.083c.163-2.861-2.052-3.491-3.037-2.362-1.014 1.233 0 2.057-4.45 5.83C7.336 9.966 7 11.011 7 11.998v6.998c-.016 1.104.491 2 1.99 2h7.586c2.097 0 2.86-1.416 2.86-1.416s2.178-5.402 2.346-5.911c1.047-3.515-1.95-3.703-1.95-3.703l-5.387.007z" fill-rule="evenodd">

					</path>
				</svg>20</span>
						<span>
				<svg class="Zi Zi--Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em">
					<path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd">

					</path>
				</svg>分享</span>

					</div>
				</div>
				<div class="Card">
					<div class="left2Div">
						<ul>
							<li class="is-active">简介</li>
							<li>目录</li>
						</ul>
					</div>
					<div class="contentDiv">
						<p>
							<svg width="15" height="7" viewBox="0 0 9 7" xmlns="http://www.w3.org/2000/svg" class="IconQuote"><title></title><g><g fill="#D8D8D8" fill-rule="evenodd"><path d="M.01 4.647C-.163 2.307 1.912.607 3.512 0l.336.475c-.868.65-1.537 1.81-1.574 2.283C3.314 2.758 4 3.65 4 4.556c0 1.06-.893 1.919-1.995 1.919C.984 6.475.092 5.75.01 4.647zM5.01 4.647C4.837 2.307 6.912.607 8.512 0l.336.475c-.868.65-1.537 1.81-1.574 2.283C8.314 2.758 9 3.65 9 4.556c0 1.06-.893 1.919-1.995 1.919-1.02 0-1.912-.725-1.994-1.828z">

							</path></g>
							</g></svg>
							如果命运是一条孤独的河流，谁会是你灵魂的摆渡人？</p>
						<p>单亲女孩迪伦，15 岁的世界一片狼藉：与母亲总是无话可说，
							在学校里经常受到同学的捉弄，谈得来的好友也因为转学离开了。
							这一切都让迪伦感到无比痛苦。</p>
						<p>她决定去看望久未谋面的父亲，然而，路上突发交通事故。
							等她拼命爬出火车残骸之后，
							却惊恐地发现，自己是的幸存者，而眼前，竟是一片荒原。</p>
						<p>此时，迪伦看到不远处的山坡上一个男孩的身影。</p>
						<div class="showDiv pDiv">
							<p>男孩将她带离了事故现场。
								但是，迪伦很快意识到，男孩并不是偶然出现的路人，他似乎是特意在此等候。</p>
							<p>命运，从他们相遇的那刻开始，发生了无法预料的转变……</p>
						</div>
						<div class="showDiv zDiv">
							<p><strong>作者</strong>克莱儿·麦克福尔</p>
							<p><strong>上架时间</strong>2019-05</p>
							<p><strong>字数</strong>16.5 万字</p>
						</div>
					</div>
					<div class="chaDiv">
						展开全部简介
					</div>
					<div class="hideDiv">
						收起简介
					</div>
				</div>
				<div class="Card pjDiv">
					<div class="leftLastDiv">
						<div class="leftLastDiv-header">
							<h2>评价</h2>
							<a href="#">去往评价列表
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 9 10" class="triangle" width="5"><title></title><g><path d="M0 .978v8.044A.893.893 0 0 0 1 10a1.17 1.17 0 0 0 .47-.118l6.932-3.99a.963.963 0 0 0 0-1.784L1.47.118A1.17 1.17 0 0 0 1 0a.892.892 0 0 0-1 .978z">

								</path></g></svg>
							</a>
						</div>
					</div>
					<div class="pfDiv">
						<div>3.4</div>
						<div>
							<div>
								<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15">
									<g fill-rule="evenodd">
										<path fill="#ffab2e" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

									</path>
									</g>
								</svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15">
									<g fill-rule="evenodd">
										<path fill="#ffab2e" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

									</path>
									</g>
								</svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15">
									<g fill-rule="evenodd">
										<path fill="#ffab2e" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

									</path>
									</g>
								</svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15"><g fill-rule="evenodd"><path fill="#d7d8d9" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

								</path></g></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15"><g fill-rule="evenodd"><path fill="#d7d8d9" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#d7d8d9" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

								</path></g></svg>
								<div class="jDiv"></div>
							</div>
							<div>452 条评价</div>

						</div>
						<div class="plRight">
							<div class="pl">
								<span>好评</span>
								<div class="ProgressBar progressBar" style="height: 5px;">
									<div class="ProgressBar-bar" style="width: 57%;height: 5px;">

									</div>
								</div>

								<span>57%</span>
							</div>
							<div class="pl">
								<span>中评</span>
								<div class="ProgressBar progressBar" style="height: 5px;">
									<div class="ProgressBar-bar" style="width: 26%; height: 5px;">

									</div>
								</div>
								<span>26%</span>
							</div>
							<div class="pl">
								<span>差评</span>
								<div class="ProgressBar progressBar" style="height: 5px;">
									<div class="ProgressBar-bar" style="width: 17%;height: 5px;">

									</div>
								</div>
								<span>17%</span>
							</div>
						</div>
					</div>
					<div class="contentDiv2">
						<div>
							<a href="#"><img src="images/book/36.jpg" alt=""></a>
							<div class="right">
								<div>凌杨熙</div>
								<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 15 15"><g fill-rule="evenodd"><path fill="#ffab2e" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

								</path></g></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 15 15"><g fill-rule="evenodd"><path fill="#ffab2e" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

								</path></g></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 15 15"><g fill-rule="evenodd"><path fill="#ffab2e" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

								</path></g></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 15 15"><g fill-rule="evenodd"><path fill="#ffab2e" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

								</path></g></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 15 15"><g fill-rule="evenodd"><path fill="#ffab2e" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

								</path></g></svg>
							</div>
							<div class="pDiv content1Div">
								<!--<p>-->
								我刚刚打了一大段，结果误按，全没了，重打…… 这本书很棒，
								不像某些评论所说的。当初是学校强制要求的，不过我看了一半，
								觉得非常好看！ 男主崔斯坦是灵魂的引路者，没有人真正的在意过他，
								没有人为他着想过。但女主迪伦是生活在一个没有爱的环境里，
								当她遇见灵魂的引路人崔斯坦时，她真真实实的为崔斯坦付出了许多
								<span class="s">...
								<span>展开</span>
							</span>
								<!--<span class="show">
                                    ，并愿意为了崔斯坦，跳出舒适圈，重新经历荆棘，只为将崔斯坦带回人间。
                                     “如果我真的存在，只是因为你需要我”出自摆渡人这本书。
                                     我文笔不好，但我觉得，摆渡人真的很有意义。看完后，心里很暖，
                                     希望大家花时间去阅读。摆渡人获得了多项世界文学大奖，版权售至33个国家。
                                      我无法很好的描述这本书有多么的有意义，
                                    我只能说“值得你去看” （以上仅个人观点，我打了两次，哭了）
                                </span>-->
								<!--</p>-->

							</div>
							<div class="laDiv">
								2019-08-26 11:07
							</div>
						</div>
						<div>
							<a href="#"><img src="images/book/37.jpg" alt=""></a>
							<div class="right">
								<div>blue鲸鱼</div>
								<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 15 15"><g fill-rule="evenodd"><path fill="#ffab2e" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

								</path></g></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 15 15"><g fill-rule="evenodd"><path fill="#ffab2e" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

								</path></g></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 15 15"><g fill-rule="evenodd"><path fill="#ffab2e" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

								</path></g></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 15 15"><g fill-rule="evenodd"><path fill="#ffab2e" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#ffab2e" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

								</path></g></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 15 15"><g fill-rule="evenodd"><path fill="#d7d8d9" d="M10.925 14.302c.173.13.408.13.58-.002.174-.13.244-.362.175-.572l-1.323-4.296 3.435-2.456c.175-.13.25-.36.185-.572-.064-.212-.253-.357-.468-.36H9.275L7.96 1.754c-.064-.21-.21-.354-.46-.354-.14 0-1.027 3.53-.988 6.32.04 2.788.98 3.85.98 3.85l3.433 2.732z"></path><path fill="#d7d8d9" d="M7.5 1.4c-.25 0-.41.144-.474.354l-1.318 4.29H1.49c-.214.003-.403.148-.467.36-.065.212.01.442.185.572l3.42 2.463-1.307 4.286c-.066.21.004.44.176.572.172.13.407.132.58.003l3.42-2.734L7.5 1.4z">

								</path></g></svg>
							</div>
							<div class="pDiv ">
								<!--<p>-->
								依稀记得书中的一句话“如果我真的存在，那也是因为你需要我。”
								迪伦与崔斯坦之间的爱情是多么神圣而又伟大啊！崔斯坦作为迪伦
								的灵魂摆渡人，一路上克服各种艰难险阻，像是成为彼此的依靠，
								也在冥冥之中产生了感情……人生在世，有时阳光明媚有时乌云密布
								，这一路也会有各种魔鬼出没：嫉妒、悲伤、失意…试图把我们拉入

								<span class="s">...
							<span>展开</span>
						</span>
								<!--<span class="show">
                                    深渊。最后，如果你身边有幸有一个这样的一个“崔斯坦”，请一定不要因为“自救”而放手！
                                </span>-->
								<!--</p>-->

							</div>
							<div class="laDiv">
								2019-08-12 08:28
							</div>
						</div>
					</div>
				</div>
				<div class="Card">
					<div class="leftLastDiv">
						<h4>相关书籍</h4>
					</div>
					<div class="ulDiv">
						<a class="PubBook-RelativeListItem" href="javascript:void(0)">
							<div class="PubBook-RelativeListItem--image"><img src="images/book/38.webp" alt=""/></div>
							<div class="PubBook-RelativeListItem--info">
								<div class="PubBook-RelativeListItem-title">摆渡人 3:无境之爱</div>
								<div class="PubBook-RelativeListItem-authors">克莱儿·麦克福尔</div>
								<div class="PubBook-RelativeListItem-promotion">
									<span class="Yuan-symbol">￥</span>
									9.99
								</div>
							</div>
						</a>
						<a class="PubBook-RelativeListItem" href="javascript:void(0)">
							<div class="PubBook-RelativeListItem--image"><img src="images/book/38.webp" alt=""/></div>
							<div class="PubBook-RelativeListItem--info">
								<div class="PubBook-RelativeListItem-title">摆渡人 3:无境之爱</div>
								<div class="PubBook-RelativeListItem-authors">克莱儿·麦克福尔</div>
								<div class="PubBook-RelativeListItem-promotion">
									<span class="Yuan-symbol">￥</span>
									9.99
								</div>
							</div>
						</a>
						<a class="PubBook-RelativeListItem" href="javascript:void(0)">
							<div class="PubBook-RelativeListItem--image"><img src="images/book/38.webp" alt=""/></div>
							<div class="PubBook-RelativeListItem--info">
								<div class="PubBook-RelativeListItem-title">摆渡人 3:无境之爱</div>
								<div class="PubBook-RelativeListItem-authors">克莱儿·麦克福尔</div>
								<div class="PubBook-RelativeListItem-promotion">
									<span class="Yuan-symbol">￥</span>
									9.99
								</div>
							</div>
						</a>
						<a class="PubBook-RelativeListItem" href="javascript:void(0)">
							<div class="PubBook-RelativeListItem--image"><img src="images/book/38.webp" alt=""/></div>
							<div class="PubBook-RelativeListItem--info">
								<div class="PubBook-RelativeListItem-title">摆渡人 3:无境之爱</div>
								<div class="PubBook-RelativeListItem-authors">克莱儿·麦克福尔</div>
								<div class="PubBook-RelativeListItem-promotion">
									<span class="Yuan-symbol">￥</span>
									9.99
								</div>
							</div>
						</a>
						<a class="PubBook-RelativeListItem" href="javascript:void(0)">
							<div class="PubBook-RelativeListItem--image"><img src="images/book/38.webp" alt=""/></div>
							<div class="PubBook-RelativeListItem--info">
								<div class="PubBook-RelativeListItem-title">摆渡人 3:无境之爱</div>
								<div class="PubBook-RelativeListItem-authors">克莱儿·麦克福尔</div>
								<div class="PubBook-RelativeListItem-promotion">
									<span class="Yuan-symbol">￥</span>
									9.99
								</div>
							</div>
						</a>
						<a class="PubBook-RelativeListItem" href="javascript:void(0)">
							<div class="PubBook-RelativeListItem--image"><img src="images/book/38.webp" alt=""/></div>
							<div class="PubBook-RelativeListItem--info">
								<div class="PubBook-RelativeListItem-title">摆渡人 3:无境之爱</div>
								<div class="PubBook-RelativeListItem-authors">克莱儿·麦克福尔</div>
								<div class="PubBook-RelativeListItem-promotion">
									<span class="Yuan-symbol">￥</span>
									9.99
								</div>
							</div>
						</a>
						<a class="PubBook-RelativeListItem" href="javascript:void(0)">
							<div class="PubBook-RelativeListItem--image"><img src="images/book/38.webp" alt=""/></div>
							<div class="PubBook-RelativeListItem--info">
								<div class="PubBook-RelativeListItem-title">摆渡人 3:无境之爱</div>
								<div class="PubBook-RelativeListItem-authors">克莱儿·麦克福尔</div>
								<div class="PubBook-RelativeListItem-promotion">
									<span class="Yuan-symbol">￥</span>
									9.99
								</div>
							</div>
						</a>
						<a class="PubBook-RelativeListItem" href="javascript:void(0)">
							<div class="PubBook-RelativeListItem--image"><img src="images/book/38.webp" alt=""/></div>
							<div class="PubBook-RelativeListItem--info">
								<div class="PubBook-RelativeListItem-title">摆渡人 3:无境之爱</div>
								<div class="PubBook-RelativeListItem-authors">克莱儿·麦克福尔</div>
								<div class="PubBook-RelativeListItem-promotion">
									<span class="Yuan-symbol">￥</span>
									9.99
								</div>
							</div>
						</a>
						<a class="PubBook-RelativeListItem" href="javascript:void(0)">
							<div class="PubBook-RelativeListItem--image"><img src="images/book/38.webp" alt=""/></div>
							<div class="PubBook-RelativeListItem--info">
								<div class="PubBook-RelativeListItem-title">摆渡人 3:无境之爱</div>
								<div class="PubBook-RelativeListItem-authors">克莱儿·麦克福尔</div>
								<div class="PubBook-RelativeListItem-promotion">
									<span class="Yuan-symbol">￥</span>
									9.99
								</div>
							</div>
						</a>
						<a class="PubBook-RelativeListItem"></a>
						<a class="PubBook-RelativeListItem"></a>
						<a class="PubBook-RelativeListItem"></a>
						<a class="PubBook-RelativeListItem"></a>
						<!--<ul>
                            <li><img src="images/book/37.webp" alt=""/></li>
                            <li>摆渡人 3:无境之爱</li>
                            <li>克莱儿·麦克福尔</li>
                            <li>￥9.99</li>
                        </ul>
                        <ul class="ul1">
                            <li><img src="images/book/38.webp" alt=""/></li>
                            <li>三生三世倾君心（共 3 册）</li>
                            <li>女巫的猫</li>
                            <li>¥59.80</li>

                        </ul>
                        <ul class="ul1">
                            <li><img src="images/book/39.webp" alt=""/></li>
                            <li>夏有乔木雅望天堂 123 合集</li>
                            <li>籽月</li>
                            <li>¥45.99</li>

                        </ul>
                        <ul  class="ul2">
                            <li><img src="images/book/45.webp" alt=""/></li>
                            <li>前任攻略</li>
                            <li>简亦繁</li>
                            <li>￥5.00</li>

                        </ul>
                        <ul  class="ul2">
                            <li><img src="images/book/40.webp" alt=""/></li>
                            <li>罗曼蒂克消亡史</li>
                            <li>程耳</li>
                            <li>￥14.00</li>

                        </ul>
                        <ul>
                            <li><img src="images/book/41.webp" alt=""/></li>
                            <li>改变电影的电影人</li>
                            <li>汤姆·夏利蒂</li>
                            <li>￥12.00</li>

                        </ul>
                        <ul>
                            <li><img src="images/book/42.webp" alt=""/></li>
                            <li>刚好遇见你：从小说到电影</li>
                            <li>尹邦满</li>
                            <li>￥21.00</li>

                        </ul>
                        <ul class="ul1">
                            <li><img src="images/book/43.webp" alt=""/></li>
                            <li>伟大的电影</li>
                            <li>罗杰·伊伯特</li>
                            <li>￥40.80</li>

                        </ul>
                        <ul class="ul1">
                            <li><img src="images/book/44.webp" alt=""/></li>
                            <li>电影管理课</li>
                            <li>[美]汤姆·雷利</li>
                            <li>￥35.40</li>

                        </ul>-->
					</div>
				</div>

			</div>

			<div class="rightDiv">
				<div class="fixedDiv">
					<div class="Card divsvg">
						<div class="divTop">
							<svg width="15" height="38" viewBox="0 0 30 38" xmlns="http://www.w3.org/2000/svg"><title></title><g><title>         tab-book     </title>     <path d="M.937 7.377A1.786 1.786 0 0 0 0 8.95v27.265C0 37.2.8 38 1.786 38h26.428C29.2 38 30 37.2 30 36.214V8.949c0-.987-.8-1.786-1.786-1.786h-1.743v25.393c0 .892-.66 1.648-1.544 1.77L5.185 37.033l15.655-5.248a1.786 1.786 0 0 0 1.219-1.694V1.915A1.786 1.786 0 0 0 19.705.22L2.101 6.123A1.786 1.786 0 0 0 .937 7.377z" fill="currentColor" fill-rule="evenodd">

							</path></g></svg>知乎书店
						</div>
						<div class="hrDiv"></div>
						<div class="divBottom">
							<svg width="15" height="14" viewBox="0 0 14 15" xmlns="http://www.w3.org/2000/svg" class="Icon"><path d="M8.05 3.24V1.086A.574.574 0 0 0 7.49.5H5.81c-.31 0-.56.262-.56.586v10.369c0 .323.25.586.56.586h1.68c.309 0 .56-.263.56-.586V4.678l1.962 6.842c.093.323.409.516.706.431l1.615-.463c.297-.085.463-.417.37-.74l-2.182-7.61c-.092-.323-.409-.516-.706-.431L8.2 3.17a.518.518 0 0 0-.15.07zm-6.44 8.8c-.31 0-.56-.266-.56-.594v-7.54c0-.329.25-.595.56-.595h1.68c.309 0 .56.266.56.594v7.541c0 .328-.251.595-.56.595H1.61zM.7 13.096h12.6a.7.7 0 0 1 .7.7v.005a.7.7 0 0 1-.7.7H.7a.7.7 0 0 1-.7-.7v-.005a.7.7 0 0 1 .7-.7z" fill="currentColor">

							</path></svg>我的书架
						</div>
					</div>
					<div class="Card divsvg divp">
						<h5>作者信息</h5>

						<div class="divBottom divBs">
							<img src="images/book/6.jpg" style="width: 38px; height: 38px;"/>
							<span>克莱儿·麦克福尔</span>
						</div>
					</div>
					<div class="Card">
						<div class="divsvg divp">
							<h5>克莱儿·麦克福尔 的其他作品</h5>

							<a href="#" class="PubBook-RelativeListItem Card-section divImg divBs">
								<img src="images/book/46.webp" style="width: 90px; height: 120px;"/>
								<div>
									<p>摆渡人2：重返荒野</p>
									<p>当我们直面生存、死亡与爱	，哪一个会是你*终的选择？</p>
								</div>
							</a>
							<a href="#" class="PubBook-RelativeListItem Card-section divImg">
								<img src="images/book/37.webp" style="width: 90px; height: 120px;"/>
								<div>
									<p>摆渡人3：无境之爱</p>
									<p>千万畅销心灵治愈小说[摆渡人]系列完结篇</p>
								</div>
							</a>
						</div>




					</div>
					<div class="Card divsvg rightDivLast">
						<div class="firstRight">成为知乎电子书作者</div>
						<div class="backDiv">我要出书</div>
					</div>
					<div class="footDiv">
						刘看山 · 知乎指南 · 知乎协议 · 应用 · 工作 联系我们 &copy; 2020 知乎
					</div>
				</div>
			</div>
		</div>
		
	<script src="Scripts/jquery-3.5.1.min.js"></script>

	<script type="text/javascript" src="Scripts/book.js" ></script>
	</body>
</html>
