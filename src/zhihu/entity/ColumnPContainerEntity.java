package zhihu.entity;

import java.util.List;

public class ColumnPContainerEntity {
	private ColumnEntity columnEntity;
	private List<PEntity> pList;
	public ColumnPContainerEntity(ColumnEntity columnEntity, List<PEntity> pList) {
		super();
		this.columnEntity = columnEntity;
		this.pList = pList;
	}
	public ColumnEntity getColumnEntity() {
		return columnEntity;
	}
	public void setColumnEntity(ColumnEntity columnEntity) {
		this.columnEntity = columnEntity;
	}
	public List<PEntity> getpList() {
		return pList;
	}
	public void setpList(List<PEntity> pList) {
		this.pList = pList;
	}
	
}
