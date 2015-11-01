package com.ftc.ad.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.ftc.ad.service.ChannelService;
import com.ftc.ad.vo.ChannelVO;
import com.ftc.foundation.dao.DefaultDAO;
import com.ftc.foundation.view.PageUtil;
@Service("ChannelService")
public class ChannelServiceImpl implements ChannelService {
	private static final Logger logger = Logger.getLogger(ChannelServiceImpl.class);
	
	@Resource
    private DefaultDAO dao;
	public DefaultDAO getDao() {
		return dao;
	}
	public void setDao(DefaultDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public void insertChannel(ChannelVO channel) throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("insertChannel(ChannelVO) - start"); //$NON-NLS-1$
		}
		try{
			dao.startTransaction();
			dao.doInsert("channel.doInsertChannel", channel);
			dao.commitTransation();
		}catch(Exception e){
			e.printStackTrace();
			dao.endTransaction();
		}finally{
			dao.endTransaction();
		}
		
		if (logger.isDebugEnabled()) {
			logger.debug("insertChannel(ChannelVO) - end"); //$NON-NLS-1$
		}
	}

	@Override
	public List<ChannelVO> getChannelList(ChannelVO channel, PageUtil pUtil)
			throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("getChannelList(ChannelVO) - start"); //$NON-NLS-1$
		}
		List<ChannelVO> channelList = null;
			try {
			     dao.startTransaction();
			     channelList = (List<ChannelVO>)dao.toList("channel.getChannelList",channel);
				 
			} catch (Exception e) {
				dao.endTransaction();
				e.printStackTrace();
			}finally{
				dao.commitTransation();
			}
			
		if (logger.isDebugEnabled()) {
			logger.debug("getChannelList(ChannelVO) - end"); //$NON-NLS-1$
		}
		return channelList;
	}
	@Override
	public List<ChannelVO> getUserChannelList(ChannelVO channel, PageUtil pUtil)
			throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("getUserChannelList(ChannelVO) - start"); //$NON-NLS-1$
		}
		List<ChannelVO> channelList = null;
			try {
			     dao.startTransaction();
			     channelList = (List<ChannelVO>)dao.toList("channel.getUserChannelList",channel);
				 
			} catch (Exception e) {
				dao.endTransaction();
				e.printStackTrace();
			}finally{
				dao.commitTransation();
			}
			
		if (logger.isDebugEnabled()) {
			logger.debug("getUserChannelList(ChannelVO) - end"); //$NON-NLS-1$
		}
		return channelList;
	}
	@Override
	public void updateChannel(ChannelVO channel) throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("updateChannel(ChannelVO) - start"); //$NON-NLS-1$
		}
		try{
			dao.startTransaction();
			dao.doInsert("channel.doUpdateChannel", channel);
			dao.commitTransation();
		}catch(Exception e){
			e.printStackTrace();
			dao.endTransaction();
		}finally{
			dao.endTransaction();
		}
		
		if (logger.isDebugEnabled()) {
			logger.debug("updateChannel(ChannelVO) - end"); //$NON-NLS-1$
		}
	}
	@Override
	public void deleteChannel(ChannelVO channel) throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("deleteChannel(ChannelVO) - start"); //$NON-NLS-1$
		}
		try{
			dao.startTransaction();
			dao.doInsert("channel.doDeleteChannel", channel);
			dao.commitTransation();
		}catch(Exception e){
			e.printStackTrace();
			dao.endTransaction();
		}finally{
			dao.endTransaction();
		}
		
		if (logger.isDebugEnabled()) {
			logger.debug("deleteChannel(ChannelVO) - end"); //$NON-NLS-1$
		}
	}
	@Override
	public ChannelVO getChannelByID(ChannelVO channel) throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("getChannelByID(ChannelVO) - start"); //$NON-NLS-1$
		}
		List<ChannelVO> channelList = null;
		try {
			channelList = (List<ChannelVO>)dao.toList("channel.getChannelList",channel);
			
			if (channelList != null && channelList.size() > 0) {
				return channelList.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (logger.isDebugEnabled()) {
			logger.debug("getChannelByID(ChannelVO) - end"); //$NON-NLS-1$
		}
		return null;
	}

}
