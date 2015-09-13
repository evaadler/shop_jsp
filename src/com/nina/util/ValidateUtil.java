package com.nina.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class ValidateUtil {
	
	public static boolean validateNull(HttpServletRequest request, String[] params) {
		boolean result = true;
		Map<String,String> errorMsg = new HashMap<String,String>();
		for(String param : params){
			String value = request.getParameter(param);
			if(value==null || "".equals(value.trim())){
				errorMsg.put(param, param+"不能为空");
				result = false;
			}
		}
		if(!result){
			request.setAttribute("errorMsg", errorMsg);
		}
		return result;
	}
	
	public static String showError(HttpServletRequest request, String field){
		Object obj = request.getAttribute("errorMsg");
		Map<String,String> errorMsg = null;
		if(obj instanceof Map<?,?>){
			errorMsg = (Map<String, String>)obj;
		}
		if(errorMsg==null)return "";
		String value = errorMsg.get(field);
		System.out.println("value"+value);
		if(value==null){
			return "";
		}else{
			return value;
		}
	}
	
}
