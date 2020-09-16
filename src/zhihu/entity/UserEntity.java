package zhihu.entity;

public class UserEntity {
	private String id;
	private String name;
	private String password;
	private String chatHead;
	private String phone;
	private String email;

	private String userID;
	private String introduce;
	private String sex;
	private String address;
	private String industry;
	private String professionalExperience;
	private String educationExperience;
	private String personalCertificate;
	private String personalExperience;
	private String editTime;

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


	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getProfessionalExperience() {
		return professionalExperience;
	}

	public void setProfessionalExperience(String professionalExperience) {
		this.professionalExperience = professionalExperience;
	}

	public String getEducationExperience() {
		return educationExperience;
	}

	public void setEducationExperience(String educationExperience) {
		this.educationExperience = educationExperience;
	}

	public String getPersonalCertificate() {
		return personalCertificate;
	}

	public void setPersonalCertificate(String personalCertificate) {
		this.personalCertificate = personalCertificate;
	}

	public String getPersonalExperience() {
		return personalExperience;
	}

	public void setPersonalExperience(String personalExperience) {
		this.personalExperience = personalExperience;
	}

	public String getEditTime() {
		return editTime;
	}

	public void setEditTime(String editTime) {
		this.editTime = editTime;
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

	public UserEntity(String id, String name, String password, String chatHead, String phone, String email, String userID, String introduce, String sex, String address, String industry, String professionalExperience, String educationExperience, String personalCertificate, String personalExperience, String editTime) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.chatHead = chatHead;
		this.phone = phone;
		this.email = email;
		this.userID = userID;
		this.introduce = introduce;
		this.sex = sex;
		this.address = address;
		this.industry = industry;
		this.professionalExperience = professionalExperience;
		this.educationExperience = educationExperience;
		this.personalCertificate = personalCertificate;
		this.personalExperience = personalExperience;
		this.editTime = editTime;
	}
}
