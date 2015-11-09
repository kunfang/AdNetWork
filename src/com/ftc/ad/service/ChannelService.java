package com.ftc.ad.service;

import java.util.List;

import com.ftc.ad.vo.ChannelVO;
import com.ftc.foundation.view.PageUtil;

public interface ChannelService {
	public void insertChannel(ChannelVO channel) throws Exception;
	public List<ChannelVO> getChannelList(ChannelVO channel,PageUtil pUtil) throws Exception;
	public List<ChannelVO> getUserChannelList(ChannelVO channel,PageUtil pUtil) throws Exception;
	public void updateChannel(ChannelVO channel) throws Exception;
	public void deleteChannel(ChannelVO channel) throws Exception;
	public ChannelVO getChannelByID(ChannelVO channel) throws Exception;
	public void updateBatchChannel(ChannelVO channel,String ids) throws Exception;
}
