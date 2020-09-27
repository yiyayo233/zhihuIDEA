package zhihu.service;

import zhihu.dao.PersonalDataDao;
import zhihu.entity.PersonalDataEntity;

public class PersonalDataService {
    PersonalDataDao PersonalDataDao = new PersonalDataDao();
    public int AddPersonalDataDao(String id, String introduce, String sex,String address, String industry, String professionalExperience,String educationExperience, String personalCertificate,String personalExperience, String editTime) {
        return PersonalDataDao.AddPersonalDataDao(id, introduce, sex, address, industry, professionalExperience, educationExperience, personalCertificate, personalExperience, editTime);
    }
}
