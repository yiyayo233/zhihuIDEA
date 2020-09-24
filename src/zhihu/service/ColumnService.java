package zhihu.service;

import java.util.List;

import zhihu.dao.ColumnDao;
import zhihu.entity.ColumnEntity;

public class ColumnService {
	ColumnDao dao = new ColumnDao();
	public List<ColumnEntity> select(){
		return dao.select();
	}
	public List<ColumnEntity> selectLimit(int curr,int size){
		return dao.selectLimit(curr,size);
	}
	public int getCount(){
		return dao.getCount();
	}
	public ColumnEntity selectById(String id){
		return dao.SelectById(id);
	}
}
