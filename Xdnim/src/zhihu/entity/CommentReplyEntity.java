package zhihu.entity;

public class CommentReplyEntity {
    private String rId;
    private String id;
    private String userId;
    private String replyuserId;
    private String content;
    private int approveNum;
    private String commentTime;

    public CommentReplyEntity(String rId, String id, String userId, String replyuserId, String content, int approveNum, String commentTime) {
        this.rId = rId;
        this.id = id;
        this.userId = userId;
        this.replyuserId = replyuserId;
        this.content = content;
        this.approveNum = approveNum;
        this.commentTime = commentTime;
    }

    public String getrId() {
        return rId;
    }

    public void setrId(String rId) {
        this.rId = rId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getReplyuserId() {
        return replyuserId;
    }

    public void setReplyuserId(String replyuserId) {
        this.replyuserId = replyuserId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getApproveNum() {
        return approveNum;
    }

    public void setApproveNum(int approveNum) {
        this.approveNum = approveNum;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }
}
