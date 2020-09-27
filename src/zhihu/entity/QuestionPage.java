package zhihu.entity;

public class QuestionPage {
    private AnswerEntity answerEntity;
    private UserEntity userEntity;
    private int commentNum;
    private int isFollow;

    public QuestionPage(AnswerEntity answerEntity, UserEntity userEntity, int commentNum, int isFollow) {
        this.answerEntity = answerEntity;
        this.userEntity = userEntity;
        this.commentNum = commentNum;
        this.isFollow = isFollow;
    }

    public AnswerEntity getAnswerEntity() {
        return answerEntity;
    }

    public void setAnswerEntity(AnswerEntity answerEntity) {
        this.answerEntity = answerEntity;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    public int getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(int commentNum) {
        this.commentNum = commentNum;
    }

    public int getIsFollow() {
        return isFollow;
    }

    public void setIsFollow(int isFollow) {
        this.isFollow = isFollow;
    }
}
