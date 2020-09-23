package zhihu.service;

import zhihu.dao.ApproveNumDao;

public class ApproveNumService {
    ApproveNumDao ApproveNumDao = new ApproveNumDao();
    public int setApproveNum(String a, String tableName, String id){
        return ApproveNumDao.setApproveNum(a, tableName, id);
    }
}
