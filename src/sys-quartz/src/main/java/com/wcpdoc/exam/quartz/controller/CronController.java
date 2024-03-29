package com.wcpdoc.exam.quartz.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.quartz.Job;
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
import com.wcpdoc.exam.core.entity.PageResultEx;
import com.wcpdoc.exam.core.exception.MyException;
import com.wcpdoc.exam.core.util.DateUtil;
import com.wcpdoc.exam.core.util.ValidateUtil;
import com.wcpdoc.exam.quartz.entity.Cron;
import com.wcpdoc.exam.quartz.service.CronService;
import com.wcpdoc.exam.quartz.util.QuartzUtil;

/**
 * 定时任务控制层
 * 
 * v1.0 zhanghc 2019-07-29 10:38:17
 */
@Controller
@RequestMapping("/cron")
public class CronController extends BaseController {
	private static final Logger log = LoggerFactory.getLogger(CronController.class);

	@Resource
	private CronService cronService;

	/**
	 * 到达定时任务列表页面
	 * 
	 * v1.0 zhanghc 2019-07-29 10:38:17
	 * 
	 * @return String
	 */
	@RequestMapping("/toList")
	public String toList() {
		try {
			return "quartz/cron/cronList";
		} catch (Exception e) {
			log.error("到达定时任务列表页面错误：", e);
			return "quartz/cron/cronList";
		}
	}

	/**
	 * 定时任务列表
	 * 
	 * v1.0 zhanghc 2019-07-29 10:38:17
	 * 
	 * @param pageIn
	 * @return PageOut
	 */
	@RequestMapping("/list")
	@ResponseBody
	public PageResult list(PageIn pageIn) {
		try {
			PageOut pageOut = cronService.getListpage(pageIn);
			List<Map<String, Object>> list = pageOut.getRows();
			for (Map<String, Object> map : list) {
				if ("1".equals(map.get("STATE").toString())) {
					map.put("STATE_NAME", "启动");
				} else if ("2".equals(map.get("STATE").toString())) {
					map.put("STATE_NAME", "停止");
				}
				
				String cron = map.get("CRON").toString();
				List<Date> timeList = QuartzUtil.getRecentTriggerTime(cron, 3);
				StringBuilder timeStr = new StringBuilder();
				for (Date date : timeList) {
					timeStr.append(DateUtil.formatDateCustom(date, DateUtil.FORMAT_DATE_TIME)).append("；");
				}
				map.put("RECENT_TRIGGER_TIME", timeStr.toString());
			}
			return new PageResultEx(true, "查询成功", pageOut);
		} catch (Exception e) {
			log.error("定时任务列表错误：", e);
			return new PageResult(false, "查询失败");
		}
	}

	/**
	 * 到达添加定时任务页面
	 * 
	 * v1.0 zhanghc 2019-07-29 10:38:17
	 * 
	 * @return String
	 */
	@RequestMapping("/toAdd")
	public String toAdd() {
		try {
			return "quartz/cron/cronEdit";
		} catch (Exception e) {
			log.error("到达添加定时任务页面错误：", e);
			return "quartz/cron/cronEdit";
		}
	}

	/**
	 * 完成添加定时任务
	 * 
	 * v1.0 zhanghc 2019-07-29 10:38:17
	 * 
	 * @param cron
	 * @return PageResult
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/doAdd")
	@ResponseBody
	public PageResult doAdd(Cron cron) {
		try {
			cron.setUpdateUserId(getCurUser().getId());
			cron.setUpdateTime(new Date());
			// 校验数据有效性
			if (!ValidateUtil.isValid(cron.getJobClass())) {
				throw new MyException("参数错误：jobClass");
			}
			if (!ValidateUtil.isValid(cron.getCron())) {
				throw new MyException("参数错误：cron");
			}

			Class<Job> jobClass = null;
			try {
				jobClass = (Class<Job>) Class.forName(cron.getJobClass());
			} catch (ClassNotFoundException e) {
				throw new MyException("无法实例化：" + cron.getJobClass());
			}
			if (!Job.class.isAssignableFrom(jobClass)) {
				throw new MyException("未实现Job接口：" + cron.getJobClass());
			}
			if (!QuartzUtil.validExpression(cron.getCron())) {
				throw new MyException("cron表达式错误：" + cron.getCron());
			}

			// 添加定时任务，默认不启动
			cron.setState(2);
			cronService.add(cron);
			return new PageResult(true, "添加成功");
		} catch (MyException e) {
			log.error("完成添加定时任务错误：{}", e.getMessage());
			return new PageResult(false, e.getMessage());
		} catch (Exception e) {
			log.error("完成添加定时任务错误：", e);
			return new PageResult(false, "未知异常！");
		}
	}

	/**
	 * 到达修改定时任务页面
	 * 
	 * v1.0 zhanghc 2019-07-29 10:38:17
	 * 
	 * @param model
	 * @param id
	 * @return String
	 */
	@RequestMapping("/toEdit")
	public String toEdit(Model model, Integer id) {
		try {
			Cron cron = cronService.getEntity(id);
			model.addAttribute("cron", cron);
			return "quartz/cron/cronEdit";
		} catch (Exception e) {
			log.error("到达修改定时任务页面错误：", e);
			return "quartz/cron/cronEdit";
		}
	}

	/**
	 * 完成修改定时任务
	 * 
	 * v1.0 zhanghc 2019-07-29 10:38:17
	 * 
	 * @param cron
	 * @return PageResult
	 */
	@RequestMapping("/doEdit")
	@ResponseBody
	public PageResult doEdit(Cron cron) {
		try {
			cronService.updateAndUpdate(cron);
			return new PageResult(true, "修改成功");
		} catch (MyException e) {
			log.error("完成修改定时任务错误：{}", e.getMessage());
			return new PageResult(false, e.getMessage());
		} catch (Exception e) {
			log.error("完成修改定时任务错误：", e);
			return new PageResult(false, "未知异常！");
		}
	}

	/**
	 * 完成删除定时任务
	 * 
	 * v1.0 zhanghc 2019-07-29 10:38:17
	 * 
	 * @param ids
	 * @return PageResult
	 */
	@RequestMapping("/doDel")
	@ResponseBody
	public PageResult doDel(Integer id) {
		try {
			cronService.delAndUpdate(id);
			return new PageResult(true, "删除成功");
		} catch (MyException e) {
			log.error("完成删除定时任务错误：{}", e.getMessage());
			return new PageResult(false, e.getMessage());
		} catch (Exception e) {
			log.error("完成删除定时任务错误：", e);
			return new PageResult(false, "未知异常！");
		}
	}
	
	/**
	 * 启动任务
	 * 
	 * v1.0 zhanghc 2019年9月12日下午5:30:34
	 * @param ids
	 * @return PageResult
	 */
	@RequestMapping("/startTask")
	@ResponseBody
	public PageResult startTask(Integer id) {
		try {
			cronService.startTask(id);
			return new PageResult(true, "启动成功");
		} catch (MyException e) {
			log.error("启动任务错误：{}", e.getMessage());
			return new PageResult(false, e.getMessage());
		} catch (Exception e) {
			log.error("启动任务错误：", e);
			return new PageResult(false, "未知异常！");
		}
	}
	
	/**
	 * 停止任务
	 * 
	 * v1.0 zhanghc 2019年9月12日下午5:30:34
	 * @param ids
	 * @return PageResult
	 */
	@RequestMapping("/stopTask")
	@ResponseBody
	public PageResult stopTask(Integer id) {
		try {
			cronService.stopTask(id);
			return new PageResult(true, "停止成功");
		} catch (MyException e) {
			log.error("停止任务错误：{}", e.getMessage());
			return new PageResult(false, e.getMessage());
		} catch (Exception e) {
			log.error("停止任务错误：", e);
			return new PageResult(false, "未知异常！");
		}
	}
	
	/**
	 * 执行一次
	 * 
	 * v1.0 zhanghc 2019年9月12日下午5:30:34
	 * @param ids
	 * @return PageResult
	 */
	@RequestMapping("/runOnceTask")
	@ResponseBody
	public PageResult runOnceTask(Integer id) {
		try {
			cronService.runOnceTask(id);
			return new PageResult(true, "执行成功");
		} catch (MyException e) {
			log.error("执行一次错误：{}", e.getMessage());
			return new PageResult(false, e.getMessage());
		} catch (Exception e) {
			log.error("执行一次错误：", e);
			return new PageResult(false, "未知异常！");
		}
	}
}
