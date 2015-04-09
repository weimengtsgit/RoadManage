package com.dearcom.mall.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;
import org.ever4j.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dearcom.mall.entity.Mall;
import com.dearcom.mall.service.MallService;

@Controller
@RequestMapping("/mall/mall")
public class MallAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = true;
	
	@Resource
	private MallService mallService;
	
	/**
	 * 存在关联对象时，查询关联对象的相关记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewRefList")
	public ModelMap viewRefList(HttpServletRequest request){
		PageData<Mall> pageData = new PageData<Mall>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = mallService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/mall/mall/listPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public String list(HttpServletRequest request,Model model){
		PageData<Mall> pageData = new PageData<Mall>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = mallService.find(pageData);
		model.addAttribute(pageData);
		return SessionUtil.getViewPath("/mall/mall/list");
	}
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request,Model model){
		
		
		// 设置逻辑删除条件
		setLogicDelete(request,logicDelete);
		// 商场管理员 只能看到本商场的信息
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("2")){
			request.setAttribute("filter_EQI_id", user.getMall().getId().toString());
		}
		PageData<Mall> pageData = new PageData<Mall>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = mallService.find(pageData);
		
		return this.toPageModel(model, pageData);
	}
	
	

	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<Mall> pageData = new PageData<Mall>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = mallService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<Mall> lookupJson(HttpServletRequest request){
		PageData<Mall> pageData = new PageData<Mall>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = mallService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/mall/mall/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return SessionUtil.getViewPath("/mall/mall/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		Mall mall = mallService.find(Integer.parseInt(id));
		model.addAttribute(mall);
		return SessionUtil.getViewPath("/mall/mall/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		Mall mall = mallService.find(Integer.parseInt(id));
		model.addAttribute(mall);
		return SessionUtil.getViewPath("/mall/mall/view");
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public Mall viewJson(Model model, String id) {
		Mall mall = mallService.find(Integer.parseInt(id));
		model.addAttribute(mall);
		return mall;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param Mall
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, Mall mall,@RequestParam("logoFile") MultipartFile logoFile,@RequestParam("backgroundFile") MultipartFile backgroundFile){
		// 初始化
		returnCommand(model, request);
		//图片附件
		if(logoFile!=null && !logoFile.isEmpty()){
			mall.setLogo(this.handleAttachment(logoFile).getAttachUri());
		}
		if(backgroundFile!=null&& !logoFile.isEmpty()){
			mall.setBackground(this.handleAttachment(backgroundFile).getAttachUri());
		}
		// 初始化
		returnCommand(model, request);
		if (mall.isNew()){
			// 生成UUID
			mall.setMallId(Utils.generateUUID());
			mallService.save(mall);
		} else{
			mallService.update(mall);
		}
		
		model.addAttribute("message", "保存成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 删除
	 * @param request
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request, Model model, String ids){
		// 初始化
		returnCommand(model, request);
		delete(mallService, "Mall", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	
	/**
	 * 弹出选择附件页面
	 */
	@RequestMapping(value = "/attachmentView")
	public String attachmentView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/mall/mall/attachmentSave");
		return "/import/attachment";
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/mall/mall/importExcel");
		request.setAttribute("navTabId", "mall_mall_list");
		return "/import/import";
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, mallService, new Mall());
		return "/commons/ajaxDone";
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(mallService, request, response, excelName, sheetName, title);
	}
	
}
