package zhihu.entity;

public class AnswerEntity {
    private String id;
    private String authorId;
    private int approveNum;
    private int browseNum;
    private String editTime;
    private String commentId;
    private String answerContent;
    private String cover;
    private String publishTime;
    private int isFold;

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getAuthorId() {
        return authorId;
    }
    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }
    public int getApproveNum() {
        return approveNum;
    }
    public void setApproveNum(int approveNum) {
        this.approveNum = approveNum;
    }
    public int getBrowseNum() {
        return browseNum;
    }
    public void setBrowseNum(int browseNum) {
        this.browseNum = browseNum;
    }
    public String getEditTime() {
        return editTime;
    }
    public void setEditTime(String editTime) {
        this.editTime = editTime;
    }
    public String getCommentId() {
        return commentId;
    }
    public void setCommentId(String commentId) {
        this.commentId = commentId;
    }
    public String getAnswerContent() {
        return answerContent;
    }
    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }
    public String getCover() {
        return cover;
    }
    public void setCover(String cover) {
        this.cover = cover;
    }
    public String getPublishTime() {
        return publishTime;
    }
    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }
    public int getIsFold() {
        return isFold;
    }
    public void setIsFold(int isFold) {
        this.isFold = isFold;
    }

    public AnswerEntity(String id, String authorId, int approveNum, int browseNum, String editTime, String commentId, String answerContent, String cover, String publishTime, int isFold) {
        this.id = id;
        this.authorId = authorId;
        this.approveNum = approveNum;
        this.browseNum = browseNum;
        this.editTime = editTime;
        this.commentId = commentId;
        this.answerContent = answerContent;
        this.cover = cover;
        this.publishTime = publishTime;
        this.isFold = isFold;
    }
}
