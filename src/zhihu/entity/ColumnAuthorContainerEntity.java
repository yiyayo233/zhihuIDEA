package zhihu.entity;

public class ColumnAuthorContainerEntity {
	private ColumnEntity columnEntity;
	private UserEntity AuthorEntity;
	public ColumnEntity getColumnEntity() {
		return columnEntity;
	}
	public void setColumnEntity(ColumnEntity columnEntity) {
		this.columnEntity = columnEntity;
	}
	public UserEntity getAuthorEntity() {
		return AuthorEntity;
	}
	public void setAuthorEntity(UserEntity authorEntity) {
		AuthorEntity = authorEntity;
	}
	public ColumnAuthorContainerEntity(ColumnEntity columnEntity,
			UserEntity authorEntity) {
		super();
		this.columnEntity = columnEntity;
		AuthorEntity = authorEntity;
	}
	
}
