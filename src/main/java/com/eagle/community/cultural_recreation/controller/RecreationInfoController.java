package com.eagle.community.cultural_recreation.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.eagle.community.cultural_recreation.entity.Pagination;
import com.eagle.community.cultural_recreation.entity.RecreationInfo;
import com.eagle.community.cultural_recreation.service.RecreationInfoService;
import com.eagle.community.news.entity.CommunityNews;

@Controller
@RequestMapping(value = "/recreationInfo")
public class RecreationInfoController {

	@Resource
	private RecreationInfoService recreationInfoService;

	private static final Logger logger = LogManager
			.getLogger(RecreationInfoController.class);

	/* 公共的可访问的部分 */

	// 根据id查找并返回一条文化娱乐信息并以json形式返回
	@RequestMapping(value = "/{id}.json", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody RecreationInfo getInfoJson(@PathVariable("id") long id) {
		logger.info("getInfoJson is invoked");
		RecreationInfo info = recreationInfoService.getRecreationInfo(id);
		info.setCount(info.getCount() + 1);
		recreationInfoService.updateInfo(info);
		return info;
	}

	// 根据id查找一条文化娱乐信息并返回试图
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView getInfo(@PathVariable("id") int id) {
		logger.info("getInfo is invoked ");
		ModelAndView view = new ModelAndView("main/recreationpart/infocontent");// 视图的名城待定
		RecreationInfo info = recreationInfoService.getRecreationInfo(id);
		//info.setCount(info.getCount() + 1);
		view.addObject("recreationInfo", info);
		return view;
	}

	// 一次性获得指定条数的Info,(供主页显示用)
//	@RequestMapping(value = "/some/num", method = RequestMethod.GET)
//	@ResponseStatus(HttpStatus.OK)
//	public ModelAndView getSome(@PathVariable("num") int num) {
//		logger.info("getSome is invoked ");
//		ModelAndView model = new ModelAndView("main/recreationpart/culturerecreation");
//		List<RecreationInfo> list = recreationInfoService.getSome(num);
//		System.out.println("/////////////////////////////");
//		System.out.println(num);
//		model.addObject("CRinfo", list);
//		return model;
//	}
	
	// 请求主页文化娱乐的信息
		@RequestMapping(value = "/some/{id}", method = RequestMethod.GET)
	    @ResponseStatus(HttpStatus.OK)
		public ModelAndView getConmunityService(@PathVariable("id") int id) {
			ModelAndView model = new ModelAndView("main/recreationpart/culturerecreation");
			List<RecreationInfo> list = recreationInfoService.getSome(id);
			model.addObject("CRinfo", list);
			return model;

		}

	// 请求一页的文化娱乐信息,并在视图中显示
	@RequestMapping(value = "/list/{currentPage}/{pageSize}")
	public ModelAndView getOnePageInfo(
			@PathVariable("currentPage") int currentPage,
			@PathVariable("pageSize") int pageSize) {
		logger.info("getOnePageInfo is invoked");
		ModelAndView view = new ModelAndView("main/recreationpart/listinfo");// 视图的名称代填
		Pagination pagination = recreationInfoService.getOnPageInfo(
				currentPage, pageSize, true);
		view.addObject("recreationInfo_pageInfo", pagination);
		return view;
	}

	/* 一下定义的操作请求都是管理员权限才能执行的操作 包括增加修改和删除以及跳转 */

	// 新建动态的链接
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String startAddCultureRecreation() {
		return "admin/recreation/addinfo";
	}
	
	
	// 创建一条文化娱乐信息
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody RecreationInfo createInfo(
			@RequestBody RecreationInfo info) {
		logger.info("createInfo is invoked");
		Date now = new Date(System.currentTimeMillis());
		info.setReleaseTime(now);
		return recreationInfoService.addRecreationInfo(info);
	}

	// 更新一条已经存在的文化娱乐信息
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody RecreationInfo updateInfo(
			@RequestBody RecreationInfo info) {
		logger.info("updateInfo is invoked");
		return recreationInfoService.updateInfo(info);
	}

	
//	@RequestMapping(value="/delete",method=RequestMethod.POST)
//	public String deleteInfo(long id) {
//		logger.info("deleteInfo is invoked");
//		return "deleteSuccess";
//	}
	
	// 根据id删除一条已知的文化娱信息
	@RequiresRoles(value = "admin")
	@RequestMapping(value = "/deleteinfo/{id}", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.OK)
	public String deleteNews(@PathVariable("id") int id) {
		RecreationInfo info = recreationInfoService.getRecreationInfo(id);
		if (info != null) {
			if (recreationInfoService.deleteInfo(id)) {
				logger.info("delete recreationInfo success");
				return "delsuccess";
			}
			else {
				logger.info("delete recreationInfo failed");
				return "delfailure";
			}
		}

		return "delfailure";
	}

	// 查看的链接
	@RequiresRoles("admin")
	@RequestMapping(value = "/query", method = RequestMethod.GET)
	public String queryNews() {
		return "admin/recreation/queryallinfo";
	}
	
	// 具体查看某一条新闻
	@RequiresRoles("admin")
	@RequestMapping(value = "/queryinfo/{id}", method = RequestMethod.GET)
	public ModelAndView queryNews(@PathVariable("id") int id) {
		ModelAndView view = new ModelAndView("admin/recreation/infoquery");
		RecreationInfo info = recreationInfoService.getRecreationInfo(id);
		view.addObject("queryinfocontent", info);
		return view;
		}
	
	
	//供管理员查看管理方便的分页请求
	@RequestMapping(value="/query/{currentPage}/{pageSize}",method=RequestMethod.GET)
	public ModelAndView getOnePage(@PathVariable("currentPage") int currentPage,
			@PathVariable("pageSize") int pageSize){
		logger.info("getOnaPage is invoked ");
		ModelAndView view = new ModelAndView("admin/recreation/alistinfo");//视图名称待定
		Pagination pagination =recreationInfoService.getOnPageInfo(currentPage, pageSize, true);
		view .addObject("admin_recreationInfo_pageInfo", pagination);
		return view;
	}
	
	/*管理员管理操作的跳转部分*/
	
	
	public RecreationInfoService getRecreationInfoService() {
		return recreationInfoService;
	}

	public void setRecreationInfoService(
			RecreationInfoService recreationInfoService) {
		this.recreationInfoService = recreationInfoService;
	}

}
