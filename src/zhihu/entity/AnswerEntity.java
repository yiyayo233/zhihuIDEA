package zhihu.entity;

public class AnswerEntity {
    private String id;
    private String authorId;
    private int approveNum;
    private String editTime;
    private String commentId;
    private String answerContent;
    private String cover;
    private String publishTime;

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

    public AnswerEntity(String id, String authorId, int approveNum, String editTime, String commentId, String answerContent, String cover, String publishTime) {
        this.id = id;
        this.authorId = authorId;
        this.approveNum = approveNum;
        this.editTime = editTime;
        this.commentId = commentId;
        this.answerContent = answerContent;
        this.cover = cover;
        this.publishTime = publishTime;
    }
}
