package com.dearcom.customer.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dearcom.customer.entity.Customer;
import com.dearcom.customer.entity.MemberPromotion;
import  com.dearcom.customer.service.MemberPromotionService;

@Controller
@RequestMapping("/customer/memberPromotion")
public class MemberPromotionAction extends BaseAction{
	
	@Resource
	private MemberPromotionService memberPromotionService;
	
	/**
	 * 存在关联对象时，查询关联对象的相关记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewRefList")
	public ModelMap viewRefList(HttpServletRequest request){
		PageData<MemberPromotion> pageData = new PageData<MemberPromotion>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = memberPromotionService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<MemberPromotion> pageData = new PageData<MemberPromotion>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = memberPromotionService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		return SessionUtil.getViewPath("/customer/memberPromotion/listPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request, Model model){
		PageData<MemberPromotion> pageData = new PageData<MemberPromotion>();
		
		// 如果为商铺管理员，则只显示当前用户所属商铺的信息
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			request.setAttribute("filter_EQI_shop.id", user.getShop().getId().toString());
		}
		// 商场管理员 只能看到本商场的信息
		if(user.getUserType().equals("2")){
			request.setAttribute("filter_EQI_mall.id", user.getMall().getId().toString());
		}
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = memberPromotionService.find(pageData);

		return this.toPageModel(model, pageData);
	}
	
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<MemberPromotion> pageData = new PageData<MemberPromotion>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = memberPromotionService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<MemberPromotion> lookupJson(HttpServletRequest request){
		PageData<MemberPromotion> pageData = new PageData<MemberPromotion>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = memberPromotionService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return SessionUtil.getViewPath("/customer/memberPromotion/advancedSearch");
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return SessionUtil.getViewPath("/customer/memberPromotion/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		MemberPromotion memberPromotion = memberPromotionService.find(Integer.parseInt(id));
		model.addAttribute(memberPromotion);
		return SessionUtil.getViewPath("/customer/memberPromotion/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		MemberPromotion memberPromotion = memberPromotionService.find(Integer.parseInt(id));
		model.addAttribute(memberPromotion);
		return SessionUtil.getViewPath("/customer/memberPromotion/view");
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public MemberPromotion viewJson(Model model, String id) {
		MemberPromotion memberPromotion = memberPromotionService.find(Integer.parseInt(id));
		model.addAttribute(memberPromotion);
		return memberPromotion;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param MemberPromotion
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, MemberPromotion memberPromotion){
		// 初始化
		returnCommand(model, request);
		if (memberPromotion.isNew()){
			memberPromotionService.save(memberPromotion);
		} else{
			memberPromotionService.update(memberPromotion);
		}
		
		model.addAttribute("message", "保存成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
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
		memberPromotionService.delete(Integer.parseInt(id));
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
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
			memberPromotionService.delete(Integer.parseInt(id));
		}
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 使用优惠券
	 */
	@RequestMapping(value = "/apply")
	public String apply(HttpServletRequest request, Model model, String id){
		// 初始化
		returnCommand(model, request);
		
		memberPromotionService.batchExecute("update MemberPromotion set status = 1 where id = ?", Integer.parseInt(id));
		model.addAttribute("message", "使用优惠券成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	/**
	 * 逻辑删除(批量删除)
	 */
	@RequestMapping(value = "/applyAll")
	public String applyAll(HttpServletRequest request, Model model,String ids){
		// 初始化
		returnCommand(model, request);
		if(ids != null && ids.length() > 0){
			String[] idArray = ids.split(",");
			for (String idStr : idArray) {
				memberPromotionService.batchExecute("update MemberPromotion set status = 1 where id = ?", Integer.parseInt(idStr));
			}
		}
		model.addAttribute("message", "使用优惠券成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 逻辑删除(单条删除)
	 */
	@RequestMapping(value = "/delete4x")
	public String delete4x(HttpServletRequest request, Model model, String id){
		// 初始化
		returnCommand(model, request);
		
		memberPromotionService.batchExecute("update MemberPromotion set visible = ? where id = ?",false, Integer.parseInt(id));
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 逻辑删除(批量删除)
	 */
	@RequestMapping(value = "/delAll4x")
	public String delAll4x(HttpServletRequest request, Model model,String ids){
		// 初始化
		returnCommand(model, request);
		if(ids != null && ids.length() > 0){
			String[] idArray = ids.split(",");
			for (String idStr : idArray) {
				memberPromotionService.batchExecute("update MemberPromotion  set visible = ? where id = ?", false, Integer.parseInt(idStr));
			}
		}
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	
	
	/**
	 * 弹出选择附件页面
	 */
	@RequestMapping(value = "/attachmentView")
	public String attachmentView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/customer/memberPromotion/attachmentSave");
		return "/import/attachment";
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/customer/memberPromotion/importExcel");
		request.setAttribute("navTabId", "customer_memberPromotion_list");
		return "/import/import";
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, memberPromotionService, new MemberPromotion());
		return "/commons/ajaxDone";
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(memberPromotionService, request, response, excelName, sheetName, title);
	}
	
}
