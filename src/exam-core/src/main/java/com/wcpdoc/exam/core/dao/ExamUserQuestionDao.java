package com.wcpdoc.exam.core.dao;

import java.util.List;

import com.wcpdoc.exam.core.dao.BaseDao;
import com.wcpdoc.exam.core.entity.ExamUserQuestion;

/**
 * 考试用户试题数据访问层接口
 * 
 * v1.0 zhanghc 2017-06-19 16:28:29
 */
public interface ExamUserQuestionDao extends BaseDao<ExamUserQuestion>{
	
	/**
	 * 获取考试用户试题列表
	 * 
	 * v1.0 zhanghc 2017年7月3日上午9:44:45
	 * @param examUserId
	 * @return List<ExamUserQuestion>
	 */
	List<ExamUserQuestion> getList(Integer examUserId);

	/**
	 * 删除考试用户试题
	 * 
	 * v1.0 zhanghc 2020年10月12日下午4:04:24
	 * @param examUserId void
	 */
	void delByExamUserId(Integer examUserId);

}
