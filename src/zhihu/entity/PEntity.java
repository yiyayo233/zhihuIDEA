package zhihu.entity;

public class PEntity {
    private String id;
    private String authorId;
    private int approveNum;
    private String editTime;
    private String commentId;
    private String pTitle;
    private String pContent;
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

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    public PEntity(String id, String authorId, int approveNum, String editTime, String commentId, String pTitle, String pContent, String publishTime) {
        this.id = id;
        this.authorId = authorId;
        this.approveNum = approveNum;
        this.editTime = editTime;
        this.commentId = commentId;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.publishTime = publishTime;
    }
}
