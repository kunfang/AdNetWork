package com.ftc.ad.service;

import java.util.List;

import com.ftc.ad.vo.AdvertiserVO;
import com.ftc.foundation.view.PageUtil;

public interface AdvertiserService {
	public void insertAdvertiser(AdvertiserVO advertiser) throws Exception;
	public List<AdvertiserVO> getAdvertiserList(AdvertiserVO advertiser,PageUtil pUtil) throws Exception;
	public List<AdvertiserVO> getUserAdvertiserList(AdvertiserVO advertiser,PageUtil pUtil) throws Exception;
	public void updateAdvertiser(AdvertiserVO advertiser) throws Exception;
	public void deleteAdvertiser(AdvertiserVO advertiser) throws Exception;
	AdvertiserVO getAdvertiserByID(AdvertiserVO advertiser) throws Exception;
}
