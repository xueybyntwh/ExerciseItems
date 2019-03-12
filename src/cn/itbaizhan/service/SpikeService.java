package cn.itbaizhan.service;

import java.util.List;
import java.util.Map;

import org.nutz.ioc.loader.annotation.IocBean;

@IocBean(name="spikeService",fields={"dao"})
public class SpikeService extends BaseService{

	/**
	*查询全部人
	*/
	public List<Map<String, String>> findListUsers(){
		return null;
	}
	
	
}
