<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTMLN">
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
	<title>知乎圆桌</title>
	<link rel="icon" href="images/favicon.ico">
	<link href="css/Header-Head.css" rel="stylesheet" type="text/css">

	<link rel="stylesheet" href="css/roundtable.css">
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
								<input type="text" >
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
							<a href="#" class="TopstoryTabs-link is-active">圆桌</a>
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
		<div id="root">
			<div>
				<div class="LoadingBar"></div>
				<div></div>
				<div class="App-main">
					<div class="css-r9mkgf">
						<div class="css-u17etp">
							<div class="css-y9ycxx">圆桌</div>
							<a href="#" class="css-gv0t9a">举办圆桌</a>
						</div>
						<div class="css-g9qnka">
							<a target="_blank" href="#" class="css-lufng4g">

								<img src="images/roundtable/yzp5.jpg" alt="" class="css-lkl3nol"/>
								<div class="zprod5"></div>
								<div class="css-k7kepf">大一起跑线</div>
								<div class="css-uzf21t">该圆桌被浏览594万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz1.jpg" class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">夏季动画大作战</div>
								<div class="css-uzf21t">该圆桌被浏览51,2万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz2.jpg" class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">我要非「常」美</div>
								<div class="css-uzf21t">该圆桌被浏览51,2万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yzp6.png"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">高考志愿到底怎么填？</div>
								<div class="css-uzf21t">该圆桌被浏览3594万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz3.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">学长学姐说|大学疑惑</div>
								<div class="css-uzf21t">该圆桌被浏览2231万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz4.png"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">专升硕留学之路</div>
								<div class="css-uzf21t">该圆桌被浏览8,2万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz5.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">知乎技能研究所</div>
								<div class="css-uzf21t">该圆桌被浏览2亿次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz6.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">皮肤老是出问题怎么办</div>
								<div class="css-uzf21t">该圆桌被浏览1512万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz7.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">非常想问|毕业生求职</div>
								<div class="css-uzf21t">该圆桌被浏览1659万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz8.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">成为「姐姐」的美一步</div>
								<div class="css-uzf21t">该圆桌被浏览3,1亿次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz9.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">蝙蝠侠|黑暗骑士三部曲</div>
								<div class="css-uzf21t">该圆桌被浏览9914万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz10.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">专业博物馆</div>
								<div class="css-uzf21t">该圆桌被浏览8514万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz11.png"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">我有一个朋友</div>
								<div class="css-uzf21t">该圆桌被浏览5亿次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz12.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">中国本土咨询行业的未来</div>
								<div class="css-uzf21t">该圆桌被浏览489万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz13.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">如何从零开始成为漫画家</div>
								<div class="css-uzf21t">该圆桌被浏览1325万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz14.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">和平精英新海岛</div>
								<div class="css-uzf21t">该圆桌被浏览2530万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz15.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">2020高考题预测</div>
								<div class="css-uzf21t">该圆桌被浏览5420万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz16.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">我们这一代文学</div>
								<div class="css-uzf21t">该圆桌被浏览4,9亿次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz17.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">2020LPL夏季赛启幕</div>
								<div class="css-uzf21t">该圆桌被浏览2903万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz18.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">自动驾驶大时代</div>
								<div class="css-uzf21t">该圆桌被浏览951万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz19.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">室内设计那些事儿</div>
								<div class="css-uzf21t">该圆桌被浏览2亿次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz20.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">火影文化复兴</div>
								<div class="css-uzf21t">该圆桌被浏览2615万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yz21.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">地摊经济学</div>
								<div class="css-uzf21t">该圆桌被浏览8461万次</div>
							</a>
							<a target="_blank" href="#" class="css-lufng4g">
								<img src="images/roundtable/yzp8.jpg"class="css-lkl3nol" />
								<div class="zprod5"></div>
								<div class="css-k7kepf">结婚也能数字化？</div>
								<div class="css-uzf21t">该圆桌被浏览4894万次</div>
							</a>
						</div>
					</div>
				</div>
				<div data-zop-usertoken="{&quot;urlToken&quot;:&quot;lick-18-66&quot;}"></div>
				<div class="CornerButtons"></div>
			</div>
		</div>
		
	<script src="Scripts/jquery-3.5.1.min.js"></script>

	<script src="Scripts/Header-Head.js"></script>
	</body>
</html>
