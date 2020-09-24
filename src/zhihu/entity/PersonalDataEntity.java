package zhihu.entity;

public class PersonalDataEntity {
	private String id;
	private String introduce;
	private String sex;
	private String address;
	private String industry;
	private String professionalExperience;
	private String educationExperience;
	private String personalCertificate;
	private String personalExperience;
	private String editTime;
	public PersonalDataEntity(String id, String introduce, String sex,
			String address, String industry, String professionalExperience,
			String educationExperience, String personalCertificate,
			String personalExperience, String editTime) {
		super();
		this.id = id;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	
}
