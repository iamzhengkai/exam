package com.wcpdoc.exam.core.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.wcpdoc.exam.base.cache.DictCache;
import com.wcpdoc.exam.base.dao.UserDao;
import com.wcpdoc.exam.base.entity.User;
import com.wcpdoc.exam.core.dao.PaperDao;
import com.wcpdoc.exam.core.entity.PageIn;
import com.wcpdoc.exam.core.entity.PageOut;
import com.wcpdoc.exam.core.entity.Paper;
import com.wcpdoc.exam.core.entity.PaperQuestion;
import com.wcpdoc.exam.core.entity.Question;
import com.wcpdoc.exam.core.util.HibernateUtil;
import com.wcpdoc.exam.core.util.SqlUtil;
import com.wcpdoc.exam.core.util.SqlUtil.Order;
import com.wcpdoc.exam.core.util.ValidateUtil;

/**
 * 试卷数据访问层实现
 * 
 * zhanghc 2018年10月21日上午8:16:06
 */
@Repository
public class PaperDaoImpl extends RBaseDaoImpl<Paper> implements PaperDao {
	@Resource
	private UserDao userDao;
	
	@Override
	public PageOut getListpage(PageIn pageIn) {
		String sql = "SELECT PAPER.ID, PAPER.NAME, PAPER_TYPE.NAME AS PAPER_TYPE_NAME, PAPER.STATE, PAPER.PASS_SCORE, PAPER.TOTAL_SCORE, "
				+ "	PAPER.SCORE_A, PAPER.SCORE_A_REMARK, PAPER.SCORE_B, PAPER.SCORE_B_REMARK, PAPER.SCORE_C, PAPER.SCORE_C_REMARK, "
				+ "	PAPER.SCORE_D, PAPER.SCORE_D_REMARK, PAPER.SCORE_E, PAPER.SCORE_E_REMARK "
				+ "FROM EXM_PAPER PAPER "
				+ "LEFT JOIN EXM_PAPER_TYPE PAPER_TYPE ON PAPER.PAPER_TYPE_ID = PAPER_TYPE.ID ";
		
		SqlUtil sqlUtil = new SqlUtil(sql);
		sqlUtil.addWhere(ValidateUtil.isValid(pageIn.getOne()) && !"1".equals(pageIn.getOne()), "PAPER.PAPER_TYPE_ID = ?", pageIn.getOne())
				.addWhere(ValidateUtil.isValid(pageIn.getTwo()), "PAPER.NAME LIKE ?", "%" + pageIn.getTwo() + "%")
				.addWhere(ValidateUtil.isValid(pageIn.getThree()), "PAPER.STATE = ?", pageIn.getThree())
				.addWhere(ValidateUtil.isValid(pageIn.getFour()), "PAPER.ID = ?", pageIn.getFour())
				.addWhere(ValidateUtil.isValid(pageIn.getFive()), "PAPER.STATE = ?", pageIn.getTen())
				.addWhere("PAPER.STATE != ?", 0)
				.addOrder("PAPER.UPDATE_TIME", Order.DESC);
		
		if (ValidateUtil.isValid(pageIn.getTen())) {
			User user = userDao.getEntity(Integer.parseInt(pageIn.getTen()));
			StringBuilder partSql = new StringBuilder();
			List<Object> params = new ArrayList<>();
			partSql.append("(");
			partSql.append("PAPER_TYPE.USER_IDS LIKE ? ");
			params.add("%" + user.getId() + "%");
			
			partSql.append("OR PAPER_TYPE.ORG_IDS LIKE ? ");
			params.add("%" + user.getOrgId() + "%");
			
			if (ValidateUtil.isValid(user.getPostIds())) {
				String[] postIds = user.getPostIds().substring(1, user.getPostIds().length() - 1).split(",");
				for (String postId : postIds) {
					partSql.append("OR PAPER_TYPE.POST_IDS LIKE ? ");
					params.add("%" + postId + "%");
				}
			}
			partSql.append(")");
			
			sqlUtil.addWhere(partSql.toString(), params.toArray(new Object[params.size()]));
		}
		
		PageOut pageOut = getListpage(sqlUtil, pageIn);
		HibernateUtil.formatDict(pageOut.getRows(), DictCache.getIndexkeyValueMap(), "STATE", "STATE");
		return pageOut;
	}

	@Override
	public List<PaperQuestion> getPaperQuestionList(Integer id) {
		String sql = "SELECT * FROM EXM_PAPER_QUESTION WHERE PAPER_ID = ? ORDER BY NO ASC";
		return getList(sql, new Object[]{id}, PaperQuestion.class);
	}

	@Override
	public List<Question> getQuestionList(Integer id) {
		String sql = "SELECT QUESTION.* "
				+ "FROM EXM_PAPER_QUESTION PAPER_QUESTION "
				+ "INNER JOIN EXM_QUESTION QUESTION ON PAPER_QUESTION.QUESTION_ID = QUESTION.ID "
				+ "WHERE PAPER_QUESTION.PAPER_ID = ? AND PAPER_QUESTION.TYPE = 2";// AND QUESTION.STATE = 1 如果删除试题，试卷关联的试题也能看
		return getList(sql, new Object[]{id}, Question.class);
	}

	@Override
	public List<Paper> getList(Integer paperTypeId) {
		String sql = "SELECT * FROM EXM_PAPER WHERE STATE = 1 AND PAPER_TYPE_ID = ?";
		return getList(sql, new Object[] { paperTypeId }, Paper.class);
	}
}