package cn.itbaizhan.common;

import java.util.List;
import java.util.Map;

import org.nutz.dao.pager.Pager;

public class Page extends Pager{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public Page(Pager pager) {
		setPageNumber(pager.getPageNumber());
		setPageSize(pager.getPageSize());
		setRecordCount(pager.getRecordCount());
	}
	
	@SuppressWarnings("rawtypes")
	private List<Map> list;

	public List<Map> getList() {
		return list;
	}

	public void setList(List<Map> list) {
		this.list = list;
	}
	
	
}
