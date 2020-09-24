package zhihu.entity;

import java.util.List;

public class RoundTableCompereContainerEntity {
	private RoundtableEntity RoundtableEntity;
	private List<UserEntity> compereList;

	public RoundTableCompereContainerEntity(
			zhihu.entity.RoundtableEntity roundtableEntity,
			List<UserEntity> compereList) {
		super();
		RoundtableEntity = roundtableEntity;
		this.compereList = compereList;
	}
	public RoundtableEntity getRoundtableEntity() {
		return RoundtableEntity;
	}
	public void setRoundtableEntity(RoundtableEntity roundtableEntity) {
		RoundtableEntity = roundtableEntity;
	}
	public List<UserEntity> getCompereList() {
		return compereList;
	}
	public void setCompereList(List<UserEntity> compereList) {
		this.compereList = compereList;
	}
		
}
