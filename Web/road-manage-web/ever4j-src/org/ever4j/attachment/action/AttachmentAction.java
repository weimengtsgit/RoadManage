package org.ever4j.attachment.action;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.attachment.entity.Attachment;
import org.ever4j.attachment.service.AttachmentService;
import org.ever4j.utils.RandomUtil;
import org.ever4j.utils.TimeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/attachment/attachment")
public class AttachmentAction extends BaseAction{
	
	@Resource
	private AttachmentService attachmentService;;
	
	/**
	 * 存在关联对象时，查询关联对象的相关记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewRefList")
	public ModelMap viewRefList(HttpServletRequest request){
		PageData<Attachment> pageData = new PageData<Attachment>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = attachmentService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<Attachment> pageData = new PageData<Attachment>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = attachmentService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<Attachment> pageData = new PageData<Attachment>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = attachmentService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<Attachment> lookupJson(HttpServletRequest request){
		PageData<Attachment> pageData = new PageData<Attachment>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = attachmentService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/attachment/attachment/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return "/attachment/attachment/input";
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		Attachment attachment = attachmentService.find(Integer.parseInt(id));
		model.addAttribute(attachment);
		return "/attachment/attachment/input";
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		Attachment attachment = attachmentService.find(Integer.parseInt(id));
		model.addAttribute(attachment);
		return "/attachment/attachment/view";
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public Attachment viewJson(Model model, String id) {
		Attachment attachment = attachmentService.find(Integer.parseInt(id));
		model.addAttribute(attachment);
		return attachment;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param Attachment
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, Attachment attachment){
		// 初始化
		returnCommand(model, request);
		if (attachment.isNew()){
			attachmentService.save(attachment);
		} else{
			attachmentService.update(attachment);
		}
		
		model.addAttribute("message", "保存成功");
		return "/commons/ajaxDone";
	}
	
	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param Attachment
	 * @return
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public String save(HttpSession session,HttpServletRequest request, @RequestParam("filedata")MultipartFile file,HttpServletResponse response){
		
		
		// 将图片按日期分开存放，方便管理
		final String path_segment = "/upload/"
				+ TimeUtil.date2Str(new Date(), "yyyy/MM_dd");

		// 存放到web根目录下,如果日期目录不存在，则创建,
		// 注意 request.getRealPath("/") 已经标记为不推荐使用了.
		final String path = session.getServletContext().getRealPath("/") + path_segment;
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		// 以下是真正的上传部分
		String error = "";
		// 取得原文件名
		String originName = file.getOriginalFilename();
		// 取得文件后缀
		String fileExt = originName.substring(originName.lastIndexOf(".") + 1);
		// 按时间戳生成图片文件名
		String picture = TimeUtil.getFormatedDate("yyyyMMddHHmmssSSS")+RandomUtil.getRandomInt(100, 999)+ "."+ fileExt;
		try {

			IOUtils.copy(file.getInputStream(), new FileOutputStream(new File(dir, picture)));

		} catch (Exception e) {
			error = e.getMessage();
		}

	
		
        JSONObject jso = new JSONObject();
        jso.put("err", "");
        jso.put("msg", "../../static"+path_segment + "/" + picture);
		return jso.toJSONString();
	}
	


	/**
	 * 删除单条记录
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request, Model model, String id){
		// 初始化
		returnCommand(model, request);
		attachmentService.delete(Integer.parseInt(id));
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	/**
	 * 批量删除记录
	 * @param request
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delAll")
	public String delAll(HttpServletRequest request, Model model,String ids){
		// 初始化
		returnCommand(model, request);
		for(String id : ids.split(",")){
			attachmentService.delete(Integer.parseInt(id));
		}
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	//循环标签的值
	
	
}
