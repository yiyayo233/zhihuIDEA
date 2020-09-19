package zhihu.entity;

public class BynamicEntity {
    private String id;
    private String userId;
    private String byBynamicId;
    private String bynamicTime;
    private String bynamicType;
    private String authorId;

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

    public String getByBynamicId() {
        return byBynamicId;
    }

    public void setByBynamicId(String byBynamicId) {
        this.byBynamicId = byBynamicId;
    }

    public String getBynamicTime() {
        return bynamicTime;
    }

    public void setBynamicTime(String bynamicTime) {
        this.bynamicTime = bynamicTime;
    }

    public String getBynamicType() {
        return bynamicType;
    }

    public void setBynamicType(String bynamicType) {
        this.bynamicType = bynamicType;
    }

    public String getAuthorId() {
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    public BynamicEntity(String id, String userId, String byBynamicId, String bynamicTime, String bynamicType, String authorId) {
        this.id = id;
        this.userId = userId;
        this.byBynamicId = byBynamicId;
        this.bynamicTime = bynamicTime;
        this.bynamicType = bynamicType;
        this.authorId = authorId;
    }
}
