package com.ftc.ad.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.ftc.ad.service.AdvertiserService;
import com.ftc.ad.vo.AdvertiserVO;
import com.ftc.ad.vo.ChannelVO;
import com.ftc.foundation.dao.DefaultDAO;
import com.ftc.foundation.view.PageUtil;
@Service("advertiserService")
public class AdvertiserServiceImpl implements AdvertiserService {
	private static final Logger logger = Logger.getLogger(AdvertiserServiceImpl.class);
	
	@Resource
    private DefaultDAO dao;
	public DefaultDAO getDao() {
		return dao;
	}
	public void setDao(DefaultDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public void insertAdvertiser(AdvertiserVO advertiser) throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("insertAdvertiser(AdvertiserVO) - start"); //$NON-NLS-1$
		}
		try{
			dao.startTransaction();
			dao.doInsert("advertiser.doInsertAd", advertiser);
			dao.commitTransation();
		}catch(Exception e){
			e.printStackTrace();
			dao.endTransaction();
		}finally{
			dao.endTransaction();
		}
		
		if (logger.isDebugEnabled()) {
			logger.debug("insertAdvertiser(AdvertiserVO) - end"); //$NON-NLS-1$
		}
	}

	@Override
	public List<AdvertiserVO> getAdvertiserList(AdvertiserVO advertiser,
			PageUtil pUtil) throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("getAdvertiserList(AdvertiserVO) - start"); //$NON-NLS-1$
		}
		List<AdvertiserVO> advertiserList = null;
			try {
			     dao.startTransaction();
			     advertiserList = (List<AdvertiserVO>)dao.toList("advertiser.getAdList",advertiser);
				 
			} catch (Exception e) {
				dao.endTransaction();
				e.printStackTrace();
			}finally{
				dao.commitTransation();
			}
			
		if (logger.isDebugEnabled()) {
			logger.debug("getAdvertiserList(AdvertiserVO) - end"); //$NON-NLS-1$
		}
		return advertiserList;
	}
	@Override
	public List<AdvertiserVO> getUserAdvertiserList(AdvertiserVO advertiser,
			PageUtil pUtil) throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("getUserAdvertiserList(AdvertiserVO) - start"); //$NON-NLS-1$
		}
		List<AdvertiserVO> advertiserList = null;
			try {
			     dao.startTransaction();
			     advertiserList = (List<AdvertiserVO>)dao.toList("advertiser.getUserAdList",advertiser);
				 
			} catch (Exception e) {
				dao.endTransaction();
				e.printStackTrace();
			}finally{
				dao.commitTransation();
			}
			
		if (logger.isDebugEnabled()) {
			logger.debug("getUserAdvertiserList(AdvertiserVO) - end"); //$NON-NLS-1$
		}
		return advertiserList;
	}
	@Override
	public void updateAdvertiser(AdvertiserVO advertiser) throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("updateAdvertiser(AdvertiserVO) - start"); //$NON-NLS-1$
		}
		try{
			dao.startTransaction();
			dao.doInsert("advertiser.doUpdateAd", advertiser);
			dao.commitTransation();
		}catch(Exception e){
			e.printStackTrace();
			dao.endTransaction();
		}finally{
			dao.endTransaction();
		}
		
		if (logger.isDebugEnabled()) {
			logger.debug("updateAdvertiser(AdvertiserVO) - end"); //$NON-NLS-1$
		}
	}
	@Override
	public void deleteAdvertiser(AdvertiserVO advertiser) throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("deleteAdvertiser(AdvertiserVO) - start"); //$NON-NLS-1$
		}
		try{
			dao.startTransaction();
			dao.doInsert("advertiser.doDeleteAd", advertiser);
			dao.commitTransation();
		}catch(Exception e){
			e.printStackTrace();
			dao.endTransaction();
		}finally{
			dao.endTransaction();
		}
		
		if (logger.isDebugEnabled()) {
			logger.debug("deleteAdvertiser(AdvertiserVO) - end"); //$NON-NLS-1$
		}
	}
	@Override
	public AdvertiserVO getAdvertiserByID(AdvertiserVO advertiser)
			throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("getAdvertiserByID(AdvertiserVO) - start"); //$NON-NLS-1$
		}
		List<AdvertiserVO> advertiserList = null;
			try {
			     dao.startTransaction();
			     advertiserList = (List<AdvertiserVO>)dao.toList("advertiser.getAdList",advertiser);
				 
			     if (advertiserList != null && advertiserList.size() > 0) {
			    	 return advertiserList.get(0);
			     }
			} catch (Exception e) {
				dao.endTransaction();
				e.printStackTrace();
			}finally{
				dao.commitTransation();
			}
			
		if (logger.isDebugEnabled()) {
			logger.debug("getAdvertiserByID(AdvertiserVO) - end"); //$NON-NLS-1$
		}
		return null;
	}

}
