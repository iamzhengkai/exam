package com.wcpdoc.exam.sys.dao;

import java.util.List;
import java.util.Map;

import com.wcpdoc.exam.core.dao.BaseDao;
import com.wcpdoc.exam.sys.entity.Org;
import com.wcpdoc.exam.sys.entity.User;

/**
 * 用户数据访问层接口
 * 
 * v1.0 zhanghc 2016-6-15下午17:24:19
 */
public interface UserDao extends BaseDao<User>{

	/**
	 * 获取组织机构
	 * v1.0 zhanghc 2016-6-15下午17:24:19
	 * @param id
	 * @return Org
	 */
	Org getOrg(Integer id);

	/**
	 * 获取所有组织机构
	 * v1.0 zhanghc 2016-6-15下午17:24:19
	 * @param ids
	 * @return List<Org>
	 */
	List<Org> getAllOrg(Integer[] ids);
	
	/**
	 * 获取岗位树型列表
	 * v1.0 zhanghc 2016-6-15下午17:24:19
	 * @param orgId
	 * @return List<Map<String,Object>>
	 */
	List<Map<String, Object>> getPostUpdateTreeList(Integer orgId);

	/**
	 * 获取用户列表
	 * v1.0 zhanghc 2016-6-15下午17:24:19
	 * @param orgId
	 * @return List<User>
	 */
	List<User> getOrgUserList(Integer orgId);

	/**
	 * 获取用户
	 * v1.0 zhanghc 2016年7月13日下午5:12:23
	 * @param loginName
	 * @return User
	 */
	User getUser(String loginName);

	/**
	 * 获取权限总和
	 * v1.0 zhanghc 2016年8月12日上午10:58:49
	 * @param id
	 * @return List<Map<String, Object>>
	 */
	List<Map<String, Object>> getAuthSum(Integer id);
}
