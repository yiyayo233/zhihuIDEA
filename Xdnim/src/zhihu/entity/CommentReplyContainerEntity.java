package zhihu.entity;

public class CommentReplyContainerEntity {
    private CommentReplyEntity commentReplyEntity;
    private UserEntity userEntity;
    private UserEntity userReplyEntity;

    public CommentReplyContainerEntity(CommentReplyEntity commentReplyEntity, UserEntity userEntity, UserEntity userReplyEntity) {
        this.commentReplyEntity = commentReplyEntity;
        this.userEntity = userEntity;
        this.userReplyEntity = userReplyEntity;
    }

    public CommentReplyEntity getCommentReplyEntity() {
        return commentReplyEntity;
    }

    public void setCommentReplyEntity(CommentReplyEntity commentReplyEntity) {
        this.commentReplyEntity = commentReplyEntity;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    public UserEntity getUserReplyEntity() {
        return userReplyEntity;
    }

    public void setUserReplyEntity(UserEntity userReplyEntity) {
        this.userReplyEntity = userReplyEntity;
    }
}
