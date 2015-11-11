package com.ftc.ad.action;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ftc.ad.service.AdvertiserService;
import com.ftc.ad.vo.AdvertiserVO;
import com.ftc.ad.vo.DictionaryMap;
import com.ftc.ad.vo.DictionaryVO;
import com.ftc.foundation.view.PageUtil;

@Controller("advertiserController")
@RequestMapping("/advertiser.do")
public class AdvertiserController {
	private static final Logger logger = Logger.getLogger(AdvertiserController.class);
	
	@Resource
	private AdvertiserService service;
	public AdvertiserService getService() {
		return service;
	}
	public void setService(AdvertiserService service) {
		this.service = service;
	}
	
	@RequestMapping(params="method=getAdvertiserList")
	public String getAdvertiserList(String isflag,AdvertiserVO advertiser, Model model,PageUtil pUtil) {
		if (logger.isDebugEnabled()) {
			logger.debug("getAdvertiserList(AdvertiserVO) - start"); //$NON-NLS-1$
		}
		String result="ad/AdList";
		try {
			
			if(isflag!=null && !"".equals(isflag)){
				result="ad/AdListUpdateAll";
			}else{
				advertiser.setVerifystatus(20);
				advertiser.setStatus(20);
			}
			
			int totalQty = service.getAdvertiserList(advertiser, null).size();
			
			List<AdvertiserVO> advertiserList = service.getAdvertiserList(advertiser, pUtil);
			model.addAttribute("advertiserList", advertiserList);
			
			PageUtil pU = new PageUtil();
			HashMap<String, Integer> pageList = pU.getPageList( pUtil.getCurPage(), totalQty,pUtil.getPageSize());
			System.out.println("server pageList:" + pageList);
			List<DictionaryVO> platList = DictionaryMap.getDicListByType("channelplat");
			List<DictionaryVO> columnList = DictionaryMap.getDicListByType("columntype");
			List<DictionaryVO> balanceList = DictionaryMap.getDicListByType("balancetype");
			List<DictionaryVO> viewList = DictionaryMap.getDicListByType("viewtype");
			List<DictionaryVO> cooperList = DictionaryMap.getDicListByType("coopertype");
			List<DictionaryVO> priceList = DictionaryMap.getDicListByType("pricesize");
			List<DictionaryVO> orderList = DictionaryMap.getDicListByType("ordertype");
			List<DictionaryVO> wayList = DictionaryMap.getDicListByType("verifyWay");
			
			model.addAttribute("platList",platList);
			model.addAttribute("columnList",columnList);
			model.addAttribute("balanceList",balanceList);
			model.addAttribute("viewList",viewList);
			model.addAttribute("cooperList",cooperList);
			model.addAttribute("priceList",priceList);
			model.addAttribute("orderList",orderList);
			model.addAttribute("wayList",wayList);
			
			model.addAttribute("pageList",pageList);
			model.addAttribute("searchInfo",advertiser);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occur error when get advertiser list:"+e);
		}
		
		if (logger.isDebugEnabled()) {
			logger.debug("getAdvertiserList(AdvertiserVO) - end"); //$NON-NLS-1$
		}
		return result;
	}
	
	@RequestMapping(params="method=getVerifyAdList")
	public String getVerifyAdList(AdvertiserVO advertiser, Model model,PageUtil pUtil) {
		if (logger.isDebugEnabled()) {
			logger.debug("getVerifyAdList(AdvertiserVO) - start"); //$NON-NLS-1$
		}
		
		try {
			advertiser.setVerifystatus(10);
			int totalQty = service.getAdvertiserList(advertiser, null).size();
			List<AdvertiserVO> advertiserList = service.getAdvertiserList(advertiser, pUtil);
			model.addAttribute("advertiserList", advertiserList);
			
			PageUtil pU = new PageUtil();
			HashMap<String, Integer> pageList = pU.getPageList( pUtil.getCurPage(), totalQty,pUtil.getPageSize());
			System.out.println("server pageList:" + pageList);
			model.addAttribute("pageList",pageList);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occur error when get advertiser list:"+e);
		}
		
		if (logger.isDebugEnabled()) {
			logger.debug("getVerifyAdList(AdvertiserVO) - end"); //$NON-NLS-1$
		}
		return "ad/AdVerifyList";
	}
	
	@RequestMapping(params="method=getUserAdvertiserList")
	public String getUserAdvertiserList(AdvertiserVO advertiser, Model model,PageUtil pUtil, HttpSession session) {
		if (logger.isDebugEnabled()) {
			logger.debug("getUserAdvertiserList(AdvertiserVO) - start"); //$NON-NLS-1$
		}
		
		try {
			Integer userid = (Integer)session.getAttribute("userId");
			advertiser.setUserID(userid);
			List<AdvertiserVO> advertiserList = service.getUserAdvertiserList(advertiser, pUtil);
			model.addAttribute("advertiserList", advertiserList);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occur error when get advertiser list:"+e);
		}
		
		if (logger.isDebugEnabled()) {
			logger.debug("getUserAdvertiserList(AdvertiserVO) - end"); //$NON-NLS-1$
		}
		return "ad/UserAdList";
	}
	
	@RequestMapping(params="method=saveAd")
	public String saveAd(AdvertiserVO advertiser) {
		if (logger.isDebugEnabled()) {
			logger.debug("saveAd(AdvertiserVO) - start"); //$NON-NLS-1$
		}
		try {
			if (advertiser.getAdvertiserID() == null) {
				service.insertAdvertiser(advertiser);
			} else {
				service.updateAdvertiser(advertiser);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occur error when save advertiser:"+e);
		}
		if (logger.isDebugEnabled()) {
			logger.debug("saveAd(AdvertiserVO) - end"); //$NON-NLS-1$
		}
		return "redirect:advertiser.do?method=getUserAdvertiserList";
	}
	
	@RequestMapping(params="method=deleteAd")
	public String deleteAd(AdvertiserVO advertiser) {
		if (logger.isDebugEnabled()) {
			logger.debug("deleteAd(AdvertiserVO) - start"); //$NON-NLS-1$
		}
		try {
			service.deleteAdvertiser(advertiser);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occur error when save advertiser:"+e);
		}
		if (logger.isDebugEnabled()) {
			logger.debug("deleteAd(AdvertiserVO) - end"); //$NON-NLS-1$
		}
		return "redirect:advertiser.do?method=getUserAdvertiserList";
	}
	
	@RequestMapping(params="method=updateAd")
	public String updateAd(AdvertiserVO advertiser) {
		if (logger.isDebugEnabled()) {
			logger.debug("updateAd(AdvertiserVO) - start"); //$NON-NLS-1$
		}
		try {
			service.updateAdvertiser(advertiser);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occur error when save advertiser:"+e);
		}
		if (logger.isDebugEnabled()) {
			logger.debug("updateAd(AdvertiserVO) - end"); //$NON-NLS-1$
		}
		if (advertiser.getStatus() != null) {
			return "redirect:advertiser.do?method=getUserAdvertiserList";
		} else {
			return "redirect:advertiser.do?method=getVerifyAdList";
		}
		
	}
	
	@RequestMapping(params="method=createAd")
	public String createAd(Model model) {
		if (logger.isDebugEnabled()) {
			logger.debug("createAd() - start"); //$NON-NLS-1$
		}
		
		List<DictionaryVO> platList = DictionaryMap.getDicListByType("channelplat");
		List<DictionaryVO> columnList = DictionaryMap.getDicListByType("columntype");
		List<DictionaryVO> balanceList = DictionaryMap.getDicListByType("balancetype");
		List<DictionaryVO> viewList = DictionaryMap.getDicListByType("viewtype");
		List<DictionaryVO> cooperList = DictionaryMap.getDicListByType("coopertype");
		List<DictionaryVO> prodWay = DictionaryMap.getDicListByType("verifyWay");
		
		model.addAttribute("platList",platList);
		model.addAttribute("columnList",columnList);
		model.addAttribute("balanceList",balanceList);
		model.addAttribute("viewList",viewList);
		model.addAttribute("cooperList",cooperList);
		model.addAttribute("prodWayList",prodWay);
		
		if (logger.isDebugEnabled()) {
			logger.debug("createAd() - start"); //$NON-NLS-1$
		}
		return "ad/AdEdit";
	}
	
	@RequestMapping(params="method=getAdInfo")
	public String getAdInfo (AdvertiserVO advertiser,Model model) {
		if (logger.isDebugEnabled()) {
			logger.debug("getAdInfo(AdvertiserVO) - start"); //$NON-NLS-1$
		}
		try {
			AdvertiserVO info = service.getAdvertiserByID(advertiser);
			
			List<DictionaryVO> platList = DictionaryMap.getDicListByType("channelplat");
			List<DictionaryVO> columnList = DictionaryMap.getDicListByType("columntype");
			List<DictionaryVO> balanceList = DictionaryMap.getDicListByType("balancetype");
			List<DictionaryVO> viewList = DictionaryMap.getDicListByType("viewtype");
			List<DictionaryVO> cooperList = DictionaryMap.getDicListByType("coopertype");
			List<DictionaryVO> prodWay = DictionaryMap.getDicListByType("verifyWay");
			
			model.addAttribute("platList",platList);
			model.addAttribute("columnList",columnList);
			model.addAttribute("balanceList",balanceList);
			model.addAttribute("viewList",viewList);
			model.addAttribute("cooperList",cooperList);
			model.addAttribute("prodWayList",prodWay);
			
			model.addAttribute("adInfo", info);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occur error when update channel:"+e);
		}
		if (logger.isDebugEnabled()) {
			logger.debug("getAdInfo(AdvertiserVO) - start"); //$NON-NLS-1$
		}
		return "ad/AdEdit";
	}
	
	@RequestMapping(params="method=toUpdateStatus")
	public String toUpdateStatus(AdvertiserVO advertiser,String ids,String pageStr) {
		if (logger.isDebugEnabled()) {
			logger.debug("toUpdateStatus(AdvertiserVO) - start"); //$NON-NLS-1$
		}
		String result="";
		try {
			service.updateBatchAdvertiser(advertiser,ids);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("occur error when save advertiser:"+e);
		}
		if (logger.isDebugEnabled()) {
			logger.debug("toUpdateStatus(AdvertiserVO) - end"); //$NON-NLS-1$
		}
		if(pageStr!=null && "Y".equals(pageStr)){
			result="redirect:advertiser.do?method=getVerifyAdList";
		}else{
			result="redirect:advertiser.do?method=getAdvertiserList&isflag=Y";
		}
		return result;
	}
}
