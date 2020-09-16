package zhihu.entity;

public class BynamicContainerEntity {
    private BynamicEntity bynamicEntity;
    private QuestionEntity questionEntity;
    private HeaderPage headerPage;

    public BynamicEntity getBynamicEntity() {
        return bynamicEntity;
    }
    public void setBynamicEntity(BynamicEntity bynamicEntity) {
        this.bynamicEntity = bynamicEntity;
    }

    public QuestionEntity getQuestionEntity() {
        return questionEntity;
    }
    public void setQuestionEntity(QuestionEntity questionEntity) {
        this.questionEntity = questionEntity;
    }

    public HeaderPage getHeaderPage() {
        return headerPage;
    }
    public void setHeaderPage(HeaderPage headerPage) {
        this.headerPage = headerPage;
    }

    public BynamicContainerEntity(BynamicEntity bynamicEntity, QuestionEntity questionEntity) {
        this.bynamicEntity = bynamicEntity;
        this.questionEntity = questionEntity;
    }

    public BynamicContainerEntity(BynamicEntity bynamicEntity, HeaderPage headerPage) {
        this.bynamicEntity = bynamicEntity;
        this.headerPage = headerPage;
    }
}
