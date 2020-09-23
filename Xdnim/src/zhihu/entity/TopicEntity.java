package zhihu.entity;

public class TopicEntity {
    private String id;
    private String topicTitle;
    private String topicIntro;
    private int questionNum;
    private int followNum;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTopicTitle() {
        return topicTitle;
    }

    public void setTopicTitle(String topicTitle) {
        this.topicTitle = topicTitle;
    }

    public String getTopicIntro() {
        return topicIntro;
    }

    public void setTopicIntro(String topicIntro) {
        this.topicIntro = topicIntro;
    }

    public int getQuestionNum() {
        return questionNum;
    }

    public void setQuestionNum(int questionNum) {
        this.questionNum = questionNum;
    }

    public int getFollowNum() {
        return followNum;
    }

    public void setFollowNum(int followNum) {
        this.followNum = followNum;
    }

    public TopicEntity(String id, String topicTitle, String topicIntro, int questionNum, int followNum) {
        this.id = id;
        this.topicTitle = topicTitle;
        this.topicIntro = topicIntro;
        this.questionNum = questionNum;
        this.followNum = followNum;
    }
}
