package org.ever4j.common.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.http.HttpRequest;
import org.ever4j.main.constant.Constant;
import org.ever4j.main.tags.EnumValuePojo;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;
import org.ever4j.utils.TimeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/commons")
public class CommonsAction {

	@RequestMapping(value = "/homePage")
	public String advancedSearch(Model model, HttpServletRequest request) {
		request.setAttribute("curDate", TimeUtil.getNowTime("yyyy-MM-dd"));
		SysUser user = SessionUtil.getCurrentUser();
		// 商铺用户
		if ("3".equals(user.getUserType())) {
			return SessionUtil.getViewPath("/commons/homePage4shop");

		} else {
			// 商场用户/超级用户
			return SessionUtil.getViewPath("/commons/homePage4mall");
		}
	}

	/**
	 * 查询所有枚举类型
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getAllEnum")
	@ResponseBody
	public JSONObject findAmount(HttpServletRequest request) {
		ServletContext application = request.getSession().getServletContext();
		Map<String, List<EnumValuePojo>> enumMap = (Map<String, List<EnumValuePojo>>)application.getAttribute(Constant.ENUM);
		JSONObject all = new JSONObject();
		for (Map.Entry<String,  List<EnumValuePojo>> entry : enumMap.entrySet()) {
			List<EnumValuePojo> targetEnumList= entry.getValue();
			
			JSONObject jso = new JSONObject();
			for (int i=0;i<targetEnumList.size();i++) {
				if(targetEnumList.get(i).getEnumKey()!=null){
					jso.put(targetEnumList.get(i).getEnumKey(), targetEnumList.get(i).getEnumVal());
				}
			}
			all.put(entry.getKey(), jso);
		}
		return all;	
	}

	
}
