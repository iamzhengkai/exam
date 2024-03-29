package com.wcpdoc.exam.core.dao;

import java.util.List;

import com.wcpdoc.exam.core.dao.BaseDao;
import com.wcpdoc.exam.core.entity.MyExam;

/**
 * 我的考试数据访问层接口
 * 
 * v1.0 zhanghc 2017-06-19 16:28:29
 */
public interface MyExamDao extends BaseDao<MyExam>{

	/**
	 * 删除实体
	 * 
	 * v1.0 zhanghc 2017年6月26日下午2:11:44
	 * @param examId
	 * @param userId
	 * void
	 */
	void del(Integer examId, Integer userId);

	/**
	 * 获取我的考试
	 * 
	 * v1.0 zhanghc 2020年9月30日上午11:00:50
	 * @param examId
	 * @return List<MyExam>
	 */
	List<MyExam> getList(Integer examId);
	
}
