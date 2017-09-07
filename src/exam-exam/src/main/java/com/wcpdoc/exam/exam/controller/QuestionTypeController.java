package com.wcpdoc.exam.exam.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wcpdoc.exam.core.controller.BaseController;
import com.wcpdoc.exam.core.entity.PageIn;
import com.wcpdoc.exam.core.entity.PageOut;
import com.wcpdoc.exam.core.entity.PageResult;
import com.wcpdoc.exam.exam.entity.QuestionType;
import com.wcpdoc.exam.exam.service.QuestionTypeService;
import com.wcpdoc.exam.sys.entity.User;

/**
 * 试题分类控制层
 * v1.0 zhanghc 2016-5-24下午14:54:09
 * 
 */
@Controller
@RequestMapping("/questionType")
public class QuestionTypeController extends BaseController{
	private static final Logger log = LoggerFactory.getLogger(QuestionTypeController.class);
	
	@Resource
	private QuestionTypeService questionTypeService;
	
	/**
	 * 到达试题分类列表页面 
	 * v1.0 zhanghc 2016-5-24下午14:54:09
	 * 
	 * @return String
	 */
	@RequestMapping("/toList")
	public String toList() {
		try {
			return "/WEB-INF/jsp/exam/questionType/questionTypeList.jsp";
		} catch (Exception e) {
			log.error("到达试题分类列表页面错误：", e);
			return "/WEB-INF/jsp/exam/questionType/questionTypeList.jsp";
		}
	}
	
	/**
	 * 获取试题分类树型列表
	 * v1.0 zhanghc 2016-5-24下午14:54:09
	 * 
	 * @return List<Map<String,Object>>
	 */
	@RequestMapping("/treeList")
	@ResponseBody
	public List<Map<String, Object>> treeList() {
		try {
			return questionTypeService.getTreeList();
		} catch (Exception e) {
			log.error("获取试题分类树型列表错误：", e);
			return new ArrayList<Map<String,Object>>();
		}
	}
	
	/**
	 * 试题分类列表 
	 * v1.0 zhanghc 2016-5-24下午14:54:09
	 * 
	 * @return pageOut
	 */
	@RequestMapping("/list")
	@ResponseBody
	public PageOut list(PageIn pageIn) {
		try {
			return questionTypeService.getListpage(pageIn);
		} catch (Exception e) {
			log.error("试题分类列表错误：", e);
			return new PageOut();
		}
	}
	
	/**
	 * 到达添加试题分类页面 
	 * v1.0 zhanghc 2016-5-24下午14:54:09
	 * 
	 * @return String
	 */
	@RequestMapping("/toAdd")
	public String toAdd() {
		try {
			return "/WEB-INF/jsp/exam/questionType/questionTypeEdit.jsp";
		} catch (Exception e) {
			log.error("到达添加试题分类页面错误", e);
			return "/WEB-INF/jsp/exam/questionType/questionTypeEdit.jsp";
		}
	}
	
	/**
	 * 完成添加试题分类
	 * v1.0 zhanghc 2016-5-24下午14:54:09
	 * 
	 * @return pageOut
	 */
	@RequestMapping("/doAdd")
	@ResponseBody
	public PageResult doAdd(QuestionType questionType) {
		try {
			questionType.setUpdateUserId(getCurrentUser().getId());
			questionType.setUpdateTime(new Date());
			questionType.setState(1);
			questionTypeService.saveAndUpdate(questionType);
			return new PageResult(true, "添加成功");
		} catch (Exception e) {
			log.error("完成添加试题分类错误：", e);
			return new PageResult(false, "添加失败：" + e.getMessage());
		}
	}
	
	/**
	 * 到达修改试题分类页面 
	 * v1.0 zhanghc 2016-5-24下午14:54:09
	 * 
	 * @return String
	 */
	@RequestMapping("/toEdit")
	public String toEdit(Model model, Integer id) {
		try {
			QuestionType questionType = questionTypeService.getEntity(id);
			model.addAttribute("questionType", questionType);
			QuestionType pQuestionType = questionTypeService.getEntity(questionType.getParentId());
			if(pQuestionType != null){
				model.addAttribute("pQuestionType", questionTypeService.getEntity(questionType.getParentId()));
			}
			return "/WEB-INF/jsp/exam/questionType/questionTypeEdit.jsp";
		} catch (Exception e) {
			log.error("到达修改试题分类页面错误", e);
			return "/WEB-INF/jsp/exam/questionType/questionTypeEdit.jsp";
		}
	}
	
	/**
	 * 完成修改试题分类
	 * v1.0 zhanghc 2016-5-24下午14:54:09
	 * 
	 * @return pageOut
	 */
	@RequestMapping("/doEdit")
	@ResponseBody
	public PageResult doEdit(QuestionType questionType) {
		try {
			QuestionType entity = questionTypeService.getEntity(questionType.getId());
			entity.setName(questionType.getName());
			entity.setUpdateTime(new Date());
			entity.setUpdateUserId(((User)getCurrentUser()).getId());
			entity.setNo(questionType.getNo());
			questionTypeService.editAndUpdate(entity);
			return new PageResult(true, "修改成功");
		} catch (Exception e) {
			log.error("完成修改试题分类错误：", e);
			return new PageResult(false, "修改失败：" + e.getMessage());
		}
	}
	
	/**
	 * 完成删除试题分类
	 * v1.0 zhanghc 2016-5-24下午14:54:09
	 * 
	 * @return pageOut
	 */
	@RequestMapping("/doDel")
	@ResponseBody
	public PageResult doDel(Integer[] ids) {
		try {
			questionTypeService.delAndUpdate(ids);
			return new PageResult(true, "删除成功");
		} catch (Exception e) {
			log.error("完成删除试题分类错误：", e);
			return new PageResult(false, "删除失败：" + e.getMessage());
		}
	}
	
	/**
	 * 到达移动试题分类页面
	 * 
	 * v1.0 zhanghc 2016-5-8上午11:00:00
	 * @return String
	 */
	@RequestMapping("/toMove")
	public String toMove() {
		try {
			return "/WEB-INF/jsp/exam/questionType/questionTypeMove.jsp";
		} catch (Exception e) {
			log.error("到达移动试题分类页面错误", e);
			return "/WEB-INF/jsp/exam/questionType/questionTypeMove.jsp";
		}
	}
	
	/**
	 * 获取试题分类树型列表
	 * 
	 * v1.0 zhanghc 2016-5-8上午11:00:00
	 * @return List<Map<String,Object>>
	 */
	@RequestMapping("/moveQuestionTypeTreeList")
	@ResponseBody
	public List<Map<String, Object>> moveQuestionTypeTreeList() {
		try {
			return questionTypeService.getTreeList();
		} catch (Exception e) {
			log.error("获取试题分类树型列表错误：", e);
			return new ArrayList<Map<String,Object>>();
		}
	}
	
	/**
	 * 移动试题分类
	 * v1.0 zhanghc 2016-5-24下午14:54:09
	 * @param sourceId
	 * @param targetId
	 * @return PageResult
	 */
	@RequestMapping("/doMove")
	@ResponseBody
	public PageResult doMove(Integer sourceId, Integer targetId) {
		try {
			questionTypeService.doMove(sourceId, targetId);
			return new PageResult(true, "移动成功");
		} catch (Exception e) {
			log.error("移动试题分类错误：", e);
			return new PageResult(false, "移动失败：" + e.getMessage());
		}
	}
}
