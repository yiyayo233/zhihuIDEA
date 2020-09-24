package zhihu.entity;

import java.util.List;

public class ColumnPage {
	private List<ColumnEntity> cnList;
	private int prev;			//上一页
	private int next;			//下一页
	private int last;			//尾页
	private int total;			//总条数
	private int size;			//每页条数
	private int curr;			//当前页
	
	public ColumnPage(int curr,int size,List<ColumnEntity> cnList,int total){
		this.curr=curr;
		this.size=size;
		this.cnList=cnList;
		this.total=total;
		this.prev=curr-1==0?curr:curr-1;
		this.last=total%size==0?total/size:total/size+1;
		this.next=curr+1>this.last?this.last:curr+1;
	}
	
	public ColumnPage(List<ColumnEntity> cnList, int prev, int next, int last,
			int total, int size, int curr) {
		super();
		this.cnList = cnList;
		this.prev = prev;
		this.next = next;
		this.last = last;
		this.total = total;
		this.size = size;
		this.curr = curr;
	}
	public List<ColumnEntity> getCnList() {
		return cnList;
	}
	public void setCnList(List<ColumnEntity> cnList) {
		this.cnList = cnList;
	}
	public int getPrev() {
		return prev;
	}
	public void setPrev(int prev) {
		this.prev = prev;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getCurr() {
		return curr;
	}
	public void setCurr(int curr) {
		this.curr = curr;
	}
	
	
}
