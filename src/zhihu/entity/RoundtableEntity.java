package zhihu.entity;

public class RoundtableEntity {
    private String id;
    private String roundtableTitle;
    private String roundtableIntro;
    private int browseNum;
    private int followNum;
    private String deginTime;
    private String endTime;
    private String isQuestion;
    private String roundtableImg;



    public String getId() {
        return id;
    }

    public void setRoundtableID(String id) {
        this.id = id;
    }

    public String getRoundtableTitle() {
        return roundtableTitle;
    }

    public void setRoundtableTitle(String roundtableTitle) {
        this.roundtableTitle = roundtableTitle;
    }

    public String getRoundtableIntro() {
        return roundtableIntro;
    }

    public void setRoundtableIntro(String roundtableIntro) {
        this.roundtableIntro = roundtableIntro;
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

    public String getDeginTime() {
        return deginTime;
    }

    public void setDeginTime(String deginTime) {
        this.deginTime = deginTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getIsQuestion() {
        return isQuestion;
    }

    public void setIsQuestion(String isQuestion) {
        this.isQuestion = isQuestion;
    }

    public String getRoundtableImg() {
        return roundtableImg;
    }

    public void setRoundtableImg(String roundtableImg) {
        this.roundtableImg = roundtableImg;
    }
    public RoundtableEntity(String id, String roundtableTitle, String roundtableIntro, int browseNum, int followNum, String deginTime, String endTime, String isQuestion,String RoundtableImg) {
        this.id = id;
        this.roundtableTitle = roundtableTitle;
        this.roundtableIntro = roundtableIntro;
        this.browseNum = browseNum;
        this.followNum = followNum;
        this.deginTime = deginTime;
        this.endTime = endTime;
        this.isQuestion = isQuestion;
        this.roundtableImg=RoundtableImg;
    }
}
