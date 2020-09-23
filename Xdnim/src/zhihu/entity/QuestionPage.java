package zhihu.entity;

public class QuestionPage {
    private AnswerEntity answerEntity;
    private UserEntity userEntity;
    private int commentNum;

    public QuestionPage(AnswerEntity answerEntity, UserEntity userEntity, int commentNum) {
        this.answerEntity = answerEntity;
        this.userEntity = userEntity;
        this.commentNum = commentNum;
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
}
