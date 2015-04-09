package com.dearcom.mall.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.dearcom.mall.entity.ShopPromotion;
import  com.dearcom.mall.service.ShopPromotionService;

@Controller
@RequestMapping("/mall/shopPromotion")
public class ShopPromotionAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = true;
	
	@Resource
	private ShopPromotionService shopPromotionService;
	
	/**
	 * 预览
	 * @param request
	 * @param model
	 * @param MallPromotion
	 * @return
	 */
	@RequestMapping(value = "/preView")
	public String preView(){
		
		return "/mall/shopPromotion/preView";
	}
	/**
	 * 存在关联对象时，查询关联对象的相关记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewRefList")
	public ModelMap viewRefList(HttpServletRequest request){
		PageData<ShopPromotion> pageData = new PageData<ShopPromotion>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = shopPromotionService.find(pageData);

		return new ModelMap(pageData);
	}
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/mall/shopPromotion/listPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request,HttpSession session){
		PageData<ShopPromotion> pageData = new PageData<ShopPromotion>();
		// 根据不同的角色设置不同的查询条件
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			// 如果为商铺管理员，则只显示当前用户所属商铺的信息
			request.setAttribute("filter_EQI_shop.id", user.getShop().getId().toString());
			
		}else if(user.getUserType().equals("2")){
			// 商场管理员 只显示 审核状态为  1 待审核  2 审核通过  的
			request.setAttribute("filter_NOTINT_auditStatus", "0,3");
		}
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = shopPromotionService.find(pageData);

		return new ModelMap(pageData);
	}
	/**
	 * 显示所有列表
	 * @param request
	 * @param model 
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request,HttpSession session,Model model){
		// 设置逻辑删除条件
		setLogicDelete(request,logicDelete);
		
		PageData<ShopPromotion> pageData = new PageData<ShopPromotion>();
		// 根据不同的角色设置不同的查询条件
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			// 如果为商铺管理员，则只显示当前用户所属商铺的信息
			request.setAttribute("filter_EQI_shop.id", user.getShop().getId().toString());
			
		}
		if(user.getUserType().equals("2")){
			request.setAttribute("filter_EQI_mall.id", user.getMall().getId().toString());
		}
		if(user.getUserType().equals("2")){
			// 商场管理员 只显示 审核状态为  1 待审核  2 审核通过  的
			request.setAttribute("filter_NOTINT_auditStatus", "0,3");
		}
		// 排序
//		setSort(request,"sort",CompositorType.desc);
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = shopPromotionService.find(pageData);
		
		return this.toPageModel(model, pageData);
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
		
		
		String tableName = "com_shop_promotion";
		String sortField = "sort";
		shopPromotionService.sort(tableName,id,sort,afterSort,beforeSort,p,sortField);
		
		
		model.addAttribute("message", "排序成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<ShopPromotion> pageData = new PageData<ShopPromotion>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = shopPromotionService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<ShopPromotion> lookupJson(HttpServletRequest request){
		PageData<ShopPromotion> pageData = new PageData<ShopPromotion>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = shopPromotionService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/mall/shopPromotion/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return SessionUtil.getViewPath("/mall/shopPromotion/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		ShopPromotion shopPromotion = shopPromotionService.find(Integer.parseInt(id));
		model.addAttribute(shopPromotion);
		return SessionUtil.getViewPath("/mall/shopPromotion/input");
	}
	/**
	 * 审核记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/audit")
	public String auditForm(Model model, String id) {
		ShopPromotion shopPromotion = shopPromotionService.find(Integer.parseInt(id));
		model.addAttribute(shopPromotion);
		return SessionUtil.getViewPath("/mall/shopPromotion/audit");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		ShopPromotion shopPromotion = shopPromotionService.find(Integer.parseInt(id));
		model.addAttribute(shopPromotion);
		return SessionUtil.getViewPath("/mall/shopPromotion/view");
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public ShopPromotion viewJson(Model model, String id) {
		ShopPromotion shopPromotion = shopPromotionService.find(Integer.parseInt(id));
		model.addAttribute(shopPromotion);
		return shopPromotion;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param ShopPromotion
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, ShopPromotion shopPromotion,HttpSession session,@RequestParam("imageFile") MultipartFile imageFile){
		// 初始化
		returnCommand(model, request);
		
		//图片附件
		if(imageFile!=null && !imageFile.isEmpty()){
			shopPromotion.setImage(this.handleAttachment(imageFile).getAttachUri());
		}
		SysUser user = SessionUtil.getCurrentUser();
		
		
		// 当前用户为商铺管理员时 创建的用户所属商铺及商场与自己相同
		if("3".equals(user.getUserType())){
			shopPromotion.setShop(user.getShop());
		}
		if("2".equals(user.getUserType())){
			shopPromotion.setMall(user.getMall());
		}
		
		
		if (shopPromotion.isNew()){
			// 商铺管理员设置为审核状态为0:待提交
			if(user.getUserType().equals("3")){
				
				shopPromotion.setAuditStatus(new Byte("0"));
			}else {
				// 商场及超级管理员设置为审核状态为2:审核通过
				shopPromotion.setAuditStatus(new Byte("2"));
				
			}
			// 生成UUID
			shopPromotion.setUuid(Utils.generateUUID());
			shopPromotionService.save(shopPromotion);
			shopPromotion.setSort(shopPromotion.getId());
			shopPromotionService.save(shopPromotion);
		} else{
			// 商铺管理员不能修改审核状态
			if(user.getUserType().equals("3")){
				ShopPromotion old = shopPromotionService.find((shopPromotion.getId()));
				shopPromotion.setAuditStatus(old.getAuditStatus());
				shopPromotion.setAuditRejectReason(old.getAuditRejectReason());
				shopPromotionService.getBaseDao().getSession().clear();
			}
			// 如果审核状态为空 则表示拒绝
			if(shopPromotion.getAuditStatus() == null){
				shopPromotion.setAuditStatus(new Byte("3") );
			}
			shopPromotionService.update(shopPromotion);
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
		delete(shopPromotionService, "ShopPromotion", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	

	/**
	 * 批量提交审核
	 * @param request
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/submitAudit")
	public String submitAudit(HttpServletRequest request, Model model,String ids){
		// 初始化
		returnCommand(model, request);
		shopPromotionService.batchExecute("update ShopPromotion set auditStatus = ? where auditStatus in(0,3) and id in ("+ids+")",new Byte("1"));
		model.addAttribute("message", "提交成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setAuditStatus")
	public String setAuditStatus(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		ShopPromotion shopPromotion = shopPromotionService.find(Integer.parseInt(id));
		shopPromotion.setAuditStatus(Byte.parseByte(value));
		shopPromotionService.update(shopPromotion);
		model.addAttribute("message", "设置成功");
		return "/commons/ajaxDone";
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
		ShopPromotion shopPromotion = shopPromotionService.find(Integer.parseInt(id));
		shopPromotion.setStatus(Byte.parseByte(value));
		shopPromotionService.update(shopPromotion);
		model.addAttribute("message", "设置成功");
		return "/commons/ajaxDone";
	} 
	
	
	
	/**
	 * 弹出选择附件页面
	 */
	@RequestMapping(value = "/attachmentView")
	public String attachmentView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/mall/shopPromotion/attachmentSave");
		return "/import/attachment";
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/mall/shopPromotion/importExcel");
		request.setAttribute("navTabId", "mall_shopPromotion_list");
		return "/import/import";
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, shopPromotionService, new ShopPromotion());
		return "/commons/ajaxDone";
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(shopPromotionService, request, response, excelName, sheetName, title);
	}
	
}
