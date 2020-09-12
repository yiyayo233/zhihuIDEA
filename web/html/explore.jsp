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

	<meta charset="utf-8" />
	<title>知乎 - 发现</title>
	<link rel="icon" href="images/favicon.ico">
	<link href="css/Header-Head.css" rel="stylesheet" type="text/css">

	<link rel="stylesheet" href="css/explore.css">
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
					<a href="#" class="Tabs-link is-active">发现</a>
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
                        <a href="#" class="TopstoryTabs-link">最新专题</a>
                        <a href="#" class="TopstoryTabs-link">圆桌讨论</a>
                        <a href="#" class="TopstoryTabs-link">热门收藏夹</a>
                        <a href="#" class="TopstoryTabs-link">专栏</a>
						</div>
					</div>
					<div class="TopstoryPageHeader-aside">
						<form action="#">
							<label>
								<input type="text" alt=""  placeholder="搜索你感兴趣的内容...">
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
		<div>
			<!--<div class="nimabi">
				<div class="big-tou">
					<div id="tou">
						<svg class="Zi Zi&#45;&#45;LabelSpecial" fill="currentColor" viewBox="0 0 24 24" width="36" height="36"><path d="M7.667 3.667h11.466a1.2 1.2 0 0 1 1.2 1.2v13.066a2.4 2.4 0 0 1-2.4 2.4H6.467V4.867a1.2 1.2 0 0 1 1.2-1.2zM4.2 9.619h1.689v10.714H5.4a2.4 2.4 0 0 1-2.4-2.4V10.82a1.2 1.2 0 0 1 1.2-1.2zm5.178-2.38a.6.6 0 0 0-.6.6v.585a.6.6 0 0 0 .6.6h8.044a.6.6 0 0 0 .6-.6v-.586a.6.6 0 0 0-.6-.6H9.378zm0 3.57a.6.6 0 0 0-.6.6v.586a.6.6 0 0 0 .6.6h8.044a.6.6 0 0 0 .6-.6v-.585a.6.6 0 0 0-.6-.6H9.378zm0 3.572a.6.6 0 0 0-.6.6v.586a.6.6 0 0 0 .6.6h4.578a.6.6 0 0 0 .6-.6v-.586a.6.6 0 0 0-.6-.6H9.378z" fill-rule="evenodd"></path></svg>
						<span class="yuanzhuo-size">最新专题</span>
					</div>
				</div>
				<div class="big-shenti">
					<div class="big-shenti-one">
						<div>
							<a class="Imgone" rel="noreferrer noopener" target="_blank" rel="noreferrer noopener">
								<img src="images/explore/ztp1.jpg" alt=""/>
							</a>
						</div>
						<div class="text">
							<div class="boder">
								<div class="boder-link">
									<a class="ZhuanTi-size">追剧看番，假期补剧计划</a>
									<div class="Liulan">22小时前更新&nbsp;·&nbsp;4,701,345人浏览</div>
								</div>

								<div class="GuanZhuZhuanTi GuanZhuZhuanTibackc">
									<a class="Zhuantibtn">关注专题</a>
								</div>
							</div>
							<div class="boder-t">
								<div class="ZH">
									<a class="xiaozi">知乎放映厅</a>
									<a class="xiaozi-two">知乎评分8.5，它不恐怖，却让人不敢看第二遍</a>

								</div>
								<div class="ZH-two">
									<a class="xiaozi">大新热剧</a>
									<a class="xiaozi-two">知乎评分9.1,10分钟看懂《隐秘的角落》</a>
								</div>
								<div class="ZH-two">
									<a class="xiaozi">必看经典</a>
									<a class="xiaozi-two">有哪些引发全民热议的[现象级]电视剧？</a>
								</div>
							</div>
						</div>
					</div>
					<div class="big-shenti-one">
						<div>
							<a class="Imgone" rel="noreferrer noopener" target="_blank" rel="noreferrer noopener">
								<img src="images/explore/ztp2.png" alt=""/>
							</a>
						</div>
						<div class="text">
							<div class="boder">
								<div class="boder-link">
									<a class="ZhuanTi-size">再陷破产风波，众泰还有救吗？</a>
									<div class="Liulan">3小时前更新&nbsp;·&nbsp;1,856,345人浏览</div>
								</div>

								<div class="GuanZhuZhuanTi GuanZhuZhuanTibackc">
									<a class="Zhuantibtn">关注专题</a>
								</div>
							</div>
							<div class="boder-t">
								<div class="ZH">
									<a class="xiaozi">众泰汽车还能坚持多久</a>
									<a class="xiaozi-two">网传众泰汽车进入破产倒计时，你怎么看？</a>

								</div>
								<div class="ZH-two">
									<a class="xiaozi">众泰抄袭过哪些车型？</a>
									<a class="xiaozi-two">众泰SR9和保时捷macan是不是就差个车标?</a>
								</div>
								<div class="ZH-two">
									<a class="xiaozi">众泰为何总被吐槽？</a>
									<a class="xiaozi-two">中国是否需要众泰这样的企业？</a>
								</div>
							</div>

						</div>
					</div>
					<div class="big-shenti-one">
						<div>
							<a class="Imgone" rel="noreferrer noopener" target="_blank" rel="noreferrer noopener">
								<img src="images/explore/ztp6.png" alt=""/>
							</a>
						</div>
						<div class="text">
							<div class="boder">
								<div class="boder-link">
									<a class="ZhuanTi-size">夏日摘镜·解锁摘镜新[视]界</a>
									<div class="Liulan">07-10更新&nbsp;·&nbsp;38,645,848人浏览</div>
								</div>

								<div class="GuanZhuZhuanTi GuanZhuZhuanTibackc">
									<a class="Zhuantibtn">关注专题</a>
								</div>
							</div>
							<div class="boder-t">
								<div class="ZH">
									<a class="xiaozi">眼镜人深夜独白</a>
									<a class="xiaozi-two">为什么戴了眼镜我的眼睛变小了？</a>
								</div>
								<div class="ZH-two">
									<a class="xiaozi">被眼镜耽误的颜值们</a>
									<a class="xiaozi-two">摘掉多年的眼镜可以有多惊艳？</a>
								</div>
								<div class="ZH-two">
									<a class="xiaozi">近视手术知多少</a>
									<a class="xiaozi-two">做近视手术后后悔吗？</a>
								</div>
							</div>
						</div>

					</div>
					<div class="big-shenti-one">
						<div>
							<a class="Imgone" rel="noreferrer noopener" target="_blank" rel="noreferrer noopener">
								<img src="images/explore/ztp5.png" alt=""/>
							</a>
						</div>
						<div class="text">
							<div class="boder">
								<div class="boder-link">
									<a class="ZhuanTi-size">2020洪水之下，不寻常的雨天</a>
									<div class="Liulan">21小时前更新&nbsp;·&nbsp;9,959,145人浏览</div>
								</div>

								<div class="GuanZhuZhuanTi GuanZhuZhuanTibackc">
									<a class="Zhuantibtn">关注专题</a>
								</div>
							</div>
							<div class="boder-t">
								<div class="ZH">
									<a class="xiaozi">水患时讯</a>
									<a class="xiaozi-two">翻阳湖水位持续上涨，周边多地打响保卫战</a>
								</div>
								<div class="ZH-two">
									<a class="xiaozi">如何避险？</a>
									<a class="xiaozi-two">如今有哪些对洪水的调控手段能最大限度减小洪灾？</a>
								</div>
								<div class="ZH-two">
									<a class="xiaozi">气象硕源</a>
									<a class="xiaozi-two">为什么中国很多城市一下暴雨就被淹？</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="big-weiba">
					<div>
						<a class="next-one" href="roundtable/roundtable.html" target="_blank">查看更多专题&nbsp;></a>
					</div>
				</div>
			</div>-->
			<div class="caonima">
				<div class="yuanzhuo-tou">
					<svg class="Zi--LabelRoundtable" fill="currentColor" viewBox="0 0 24 24" width="36" height="36">
						<path d="M12 21.333a9.333 9.333 0 1 1 0-18.666 9.333 9.333 0 0 1 0 18.666zm-.66-11.287c.332.385.609.77.775 1.21.055-.054.665-.99.72-1.706.055-.385.126-1.616-.443-2.367-.443-.496-1.219-.77-1.884-.55a1.788 1.788 0 0 0-1.33 2.036c.887.276 1.607.771 2.161 1.377zm-1.33 1.541c.443-.055.941-.11 1.44 0 0-.055-.484-.936-1.108-1.486-.665-.496-1.33-.973-2.216-.771-.72.11-1.723.77-1.55 2.092.11.606.553 1.101 1.162 1.321.61-.605 1.44-1.046 2.272-1.156zm2.714.165c.056 0 1.164.055 1.828-.165.72-.275 1.412-.68 1.773-1.541.11-.276.23-1.248-.443-1.872-.72-.716-1.717-.716-2.438-.165.222.825.063 1.966-.11 2.532-.103.348-.333.88-.61 1.211zm-1.44.55c-.056 0-1.33.056-1.828.221-.72.275-1.447.668-1.773 1.541-.11.276-.21 1.26.443 1.872.665.661 1.718.661 2.438.11-.295-.811-.166-1.761.055-2.477.166-.495.388-.936.665-1.266zm5.041-.99c-.665.605-1.44.99-2.327 1.211-.443.055-.941.11-1.44 0 0 .055.554.991 1.108 1.431.665.496 1.385.771 2.216.771.72-.11 1.678-.692 1.551-2.092-.055-.605-.554-1.101-1.108-1.321zm-3.656 2.642a3.475 3.475 0 0 1-.776-1.156c-.055.055-.665.991-.72 1.707-.055.385-.101 1.506.499 2.312.443.496 1.218.77 1.883.55.887-.275 1.496-1.1 1.33-2.036a5.38 5.38 0 0 1-2.216-1.377z" fill-rule="evenodd"></path>
					</svg>
					<span class="yuanzhuo-size">圆桌讨论</span>
				</div>

				<div class="yuanzhuo-shenti">
					<div class="yuanzhuo-roundtables">
						<div class="yuanzhuo-roundtables-neirong">
							<div class="yuanzhuo-roundtables-neirong-tou" style="background: rgb(36, 179, 164)">
								<div class="yuanzhuo-background">
									<div class="yuanzhuo-p1"></div>
									<div class="yuanzhuo-color" style="background: linear-gradient(to right, rgb(36, 179, 164) 0%, rgba(36, 179, 164, 0) 100%); "></div>
									<div class="yuanzhuo-jing " style="background: linear-gradient(to right, rgba(36, 179, 164, 0.5) 0%, rgba(36, 179, 164, 0) 100%); "></div>
								</div>
								<div class="yuanzhuo-header">
									<a class="yuanzhuo-header-title " target="_blank " rel="noreferrer noopener ">打卡挑战 | 运动达人养成计划</a>
									<a class="yuanzhuo-header-info " target="_blank " rel="noreferrer noopener ">炎炎夏日，@知乎体育 喊你来做运动啦！参与有奖打卡活动，累计打卡 5、10、14 天就有机会获得现金奖励与知乎周边礼品哦~</a>
									<div class="yuanzhuo-header-infoes ">
										<div class="yuanzhuo-header-guests ">
											<span>2位嘉宾参与</span>
										</div>
										<div class="yuanzhuo-header-count ">
											<span>846 人关注</span>
										</div>
									</div>
								</div>
								<div class="yuanzhuo-button ">
									<button class="yuanzhuo-button-color yuanzhuo-button-color-two " >关注圆桌</button>
								</div>
							</div>
							<div class="yuanzhuo-roundtables-neirong-wei ">
								<div class="yuanzhuo-roundtables-neirong-Item ">
									<a class="yuanzhuo-roundtables-Title ">女生坚持健身是怎样的体验？</a>
									<div class="yuanzhuo-roundtables-Counts ">
										<span>16个回答</span>
									</div>
								</div>
								<div class="yuanzhuo-roundtables-neirong-Item ">
									<a class="yuanzhuo-roundtables-Title ">只是每天坚持跑步就能改变一个人吗？</a>
									<div class="yuanzhuo-roundtables-Counts ">
										<span>4546个回答</span>
									</div>
								</div>
								<div class="yuanzhuo-roundtables-neirong-Item ">
									<a class="yuanzhuo-roundtables-Title ">14 天打卡挑战：新手想要健身，有哪些需要注意的地方？</a>
									<div class="yuanzhuo-roundtables-Counts ">
										<span>892个回答</span>
									</div>
								</div>
							</div>
						</div>
						<div class="yuanzhuo-roundtables-neirong ">
							<div class="yuanzhuo-roundtables-neirong-tou " style="background-color: rgb(66, 18, 101); ">
								<div class="yuanzhuo-background ">
									<div class="yuanzhuo-p2 "></div>
									<div class="yuanzhuo-color " style="background: linear-gradient(to right, rgb(66, 18, 101) 0%, rgba(66, 18, 101, 0) 100%); "></div>
									<div class="yuanzhuo-jing " style="background: linear-gradient(to right, rgba(66, 18, 101, 0.5) 0%, rgba(66, 18, 101, 0) 100%); "></div>
								</div>
								<div class="yuanzhuo-header ">
									<a class="yuanzhuo-header-title " target="_blank " rel="noreferrer noopener ">考研人的疑难杂症诊所</a>
									<a class="yuanzhuo-header-info " target="_blank " rel="noreferrer noopener ">现在已经进入 7 月中下旬，考研复习时间已经过半，正在复习考研的小伙伴们，你们还好吗？是否感觉焦虑，烦躁和不安，是否感觉复习进入了迷茫期，好多知识点还是不会，是否在</a>
									<div class="yuanzhuo-header-infoes ">
										<div class="yuanzhuo-header-guests ">
											<span>1位嘉宾参与</span>
										</div>
										<div class="yuanzhuo-header-count ">
											<span>156 人关注</span>
										</div>
									</div>
								</div>
								<div class="yuanzhuo-button ">
									<button class="yuanzhuo-button-color yuanzhuo-button-color-two " >关注圆桌</button>
								</div>
							</div>
							<div class="yuanzhuo-roundtables-neirong-wei ">
								<div class="yuanzhuo-roundtables-neirong-Item ">
									<a class="yuanzhuo-roundtables-Title ">2021年考研（大三），如何规划复习？</a>
									<div class="yuanzhuo-roundtables-Counts ">
										<span>16个回答</span>
									</div>
								</div>
								<div class="yuanzhuo-roundtables-neirong-Item ">
									<a class="yuanzhuo-roundtables-Title ">考研复习怎么安排时间？</a>
									<div class="yuanzhuo-roundtables-Counts ">
										<span>88个回答</span>
									</div>
								</div>
								<div class="yuanzhuo-roundtables-neirong-Item ">
									<a class="yuanzhuo-roundtables-Title ">五个月复习时间考研来得及吗？</a>
									<div class="yuanzhuo-roundtables-Counts ">
										<span>202</span>
									</div>
								</div>
							</div>
						</div>
						<div class="yuanzhuo-roundtables-neirong ">
							<div class="yuanzhuo-roundtables-neirong-tou " style="background-color: rgb(62, 93, 179); ">
								<div class="yuanzhuo-background ">
									<div class="yuanzhuo-p3 "></div>
									<div class="yuanzhuo-color " style="background: linear-gradient(to right, rgb(62, 93, 179) 0%, rgba(62, 93, 179, 0) 100%); "></div>
									<div class="yuanzhuo-jing " style="background: linear-gradient(to right, rgba(62, 93, 179, 0.5) 0%, rgba(62, 93, 179, 0) 100%); "></div>
								</div>
								<div class="yuanzhuo-header ">
									<a class="yuanzhuo-header-title " target="_blank " rel="noreferrer noopener ">现代视觉文化研究计划</a>
									<a class="yuanzhuo-header-info " target="_blank " rel="noreferrer noopener ">经典的动漫作品彷佛是一杯杯醇美的陈酿，让人品味过后还能够回味无穷，这些作品有哪些人们没有注意到的细节，它们的背后又有哪些不为人所知的故事，一起来圆桌分享关于经典动</a>
									<div class="yuanzhuo-header-infoes ">
										<div class="yuanzhuo-header-guests ">
											<span>7位嘉宾参与</span>
										</div>
										<div class="yuanzhuo-header-count ">
											<span>184 人关注</span>
										</div>
									</div>
								</div>
								<div class="yuanzhuo-button ">
									<button class="yuanzhuo-button-color yuanzhuo-button-color-two " >关注圆桌</button>
								</div>
							</div>
							<div class="yuanzhuo-roundtables-neirong-wei ">
								<div class="yuanzhuo-roundtables-neirong-Item ">
									<a class="yuanzhuo-roundtables-Title ">有哪些[吃设定]的作品？</a>
									<div class="yuanzhuo-roundtables-Counts ">
										<span>229个回答</span>
									</div>
								</div>
								<div class="yuanzhuo-roundtables-neirong-Item ">
									<a class="yuanzhuo-roundtables-Title ">《新世纪福音战士》</a>
									<div class="yuanzhuo-roundtables-Counts ">
										<span>225个回答</span>
									</div>
								</div>
								<div class="yuanzhuo-roundtables-neirong-Item ">
									<a class="yuanzhuo-roundtables-Title ">为什么《大闹天宫》《哪吒闹海》等风格的动画现在不拍了？</a>
									<div class="yuanzhuo-roundtables-Counts ">
										<span>89个回答</span>
									</div>
								</div>
							</div>
						</div>
						<div class="yuanzhuo-roundtables-neirong ">
							<div class="yuanzhuo-roundtables-neirong-tou " style="background-color: rgb(16, 26, 102); ">
								<div class="yuanzhuo-background ">
									<div class="yuanzhuo-p4 "></div>
									<div class="yuanzhuo-color " style="background: linear-gradient(to right, rgb(16, 26, 102) 0%, rgba(16, 26, 102, 0) 100%); "></div>
									<div class="yuanzhuo-jing " style="background: linear-gradient(to right, rgba(16, 26, 102, 0.5) 0%, rgba(16, 26, 102, 0) 100%); "></div>
								</div>
								<div class="yuanzhuo-header ">
									<a class="yuanzhuo-header-title " target="_blank " rel="noreferrer noopener ">结婚也能数字化》</a>
									<a class="yuanzhuo-header-info " target="_blank " rel="noreferrer noopener ">7月22日-23日，“金犀奖”全球结婚产业潮流峰会将在浙江省乌镇互联网国际会展中心举办。峰会将以“升级.共创生机”为主题，全面解构结婚产业数字升级、核心竞争力与行业新增长</a>
									<div class="yuanzhuo-header-infoes ">
										<div class="yuanzhuo-header-guests ">
											<span>8位嘉宾参与</span>
										</div>
										<div class="yuanzhuo-header-count ">
											<span>80 人关注</span>
										</div>
									</div>
								</div>
								<div class="yuanzhuo-button ">
									<button class="yuanzhuo-button-color yuanzhuo-button-color-two " >关注圆桌</button>
								</div>
							</div>
							<div class="yuanzhuo-roundtables-neirong-wei ">
								<div class="yuanzhuo-roundtables-neirong-Item ">
									<a class="yuanzhuo-roundtables-Title ">整个人类处于互联网发展的哪个阶段？</a>
									<div class="yuanzhuo-roundtables-Counts ">
										<span>525个回答</span>
									</div>
								</div>
								<div class="yuanzhuo-roundtables-neirong-Item ">
									<a class="yuanzhuo-roundtables-Title ">中国婚纱摄影未来的发展趋势是什么？</a>
									<div class="yuanzhuo-roundtables-Counts ">
										<span>6个回答</span>
									</div>
								</div>
								<div class="yuanzhuo-roundtables-neirong-Item ">
									<a class="yuanzhuo-roundtables-Title ">2020年，为什么大家转行都去做互联网运营</a>
									<div class="yuanzhuo-roundtables-Counts ">
										<span>225个回答</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="big-weiba ">
					<div>
						<a class="next-one " href="roundtable/roundtable.html" target="_blank">查看更多圆桌&nbsp;></a>
					</div>
				</div>
			</div>
			<div class="simazai">
				<div class="zhuanlan-header">
					<svg class="Zi Zi--EditCircle" fill="currentColor" viewBox="0 0 24 24" width="36" height="36"><path d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm4.043-15.524a.745.745 0 0 0-1.053.017l-6.857 7.071 2.237 2.17 6.857-7.071a.743.743 0 0 0-.016-1.052l-1.168-1.135zm-9.028 9.476l-.348 1.381 1.37-.39 1.274-.36-1.973-1.916-.323 1.285z" fill-rule="evenodd"></path></svg>
					<span class="yuanzhuo-size">专栏</span>
				</div>
				<div class="yuanzhuo-shenti">
					<div class="zhuanlan-columns">
						<div class="zhuanlan-columCard">
							<a class="zhuanlan-avatar" target="_blank" rel="noreferrer noopener">
								<img src="images/explore/zlp1.jpg" alt=""/></a>
							<a class="zhuanlan-title" target="_blank">
								TD北美留学进化论
							</a>
							<div class="zhuanlan-count">
								<span>4,079 关注</span>
								<span>1,054 文章</span>
							</div>
							<div class="zhuanlan-intro">投资是毕业事业，坚守规则活着更重要</div>
							<button class="zhuanlan-Buttom">进入专栏</button>
						</div>
						<div class="zhuanlan-columCard">
							<a class="zhuanlan-avatar" target="_blank" rel="noreferrer noopener">
								<img src="images/explore/zlp6.jpg" alt=""/></a>
							</a>
							<a class="zhuanlan-title" target="_blank">
								AIRPHOTO
							</a>
							<div class="zhuanlan-count">
								<span>28,441 关注</span>
								<span>525 文章</span>
							</div>
							<div class="zhuanlan-intro">定义新视觉</div>
							<button class="zhuanlan-Buttom">进入专栏</button>
						</div>
						<div class="zhuanlan-columCard">
							<a class="zhuanlan-avatar" target="_blank" rel="noreferrer noopener">
								<img src="images/explore/zlp4.jpg" alt=""/></a>

							</a>
							<a class="zhuanlan-title" target="_blank">
								电商淘宝视觉营销
							</a>
							<div class="zhuanlan-count">
								<span>11,548 关注</span>
								<span>948 文章</span>
							</div>
							<div class="zhuanlan-intro">产品进入视线--信息传递大脑-产生购买欲望-形成购买</div>
							<button class="zhuanlan-Buttom">进入专栏</button>
						</div>
						<div class="zhuanlan-columCard">
							<a class="zhuanlan-avatar" target="_blank" rel="noreferrer noopener">
								<img src="images/explore/zlp5.jpg" alt=""/></a>

							</a>
							<a class="zhuanlan-title" target="_blank">
								抽屉电影
							</a>
							<div class="zhuanlan-count">
								<span>3,323 关注</span>
								<span>1,848 文章</span>
							</div>
							<div class="zhuanlan-intro">说电影，也说事情</div>
							<button class="zhuanlan-Buttom">进入专栏</button>
						</div>
					</div>
				</div>
				<div class="big-weiba">
					<div>
						<a class="next-one" href="zhuanlan/zhuanlan.html" target="_blank">查看更多专栏&nbsp;></a>
					</div>
				</div>
			</div>
			<div class="jiewei">
				<a> ⁄(⁄ ⁄•⁄●⁄•⁄ ⁄)⁄</a>
				<a>知乎指南</a>
				<a>知乎协议</a>
				<a>应用</a>
				<a>工作</a>
				<a>联系我们</a>
				<span>© 2020知乎</span>
			</div>
		</div>
		
	<script src="Scripts/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="Scripts/Header-Head.js"></script>
	
	<script src="Scripts/explore.js"></script>
</body>
</html>
