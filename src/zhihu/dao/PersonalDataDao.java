package zhihu.dao;

public class PersonalDataDao extends BrowseDao{
    public int AddPersonalDataDao(String id, String introduce, String sex,String address, String industry, String professionalExperience,String educationExperience, String personalCertificate,String personalExperience, String editTime) {
        return execUpdate("insert personaldata values( ? , ? , ? , ? , ? , ?, ? , ? , ? , ?)", id, introduce, sex, address, industry, professionalExperience,educationExperience,personalCertificate,personalExperience,editTime);
    }
}
