package com.eagle.community.message.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.eagle.community.message.entity.Message;
import com.eagle.community.message.entity.Pagination;
import com.eagle.community.message.service.MessageService;
import com.eagle.community.news.entity.CommunityNews;
import com.eagle.community.user.entity.User;

//留言的controller
@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Resource
	private MessageService messageService;

	private static final Logger logger = LogManager
			.getLogger(MessageController.class);

	//以下是前台界面跳转，，，，，，，，，，，，，
	
	//跳转到留言主页面
	@RequestMapping(value = "/skip", method = RequestMethod.GET)
	public String startAddUser(){
		return "/main/personpart/onlinemessage";
	}
	
	//增加一条留言
	@RequestMapping( value="/add", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.CREATED)
	public @ResponseBody Message addMessage(
			@RequestBody String msg ,HttpServletRequest request, HttpSession session) {
		System.out.println(msg);
		User user =(User) session.getAttribute("user");
		System.out.println(user);
		Message message = new Message();
		Date currentTime = new Date(System.currentTimeMillis());
		message.setDate(currentTime);
		message.setContent(msg);
		message.setUser(user);
		System.out.println(message.getContent());
		return messageService.addMessage(message);
	}
	
	
	
	//以下是后台操作
	//根据id跳转到对应的留言界面	
	@RequestMapping( value="/querymsg/{currentPage}/{pageSize}", method = RequestMethod.GET)
	public ModelAndView getMessage(@PathVariable("currentPage") int currentPage,
			@PathVariable("pageSize") int pageSize){
		ModelAndView msglist = new ModelAndView("admin/user/alistmsg");
		Pagination pagination = messageService.getMsgs(currentPage, pageSize, true);
		msglist.addObject("message_pageInfo",pagination);
		return msglist;
	}
	
	
	public MessageService getMessageService() {
		return messageService;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	
	
	
}
