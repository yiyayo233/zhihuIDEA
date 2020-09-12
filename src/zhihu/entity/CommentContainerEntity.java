package zhihu.entity;

import java.util.List;

public class CommentContainerEntity {
    private CommentEntity commentEntity;
    private UserEntity userEntity;
    private List<CommentReplyContainerEntity> commentReplyContainerEntityList;

    public CommentContainerEntity(CommentEntity commentEntity, UserEntity userEntity, List<CommentReplyContainerEntity> commentReplyContainerEntityList) {
        this.commentEntity = commentEntity;
        this.userEntity = userEntity;
        this.commentReplyContainerEntityList = commentReplyContainerEntityList;
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

    public List<CommentReplyContainerEntity> getCommentReplyContainerEntityList() {
        return commentReplyContainerEntityList;
    }

    public void setCommentReplyContainerEntityList(List<CommentReplyContainerEntity> commentReplyContainerEntityList) {
        this.commentReplyContainerEntityList = commentReplyContainerEntityList;
    }
}
