package com.wcpdoc.exam.core.service;

import java.math.BigDecimal;
import java.util.List;

import com.wcpdoc.exam.core.entity.Exam;
import com.wcpdoc.exam.core.entity.LoginUser;
import com.wcpdoc.exam.core.entity.PageIn;
import com.wcpdoc.exam.core.entity.PageOut;
/**
 * 考试服务层接口
 * 
 * v1.0 zhanghc 2017-06-11 09:13:23
 */
public interface ExamService extends BaseService<Exam>{
	
	/**
	 * 获取考试用户列表 
	 * 
	 * v1.0 zhanghc 2017年6月16日下午5:02:45
	 * @param pageIn
	 * @return PageOut
	 */
	PageOut getUserListpage(PageIn pageIn);

	/**
	 * 完成考试配置
	 * 
	 * v1.0 zhanghc 2017年6月19日下午3:10:24
	 * @param id 
	 * @param userIds
	 * @param markUserIds
	 * void
	 */
	void doCfg(Integer id, Integer[] userIds, Integer[] markUserIds);

	/**
	 * 完成试卷
	 * 
	 * v1.0 zhanghc 2017年7月3日下午11:17:50
	 * @param user
	 * @param examUserId
	 * void
	 */
	void doPaper(LoginUser user, Integer examUserId);
	
	/**
	 * 完成强制交卷
	 * 
	 * v1.0 zhanghc 2017年8月28日上午10:37:27
	 * @param user
	 * @param examUserId
	 * void
	 */
	void doForcePaper(LoginUser user);

	/**
	 * 更新阅卷分数
	 * 
	 * v1.0 zhanghc 2017年7月4日下午5:47:22
	 * @param user
	 * @param examUserQuestionId
	 * @param score
	 * void
	 */
	void updateMarkScore(LoginUser user, Integer examUserQuestionId, BigDecimal score);

	/**
	 * 完成阅卷
	 * 
	 * v1.0 zhanghc 2017年7月4日下午9:53:24
	 * @param user 
	 * @param examUserId
	 * void
	 */
	void doMark(LoginUser user, Integer examUserId);

	/**
	 * 获取考试列表
	 * 
	 * v1.0 zhanghc 2017年8月6日下午10:03:09
	 * @param examTypeId
	 * @return List<Exam>
	 */
	List<Exam> getList(Integer examTypeId);

	/**
	 * 获取成绩列表
	 * 
	 * v1.0 zhanghc 2017年8月29日下午3:16:12
	 * @param pageIn
	 * @return PageOut
	 */
	PageOut getGradeListpage(PageIn pageIn);

}
