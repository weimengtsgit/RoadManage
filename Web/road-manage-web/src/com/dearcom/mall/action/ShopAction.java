package com.dearcom.mall.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.manager.util.SessionUtils;
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

import com.dearcom.mall.entity.ApDevice;
import com.dearcom.mall.entity.DeviceShop;
import com.dearcom.mall.entity.Shop;
import com.dearcom.mall.service.DeviceShopService;
import  com.dearcom.mall.service.ShopService;
import com.dearcom.queue.entity.QueueConfigShop;
import com.dearcom.queue.service.QueueConfigShopService;

@Controller
@RequestMapping("/mall/shop")
public class ShopAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = true;
	
	@Resource
	private ShopService shopService;
	@Resource
	private DeviceShopService deviceShopService;
	@Resource
	private QueueConfigShopService queueConfigShopService;
	/**
	 * 存在关联对象时，查询关联对象的相关记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewRefList")
	public ModelMap viewRefList(HttpServletRequest request){
		PageData<Shop> pageData = new PageData<Shop>();
		// 如果为商铺管理员，则只显示当前用户所属商铺的信息
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			request.setAttribute("filter_EQI_id", user.getShop().getId().toString());
		}
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = shopService.find(pageData);

		return new ModelMap(pageData);
	}
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/mall/shop/listPage");
	}
	
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<Shop> pageData = new PageData<Shop>();
		
		// 如果为商铺管理员，则只显示当前用户所属商铺的信息
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			request.setAttribute("filter_EQI_id", user.getShop().getId().toString());
		}	
		// 排序
		setSort(request,Compositor.SORT_FIELD,CompositorType.desc);
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = shopService.find(pageData);

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
	public Model listJSON(HttpServletRequest request, Model model){
		
		// 设置逻辑删除条件
		setLogicDelete(request,logicDelete);
		
		PageData<Shop> pageData = new PageData<Shop>();
		
		// 如果为商铺管理员，则只显示当前用户所属商铺的信息
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			request.setAttribute("filter_EQI_id", user.getShop().getId().toString());
		}	
		if(user.getUserType().equals("2")){
			request.setAttribute("filter_EQI_mall.id", user.getMall().getId().toString());
		}
		// 排序
//		setSort(request,"priority",CompositorType.desc);
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = shopService.find(pageData);
		
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
		
		
		String tableName = "com_shop";
		String sortField = "priority";
		shopService.sort(tableName,id,sort,afterSort,beforeSort,p,sortField);
		
		
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
		PageData<Shop> pageData = new PageData<Shop>();
		// 如果为商铺管理员，则只显示当前用户所属商铺的信息
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			request.setAttribute("filter_EQI_id", user.getShop().getId().toString());
		}
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = shopService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<Shop> lookupJson(HttpServletRequest request){
		PageData<Shop> pageData = new PageData<Shop>();
		// 如果为商铺管理员，则只显示当前用户所属商铺的信息
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			request.setAttribute("filter_EQI_id", user.getShop().getId().toString());
		}
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = shopService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/mall/shop/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return SessionUtil.getViewPath("/mall/shop/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		Shop shop = shopService.find(Integer.parseInt(id));
		// 查找关联的设备
		DeviceShop ds = deviceShopService.findHql("from DeviceShop ds where ds.shop.id=?", shop.getId());
		
		shop.setDevice(ds!=null?ds.getDevice():null);
		model.addAttribute(shop);
		return SessionUtil.getViewPath("/mall/shop/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		Shop shop = shopService.find(Integer.parseInt(id));
		// 查找关联的设备
		DeviceShop ds = deviceShopService.findHql("from DeviceShop ds where ds.shop.id=?", shop.getId());
		shop.setDevice(ds.getDevice());
		model.addAttribute(shop);
		return SessionUtil.getViewPath("/mall/shop/view");
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public Shop viewJson(Model model, String id) {
		Shop shop = shopService.find(Integer.parseInt(id));
		// 查找关联的设备
		DeviceShop ds = deviceShopService.findHql("from DeviceShop ds where ds.shop.id=?", shop.getId());
		shop.setDevice(ds.getDevice());
		model.addAttribute(shop);
		return shop;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param Shop
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, Shop shop,@RequestParam("logoFile") MultipartFile logoFile,@RequestParam("imageFile") MultipartFile imageFile){
		// 初始化
		returnCommand(model, request);
		//图片附件
		if(logoFile!=null && !logoFile.isEmpty()){
			shop.setLogo(this.handleAttachment(logoFile).getAttachUri());
		}
		if(imageFile!=null&& !logoFile.isEmpty()){
			shop.setImage(this.handleAttachment(imageFile).getAttachUri());
		}
		if (shop.isNew()){
			//设置UUID
			shop.setShopUuid(Utils.generateUUID());
			shopService.save(shop);
			shop.setPriority(shop.getId());
			shopService.save(shop);
			// 设置商铺的排队配置
			for (int i = 1; i <= 4; i++) {
				QueueConfigShop config = new QueueConfigShop();
				config.setMall(shop.getMall());
				config.setInterval(15);
				config.setCallType((byte) 1);
				config.setIsCall((byte) 1);
				config.setShop(shop);
				config.setStatus((byte) 0);
				config.setType(i);
				queueConfigShopService.save(config);
			}
		} else{
			shopService.update(shop);
		}
		
		// 维护 店铺与设备之间的关系
		deviceShopService.batchExecute("delete DeviceShop ds where ds.shop.id = ?", shop.getId());
		if(shop.getDevice()!=null){
			DeviceShop ds = new DeviceShop();
			ds.setDevice(shop.getDevice());
			ds.setShop(shop);
			deviceShopService.save(ds);
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
		delete(shopService, "Shop", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	
	
	
	/**
	 * 弹出选择附件页面
	 */
	@RequestMapping(value = "/attachmentView")
	public String attachmentView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/mall/shop/attachmentSave");
		return "/import/attachment";
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/mall/shop/importExcel");
		request.setAttribute("navTabId", "mall_shop_list");
		return "/import/import";
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, shopService, new Shop());
		return "/commons/ajaxDone";
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(shopService, request, response, excelName, sheetName, title);
	}
	
}
