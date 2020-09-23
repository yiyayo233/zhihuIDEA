package zhihu.entity;

public class QuestionEntity {
    private String id;
    private String authorId;
    private String questionTitle;
    private String questionIntro;
    private int approveNum;
    private int browseNum;
    private int followNum;
    private String commentId;
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

    public String getQuestionTitle() {
        return questionTitle;
    }

    public void setQuestionTitle(String questionTitle) {
        this.questionTitle = questionTitle;
    }

    public String getQuestionIntro() {
        return questionIntro;
    }

    public void setQuestionIntro(String questionIntro) {
        this.questionIntro = questionIntro;
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

    public int getFollowNum() {
        return followNum;
    }

    public void setFollowNum(int followNum) {
        this.followNum = followNum;
    }

    public String getCommentId() {
        return commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId;
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

    public QuestionEntity(String id, String authorId, String questionTitle, String questionIntro, int approveNum, int browseNum, int followNum, String commentId, String publishTime, int isFold) {
        this.id = id;
        this.authorId = authorId;
        this.questionTitle = questionTitle;
        this.questionIntro = questionIntro;
        this.approveNum = approveNum;
        this.browseNum = browseNum;
        this.followNum = followNum;
        this.commentId = commentId;
        this.publishTime = publishTime;
        this.isFold = isFold;
    }
}
