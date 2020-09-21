/**
 * 判断是否扩展
 * @type {number}
 */
var AnalyticsWork_detailExpand_i = 0;

/**
 * 创作者部分主体处理
 * @param index 主体部分选择
 * @constructor
 */
function CreatorSection_body_html(index){
    var CreatorSection_body_html = '';
    if (index === 0){
        CreatorSection_body_html = CreatorSection_body_html + '<div class="AnalyticsWork-detailCount">\n' +
                    '                                            <div class="AnalyticsWork-detailCountBodyHeader">\n' +
                    '                                                <div class="AnalyticsWork-detailCountBodyHeaderTitle">\n' +
                    '                                                    数据趋势\n' +
                    '                                                </div>\n' +
                    '                                            </div>\n' +
                    '                                            <div class="AnalyticsChart AnalyticsWork-detailCountChart">\n' +
                    '                                                <div id="main" style="width: 100%;height: 440px;"></div>\n' +
                    '\n' +
                    '                                            </div>' +
            '                                                  </div>';
        CreatorSection_body_html = CreatorSection_body_html + '<div class="AnalyticsWork-detailCount">\n' +
            '                                            <div class="AnalyticsWork-detailCountBodyHeader">\n' +
            '                                                <div class="AnalyticsWork-detailCountBodyHeaderTitle">\n' +
            '                                                    分日报表\n' +
            '                                                </div>\n' +
            '                                                <div class="AnalyticsWork-detailCountBodyHeaderTool">\n' +
            '                                                    <div class="AnalyticsWork-detailCountBodyHeaderToolButton">\n' +
            '                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;Download" fill="currentColor" viewBox="0 0 24 24" width="16" height="16"><path d="M13.5 12.09l3.486-3.196a1.5 1.5 0 1 1 2.028 2.212l-6 5.5a1.5 1.5 0 0 1-2.028 0l-6-5.5a1.5 1.5 0 1 1 2.028-2.212L10.5 12.09V3.5a1.5 1.5 0 0 1 3 0v8.59zM6.5 22a1.5 1.5 0 0 1 0-3h11a1.5 1.5 0 0 1 0 3h-11z"></path></svg></span>\n' +
            '                                                        导出 Excel\n' +
            '                                                    </div>\n' +
            '                                                </div>\n' +
            '\n' +
            '                                            </div>\n' +
            '                                            <div class="CreatorTable">\n' +
            '                                                <div class="CreatorTable-tableBox">\n' +
            '                                                    <table class="CreatorTable-table" cellspacing="0" cellpadding="0">\n' +
            '                                                        <thead>\n' +
            '                                                        <tr class="CreatorTable-tableRow CreatorTable-tableRow&#45;&#45;header">\n' +
            '                                                            <th class="CreatorTable-tableHead" style="width: 102px">发布时间\n' +
            '                                                                <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>\n' +
            '                                                            </th>\n' +
            '                                                            <th class="CreatorTable-tableHead" style="width: 102px">阅读数\n' +
            '                                                                <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>\n' +
            '                                                            </th>\n' +
            '                                                            <th class="CreatorTable-tableHead" style="width: 80px">评论数\n' +
            '                                                                <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>\n' +
            '                                                            </th>\n' +
            '                                                            <th class="CreatorTable-tableHead" style="width: 80px">赞同数\n' +
            '                                                                <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>\n' +
            '                                                            </th>\n' +
            '                                                            <th class="CreatorTable-tableHead" style="width: 80px">喜欢数\n' +
            '                                                                <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>\n' +
            '                                                            </th>\n' +
            '                                                            <th class="CreatorTable-tableHead" style="width: 80px">收藏数\n' +
            '                                                                <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>\n' +
            '                                                            </th>\n' +
            '                                                        </tr>\n' +
            '                                                        </thead>\n' +
            '                                                        <tbody>\n' +
            '                                                        <tr class="CreatorTable-tableRow">\n' +
            '                                                            <td class="CreatorTable-tableDate">\n' +
            '                                                                2020/01/03\n' +
            '                                                            </td>\n' +
            '                                                            <td class="CreatorTable-tableDate">\n' +
            '                                                                5\n' +
            '                                                            </td>\n' +
            '                                                            <td class="CreatorTable-tableDate">\n' +
            '                                                                0\n' +
            '                                                            </td>\n' +
            '                                                            <td class="CreatorTable-tableDate">\n' +
            '                                                                0\n' +
            '                                                            </td>\n' +
            '                                                            <td class="CreatorTable-tableDate">\n' +
            '                                                                0\n' +
            '                                                            </td>\n' +
            '                                                            <td class="CreatorTable-tableDate">\n' +
            '                                                                0\n' +
            '                                                            </td>\n' +
            '                                                        </tr>\n' +
            '                                                        </tbody>\n' +
            '                                                    </table>\n' +
            '                                                </div>\n' +
            '                                                <div class="CreatorPagination CreatorTable-Pagination">\n' +
            '                                                    <button class="button CreatorPagination-Button CreatorPagination-Button&#45;&#45;disabled CreatorPagination-lastButton" type="button">\n' +
            '                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>\n' +
            '                                                    </button>\n' +
            '                                                    <div class="CreatorPagination-pageNumber">\n' +
            '                                                        1\n' +
            '                                                        /\n' +
            '                                                        1\n' +
            '                                                    </div>\n' +
            '                                                    <button class="button CreatorPagination-Button CreatorPagination-Button&#45;&#45;disabled CreatorPagination-nextButton" type="button">\n' +
            '                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi&#45;&#45;TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>\n' +
            '                                                    </button>\n' +
            '                                                    <label class="CreatorPagination-Input Input-wrapper">\n' +
            '                                                        <input type="text" value="1">\n' +
            '                                                    </label>\n' +
            '                                                    <button class="button CreatorPagination-Button CreatorPagination-Button&#45;&#45;skip" type="button">跳转</button>\n' +
            '                                                </div>\n' +
            '                                            </div>\n' +
            '\n' +
            '                                        </div>';
    }else if (index === 1){
        CreatorSection_body_html = CreatorSection_body_html + '\n' +
            '                                        <div class="AnalyticsWork-detailCount">\n' +
            '                                            <div class="AnalyticsWork-detailCountBodyHeader">\n' +
            '                                                <div class="AnalyticsWork-detailCountBodyHeaderTitle">\n' +
            '                                                    统计详情\n' +
            '                                                </div>\n' +
            '                                                <div class="AnalyticsWork-detailCountBodyHeaderTool">\n' +
            '                                                    <div class="AnalyticsWork-detailCountBodyHeaderToolButton">\n' +
            '                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--Download" fill="currentColor" viewBox="0 0 24 24" width="16" height="16"><path d="M13.5 12.09l3.486-3.196a1.5 1.5 0 1 1 2.028 2.212l-6 5.5a1.5 1.5 0 0 1-2.028 0l-6-5.5a1.5 1.5 0 1 1 2.028-2.212L10.5 12.09V3.5a1.5 1.5 0 0 1 3 0v8.59zM6.5 22a1.5 1.5 0 0 1 0-3h11a1.5 1.5 0 0 1 0 3h-11z"></path></svg></span>\n' +
            '                                                        导出 Excel\n' +
            '                                                    </div>\n' +
            '                                                </div>\n' +
            '                                            </div>\n' +
            '                                            <div class="CreatorTable">\n' +
            '                                                <div class="CreatorTable-tableBox">\n' +
            '                                                    <table class="CreatorTable-table" cellspacing="0" cellpadding="0">\n' +
            '                                                        <thead>\n' +
            '                                                            <tr class="CreatorTable-tableRow CreatorTable-tableRow--header">\n' +
            '                                                                <th class="CreatorTable-tableHead AnalyticsWork-titleColumn">回答内容</th>\n' +
            '                                                                <th class="CreatorTable-tableHead" style="width: 102px">发布时间\n' +
            '                                                                    <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>\n' +
            '                                                                </th>\n' +
            '                                                                <th class="CreatorTable-tableHead" style="width: 102px">阅读数\n' +
            '                                                                    <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>\n' +
            '                                                                </th>\n' +
            '                                                                <th class="CreatorTable-tableHead" style="width: 80px">评论数\n' +
            '                                                                    <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>\n' +
            '                                                                </th>\n' +
            '                                                                <th class="CreatorTable-tableHead" style="width: 80px">赞同数\n' +
            '                                                                    <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>\n' +
            '                                                                </th>\n' +
            '                                                                <th class="CreatorTable-tableHead" style="width: 80px">喜欢数\n' +
            '                                                                    <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>\n' +
            '                                                                </th>\n' +
            '                                                                <th class="CreatorTable-tableHead" style="width: 80px">收藏数\n' +
            '                                                                    <span class="CreatorSorter">​<svg class="CreatorSorter-icon" xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><g fill-rule="evenodd"><path d="M12.8204627,2.43875302 L16.8336794,8.44679881 C17.1363769,8.89995657 17.0144047,9.5126983 16.561247,9.81539577 C16.3990041,9.92376975 16.2082741,9.98161231 16.0131647,9.98161231 L7.98673124,9.98161231 C7.44177462,9.98161231 7,9.53983769 7,8.99488107 C7,8.79977169 7.05784256,8.60904169 7.16621654,8.44679881 L11.1794333,2.43875302 C11.4821308,1.98559526 12.0948725,1.86362311 12.5480302,2.16632058 C12.65586,2.23834804 12.7484352,2.33092324 12.8204627,2.43875302 Z"></path><path d="M12.8204627,21.5428593 C12.7484352,21.6506891 12.65586,21.7432643 12.5480302,21.8152917 C12.0948725,22.1179892 11.4821308,21.996017 11.1794333,21.5428593 L7.16621654,15.5348135 C7.05784256,15.3725706 7,15.1818406 7,14.9867312 C7,14.4417746 7.44177462,14 7.98673124,14 L16.0131647,14 C16.2082741,14 16.3990041,14.0578426 16.561247,14.1662165 C17.0144047,14.468914 17.1363769,15.0816557 16.8336794,15.5348135 L12.8204627,21.5428593 Z"></path></g></svg></span>\n' +
            '                                                                </th>\n' +
            '                                                                <th class="CreatorTable-tableHead" style="width: 80px">操作</th>\n' +
            '                                                            </tr>\n' +
            '                                                        </thead>\n' +
            '                                                        <tbody>\n' +
            '                                                            <tr class="CreatorTable-tableRow">\n' +
            '                                                                <td class="CreatorTable-tableDate AnalyticsWork-titleColumn">\n' +
            '                                                                    <a href="#" class="Creator-entityLink">当然是《樱花庄》啦，吹爆我真白！！ [图片]</a>\n' +
            '                                                                </td>\n' +
            '                                                                <td class="CreatorTable-tableDate">\n' +
            '                                                                    2020/01/03\n' +
            '                                                                </td>\n' +
            '                                                                <td class="CreatorTable-tableDate">\n' +
            '                                                                    5\n' +
            '                                                                </td>\n' +
            '                                                                <td class="CreatorTable-tableDate">\n' +
            '                                                                    0\n' +
            '                                                                </td>\n' +
            '                                                                <td class="CreatorTable-tableDate">\n' +
            '                                                                    0\n' +
            '                                                                </td>\n' +
            '                                                                <td class="CreatorTable-tableDate">\n' +
            '                                                                    0\n' +
            '                                                                </td>\n' +
            '                                                                <td class="CreatorTable-tableDate">\n' +
            '                                                                    0\n' +
            '                                                                </td>\n' +
            '                                                                <td class="CreatorTable-tableDate">\n' +
            '                                                                    <div class="AnalyticsWork-detailExpand Creator-internalLink">\n' +
            '                                                                        详细分析\n' +
            '                                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="6" height="6"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span>\n' +
            '                                                                    </div>\n' +
            '                                                                </td>\n' +
            '                                                            </tr>\n' +
            '                                                            <tr class="CreatorTable-tableRow">\n' +
            '                                                                <td class="CreatorTable-tableDate AnalyticsWork-titleColumn">\n' +
            '                                                                    <a href="#" class="Creator-entityLink">当然是《樱花庄》啦，吹爆我真白！！ [图片]</a>\n' +
            '                                                                </td>\n' +
            '                                                                <td class="CreatorTable-tableDate">\n' +
            '                                                                    2020/01/03\n' +
            '                                                                </td>\n' +
            '                                                                <td class="CreatorTable-tableDate">\n' +
            '                                                                    5\n' +
            '                                                                </td>\n' +
            '                                                                <td class="CreatorTable-tableDate">\n' +
            '                                                                    0\n' +
            '                                                                </td>\n' +
            '                                                                <td class="CreatorTable-tableDate">\n' +
            '                                                                    0\n' +
            '                                                                </td>\n' +
            '                                                                <td class="CreatorTable-tableDate">\n' +
            '                                                                    0\n' +
            '                                                                </td>\n' +
            '                                                                <td class="CreatorTable-tableDate">\n' +
            '                                                                    0\n' +
            '                                                                </td>\n' +
            '                                                                <td class="CreatorTable-tableDate">\n' +
            '                                                                    <div class="AnalyticsWork-detailExpand Creator-internalLink">\n' +
            '                                                                        详细分析\n' +
            '                                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="6" height="6"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span>\n' +
            '                                                                    </div>\n' +
            '                                                                </td>\n' +
            '                                                            </tr>\n' +
            '                                                        </tbody>\n' +
            '                                                    </table>\n' +
            '                                                </div>\n' +
            '                                                <div class="CreatorPagination CreatorTable-Pagination">\n' +
            '                                                    <button class="button CreatorPagination-Button CreatorPagination-Button--disabled CreatorPagination-lastButton" type="button">\n' +
            '                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>\n' +
            '                                                    </button>\n' +
            '                                                    <div class="CreatorPagination-pageNumber">\n' +
            '                                                        1\n' +
            '                                                        /\n' +
            '                                                        1\n' +
            '                                                    </div>\n' +
            '                                                    <button class="button CreatorPagination-Button CreatorPagination-Button--disabled CreatorPagination-nextButton" type="button">\n' +
            '                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleUp" fill="currentColor" viewBox="0 0 24 24" width="10" height="10"><path d="M2 18.242c0-.326.088-.532.237-.896l7.98-13.203C10.572 3.57 11.086 3 12 3c.915 0 1.429.571 1.784 1.143l7.98 13.203c.15.364.236.57.236.896 0 1.386-.875 1.9-1.955 1.9H3.955c-1.08 0-1.955-.517-1.955-1.9z" fill-rule="evenodd"></path></svg></span>\n' +
            '                                                    </button>\n' +
            '                                                    <label class="CreatorPagination-Input Input-wrapper">\n' +
            '                                                        <input type="text" value="1">\n' +
            '                                                    </label>\n' +
            '                                                    <button class="button CreatorPagination-Button CreatorPagination-Button--skip" type="button">跳转</button>\n' +
            '                                                </div>\n' +
            '                                            </div>\n' +
            '                                        </div>';
    }
    return CreatorSection_body_html;
}

/**
 * 补全表格行
 * @constructor
 */
function CreatorSection_body_CompletionTableRow_html() {
    var item = $(".CreatorTable-table>tbody>.CreatorTable-tableRow").length;
    var tableDateItem = $(".CreatorTable-table>tbody>.CreatorTable-tableRow:first-child>.CreatorTable-tableDate").length;

    var CompletionTableRow_html= '';
    for (let i = 0; i <10-item ; i++) {
        CompletionTableRow_html = CompletionTableRow_html + '<tr class="CreatorTable-tableRow">\n';
        for (let j = 0; j < tableDateItem; j++) {
            CompletionTableRow_html = CompletionTableRow_html + '<td class="CreatorTable-tableDate">\n' +
                '                                                </td>\n';
        }
        CompletionTableRow_html = CompletionTableRow_html +'</tr>\n';
    }
    $(".CreatorTable-table>tbody>.CreatorTable-tableRow:last-child").after(CompletionTableRow_html);
    $(".CreatorTable-tableRow").odd().addClass("CreatorTable-tableRow-odd");
}

/**
 * 图表处理
 * @param is_odd 判断背景是否变灰
 * @returns {string} 返回处理完成的图标
 * @constructor
 */
function CreatorTable_tableRowExpanded_html(is_odd){
    var CreatorTable_tableRowExpanded_html = '<tr class="CreatorTable-tableRow ';
    if(is_odd == 0){
        CreatorTable_tableRowExpanded_html = CreatorTable_tableRowExpanded_html + 'CreatorTable-tableRow-odd';
    }
    CreatorTable_tableRowExpanded_html = CreatorTable_tableRowExpanded_html + ' CreatorTable-tableRowExpanded">\n' +
        '                                                                <td class="CreatorTable-tableDate" colspan="8">\n' +
        '                                                                    <div class="AnalyticsWork-expandRowBox">\n' +
        '                                                                        <div class="DateLimitSelector AnalyticsWork-DateLimitSelector">\n' +
        '                                                                            <button class="Creator-ButtonGroupButton ButtonGroupButton-select">\n' +
        '                                                                                最近\n' +
        '                                                                                14\n' +
        '                                                                                天\n' +
        '                                                                            </button>\n' +
        '                                                                            <button class="Creator-ButtonGroupButton">\n' +
        '                                                                                最近\n' +
        '                                                                                30\n' +
        '                                                                                天\n' +
        '                                                                            </button>\n' +
        '                                                                            <button class="Creator-ButtonGroupButton">\n' +
        '                                                                                最近\n' +
        '                                                                                90\n' +
        '                                                                                天\n' +
        '                                                                            </button>\n' +
        '                                                                        </div>\n' +
        '                                                                        <div class="AnalyticsChart AnalyticsWork-expandRowChart">\n' +
        '                                                                            <div id="main" style="width: 100%;height: 440px;"></div>\n' +
        '\n' +
        '                                                                        </div>\n' +
        '                                                                    </div>\n' +
        '\n' +
        '                                                                </td>\n' +
        '                                                            </tr>';
    return CreatorTable_tableRowExpanded_html;
}
/**
 * 详细分析按钮点击：
 * 如果扩展就删掉所有，否则删除所有后扩展
 * @param button 按钮
 * @constructor
 */
function AnalyticsWork_detailExpand_Lick(button){
    if ($(button).parent().parent().next().attr("class").indexOf("CreatorTable-tableRowExpanded") !== -1){
        // $(button).parent().parent().next().remove();
        $(".CreatorTable-tableRowExpanded").remove();
        console.log(1);
    }else {
        $(".CreatorTable-tableRowExpanded").remove();
        var $parentName = $(button).parent().parent().attr("class");
        if ($parentName.indexOf("CreatorTable-tableRow-odd") !== -1){
            $(button).parent().parent().after(CreatorTable_tableRowExpanded_html(0));
        }else {
            $(button).parent().parent().after(CreatorTable_tableRowExpanded_html(1));
        }
        var data = [
            ['2020-8-03', 10,0,0,0,0],
            ["2020-08-04",2,0,0,0,0],
            ["2020-08-05",8,0,0,0,0],
            ["2020-08-06",7,0,0,0,0],
            ["2020-08-07",8,0,0,0,0],
            ["2020-08-08",12,0,0,0,0],
            ["2020-08-09",15,0,0,0,0],
        ];
        myChartFction(data);
        console.log(2);

    }
}

/**
 * 图表最近天数选择
 * @constructor
 */
function Creator_ButtonGroupButton_IsSelect(button) {
    if ($(button).attr("class").indexOf("ButtonGroupButton-select") === -1) {
        $(button).siblings().removeClass("ButtonGroupButton-select");
        $(button).addClass("ButtonGroupButton-select");
    }
}
/**
 * 最近天数选择
 * @constructor
 */
function AnalyticsDetailRangPicker_dateButton_IsActive(button){
    if ($(button).attr("class").indexOf("is-active") === -1) {
        $(button).siblings().removeClass("is-active");
        $(button).addClass("is-active");
    }
    var index = $(".CreatorSectionItem.CreatorSectionItem--clickable.is-active").index();
    if (index == 0){
        var day = $(button).attr("data-dayNum");
        getdata("getDataTime",day);
    }else if (index == 1){
        var day = $(button).attr("data-dayNum");
        alert(day);
    }


}

/**
 * 所有回答和单片回答选择
 * @constructor
 */
function CreatorSectionItem__name_IsActive(button){
    if (button !== null){
        if ($(button).parent().attr("class").indexOf("is-active") === -1){
            $(button).parent().siblings().removeClass("is-active");
            $(button).parent().addClass("is-active");
            var index = $(button).parent().index();

            $(".CreatorSection-body").html(CreatorSection_body_html(index));
            new CreatorSection_body_CompletionTableRow_html();
            var day = $(".button.AnalyticsDetailRangPicker-dateButton.is-active").attr("data-daynum");
            if(index == 0){
                getdata("getDataTime",day);
            }else if (index == 1){
                getdata("getDataObject",day);
            }
        }

    }

}

/**
 * 选择分析内容：回答、文章、想法、视频
 * @param button
 * @constructor
 */
function AnalyticsWork_TabsBox_TabsLick_IsActive(button){
    if ($(button).attr("class").indexOf("is-active") === -1) {
        $(button).parent().siblings().find(".Tabs-link").removeClass("is-active");
        $(button).addClass("is-active");
    }
}


$(function () {
    // new CreatorSectionItem__name_IsActive($(".CreatorSectionItem--name"));
    $(".CreatorSection-body").html(CreatorSection_body_html(0));
    CreatorSection_body_CompletionTableRow_html();
    getdata("getDataTime",7)

    $(document).on("click",".AnalyticsWork-detailExpand",function () {
        new AnalyticsWork_detailExpand_Lick(this);
    });
    $(document).on("click",".Creator-ButtonGroupButton",function () {
        new Creator_ButtonGroupButton_IsSelect(this);
    });
    $(document).on("click",".AnalyticsDetailRangPicker-dateButton",function () {
        AnalyticsDetailRangPicker_dateButton_IsActive(this);
    });
    $(".CreatorSectionItem--name").click(function () {
        CreatorSectionItem__name_IsActive(this);
    });
    $(".AnalyticsWork-TabsBox .Tabs-link").click(function () {
        AnalyticsWork_TabsBox_TabsLick_IsActive(this);
    });
});

/**
 * 获取数据
 * @param day
 */
function getdata(a,day) {
    $.ajax({
        url:"creator/analytics",
        type:"post",
        data:{
            "a":a,
            "day":day,
        },
        dataType:"JSON",
        success:function (result) {
            console.log(result);
            console.log(parseInt(day/4))
            if (a.index("getDataTime") != -1){
            myChartFction(result,parseInt(day/4));
            $(".CreatorTable-table tbody").html("");
            for (var i = 0; i < day; i++) {
                var item;
                if (i%2 == 0){
                    item = $('<tr class="CreatorTable-tableRow CreatorTable-tableRow-odd">\n' +
                        '                                                            <td class="CreatorTable-tableDate">\n' +
                        '                                                                '+ result[i] [0] +'\n' +
                        '                                                            </td>\n' +
                        '                                                            <td class="CreatorTable-tableDate">\n' +
                        '                                                                '+ result[i] [1] +'\n' +
                        '                                                            </td>\n' +
                        '                                                            <td class="CreatorTable-tableDate">\n' +
                        '                                                                '+ result[i] [2] +'\n' +
                        '                                                            </td>\n' +
                        '                                                            <td class="CreatorTable-tableDate">\n' +
                        '                                                                '+ result[i] [3] +'\n' +
                        '                                                            </td>\n' +
                        '                                                            <td class="CreatorTable-tableDate">\n' +
                        '                                                                '+ result[i] [4] +'\n' +
                        '                                                            </td>\n' +
                        '                                                            <td class="CreatorTable-tableDate">\n' +
                        '                                                                '+ result[i] [5] +'\n' +
                        '                                                            </td>\n' +
                        '                                                        </tr>');
                }else {
                    item = $('<tr class="CreatorTable-tableRow">\n' +
                        '                                                            <td class="CreatorTable-tableDate">\n' +
                        '                                                                '+ result[i] [0] +'\n' +
                        '                                                            </td>\n' +
                        '                                                            <td class="CreatorTable-tableDate">\n' +
                        '                                                                '+ result[i] [1] +'\n' +
                        '                                                            </td>\n' +
                        '                                                            <td class="CreatorTable-tableDate">\n' +
                        '                                                                '+ result[i] [2] +'\n' +
                        '                                                            </td>\n' +
                        '                                                            <td class="CreatorTable-tableDate">\n' +
                        '                                                                '+ result[i] [3] +'\n' +
                        '                                                            </td>\n' +
                        '                                                            <td class="CreatorTable-tableDate">\n' +
                        '                                                                '+ result[i] [4] +'\n' +
                        '                                                            </td>\n' +
                        '                                                            <td class="CreatorTable-tableDate">\n' +
                        '                                                                '+ result[i] [5] +'\n' +
                        '                                                            </td>\n' +
                        '                                                        </tr>');
                }


                $(".CreatorTable-table tbody").append(item);
            }
            }else {

                $(".CreatorTable-table tbody").html("");
                for (var i = 0; i < day; i++) {
                    var item;
                    if (i%2 == 0){
                        item = $('<tr class="CreatorTable-tableRow CreatorTable-tableRow-odd">\n' +
                            '                                                                <td class="CreatorTable-tableDate AnalyticsWork-titleColumn">\n' +
                            '                                                                    <a href="#" class="Creator-entityLink">当然是《樱花庄》啦，吹爆我真白！！ [图片]</a>\n' +
                            '                                                                </td>\n' +
                            '                                                                <td class="CreatorTable-tableDate">\n' +
                            '                                                                    2020/01/03\n' +
                            '                                                                </td>\n' +
                            '                                                                <td class="CreatorTable-tableDate">\n' +
                            '                                                                    5\n' +
                            '                                                                </td>\n' +
                            '                                                                <td class="CreatorTable-tableDate">\n' +
                            '                                                                    0\n' +
                            '                                                                </td>\n' +
                            '                                                                <td class="CreatorTable-tableDate">\n' +
                            '                                                                    0\n' +
                            '                                                                </td>\n' +
                            '                                                                <td class="CreatorTable-tableDate">\n' +
                            '                                                                    0\n' +
                            '                                                                </td>\n' +
                            '                                                                <td class="CreatorTable-tableDate">\n' +
                            '                                                                    0\n' +
                            '                                                                </td>\n' +
                            '                                                                <td class="CreatorTable-tableDate">\n' +
                            '                                                                    <div class="AnalyticsWork-detailExpand Creator-internalLink">\n' +
                            '                                                                        详细分析\n' +
                            '                                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="6" height="6"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span>\n' +
                            '                                                                    </div>\n' +
                            '                                                                </td>\n' +
                            '                                                            </tr>');
                    }else {
                        item = $('<tr class="CreatorTable-tableRow">\n' +
                            '                                                                <td class="CreatorTable-tableDate AnalyticsWork-titleColumn">\n' +
                            '                                                                    <a href="#" class="Creator-entityLink">当然是《樱花庄》啦，吹爆我真白！！ [图片]</a>\n' +
                            '                                                                </td>\n' +
                            '                                                                <td class="CreatorTable-tableDate">\n' +
                            '                                                                    2020/01/03\n' +
                            '                                                                </td>\n' +
                            '                                                                <td class="CreatorTable-tableDate">\n' +
                            '                                                                    5\n' +
                            '                                                                </td>\n' +
                            '                                                                <td class="CreatorTable-tableDate">\n' +
                            '                                                                    0\n' +
                            '                                                                </td>\n' +
                            '                                                                <td class="CreatorTable-tableDate">\n' +
                            '                                                                    0\n' +
                            '                                                                </td>\n' +
                            '                                                                <td class="CreatorTable-tableDate">\n' +
                            '                                                                    0\n' +
                            '                                                                </td>\n' +
                            '                                                                <td class="CreatorTable-tableDate">\n' +
                            '                                                                    0\n' +
                            '                                                                </td>\n' +
                            '                                                                <td class="CreatorTable-tableDate">\n' +
                            '                                                                    <div class="AnalyticsWork-detailExpand Creator-internalLink">\n' +
                            '                                                                        详细分析\n' +
                            '                                                                        <span style="display: inline-flex; align-items: center;">​<svg class="Zi Zi--TriangleDown" fill="currentColor" viewBox="0 0 24 24" width="6" height="6"><path d="M20.044 3H3.956C2.876 3 2 3.517 2 4.9c0 .326.087.533.236.896L10.216 19c.355.571.87 1.143 1.784 1.143s1.429-.572 1.784-1.143l7.98-13.204c.149-.363.236-.57.236-.896 0-1.386-.876-1.9-1.956-1.9z" fill-rule="evenodd"></path></svg></span>\n' +
                            '                                                                    </div>\n' +
                            '                                                                </td>\n' +
                            '                                                            </tr>');
                    }


                    $(".CreatorTable-table tbody").append(item);
                }
            }

        }
    });
}

