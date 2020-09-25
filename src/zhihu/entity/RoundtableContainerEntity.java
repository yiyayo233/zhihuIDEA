package zhihu.entity;

import java.util.List;

public class RoundtableContainerEntity {
	private RoundtableEntity roundtableEntity;
	private List<QuestionEntity> questionEntitiyList;
	private int isFollow;

	public RoundtableEntity getRoundtableEntity() {
		return roundtableEntity;
	}
	public void setRoundtableEntity(RoundtableEntity roundtableEntity) {
		this.roundtableEntity = roundtableEntity;
	}

	public int getIsFollow() {
		return isFollow;
	}

	public void setIsFollow(int isFollow) {
		this.isFollow = isFollow;
	}

	public List<QuestionEntity> getQuestionEntitiyList() {
		return questionEntitiyList;
	}

	public void setQuestionEntitiyList(List<QuestionEntity> questionEntitiyList) {
		this.questionEntitiyList = questionEntitiyList;
	}

	public RoundtableContainerEntity(RoundtableEntity roundtableEntity,
									 List<QuestionEntity> questionEntitiyList) {
		super();
		this.roundtableEntity = roundtableEntity;
		this.questionEntitiyList = questionEntitiyList;
	}

	public RoundtableContainerEntity(RoundtableEntity roundtableEntity, List<QuestionEntity> questionEntitiyList, int isFollow) {
		this.roundtableEntity = roundtableEntity;
		this.questionEntitiyList = questionEntitiyList;
		this.isFollow = isFollow;
	}
}
