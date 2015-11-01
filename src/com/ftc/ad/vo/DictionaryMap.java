package com.ftc.ad.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ftc.ad.serviceImpl.DictionaryServiceImpl;

public class DictionaryMap {
	private static Map<String,List<DictionaryVO>> dicMap;
	public static List<DictionaryVO> getDicListByType(String type) {
		if (dicMap == null) {
			loadDicMap();
		}
		return dicMap.get(type);
	}
	public static String getDicDesc(String type,int value) {
		List<DictionaryVO> dicList = getDicListByType(type);
		
		for (DictionaryVO dic : dicList) {
			if (dic.getValue() == value) {
				return dic.getValuename();
			}
		}
		return null;
	}
	
	private static void loadDicMap () {
		DictionaryServiceImpl impl = new DictionaryServiceImpl();
		dicMap = new HashMap<String, List<DictionaryVO>>();
		
		try {
			List<DictionaryVO> allDicList = impl.getDicList();
			String lastType = "";
			List<DictionaryVO> dicArray = new ArrayList<DictionaryVO>();
			for (DictionaryVO dic : allDicList) {
				if (!dic.getType().equals(lastType)) {
					lastType = dic.getType();
					dicArray = new ArrayList<DictionaryVO>();
					dicMap.put(lastType, dicArray);
				}
				dicArray.add(dic);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
