package com.eagle.community.user.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
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

import com.eagle.community.dao.BaseDaoImpl;
import com.eagle.community.news.entity.CommunityNews;
import com.eagle.community.user.entity.Pagination;
import com.eagle.community.user.entity.Child;
import com.eagle.community.user.entity.User;
import com.eagle.community.user.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Resource(name = "userService")
	private UserService userService;

	private static final Logger logger = LogManager
			.getLogger(BaseDaoImpl.class);

	// 根据用户id查找一个用户，并返回json数据
	@RequestMapping(value = "/{id}.json", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody User getUserJson(@PathVariable("id") String id) {
		logger.info("getUserJson method is invoked ");
		User user = userService.findUserById(id);
		return user;
	}

	// 根据用户id查找一个用户，并返回视图
	@RequestMapping(value = "/{id}")
	public ModelAndView getUser(@PathVariable("id") String id) {
		logger.info("getUser method is invoked ");
		User user = userService.findUserById(id);
		ModelAndView view = new ModelAndView("");//这里调用这个方法的场景是管理员查看用户的详细信息
		view.addObject("userDetail", user);
		return view;
	}

	// 创建一个新用户的请求
	@RequiresRoles("admin")
	@RequestMapping(value="/create",method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody User createUser(@RequestBody User user) {
		System.out.println(user.getBitrhday());
		//user.setBitrhday(new Date(System.currentTimeMillis()));
		//String s = new SimpleDateFormat("yyyy-MM-dd").format(user.getBitrhday());
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String s=sdf.format(user.getBitrhday());


		try {
			user.setBitrhday(sdf.parse(s)); 
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		System.out.println(user);
		User temp = userService.createUser(user);
		return temp;
	}

	// 更新一个已有的用户信息的
	@RequiresRoles("admin")
	@RequestMapping(value = "/update", method = RequestMethod.POST)// 没有使用put是因为不同浏览器支持的原因
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody User updateUser(@RequestBody User user) {
		User temp = userService.updateUser(user);
		return temp;
	}

	//跳转到添加子女信息
	@RequiresRoles(value = "admin")
	@RequestMapping(value = "/skiptoadd/{userid}", method = RequestMethod.GET)
	public ModelAndView startAddHeathlProfile(@PathVariable("userid") String userid,HttpSession session) {
		ModelAndView hp = new ModelAndView("admin/user/addchildinfo");
		//hp.addObject("userid",userid);
		session.setAttribute("userid", userid);
		System.out.println("-------"+userid);
		return hp;
	}
	
	// 为某个用户添加子女信息
	@RequiresRoles("admin")
	@RequestMapping(value = "/addChild", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody User addChild(@RequestBody Child childs,HttpSession session) {
		String id = (String) session.getAttribute("userid");
		System.out.println("第二次"+id);
		return userService.addChildForUser(id, childs);
	}
	
	// 查看子女信息
		@RequiresRoles("admin")
		@RequestMapping(value = "/querychild/{id}", method = RequestMethod.GET)
		@ResponseStatus(HttpStatus.OK)
		public  ModelAndView queryChild(@PathVariable String id) {
			ModelAndView model = new ModelAndView("admin/user/childquery");
			System.out.println("子女信息"+id);
			User user = userService.findUserById(id);

			if(user.getChildren().size()!=0){
				System.out.println(user.getChildren().size());
				Set<Child> set = user.getChildren();
				Iterator<Child> it = set.iterator();
				while(it.hasNext()){
					Child child = it.next();
					model.addObject("childinfo",child);
					System.out.println(child);
				}
				
			}
			return model;
		}
	
		//添加成功
		@RequiresRoles("admin")
		@RequestMapping(value = "/success", method = RequestMethod.GET)
		public String getSuccess() {
			return "admin/common/success";
		}

	// 修改某个用户的某个子女的信息
	@RequiresRoles("admin")
	@RequestMapping(value = "/{id}/updateChild", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody User updateChild(@PathVariable("id") String id,
			@RequestBody Child childs) {
		User user = userService.updateChildForUser(id, childs);
		return user;
	}

	//添加用户主界面的跳转
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String startAddUser(){
		return "/admin/user/addUser";
	}
	

		
		// 查看链接的分页部分
		@RequiresRoles("admin")
		@RequestMapping(value = "/query/{currentPage}/{pageSize}", method = RequestMethod.GET)
		public ModelAndView queryNews(@PathVariable("currentPage") int currentPage,
				@PathVariable("pageSize") int pageSize) {
			ModelAndView view = new ModelAndView("admin/user/alistusers");
			Pagination pagination = userService.getUsers(currentPage,
					pageSize);
			view.addObject("admin_userInfo_pageInfo", pagination);
			return view;
		}	
		
		// 具体查看某用户信息
		@RequiresRoles("admin")
		@RequestMapping(value = "/queryuser/{id}", method = RequestMethod.GET)
		public ModelAndView queryNews(@PathVariable("id") String id) {
			ModelAndView view = new ModelAndView("admin/user/userquery");
			User user = userService.findUserById(id);
			String userid,childid;
			if(user.getHealthProfile()!=null){
				userid = user.getHealthProfile().getUserId();
			}else
				userid="0";
			if(user.getChildren().size()!=0){
				childid="1";
			}
			else
				childid="0";
			view.addObject("queryusercontent", user);
			view.addObject("hpuserid",userid);
			view.addObject("childid",childid);
			return view;
		}
		
		// 删除某用户
//		@RequiresRoles(value = "admin")
//		@RequestMapping(value = "/deleteuser/{id}", method = RequestMethod.POST)
//		@ResponseStatus(value = HttpStatus.OK)
//		public String deleteNews(@PathVariable("id") String id) {
//			User user = userService.findUserById(id);
//			if (user != null) {
//				if (userService.) {
//					logger.info("delete communityNews success");
//					return "delsuccess";
//				}
//				else {
//					logger.info("delete communityNews failed");
//					return "delfailure";
//				}
//			}
//
//			return "delfailure";
//		}
		
		
   //////////////
  //以下是前台界面的跳转
		@RequestMapping(value = "/skiptologin", method = RequestMethod.GET)
		public String skip(){
			return "/main/personpart/personlogin";
		}

		//点击查看信息实现的跳转
		@RequestMapping(value="/skipBasicInfo",method= RequestMethod.GET)
		public String skipToBI(){
			return "main/personpart/personbasicinfo";
		}
		
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public String login(String userName, String password,
				HttpServletRequest request, HttpSession session) {
			logger.info("/login is invoked");
			System.out.println(userName);
			User user = userService.authenticate(userName, password);
			if(user!=null){
				session.setAttribute("user", user);
				if(user.getChildren().size()!=0){
					Set<Child> set = user.getChildren();
					Iterator<Child> it =set.iterator();
					while(it.hasNext()){
						Child child = it.next();
						session.setAttribute("child", child);
					}
				}
				return "main/personpart/personmain";
			}
			else
				return "main/personpart/personlogin";
			}
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserServcie(UserService userServcie) {
		this.userService = userServcie;
	}

}
