package zhihu.entity;

public class ColumnEntity {
	private String id;
	private String columnTItle;
	private String columnSlogan;
	private String columnLOGO;
	private int followNum;
	public ColumnEntity(String id, String columnTItle, String columnSlogan,
			String columnLOGO, int followNum) {
		super();
		this.id = id;
		this.columnTItle = columnTItle;
		this.columnSlogan = columnSlogan;
		this.columnLOGO = columnLOGO;
		this.followNum = followNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getColumnTItle() {
		return columnTItle;
	}
	public void setColumnTItle(String columnTItle) {
		this.columnTItle = columnTItle;
	}
	public String getColumnSlogan() {
		return columnSlogan;
	}
	public void setColumnSlogan(String columnSlogan) {
		this.columnSlogan = columnSlogan;
	}
	public String getColumnLOGO() {
		return columnLOGO;
	}
	public void setColumnLOGO(String columnLOGO) {
		this.columnLOGO = columnLOGO;
	}
	public int getFollowNum() {
		return followNum;
	}
	public void setFollowNum(int followNum) {
		this.followNum = followNum;
	}
	
}
