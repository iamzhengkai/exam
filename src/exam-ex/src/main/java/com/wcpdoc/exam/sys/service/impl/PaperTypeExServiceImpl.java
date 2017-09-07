package com.wcpdoc.exam.sys.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wcpdoc.exam.exam.entity.Paper;
import com.wcpdoc.exam.exam.entity.PaperType;
import com.wcpdoc.exam.exam.service.PaperService;
import com.wcpdoc.exam.exam.service.PaperTypeExService;

/**
 * 试卷分类扩展服务层实现
 * 
 * v1.0 zhanghc 2017-05-25 16:34:59
 */
@Service
public class PaperTypeExServiceImpl implements PaperTypeExService {

	@Resource
	private PaperService paperService;

	@Override
	public void delAndUpdate(PaperType paperType) {
		List<Paper> paperList = paperService.getList(paperType.getId());
		for(Paper paper : paperList){
			paper.setPaperTypeId(1);
		}
	}
}
