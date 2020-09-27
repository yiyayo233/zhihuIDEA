package zhihu.entity;

import java.util.List;

public class HeaderPage {
    private List<QuestionEntity> questionEntityList;
    private List<AnswerEntity> answerEntityList;
    private List<CommentEntity> commentEntityList;
    private List<UserEntity> userEntityList;

    private QuestionEntity questionEntity;
    private AnswerEntity answerEntity;
    private CommentEntity commentEntity;
    private UserEntity userEntity;
    private int CommentNum;
    private int isFollow;

    public HeaderPage(QuestionEntity questionEntity, AnswerEntity answerEntity, CommentEntity commentEntity, UserEntity userEntity) {
        this.questionEntity = questionEntity;
        this.answerEntity = answerEntity;
        this.commentEntity = commentEntity;
        this.userEntity = userEntity;
    }

    public HeaderPage(QuestionEntity questionEntity, AnswerEntity answerEntity, UserEntity userEntity, int commentNum, int isFollow) {
        this.questionEntity = questionEntity;
        this.answerEntity = answerEntity;
        this.userEntity = userEntity;
        CommentNum = commentNum;
        this.isFollow = isFollow;
    }

    public List<UserEntity> getUserEntityList() {
        return userEntityList;
    }

    public void setUserEntityList(List<UserEntity> userEntityList) {
        this.userEntityList = userEntityList;
    }

    public QuestionEntity getQuestionEntity() {
        return questionEntity;
    }

    public void setQuestionEntity(QuestionEntity questionEntity) {
        this.questionEntity = questionEntity;
    }

    public AnswerEntity getAnswerEntity() {
        return answerEntity;
    }

    public void setAnswerEntity(AnswerEntity answerEntity) {
        this.answerEntity = answerEntity;
    }

    public CommentEntity getCommentEntity() {
        return commentEntity;
    }

    public void setCommentEntity(CommentEntity commentEntity) {
        this.commentEntity = commentEntity;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    public int getCommentNum() {
        return CommentNum;
    }

    public void setCommentNum(int commentNum) {
        CommentNum = commentNum;
    }

    public List<QuestionEntity> getQuestionEntityList() {
        return questionEntityList;
    }

    public void setQuestionEntityList(List<QuestionEntity> questionEntityList) {
        this.questionEntityList = questionEntityList;
    }

    public List<AnswerEntity> getAnswerEntityList() {
        return answerEntityList;
    }

    public void setAnswerEntityList(List<AnswerEntity> answerEntityList) {
        this.answerEntityList = answerEntityList;
    }

    public List<CommentEntity> getCommentEntityList() {
        return commentEntityList;
    }

    public void setCommentEntityList(List<CommentEntity> commentEntityList) {
        this.commentEntityList = commentEntityList;
    }

    public int getIsFollow() {
        return isFollow;
    }

    public void setIsFollow(int isFollow) {
        this.isFollow = isFollow;
    }
}
