package zhihu.entity;

public class BrowseEntity {
    private String browseId;
    private String userId;
    private String objectId;
    private String browseTime;
    private String objectType;
    private String authorId;

    public BrowseEntity(String browseId, String userId, String objectId, String browseTime, String objectType, String authorId) {
        this.browseId = browseId;
        this.userId = userId;
        this.objectId = objectId;
        this.browseTime = browseTime;
        this.objectType = objectType;
        this.authorId = authorId;
    }

    public String getBrowseId() {
        return browseId;
    }

    public void setBrowseId(String browseId) {
        this.browseId = browseId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getObjectId() {
        return objectId;
    }

    public void setObjectId(String objectId) {
        this.objectId = objectId;
    }

    public String getBrowseTime() {
        return browseTime;
    }

    public void setBrowseTime(String browseTime) {
        this.browseTime = browseTime;
    }

    public String getObjectType() {
        return objectType;
    }

    public void setObjectType(String objectType) {
        this.objectType = objectType;
    }

    public String getAuthorId() {
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }
}
