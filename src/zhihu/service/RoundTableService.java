package zhihu.service;


import java.util.List;

import zhihu.dao.RoundTableDao;
import zhihu.entity.RoundtableEntity;

public class RoundTableService {
	RoundTableDao dao = new RoundTableDao();
	public List<RoundtableEntity> select(){
		return dao.select();
	}

	public List<RoundtableEntity> allselect(){
		return dao.allselect();
	}

	public RoundtableEntity select(String id){
		return dao.selectById(id);
	}
}
