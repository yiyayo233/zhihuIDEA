package zhihu.service;

import java.util.List;

import zhihu.dao.PDao;
import zhihu.entity.PEntity;

public class PService {

	PDao dao = new PDao();
	public PEntity selectById(String id){
		return dao.selectById(id);
	}
}
