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

	<title>知乎·${cnList.columnTItle }</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<meta charset="UTF-8">
	<title>专栏</title>
	<link rel="icon" href="images/favicon.ico">
	<link href="css/Header-Head.css" rel="stylesheet" type="text/css">
	<link type="text/css" href="css/zhuanlanCon.css" rel="stylesheet"/>
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
		<a href="/zhihuIDEA_war_exploded/">
			<svg viewBox="0 0 200 91" fill="#0084FF" width="64" height="30">
				<path d="M53.29 80.035l7.32.002 2.41 8.24 13.128-8.24h15.477v-67.98H53.29v67.978zm7.79-60.598h22.756v53.22h-8.73l-8.718 5.473-1.587-5.46-3.72-.012v-53.22zM46.818 43.162h-16.35c.545-8.467.687-16.12.687-22.955h15.987s.615-7.05-2.68-6.97H16.807c1.09-4.1 2.46-8.332 4.1-12.708 0 0-7.523 0-10.085 6.74-1.06 2.78-4.128 13.48-9.592 24.41 1.84-.2 7.927-.37 11.512-6.94.66-1.84.785-2.08 1.605-4.54h9.02c0 3.28-.374 20.9-.526 22.95H6.51c-3.67 0-4.863 7.38-4.863 7.38H22.14C20.765 66.11 13.385 79.24 0 89.62c6.403 1.828 12.784-.29 15.937-3.094 0 0 7.182-6.53 11.12-21.64L43.92 85.18s2.473-8.402-.388-12.496c-2.37-2.788-8.768-10.33-11.496-13.064l-4.57 3.627c1.363-4.368 2.183-8.61 2.46-12.71H49.19s-.027-7.38-2.372-7.38zm128.752-.502c6.51-8.013 14.054-18.302 14.054-18.302s-5.827-4.625-8.556-1.27c-1.874 2.548-11.51 15.063-11.51 15.063l6.012 4.51zm-46.903-18.462c-2.814-2.577-8.096.667-8.096.667s12.35 17.2 12.85 17.953l6.08-4.29s-8.02-11.752-10.83-14.33zM199.99 46.5c-6.18 0-40.908.292-40.953.292v-31.56c1.503 0 3.882-.124 7.14-.376 12.773-.753 21.914-1.25 27.427-1.504 0 0 3.817-8.496-.185-10.45-.96-.37-7.24 1.43-7.24 1.43s-51.63 5.153-72.61 5.64c.5 2.756 2.38 5.336 4.93 6.11 4.16 1.087 7.09.53 15.36.277 7.76-.5 13.65-.76 17.66-.76v31.19h-41.71s.88 6.97 7.97 7.14h33.73v22.16c0 4.364-3.498 6.87-7.65 6.6-4.4.034-8.15-.36-13.027-.566.623 1.24 1.977 4.496 6.035 6.824 3.087 1.502 5.054 2.053 8.13 2.053 9.237 0 14.27-5.4 14.027-14.16V53.93h38.235c3.026 0 2.72-7.432 2.72-7.432z" fill-rule="evenodd">
				</path>
			</svg>
		</a>
		<ul class="tabs">
			<li class="Tabs-item">
				<a href="/zhihuIDEA_war_exploded/" class="Tabs-link is-active">首页</a>
			</li>
			<li class="Tabs-item">
				<a href="html/explore.jsp" class="Tabs-link">发现</a>
			</li>
			<li class="Tabs-item">
				<a href="question?a=AllQuestion" class="Tabs-link">等你来答</a>
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
				<button data-usero-id="<%=uId%>" class="button">
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
						<a href="javaScript:void(0)" class="TopstoryTabs-link is-active">推荐</a>
						<%--<a href="javaScript:void(0)" class="TopstoryTabs-link">关注</a>
                        <a href="javaScript:void(0)" class="TopstoryTabs-link">热榜</a>--%>
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
	<header>
		<div class="firstDiv" data-zl-id="${cnList.id }">

			<h1 style="width:550px;line-height: 0px; font-size:22px; ">${cnList.columnTItle }</h1>
			<p class="titleP" style="width:550px;">${cnList.columnSlogan }</p>

			<p><a href="#">${cnList.followNum }关注</a></p>

			<div>
				<div>关注专栏</div>
				<div>投稿</div>

				<img src="images/zhuanlan/${cnList.columnLOGO }" />
				<span>
								<svg class="Zi Zi--Report" fill="currentColor" viewBox="0 0 24 24" width="14" height="14">
									<path d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z" fill-rule="evenodd">

									</path>
								</svg>举报
							</span>
			</div>



			<!-- <h1>网聚创业</h1>
            <p class="titleP">互联网科技创业资讯，分享不同的观点！</p>
            <p><a href="#">玉成、清沫 · 关于专栏</a></p>
            <p><a href="#">6,896关注</a></p>

            <div>
                <div>关注专栏</div>
                <div>投稿</div>

                <img src="images/zhuanlan/zhuanlanCon/20.jpg" />
                <span>
                    <svg class="Zi Zi--Report" fill="currentColor" viewBox="0 0 24 24" width="14" height="14">
                        <path d="M19.947 3.129c-.633.136-3.927.639-5.697.385-3.133-.45-4.776-2.54-9.949-.888-.997.413-1.277 1.038-1.277 2.019L3 20.808c0 .3.101.54.304.718a.97.97 0 0 0 .73.304c.275 0 .519-.102.73-.304.202-.179.304-.418.304-.718v-6.58c4.533-1.235 8.047.668 8.562.864 2.343.893 5.542.008 6.774-.657.397-.178.596-.474.596-.887V3.964c0-.599-.42-.972-1.053-.835z" fill-rule="evenodd">

                        </path>
                    </svg>举报
                </span>
            </div> -->
		</div>
	</header>
	<section>
		<h4>最新文章</h4>
		<div class="BigDiv" data-zl-id="${cnList.id }" >
			<c:forEach var="zlwz" items="cnList">

			</c:forEach>
			<!-- <h4>美国驻成都总领事馆现场放鞭炮群众欢乐多</h4>
            <div class="oneDiv">
                <img src="images/zhuanlan/zhuanlanCon/21.jpg" />
                <span>玉成</span>
                 prepend() append()  before() after()
                <svg viewBox="0 0 24 24" class="css-1ifz0go" width="18" height="18">
                    <svg viewBox="0 0 24 24" x="-3" y="-3" fill="#FFFFFF" width="30" height="30">
                    <path d="M3.56231227,13.8535307 C2.40051305,12.768677 2.41398885,11.0669203 3.59484487,9.99979213 L3.59222085,9.99654885 C4.26730143,9.45036719 4.79446755,8.21005186 4.7184197,7.34453784 L4.72305873,7.34412719 C4.66942824,5.75539997 5.8824188,4.56066914 7.47188965,4.64242381 L7.47229112,4.6386236 C8.33515314,4.72977993 9.58467253,4.22534048 10.1426329,3.55925173 L10.1462611,3.56228565 C11.2316055,2.40008701 12.9353108,2.41394456 14.0015072,3.59634088 L14.0047263,3.59374004 C14.5498229,4.26841874 15.7896857,4.79521622 16.6545744,4.71844347 L16.6549836,4.72304294 C18.245027,4.66894057 19.4396947,5.88213996 19.3575031,7.47241135 L19.3623099,7.47292747 C19.2704388,8.3358681 19.7742711,9.58421483 20.4407199,10.1424506 L20.437686,10.1460789 C21.5997217,11.2312209 21.5860695,12.9345218 20.4042441,14.0007396 L20.4072865,14.0045125 C19.7325967,14.5495925 19.2055209,15.7896954 19.2815865,16.6561959 L19.2770449,16.6565978 C19.3315454,18.2453037 18.1173775,19.4393568 16.5274188,19.3571512 L16.5269029,19.3619539 C15.6647098,19.270083 14.415408,19.7741709 13.8573671,20.4403558 L13.8537409,20.4373235 C12.76842,21.5995708 11.0650432,21.5864553 9.99899434,20.4039226 L9.99527367,20.406923 C9.45025436,19.7323399 8.21017638,19.2051872 7.34461983,19.2812352 L7.344304,19.2776405 C5.75448683,19.3312904 4.55977145,18.1170085 4.64254978,16.527117 L4.63769921,16.5265942 C4.72957031,15.6644394 4.22547659,14.4151814 3.55928015,13.8571569 L3.56231227,13.8535307 Z">

                    </path>
                    </svg>
                    <path d="M2.63951518,13.3895441 C3.70763333,14.2842292 4.44777637,16.1226061 4.30075305,17.5023312 L4.32211542,17.3063047 C4.17509209,18.6910561 5.17786655,19.7063729 6.5613937,19.5844846 L6.364106,19.6008202 C7.75140298,19.4789319 9.57474349,20.2554985 10.4468305,21.3349009 L10.3224262,21.1803415 C11.1982831,22.2647703 12.6257916,22.2723098 13.5167278,21.2079863 L13.3898102,21.3600325 C14.2845162,20.2919393 16.1229361,19.5518136 17.5026934,19.6988334 L17.3054057,19.6774716 C18.6914461,19.8244915 19.7067866,18.8217404 19.5836389,17.4395022 L19.6012314,17.6367853 C19.4793403,16.2482641 20.255925,14.4249662 21.3353526,13.5528995 L21.1807897,13.677301 C22.2639871,12.8014646 22.2727834,11.3739894 21.2084351,10.483074 L21.3604848,10.6099886 C20.2923667,9.71530351 19.5522236,7.87818322 19.6992469,6.49720154 L19.6778846,6.69448464 C19.8249079,5.30847665 18.8221335,4.2944164 17.4386063,4.41630468 L17.635894,4.39871256 C16.248597,4.52185742 14.4252565,3.74529084 13.5531695,2.66588842 L13.6775738,2.81919121 C12.8017169,1.73601905 11.3742084,1.72722299 10.4832722,2.79154644 L10.6101898,2.63950024 C9.71548377,3.70759343 7.87706394,4.44771919 6.49730661,4.30195588 L6.69459432,4.32206116 C5.30855394,4.17504128 4.29447,5.17904888 4.41636114,6.56128713 L4.3987686,6.36400404 C4.52065973,7.75126861 3.74407501,9.57456653 2.66464737,10.4478898 L2.81921035,10.3222318 C1.73601288,11.1993248 1.72721662,12.6255433 2.79156494,13.5164587 L2.63951518,13.3895441 Z" fill="#0084FF">

                    </path>
                    <svg class="Zi Zi--Check" fill="#fff" x="6" y="6" viewBox="0 0 24 24" width="12" height="12">
                        <path d="M10.229 17.516c-.318.327-.75.484-1.199.484-.453 0-.884-.16-1.202-.488l-4.335-4.47a1.77 1.77 0 0 1 .007-2.459 1.663 1.663 0 0 1 2.397.01l3.137 3.246 9.072-9.329a1.662 1.662 0 0 1 2.397 0c.663.681.663 1.786 0 2.466L10.23 17.516z" fill-rule="evenodd">

                        </path>
                    </svg>
                </svg>
                <span>2 天前</span>
                <p>
                    中国关闭美国驻成都总领事馆；在美国单方面挑起争端，要求中方关闭驻休斯顿总领事馆之后，中方做出
                    了外交上的对等反应，通知美方关闭美国驻成都总领事馆。
                    不过，刚刚最新消息：美国驻成都总领事馆门口的最新情况，
                    相当的欢乐喜庆。以高规格鞭炮欢送美国驻成都总领事馆回国，哈哈。

                    废话不多说，来个视频先，有多个网友拍摄视频放到了网上：
                </p>
                <div class="fiveDiv">
                    <button type="button" class="b01 bt--button01">
                        <svg class="Zi Zi--TriangleUp VoteButton-TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10">
                            <path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd">

                            </path>
                        </svg>
                        赞同 67
                    </button>
                    <button type="button" class="b01 bt--button01 bt--Button02">
                        <svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="10" height="10">
                            <path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd">

                            </path>
                        </svg>
                    </button>
                    <button type="button" class="bt--button01 bt-Button03 span_button">
                        <svg class="Zi Zi--Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em">
                            <path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd">

                            </path>
                        </svg>
                        <span>24 条评论

                        </span>
                    </button>
                    <button type="button" class="bt--button01 bt-Button03">
                        <svg class="Zi Zi--Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em">
                            <path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd">

                            </path>
                        </svg>
                        分享
                    </button>
                    <button type="button" class="bt--button01 bt-Button03">
                        <svg class="Zi Zi--Star Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em">
                            <path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd">

                            </path>
                        </svg>
                        收藏
                    </button>
                    <button type="button" class="bt--button01 bt-Button03">
                        <svg class="Zi Zi--Heart Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em">
                            <path d="M2 8.437C2 5.505 4.294 3.094 7.207 3 9.243 3 11.092 4.19 12 6c.823-1.758 2.649-3 4.651-3C19.545 3 22 5.507 22 8.432 22 16.24 13.842 21 12 21 10.158 21 2 16.24 2 8.437z" fill-rule="evenodd">

                            </path>
                        </svg>
                        喜欢
                    </button>

                </div>
            </div>-->
		</div>

	</section>
</div>
<script src="Scripts/jquery-3.5.1.min.js"></script>
<script src="Scripts/zhuanlanCon.js"></script>
<script src="Scripts/Header-Head.js"></script>
<script type="text/javascript">

	//专栏作者
	$.ajax({
		url:"<%=path%>/ColumnBy",
		type:"post",
		data:{"zlId":$(".firstDiv").attr("data-zl-id"),"p":"ColumnAuthor"},
		dataType:"json",
		success:function(result){

			$.each(result,function(i,obj){

				var item = $('<p><a href="#">'+obj.name +' · 关于专栏</a></p>');
				$(".titleP").after(item);
			})
		},
		error:function(){
			alert("服务器异常！");
		}
	})


	//专栏文章
	$.ajax({
		url:"<%=path%>/ColumnBy",
		type:"post",
		data:{"zlId":$(".BigDiv").attr("data-zl-id"),"p":"ColumnP"},
		dataType:"json"	,
		success:function(result){

			console.log(result);

			$.each(result,function(i,obj){
				$(".BigDiv").html(" ");
				$.each(obj.pList,function(i,objp){

					var item = $('<h4 data-Author-id="'+objp.id+'">'+objp.pTitle+'</h4>\n'+
							'<span>2 天前</span>\n'+
							'<p style="line-height:30px;">\n'+
							''+objp.pContent+'\n'+
							'</p>\n'+
							'<div class="fiveDiv">\n'+
							'<button type="button" class="b01 bt--button01">\n'+
							'<svg class="Zi Zi--TriangleUp VoteButton-TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10">\n'+
							'<path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd">\n'+

							'</path>\n'+
							'</svg>\n'+
							'赞同'+objp.approveNum+'\n'+
							'</button>\n'+
							'<button type="button" class="b01 bt--button01 bt--Button02">\n'+
							'<svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="10" height="10">\n'+
							'<path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd">\n'+

							'</path>\n'+
							'</svg>\n'+
							'</button>\n'+
							'<button type="button" class="bt--button01 bt-Button03 span_button">\n'+
							'<svg class="Zi Zi--Comment Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em">\n'+
							'<path d="M10.241 19.313a.97.97 0 0 0-.77.2 7.908 7.908 0 0 1-3.772 1.482.409.409 0 0 1-.38-.637 5.825 5.825 0 0 0 1.11-2.237.605.605 0 0 0-.227-.59A7.935 7.935 0 0 1 3 11.25C3 6.7 7.03 3 12 3s9 3.7 9 8.25-4.373 9.108-10.759 8.063z" fill-rule="evenodd">\n'+

							'</path>\n'+
							'</svg>\n'+
							'<span>24 条评论\n'+

							'</span>\n'+
							'</button>\n'+
							'<button type="button" class="bt--button01 bt-Button03">\n'+
							'<svg class="Zi Zi--Share Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em">\n'+
							'<path d="M2.931 7.89c-1.067.24-1.275 1.669-.318 2.207l5.277 2.908 8.168-4.776c.25-.127.477.198.273.39L9.05 14.66l.927 5.953c.18 1.084 1.593 1.376 2.182.456l9.644-15.242c.584-.892-.212-2.029-1.234-1.796L2.93 7.89z" fill-rule="evenodd">\n'+

							'</path>\n'+
							'</svg>\n'+
							'分享\n'+
							'</button>\n'+
							'<button type="button" class="bt--button01 bt-Button03">\n'+
							'<svg class="Zi Zi--Star Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em">\n'+
							'<path d="M5.515 19.64l.918-5.355-3.89-3.792c-.926-.902-.639-1.784.64-1.97L8.56 7.74l2.404-4.871c.572-1.16 1.5-1.16 2.072 0L15.44 7.74l5.377.782c1.28.186 1.566 1.068.64 1.97l-3.89 3.793.918 5.354c.219 1.274-.532 1.82-1.676 1.218L12 18.33l-4.808 2.528c-1.145.602-1.896.056-1.677-1.218z" fill-rule="evenodd">\n'+

							'</path>\n'+
							'</svg>\n'+
							'收藏\n'+
							'</button>\n'+
							'<button type="button" class="bt--button01 bt-Button03">\n'+
							'<svg class="Zi Zi--Heart Button-zi" fill="currentColor" viewBox="0 0 24 24" width="1.2em" height="1.2em">\n'+
							'<path d="M2 8.437C2 5.505 4.294 3.094 7.207 3 9.243 3 11.092 4.19 12 6c.823-1.758 2.649-3 4.651-3C19.545 3 22 5.507 22 8.432 22 16.24 13.842 21 12 21 10.158 21 2 16.24 2 8.437z" fill-rule="evenodd">\n'+

							'</path>\n'+
							'</svg>\n'+
							'喜欢\n'+
							'</button>\n'+
							'</div>');

					if(obj==null){
						var items = $('<div>暂未发布文章</div>');
						$(".BigDiv").append(items);
					}else{
						$(".BigDiv").append(item);
					}
				})


			})

		},
		error:function(){
			alert("服务器异常！");
		}
	})

	//专栏文章作者
	$.ajax({
		url:"<%=path%>/ColumnBy",
		type:"post",
		data:{"AuthorId":$(".BigDiv>h4").attr("data-Author-id"),"p":"ColumnPAuthor"},
		dataType:"json",
		success:function(result){
			$.each(result,function(i,obj){
				var item = $('<img src="images/zhuanlan/zhuanlanCon/'+obj.chatHead+'" />\n'+
						'<span>'+obj.name+'</span>');
				$(".oneDiv").prepend(item);
			})
		},
		error:function(){
			alert("服务器异常！");
		}
	})
</script>
</body>
</html>
