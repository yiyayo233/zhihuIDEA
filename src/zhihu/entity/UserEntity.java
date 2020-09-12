package zhihu.entity;

public class UserEntity {
	private String id;
	private String name;
	private String password;
	private String chatHead;
	private String phone;
	private String email;

	private String industry;



	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getChatHead() {
		return chatHead;
	}
	public void setChatHead(String chatHead) {
		this.chatHead = chatHead;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public UserEntity(String id, String name, String password, String chatHead,
			String phone, String email) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.chatHead = chatHead;
		this.phone = phone;
		this.email = email;
	}

	public UserEntity(String id, String name, String chatHead) {
		this.id = id;
		this.name = name;
		this.chatHead = chatHead;
	}

	public UserEntity(String id, String name, String chatHead, String industry) {
		this.id = id;
		this.name = name;
		this.chatHead = chatHead;
		this.industry = industry;
	}
}
