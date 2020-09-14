<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2020/9/14
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="<%=path%>/node_modules/react/umd/react.development.js"></script>
    <script src="<%=path%>/node_modules/react-dom/umd/react-dom.development.js"></script>
    <script src="<%=path%>/node_modules/babel-standalone/babel.min.js"></script>

</head>
<body>
<div id="domReact"></div>
<script type="text/babel">
/*    // react列表渲染 map()
    let arre=["吃饭","睡觉","打豆豆"];

    let myDom = arre.map((item,index)=>{    //map方法，渲染数据
        return (<p key={index}>{item}</p>)  //key 值必须加上
    })
    //通过for来渲染
    function name() {
        let newarre=[];
        for (const key in arre) {
            newarre.push(<p key={key}>{arre[key]}</p>);
        }
        return newarre;
    }




    ReactDOM.render(name(),document.getElementById("domReact"));*/

    function myBlockRenderer(contentBlock) {
        const type = contentBlock.getType();
        if (type === 'atomic'){
            return{
                component: MediaComponent,
                editable: false,
                props:{
                    foo: 'bar'
                }
            }
        }
    }

    const blockRenderMap = Immutable.Map({
        'MyCustomBlock':{
            element: 'section',
            wrapper:<MyCustomBlock />
        }
    });

    const extendedBlockRenderMap = Draft.DefaultDraftBlockRenderMap.merge(blockRenderMap);

    let defaultInlineStyle = [
        { el: <span style={{ fontWeight: "bold" }}>B</span>, style: 'BOLD' },
        { el: <span style={{ fontStyle: "italic",color:"#333" }}>I</span>, style: 'ITALIC' },
        { el: <span style={{ textDecoration: "underline" }}>U</span>, style: 'UNDERLINE' },
        { el: <span>H1</span>, style: 'HEADER-TWO'},
    ];

    let customColorStyleMap = {
        'RED': { color: '#e24' },
        'BLUE': { color: '#39f' },
        'ORANGE': { color: '#f93' },
        'GREEN': { color: '#3a6' },
        'HEADER-TWO': {color: '#FFF'}
    };

    class MyEditor extends Component {
        customStyleMap = customColorStyleMap;
        myBlockRenderer = myBlockRenderer;


        constructor(props) {
            super(props);
            this.state = {
                editorState: EditorState.createEmpty()
            };
            this.onChange = editorState => this.setState({editorState});


            const sampleMarkup =
                '<b>Bold text</b>, <i>Italic text</i><br/ ><br />' +
                '<a href="http://www.facebook.com">Example link</a>' +
                '<h1>qwertyui</h1>';

            const blocksFromHTML = convertFromHTML(sampleMarkup);
            const state = ContentState.createFromBlockArray(
                blocksFromHTML.contentBlocks,
                blocksFromHTML.entityMap,
            );

            /*this.state = {
                editorState: EditorState.createWithContent(state),
            };*/


        }

        _onBoldClick() {
            this.onChange(RichUtils.toggleInlineStyle(this.state.editorState, 'BOLD'));
        }
        _onItalicClick() {
            this.onChange(RichUtils.toggleInlineStyle(this.state.editorState, 'ITALIC'));
        }
        _onUNDERLINEClick() {
            this.onChange(RichUtils.toggleInlineStyle(this.state.editorState, 'UNDERLINE'));
        }
        _onH1Click(){
            const newEditState = RichUtils.toggleBlockType(
                this.state.editorState,
                'header-two'
            )
            this.onChange(newEditState);
        }
        _onblockquoteClick(){
            const newEditState = RichUtils.toggleBlockType(
                this.state.editorState,
                'blockquote'
            )
            this.onChange(newEditState);
        }
        _onCodeBlockClick(){
            const newEditState = RichUtils.toggleBlockType(
                this.state.editorState,
                'code-block'
            )
            this.onChange(newEditState);
        }
        _onUnorderedlistitemClick(){
            const newEditState = RichUtils.toggleBlockType(
                this.state.editorState,
                'unordered-list-item'
            )
            this.onChange(newEditState);
        }
        _onOrderedlistitemClick(){
            const newEditState = RichUtils.toggleBlockType(
                this.state.editorState,
                'ordered-list-item'
            )
            this.onChange(newEditState);
        }
        _onblockquoteClick(){
            const newEditState = RichUtils.toggleBlockType(
                this.state.editorState,
                'blockquote'
            )
            this.onChange(newEditState);
        }
        _onAddImageClick(){
            const newEditState = RichUtils.toggleBlockType(
                this.state.editorState,
                'atomic'
            )
            this.onChange(newEditState);
        }

        toggleInlineStyle(style) {
            let state = RichUtils.toggleInlineStyle(this.state.editorState, style);
            this.onChange(state);
        }

        fun2(){

        }

        render() {
            return (
                <div>
                    <div>
                        <div className="Editable-toolbar Sticky">
                            <div className="Editable-toolbar-controls">
                                <button onClick={this._onBoldClick.bind(this)} aria-label="粗体" data-tooltip="粗体 (Ctrl+B)"
                                        data-tooltip-position="bottom"
                                        data-tooltip-will-hide-on-click="true" type="button"
                                        className="Button Editable-control Button--plain">
                                    <svg className="Zi Zi--FormatBold" fill="currentColor"
                                         viewBox="0 0 24 24" width="24" height="24">
                                        <path
                                            d="M9 17.025V13h4.418c1.19 0 2.415.562 2.415 2.012s-1.608 2.013-2.9 2.013H9zM9 7h4.336c1 0 1.814.888 1.814 2 0 .89-.814 2-1.814 2H9V7zm8.192 1.899a3.893 3.893 0 0 0-3.888-3.889S9.334 5 8.167 5C7 5 7 6.167 7 6.167v11.666C7 19 8.167 19 8.167 19l5.572.01c2.333 0 4.231-1.86 4.231-4.148a4.122 4.122 0 0 0-1.77-3.372 3.873 3.873 0 0 0 .992-2.591z"
                                            fill-rule="evenodd"></path>
                                    </svg>
                                </button>
                                <button onClick={this._onItalicClick.bind(this)} aria-label="斜体" data-tooltip="斜体 (Ctrl+I)"
                                        data-tooltip-position="bottom"
                                        data-tooltip-will-hide-on-click="true" type="button"
                                        className="Button Editable-control Button--plain">
                                    <svg className="Zi Zi--FormatItalic" fill="currentColor"
                                         viewBox="0 0 24 24" width="24" height="24">
                                        <path
                                            d="M15.751 5h-5.502a.751.751 0 0 0-.749.75c0 .417.336.75.749.75H12l-2 11H8.249a.751.751 0 0 0-.749.75c0 .417.336.75.749.75h5.502a.751.751 0 0 0 .749-.75.748.748 0 0 0-.749-.75H12l2-11h1.751a.751.751 0 0 0 .749-.75.748.748 0 0 0-.749-.75"
                                            fill-rule="evenodd"></path>
                                    </svg>
                                </button>
                                <span className="Editable-toolbar-separator"></span>
                                <button onClick={this._onH1Click.bind(this)} aria-label="一级标题" data-tooltip="一级标题 (Ctrl+Alt+1)"
                                        data-tooltip-position="bottom"
                                        data-tooltip-will-hide-on-click="true" type="button"
                                        className="Button Editable-control Button--plain">
                                    <svg className="Zi Zi--FormatHeader" fill="currentColor"
                                         viewBox="0 0 24 24" width="24" height="24">
                                        <path
                                            d="M7 6.007C7 5.45 7.444 5 8 5c.552 0 1 .45 1 1.007v11.986C9 18.55 8.556 19 8 19c-.552 0-1-.45-1-1.007V6.007zm8 0C15 5.45 15.444 5 16 5c.552 0 1 .45 1 1.007v11.986C17 18.55 16.556 19 16 19c-.552 0-1-.45-1-1.007V6.007zM9 11h6v2H9v-2z"
                                            fill-rule="evenodd"></path>
                                    </svg>
                                </button>
                                <button onClick={this._onblockquoteClick.bind(this)} aria-label="引用块" data-tooltip="引用块 (Ctrl+Shift+U)"
                                        data-tooltip-position="bottom"
                                        data-tooltip-will-hide-on-click="true" type="button"
                                        className="Button Editable-control Button--plain">
                                    <svg className="Zi Zi--FormatBlockquote" fill="currentColor"
                                         viewBox="0 0 24 24" width="24" height="24">
                                        <path
                                            d="M17.975 12.209c.504.454.822 1.05.952 1.792.061.35.055.715-.022 1.096-.075.379-.209.718-.4 1.018-.465.73-1.155 1.175-2.07 1.337-.874.153-1.684-.06-2.432-.638a3.6 3.6 0 0 1-.916-1.043 3.92 3.92 0 0 1-.506-1.336c-.172-.98-.03-2.026.425-3.142.455-1.116 1.155-2.118 2.1-3.007.8-.757 1.456-1.182 1.97-1.273a.72.72 0 0 1 .544.104.656.656 0 0 1 .286.452c.054.31-.095.601-.45.877-.856.67-1.455 1.27-1.796 1.798-.323.513-.467.873-.43 1.079.034.196.21.287.524.274l.191-.001.249-.029a2.436 2.436 0 0 1 1.781.642zm-7.51 0c.504.454.821 1.05.951 1.792.062.35.056.715-.02 1.096-.077.379-.21.718-.401 1.018-.465.73-1.155 1.175-2.07 1.337-.874.153-1.684-.06-2.432-.638a3.6 3.6 0 0 1-.916-1.043 3.92 3.92 0 0 1-.506-1.336c-.172-.98-.03-2.026.424-3.142.455-1.116 1.156-2.118 2.101-3.007.8-.757 1.456-1.182 1.97-1.273a.72.72 0 0 1 .544.104.656.656 0 0 1 .285.452c.055.31-.094.601-.45.877-.855.67-1.454 1.27-1.796 1.798-.322.513-.466.873-.43 1.079.034.196.21.287.525.274l.191-.001.248-.029a2.436 2.436 0 0 1 1.782.642z"
                                            fill-rule="evenodd"></path>
                                    </svg>
                                </button>
                                <button onClick={this._onCodeBlockClick.bind(this)} aria-label="代码块" data-tooltip="代码块 (Ctrl+Alt+C)"
                                        data-tooltip-position="bottom"
                                        data-tooltip-will-hide-on-click="true" type="button"
                                        className="Button Editable-control Button--plain">
                                    <svg className="Zi Zi--FormatCode" fill="currentColor"
                                         viewBox="0 0 24 24" width="24" height="24">
                                        <path
                                            d="M19.718 11.559a.961.961 0 0 1 .007 1.352l-2.201 2.033-1.319 1.219a.937.937 0 0 1-1.33-.005.961.961 0 0 1-.001-1.345l2.813-2.576-2.804-2.568a.96.96 0 0 1-.008-1.352.963.963 0 0 1 1.337 0l2.475 2.289 1.031.953zm-7.462-5.567a1.001 1.001 0 0 1 1.16-.818c.544.096.907.616.81 1.165l-2.082 11.804a1.001 1.001 0 0 1-1.16.818 1.003 1.003 0 0 1-.81-1.165l2.082-11.804zM9.123 8.316a.96.96 0 0 1 0 1.345l-2.812 2.575 2.806 2.569a.962.962 0 0 1 .006 1.35.935.935 0 0 1-1.337 0l-2.093-1.934-1.412-1.305a.961.961 0 0 1-.007-1.352l2.833-2.62.685-.634c.345-.35.976-.354 1.331.006z"
                                            fill-rule="evenodd"></path>
                                    </svg>
                                </button>
                                <button onClick={this._onOrderedlistitemClick.bind(this)} aria-label="有序列表" data-tooltip="有序列表 (Ctrl+Shift+7)"
                                        data-tooltip-position="bottom"
                                        data-tooltip-will-hide-on-click="true" type="button"
                                        className="Button Editable-control Button--plain">
                                    <svg className="Zi Zi--InsertOrderedList"
                                         fill="currentColor" viewBox="0 0 24 24" width="24"
                                         height="24">
                                        <path
                                            d="M9 6.5c0-.552.456-1 .995-1h8.01c.55 0 .995.444.995 1 0 .552-.456 1-.995 1h-8.01A.995.995 0 0 1 9 6.5zM5.884 7.893v-2.09h-.643L5.402 5h1.285v2.893h-.803zm.898 3.83l-.393.395h.862v.733H5v-.482l1.057-.892c.371-.312.461-.434.463-.566.003-.202-.135-.368-.396-.368-.289 0-.418.206-.418.43H5c0-.642.482-1.073 1.125-1.073s1.125.457 1.125.945c0 .307-.106.516-.468.877zM9 11.5c0-.552.456-1 .995-1h8.01c.55 0 .995.444.995 1 0 .552-.456 1-.995 1h-8.01a.995.995 0 0 1-.995-1zm0 5c0-.552.456-1 .995-1h8.01c.55 0 .995.444.995 1 0 .552-.456 1-.995 1h-8.01a.995.995 0 0 1-.995-1zm-1.759.624c0 .14-.025.27-.076.388a.902.902 0 0 1-.217.309 1.017 1.017 0 0 1-.336.205c-.13.05-.275.074-.437.074-.166 0-.32-.027-.462-.08a1.166 1.166 0 0 1-.367-.217 1.062 1.062 0 0 1-.246-.318.914.914 0 0 1-.1-.38v-.055h.765v.054a.343.343 0 0 0 .367.352c.117 0 .207-.03.27-.09.062-.06.093-.152.093-.277 0-.117-.039-.206-.117-.268a.506.506 0 0 0-.32-.091h-.14v-.516h.144c.117 0 .205-.03.264-.09a.31.31 0 0 0 .087-.226.27.27 0 0 0-.087-.209.332.332 0 0 0-.233-.08c-.107 0-.185.027-.236.08a.275.275 0 0 0-.076.197v.055h-.695v-.055a.915.915 0 0 1 .295-.644c.178-.161.436-.242.775-.242.14 0 .27.021.39.064s.224.102.312.176a.802.802 0 0 1 .207.262c.05.1.075.206.075.318 0 .258-.116.46-.348.605v.008a.625.625 0 0 1 .193.119.777.777 0 0 1 .256.572z"
                                            fill-rule="evenodd"></path>
                                    </svg>
                                </button>
                                <button onClick={this._onUnorderedlistitemClick.bind(this)} aria-label="无序列表" data-tooltip="无序列表 (Ctrl+Shift+8)"
                                        data-tooltip-position="bottom"
                                        data-tooltip-will-hide-on-click="true" type="button"
                                        className="Button Editable-control Button--plain">
                                    <svg className="Zi Zi--InsertUnorderedList"
                                         fill="currentColor" viewBox="0 0 24 24" width="24"
                                         height="24">
                                        <path
                                            d="M9 7c0-.552.456-1 .995-1h8.01c.55 0 .995.444.995 1 0 .552-.456 1-.995 1h-8.01A.995.995 0 0 1 9 7zM6 8a1 1 0 1 1 0-2 1 1 0 0 1 0 2zm0 5a1 1 0 1 1 0-2 1 1 0 0 1 0 2zm0 5a1 1 0 1 1 0-2 1 1 0 0 1 0 2zm3-6c0-.552.456-1 .995-1h8.01c.55 0 .995.444.995 1 0 .552-.456 1-.995 1h-8.01A.995.995 0 0 1 9 12zm0 5c0-.552.456-1 .995-1h8.01c.55 0 .995.444.995 1 0 .552-.456 1-.995 1h-8.01A.995.995 0 0 1 9 17z"
                                            fill-rule="evenodd"></path>
                                    </svg>
                                </button>
                                <button aria-label="插入注释" data-tooltip="插入注释 (Ctrl+Shift+9)"
                                        data-tooltip-position="bottom"
                                        data-tooltip-will-hide-on-click="true" type="button"
                                        className="Button Editable-control Button--plain">
                                    <svg className="Zi Zi--InsertReference" fill="currentColor"
                                         viewBox="0 0 24 24" width="24" height="24">
                                        <path
                                            d="M8 3.25v1.5a.25.25 0 0 1-.25.25h-2.5a.25.25 0 0 0-.25.25v13.5c0 .138.112.25.25.25h2.5a.25.25 0 0 1 .25.25v1.5a.25.25 0 0 1-.25.25H4a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h3.75a.25.25 0 0 1 .25.25zM20 3a1 1 0 0 1 1 1v16a1 1 0 0 1-1 1h-3.75a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 1 .25-.25h2.5a.25.25 0 0 0 .25-.25V5.25a.25.25 0 0 0-.25-.25h-2.5a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 1 .25-.25H20zm-7.25 4a.25.25 0 0 1 .243.193L13 7.25v9.5a.25.25 0 0 1-.193.243L12.75 17h-1.5a.25.25 0 0 1-.243-.193L11 16.75v-7.5a.25.25 0 0 0-.193-.243L10.75 9H9.32a.25.25 0 0 1-.25-.253l.008-.058.375-1.5a.25.25 0 0 1 .176-.18L9.695 7h3.055z"
                                            fill-rule="evenodd"></path>
                                    </svg>
                                </button>
                                <button  aria-label="插入链接" data-tooltip="插入链接 (Ctrl+K)"
                                         data-tooltip-position="bottom"
                                         data-tooltip-will-hide-on-click="true" type="button"
                                         className="Button AddLink Editable-control Button--plain">
                                    <svg className="Zi Zi--InsertLink" fill="currentColor"
                                         viewBox="0 0 24 24" width="24" height="24">
                                        <path
                                            d="M13.414 4.222a4.5 4.5 0 1 1 6.364 6.364l-3.005 3.005a.5.5 0 0 1-.707 0l-.707-.707a.5.5 0 0 1 0-.707l3.005-3.005a2.5 2.5 0 1 0-3.536-3.536l-3.005 3.005a.5.5 0 0 1-.707 0l-.707-.707a.5.5 0 0 1 0-.707l3.005-3.005zm-6.187 6.187a.5.5 0 0 1 .638-.058l.07.058.706.707a.5.5 0 0 1 .058.638l-.058.07-3.005 3.004a2.5 2.5 0 0 0 3.405 3.658l.13-.122 3.006-3.005a.5.5 0 0 1 .638-.058l.069.058.707.707a.5.5 0 0 1 .058.638l-.058.069-3.005 3.005a4.5 4.5 0 0 1-6.524-6.196l.16-.168 3.005-3.005zm8.132-3.182a.25.25 0 0 1 .353 0l1.061 1.06a.25.25 0 0 1 0 .354l-8.132 8.132a.25.25 0 0 1-.353 0l-1.061-1.06a.25.25 0 0 1 0-.354l8.132-8.132z"></path>
                                    </svg>
                                </button>
                                <button onClick={this._onAddImageClick.bind(this)} aria-label="上传图片" data-tooltip="上传图片"
                                        data-tooltip-position="bottom"
                                        data-tooltip-will-hide-on-click="true" type="button"
                                        className="Button Editable-control Button--plain">
                                    <svg className="Zi Zi--Image" fill="currentColor"
                                         viewBox="0 0 24 24" width="24" height="24">
                                        <path
                                            d="M3.75 4.002L20.078 4c.669 0 .911.07 1.156.2.244.131.436.323.567.567.13.245.2.487.2 1.156v12.154c0 .669-.07.911-.2 1.156-.131.244-.323.436-.567.567-.245.13-.487.2-1.156.2H3.923c-.669 0-.911-.07-1.156-.2a1.363 1.363 0 0 1-.567-.567c-.118-.223-.187-.443-.198-.984L2 5.923c0-.669.07-.911.2-1.156.131-.244.323-.436.567-.567.223-.118.443-.187.984-.198zM19.68 6H4.32c-.111 0-.151.012-.192.033a.227.227 0 0 0-.095.095.27.27 0 0 0-.03.121L4 6.32v11.36c0 .111.012.151.033.192.022.04.054.073.095.095a.27.27 0 0 0 .121.03L4.32 18h15.36c.111 0 .151-.012.192-.033a.227.227 0 0 0 .095-.095.27.27 0 0 0 .03-.121L20 17.68V6.32c0-.111-.012-.151-.033-.192a.227.227 0 0 0-.095-.095.27.27 0 0 0-.121-.03L19.68 6zm-5.176 2.18a.25.25 0 0 1 .088.09l4.195 7.356a.25.25 0 0 1-.217.374H5.44a.25.25 0 0 1-.216-.378l3.235-5.447a.25.25 0 0 1 .426-.006l1.899 2.99a.25.25 0 0 0 .425-.005l2.952-4.89a.25.25 0 0 1 .343-.084z"></path>
                                    </svg>
                                </button>
                                <button aria-label="插入视频" data-tooltip="插入视频"
                                        data-tooltip-position="bottom"
                                        data-tooltip-will-hide-on-click="true" type="button"
                                        className="Button Editable-control Button--plain">
                                    <svg className="Zi Zi--InsertVideo" fill="currentColor"
                                         viewBox="0 0 24 24" width="24" height="24">
                                        <path
                                            d="M3.75 4.002L20.078 4c.669 0 .911.07 1.156.2.244.131.436.323.567.567.13.245.2.487.2 1.156v12.154c0 .669-.07.911-.2 1.156-.131.244-.323.436-.567.567-.245.13-.487.2-1.156.2H3.923c-.669 0-.911-.07-1.156-.2a1.363 1.363 0 0 1-.567-.567c-.118-.223-.187-.443-.198-.984L2 5.923c0-.669.07-.911.2-1.156.131-.244.323-.436.567-.567.223-.118.443-.187.984-.198zM19.68 6H4.32c-.111 0-.151.012-.192.033a.227.227 0 0 0-.095.095.27.27 0 0 0-.03.121L4 6.32v11.36c0 .111.012.151.033.192.022.04.054.073.095.095a.27.27 0 0 0 .121.03L4.32 18h15.36c.111 0 .151-.012.192-.033a.227.227 0 0 0 .095-.095.27.27 0 0 0 .03-.121L20 17.68V6.32c0-.111-.012-.151-.033-.192a.227.227 0 0 0-.095-.095.27.27 0 0 0-.121-.03L19.68 6zM9.584 8.657a.5.5 0 0 1 .614-.182l.08.043 4.598 3.066a.5.5 0 0 1 .07.775l-.07.057-4.599 3.066a.5.5 0 0 1-.769-.326l-.008-.09V8.934a.5.5 0 0 1 .084-.277z"/>
                                    </svg>
                                </button>
                                <button aria-label="插入公式" data-tooltip="插入公式 (Ctrl+Shift+E)"
                                        data-tooltip-position="bottom"
                                        data-tooltip-will-hide-on-click="true" type="button"
                                        className="Button Editable-control Button--plain">
                                    <svg className="Zi Zi--InsertFormula" fill="currentColor"
                                         viewBox="0 0 24 24" width="24" height="24">
                                        <path
                                            d="M18.57 19.862l.75-1.5a.25.25 0 0 0-.225-.362H9.104a.25.25 0 0 1-.177-.427l5.88-5.88a.25.25 0 0 0-.014-.369L9.02 6.441A.25.25 0 0 1 9.182 6h8.568a.25.25 0 0 0 .25-.25v-1.5a.25.25 0 0 0-.25-.25h-13a.25.25 0 0 0-.25.25v.141c0 .07.029.136.08.183l7.237 6.755a.25.25 0 0 1 .012.354l-7.261 7.745a.25.25 0 0 0-.068.17v.152c0 .138.112.25.25.25h13.595a.25.25 0 0 0 .224-.138z"></path>
                                    </svg>
                                </button>
                                <button aria-label="插入分割线" data-tooltip="插入分割线 (Ctrl+Shift+S)"
                                        data-tooltip-position="bottom"
                                        data-tooltip-will-hide-on-click="true" type="button"
                                        className="Button Editable-control Button--plain">
                                    <svg className="Zi Zi--InsertDivider" fill="currentColor"
                                         viewBox="0 0 24 24" width="24" height="24">
                                        <path
                                            d="M20.75 17a.25.25 0 0 1 .25.25v1.5a.25.25 0 0 1-.25.25H3.25a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 1 .25-.25h17.5zm-13-6a.25.25 0 0 1 .25.25v1.5a.25.25 0 0 1-.25.25h-4.5a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 1 .25-.25h4.5zm6 0a.25.25 0 0 1 .25.25v1.5a.25.25 0 0 1-.25.25h-3.5a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 1 .25-.25h3.5zm7 0a.25.25 0 0 1 .25.25v1.5a.25.25 0 0 1-.25.25h-4.5a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 1 .25-.25h4.5zm0-6a.25.25 0 0 1 .25.25v1.5a.25.25 0 0 1-.25.25H3.25A.25.25 0 0 1 3 6.75v-1.5A.25.25 0 0 1 3.25 5h17.5z"></path>
                                    </svg>
                                </button>
                                <button aria-label="清除格式" data-tooltip="清除格式 (Ctrl+\)"
                                        data-tooltip-position="bottom"
                                        data-tooltip-will-hide-on-click="true" type="button"
                                        className="Button Editable-control Button--plain">
                                    <svg className="Zi Zi--FormatClear" fill="currentColor"
                                         viewBox="0 0 24 24" width="24" height="24">
                                        <path
                                            d="M20.309 20.309a.25.25 0 0 1 0 .353l-1.061 1.06a.25.25 0 0 1-.354 0l-7.299-7.299L11 18h1.75a.25.25 0 0 1 .25.25v1.5a.25.25 0 0 1-.25.25h-5.5a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 1 .25-.25H9l.881-5.29-4.73-4.73a.25.25 0 0 1-.13-.129L2.277 5.106a.25.25 0 0 1 0-.354l1.06-1.06a.25.25 0 0 1 .301-.041l.053.04L20.31 20.31zM18.75 4a.25.25 0 0 1 .25.25v3.5a.25.25 0 0 1-.25.25h-1.5a.25.25 0 0 1-.25-.25v-1.5a.25.25 0 0 0-.25-.25H13l-.597 3.575-1.714-1.714L11 6H8.826l-2-2H18.75z"></path>
                                    </svg>
                                </button>
                                <button aria-label="上传附件" data-tooltip="上传附件"
                                        data-tooltip-position="bottom"
                                        data-tooltip-will-hide-on-click="true" type="button"
                                        className="Button Editable-control Button--plain">
                                    <svg className="Zi Zi--Folder" fill="currentColor"
                                         viewBox="0 0 24 24" width="24" height="24">
                                        <path
                                            d="M9.586 3a1 1 0 0 1 .707.293l1.414 1.414a1 1 0 0 0 .707.293H21a1 1 0 0 1 1 1v13a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h6.586zM4 11v6.75c0 .138.112.25.25.25h15.5a.25.25 0 0 0 .25-.25V11H4zm0-2h16V7.25a.25.25 0 0 0-.25-.25h-8.164a1 1 0 0 1-.707-.293L9.464 5.293A1 1 0 0 0 8.757 5H4.25a.25.25 0 0 0-.25.25V9z"></path>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div className="Dropzone Editable-content RicheText RicheText--editable RicheText--clraeBoth ztext">
                        <Editor
                            editorState={this.state.editorState}
                            onChange={this.onChange}
                            customStyleMap={this.customStyleMap}
                            blockRenderMap={extendedBlockRenderMap}
                            handleKeyCommand={this.handleKeyCommand}
                            blockRendererFn={myBlockRenderer}
                        />
                    </div>
                </div>
            );
        }
    }

    export default MyEditor;
</script>
</body>
</html>
