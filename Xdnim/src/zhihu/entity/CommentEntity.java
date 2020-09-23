package zhihu.entity;

public class CommentEntity {
    private String id;
    private String answerId;
    private String userId;
    private String affiliationId;
    private String commentContent;
    private int approveNum;
    private String commentTime;

    public CommentEntity(String id, String answerId, String userId, String affiliationId, String commentContent, int approveNum, String commentTime) {
        this.id = id;
        this.answerId = answerId;
        this.userId = userId;
        this.affiliationId = affiliationId;
        this.commentContent = commentContent;
        this.approveNum = approveNum;
        this.commentTime = commentTime;
    }



    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAnswerId() {
        return answerId;
    }

    public void setAnswerId(String answerId) {
        this.answerId = answerId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getAffiliationId() {
        return affiliationId;
    }

    public void setAffiliationId(String affiliationId) {
        this.affiliationId = affiliationId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
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
