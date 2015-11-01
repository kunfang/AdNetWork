package com.ftc.ad.action;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ftc.ad.service.ChannelService;
import com.ftc.ad.vo.ChannelVO;
import com.ftc.ad.vo.DictionaryMap;
import com.ftc.ad.vo.DictionaryVO;
import com.ftc.foundation.view.PageUtil;

@Controller("channelController")
@RequestMapping("/channel.do")
public class ChannelController {
	private static final Logger logger = Logger.getLogger(ChannelController.class);
	
	@Resource
	private ChannelService service;
	public ChannelService getService() {
		return service;
	}
	public void setService(ChannelService service) {
		this.service = service;
	}
	
	@RequestMapping(params="method=createChannel")
	public String createChannel(Model model) {
		if (logger.isDebugEnabled()) {
			logger.debug("createChannel() - start"); //$NON-NLS-1$
		}
		
		List<DictionaryVO> platList = DictionaryMap.getDicListByType("channelplat");
		List<DictionaryVO> typeList = DictionaryMap.getDicListByType("channeltype");
		List<DictionaryVO> sizeList = DictionaryMap.getDicListByType("channelsize");
		
		model.addAttribute("platList",platList);
		model.addAttribute("typeList",typeList);
		model.addAttribute("sizeList",sizeList);
		
		if (logger.isDebugEnabled()) {
			logger.debug("createChannel() - start"); //$NON-NLS-1$
		}
		return "channel/ChannelEdit";
	}
	
	@RequestMapping(params="method=getChannelList") 
	public String getChannelList(ChannelVO channel, Model model,PageUtil pUtil){
		if (logger.isDebugEnabled()) {
			logger.debug("getChannelList(ChannelVO) - start"); //$NON-NLS-1$
		}
		
		try {
			channel.setStatus(20);
			channel.setVerifystatus(20);
			
			int totalQty = service.getChannelList(channel, null).size();
			
			List<ChannelVO> channelList = service.getChannelList(channel, pUtil);
			model.addAttribute("channelList",channelList);
			
			PageUtil pU = new PageUtil();
			HashMap<String, Integer> pageList = pU.getPageList( pUtil.getCurPage(), totalQty,pUtil.getPageSize());
			
			List<DictionaryVO> platList = DictionaryMap.getDicListByType("channelplat");
			List<DictionaryVO> typeList = DictionaryMap.getDicListByType("channeltype");
			List<DictionaryVO> sizeList = DictionaryMap.getDicListByType("channelsize");
			List<DictionaryVO> orderList = DictionaryMap.getDicListByType("ordertype");
			
			model.addAttribute("platList",platList);
			model.addAttribute("typeList",typeList);
			model.addAttribute("sizeList",sizeList);
			model.addAttribute("orderList",orderList);
			
			model.addAttribute("pageList",pageList);
			model.addAttribute("searchInfo",channel);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occur error when get channel list:"+e);
		}
		
		if (logger.isDebugEnabled()) {
			logger.debug("getChannelList(ChannelVO) - start"); //$NON-NLS-1$
		}
		return "channel/ChannelList";
	}
	
	@RequestMapping(params="method=getVerifyChannelList") 
	public String getVerifyChannelList(ChannelVO channel, Model model,PageUtil pUtil){
		if (logger.isDebugEnabled()) {
			logger.debug("getChannelList(ChannelVO) - start"); //$NON-NLS-1$
		}
		
		try {
			channel.setVerifystatus(10);
			
			List<ChannelVO> channelList = service.getChannelList(channel, pUtil);
			model.addAttribute("channelList",channelList);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occur error when get channel list:"+e);
		}
		
		if (logger.isDebugEnabled()) {
			logger.debug("getChannelList(ChannelVO) - start"); //$NON-NLS-1$
		}
		return "channel/VerifyChannelList";
	}
	
	@RequestMapping(params="method=getUserChannelList") 
	public String getUserChannelList(ChannelVO channel, Model model,PageUtil pUtil, HttpSession session){
		if (logger.isDebugEnabled()) {
			logger.debug("getUserChannelList(ChannelVO) - start"); //$NON-NLS-1$
		}
		
		try {
			Integer userid = (Integer)session.getAttribute("userId");
			channel.setUserID(userid);
			List<ChannelVO> channelList = service.getUserChannelList(channel, pUtil);
			model.addAttribute("channelList",channelList);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occur error when get channel list:"+e);
		}
		
		if (logger.isDebugEnabled()) {
			logger.debug("getUserChannelList(ChannelVO) - start"); //$NON-NLS-1$
		}
		return "channel/UserChannelList";
	}
	
	@RequestMapping(params="method=saveChannel") 
	public String saveChannel(ChannelVO channel){
		if (logger.isDebugEnabled()) {
			logger.debug("saveChannel(ChannelVO) - start"); //$NON-NLS-1$
		}
		try {
			if (channel.getChannelID() == null) {
				service.insertChannel(channel);
			} else {
				service.updateChannel(channel);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occur error when save channel:"+e);
		}
		if (logger.isDebugEnabled()) {
			logger.debug("saveChannel(ChannelVO) - start"); //$NON-NLS-1$
		}
		return "redirect:channel.do?method=getUserChannelList";
	}
	
	@RequestMapping(params="method=deleteChannel") 
	public String deleteChannel(ChannelVO channel){
		if (logger.isDebugEnabled()) {
			logger.debug("deleteChannel(ChannelVO) - start"); //$NON-NLS-1$
		}
		try {
			service.deleteChannel(channel);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occur error when delete channel:"+e);
		}
		if (logger.isDebugEnabled()) {
			logger.debug("deleteChannel(ChannelVO) - start"); //$NON-NLS-1$
		}
		return "redirect:channel.do?method=getUserChannelList";
	}
	
	@RequestMapping(params="method=updateChannel")
	public String updateChannel(ChannelVO channel){
		if (logger.isDebugEnabled()) {
			logger.debug("updateChannel(ChannelVO) - start"); //$NON-NLS-1$
		}
		try {
			service.updateChannel(channel);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occur error when update channel:"+e);
		}
		if (logger.isDebugEnabled()) {
			logger.debug("updateChannel(ChannelVO) - start"); //$NON-NLS-1$
		}
		if (channel.getStatus() != null) {
			return "redirect:channel.do?method=getUserChannelList";
		} else {
			return "redirect:channel.do?method=getVerifyChannelList";
		}
		
	}
	
	@RequestMapping(params="method=getChannelInfo")
	public String getChannelInfo (ChannelVO channel,Model model) {
		if (logger.isDebugEnabled()) {
			logger.debug("updateChannel(ChannelVO) - start"); //$NON-NLS-1$
		}
		try {
			ChannelVO info = service.getChannelByID(channel);
			
			List<DictionaryVO> platList = DictionaryMap.getDicListByType("channelplat");
			List<DictionaryVO> typeList = DictionaryMap.getDicListByType("channeltype");
			List<DictionaryVO> sizeList = DictionaryMap.getDicListByType("channelsize");
			
			model.addAttribute("platList",platList);
			model.addAttribute("typeList",typeList);
			model.addAttribute("sizeList",sizeList);
			
			model.addAttribute("channelInfo", info);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occur error when update channel:"+e);
		}
		if (logger.isDebugEnabled()) {
			logger.debug("updateChannel(ChannelVO) - start"); //$NON-NLS-1$
		}
		return "channel/ChannelEdit";
	}
}
