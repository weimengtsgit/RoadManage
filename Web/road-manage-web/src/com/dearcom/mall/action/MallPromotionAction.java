package com.dearcom.mall.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.base4j.orm.Compositor;
import org.base4j.orm.PageData;
import org.base4j.orm.Compositor.CompositorType;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.SortUtil;
import org.base4j.utils.WebUtils;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;
import org.ever4j.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dearcom.mall.entity.MallPromotion;
import  com.dearcom.mall.service.MallPromotionService;
import com.dearcom.mall.service.ShopPromotionService;

@Controller
@RequestMapping("/mall/mallPromotion")
public class MallPromotionAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = true;
	
	@Resource
	private MallPromotionService mallPromotionService;
	
	/**
	 * 存在关联对象时，查询关联对象的相关记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewRefList")
	public ModelMap viewRefList(HttpServletRequest request){
		PageData<MallPromotion> pageData = new PageData<MallPromotion>();
		
		WebUtils.setPageDataParameter(request, pageData);
		pageData = mallPromotionService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/mall/mallPromotion/listPage");
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
			request.setAttribute("filter_EQI_mall.id", user.getMall().getId().toString());
		}
		PageData<MallPromotion> pageData = new PageData<MallPromotion>();
		// 排序
//		setSort(request,Compositor.SORT_FIELD,CompositorType.desc);
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = mallPromotionService.find(pageData);

		return this.toPageModel(model, pageData);
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public String list(HttpServletRequest request,Model model){
		PageData<MallPromotion> pageData = new PageData<MallPromotion>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = mallPromotionService.find(pageData);
		model.addAttribute(pageData);
		return SessionUtil.getViewPath("/mall/mallPromotion/list");
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<MallPromotion> pageData = new PageData<MallPromotion>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = mallPromotionService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<MallPromotion> lookupJson(HttpServletRequest request){
		PageData<MallPromotion> pageData = new PageData<MallPromotion>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = mallPromotionService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/mall/mallPromotion/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return SessionUtil.getViewPath("/mall/mallPromotion/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		MallPromotion mallPromotion = mallPromotionService.find(Integer.parseInt(id));
		model.addAttribute(mallPromotion);
		return SessionUtil.getViewPath("/mall/mallPromotion/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		MallPromotion mallPromotion = mallPromotionService.find(Integer.parseInt(id));
		model.addAttribute(mallPromotion);
		return SessionUtil.getViewPath("/mall/mallPromotion/view");
	}
	
	
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public MallPromotion viewJson(Model model, String id) {
		MallPromotion mallPromotion = mallPromotionService.find(Integer.parseInt(id));
		model.addAttribute(mallPromotion);
		return mallPromotion;
	}

	/**
	 * 预览
	 * @param request
	 * @param model
	 * @param MallPromotion
	 * @return
	 */
	@RequestMapping(value = "/preView")
	public String preView(){
		
		return SessionUtil.getViewPath("/mall/mallPromotion/preView");
	}
	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param MallPromotion
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, MallPromotion mallPromotion,@RequestParam("imageFile") MultipartFile imageFile,@RequestParam("imageBigFile") MultipartFile imageBigFile){
		// 初始化
		returnCommand(model, request);
		
		//图片附件
		if(imageFile!=null && !imageFile.isEmpty()){
			mallPromotion.setImage(this.handleAttachment(imageFile).getAttachUri());
		}
		//大图片附件
		if(imageBigFile!=null && !imageBigFile.isEmpty()){
			mallPromotion.setImageBig(this.handleAttachment(imageBigFile).getAttachUri());
		}
		if(mallPromotion.getStatus()==null){
			mallPromotion.setStatus(new Byte("0"));
		}
		if (mallPromotion.isNew()){
			// 生成UUID
			mallPromotion.setUuid(Utils.generateUUID());
			mallPromotionService.save(mallPromotion);
			mallPromotion.setSort(mallPromotion.getId());
			mallPromotionService.save(mallPromotion);
		} else{
			mallPromotionService.update(mallPromotion);
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
		delete(mallPromotionService, "MallPromotion", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	/**
	 * 排序
	 * @param request
	 * @param model
	 * @param sort
	 * @return
	 */
	@RequestMapping(value = "sort")
	public String sort(HttpServletRequest request, Model model,Integer id, Integer sort,Integer afterSort,Integer beforeSort,Integer p){
		// 初始化
		returnCommand(model, request);
		
		
		String tableName = "com_mall_promotion";
		String sortField = "sort";
		mallPromotionService.sort(tableName,id,sort,afterSort,beforeSort,p,sortField);
		
		
		model.addAttribute("message", "排序成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setStatus")
	public String setStatus(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		MallPromotion mallPromotion = mallPromotionService.find(Integer.parseInt(id));
		mallPromotion.setStatus(Byte.parseByte(value));
		mallPromotionService.update(mallPromotion);
		model.addAttribute("message", "设置成功");
		return "/commons/ajaxDone";
	} 
	
	
	
	/**
	 * 弹出选择附件页面
	 */
	@RequestMapping(value = "/attachmentView")
	public String attachmentView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/mall/mallPromotion/attachmentSave");
		return "/import/attachment";
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/mall/mallPromotion/importExcel");
		request.setAttribute("navTabId", "mall_mallPromotion_list");
		return "/import/import";
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, mallPromotionService, new MallPromotion());
		return "/commons/ajaxDone";
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(mallPromotionService, request, response, excelName, sheetName, title);
	}
	
}
