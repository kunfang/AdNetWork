package com.ftc.ad.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.ftc.ad.vo.DictionaryVO;
import com.ftc.foundation.dao.DefaultDAO;

@Service("dicService") 
public class DictionaryServiceImpl {
	private static final Logger logger = Logger.getLogger(DictionaryServiceImpl.class);
	@Resource
	private DefaultDAO dao = new DefaultDAO();
	public DefaultDAO getDao() {
		return dao;
	}
	
	public void setDao(DefaultDAO dao) {
		this.dao = dao;
	}

	@SuppressWarnings("unchecked")
	public List<DictionaryVO> getDicList() throws Exception {
		if (logger.isDebugEnabled()) {
			logger.debug("getDicList() - start"); //$NON-NLS-1$
		}
		List<DictionaryVO> dicList = (List<DictionaryVO>)dao.toList("dictionary.getDicRS", null);;
		     
			     
		if (logger.isDebugEnabled()) {
			logger.debug("getDicList() - end"); //$NON-NLS-1$
		}
		return dicList;
	}
}
