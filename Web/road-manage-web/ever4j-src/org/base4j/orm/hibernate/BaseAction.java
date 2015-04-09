package org.base4j.orm.hibernate;

import java.beans.PropertyEditorSupport;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.tools.ant.util.FileUtils;
import org.base4j.orm.PageData;
import org.base4j.orm.Compositor.CompositorType;
import org.base4j.utils.WebUtils;
import org.ever4j.attachment.entity.Attachment;
import org.ever4j.attachment.service.AttachmentService;
import org.ever4j.main.constant.Constant;
import org.ever4j.system.service.SysOperLogService;
import org.ever4j.utils.RandomUtil;
import org.ever4j.utils.TimeUtil;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.expression.ParseException;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;


public class BaseAction<T extends BaseEntity> {
	
	@Resource
	protected SysOperLogService logService;
	
	@Resource
	private AttachmentService attachmentService;
	
	/**
	 * 返回结果
	 */
	public void returnCommand(Model model, HttpServletRequest request){
		model.addAttribute("navTabId", request.getParameter("navTabId"));
		model.addAttribute("callbackType", request.getParameter("callbackType"));
		model.addAttribute("ajax", request.getParameter("ajax"));
		model.addAttribute("code", "200");
		model.addAttribute("type", "success");
	}
	
	/**
	 *  解决Spring自动绑定中的数据转换问题
	 * @param dataBinder
	 */
	@InitBinder
	public void InitBinder(WebDataBinder dataBinder){
//		dataBinder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), false));
		dataBinder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
		    public void setAsText(String value) {
		        try {
		            setValue(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(value));
		        } catch(Exception e) {
		           // setValue(null);
		        }
		        try {
		        	setValue(new SimpleDateFormat("yyyy-MM-dd").parse(value));
		        } catch(Exception e) {
		        	setValue(null);
		        }
		    }

		    public String getAsText() {
		        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format((Date) getValue());
		    }        

		});
	}

	public SysOperLogService getLogService() {
		return logService;
	}

	public void setLogService(SysOperLogService logService) {
		this.logService = logService;
	}
	public static Attachment handleAttachment(MultipartFile file){
		String realPath = Constant.configMap.get("sysbaseConfig_image_path");
		final String path_segment = "attachment" + File.separator + TimeUtil.date2Str(new Date(), "yyyy-MM-dd");
		final String path = realPath + path_segment;
		
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		String originName = file.getOriginalFilename();// 取得原文件名
		String fileExt = originName.substring(originName.lastIndexOf(".") + 1);// 取得文件后缀
		String newOriginName = TimeUtil.getFormatedDate("yyyyMMddHHmmssSSS")+RandomUtil.getRandomInt(100, 999)+ "."+ fileExt;
		try {
			File attachmentFile = new File(dir, newOriginName);
			FileOutputStream fos = new FileOutputStream(attachmentFile);
			IOUtils.copy(file.getInputStream(), fos);
			fos.flush();
			fos.close();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		Attachment attachment = new Attachment();
		attachment.setAttachName(originName);
		attachment.setAttachUri(path_segment+File.separator+newOriginName);
		return attachment;
	}
	@RequestMapping(value = "/attachmentSave")
	@ResponseBody
	public ModelMap attachmentSave(HttpSession session,  @RequestParam("upload") MultipartFile file){
		ModelMap modelMap = new ModelMap();
		
		Attachment attachment=handleAttachment(file);
		attachmentService.save(attachment);
		
		modelMap.addAttribute("id", attachment.getId());
		modelMap.addAttribute("attachName", attachment.getAttachName());
		modelMap.addAttribute("attachUri", attachment.getAttachUri());
		
		return modelMap;
	}
	@RequestMapping(value = "/attachmentDownload")
	public void attachmentDownload(HttpSession session, HttpServletRequest request, HttpServletResponse response, String attachmentUri, String attachmentName){
		String realPath = Constant.configMap.get("sysbaseConfig_image_path");
//		try {
//			attachmentUri = new String(attachmentUri.getBytes("ISO-8859-1"), "UTF-8");
//		} catch (UnsupportedEncodingException uee) {
//			uee.printStackTrace();
//		}
		String path = realPath + attachmentUri;
		
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Content-Type", "application/x-msdownload");
		response.setHeader("Content-Disposition", "Attachment;filename=" + encodeFilename(attachmentName, request));
		
		try {
			bis = new BufferedInputStream(new FileInputStream(path));
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];  
            int bytesRead;  
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
                bos.write(buff, 0, bytesRead);  
            }  
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally{
			if(bos != null){
				try {
					bos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(bis != null){
				try {
					bis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public void attachmentRemove(HttpServletRequest request, int sid,String sname){
		
		List<Attachment> list = attachmentService.findList(sname, sid);
		if(list != null && list.size()>0){
			for(Attachment attachment : list){
				if(attachment != null){
					attachmentService.delete(attachment);
					String realPath = request.getSession().getServletContext().getRealPath("/");
					File targetFile = new File(realPath + attachment.getAttachUri());
					if(targetFile.exists()){
						FileUtils.delete(targetFile);
					}
				}
			}
		}
	}
	
	/**
	 * 导入Excel
	 * @param model
	 * @param request
	 * @param file
	 * @param service
	 * @param entity
	 * @return
	 */
	public List<T> importExcel(Model model, HttpServletRequest request, MultipartFile file, BaseService<T> service, T entity){
		returnCommand(model, request);
		ServletContext application = request.getSession().getServletContext();
		int batchNum = (Integer)application.getAttribute(Constant.BATCH_NUM);
		try {
			List<T> entityList = service.importSave(file, entity);
			List<T> saveList = new ArrayList<T>();
			if(entityList != null && entityList.size() > 0){
				for (int i = 0; i < entityList.size(); i++) {
					saveList.add(entityList.get(i));
					if(i != 0 && i%batchNum==0){
						service.batchSave(saveList);
						saveList.clear();
					}
				}
				
				if(saveList.size() > 0){
					service.batchSave(saveList);
					saveList.clear();
				}
			}
			model.addAttribute("message", "成功导入" + (entityList == null ? 0 : (int) entityList.size()) + "条信息!");

			return entityList;
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("code", "300");
			model.addAttribute("message", e.getMessage());
			
			return null;
		}
	}
	public void setSort(HttpServletRequest request, String sortField,
			CompositorType desc) {
		request.setAttribute("fieldName", sortField);
		request.setAttribute("compositorType", desc.toString());
	}
	/**
	 * 导出Excel
	 * @param request
	 * @param response
	 * @param excelName
	 * @param sheetName
	 * @param title
	 */
	public void exportExcel(BaseService<T> service, HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		
		try {
			PageData<T> pageData = new PageData<T>();
			WebUtils.setSearchParameter(request, pageData);
			pageData = service.find(pageData);
			List<T> results = pageData.getResult();
			HSSFWorkbook wb = service.exportExcel(results, sheetName, title);
			if (wb != null) {
				response.setCharacterEncoding("UTF-8");
				response.setHeader("Content-Type", "application/vnd.ms-excel");
				response.setHeader("Content-Disposition", "Attachment;filename=" + encodeFilename(excelName, request) + ".xls");
				OutputStream os = response.getOutputStream();
				wb.write(os);
				os.flush();
				os.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void fileDownload(HttpServletRequest request, HttpServletResponse response, String filePath, String fileName){
		
		if (!filePath.endsWith(File.separator)) {
			filePath = filePath + File.separator;
        }
//		try {
//			filePath = new String(filePath.getBytes("ISO-8859-1"), "UTF-8");
//			fileName = new String(fileName.getBytes("ISO-8859-1"), "UTF-8");
//		} catch (UnsupportedEncodingException uee) {
//			uee.printStackTrace();
//		}
		String path = filePath + fileName;
		
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Content-Type", "application/x-msdownload");
		response.setHeader("Content-Disposition", "Attachment;filename=" + encodeFilename(fileName, request));
		
		try {
			bis = new BufferedInputStream(new FileInputStream(path));
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];  
            int bytesRead;  
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
                bos.write(buff, 0, bytesRead);  
            }  
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(bos != null){
				try {
					bos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(bis != null){
				try {
					bis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 设置下载文件中文件的名称
	 * 
	 * @param filename
	 * @param request
	 * @return
	 */
	public static String encodeFilename(String filename, HttpServletRequest request) {
		/**
		 * 获取客户端浏览器和操作系统信息 
		 * 在IE浏览器中得到的是：User-Agent=Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; Maxthon; Alexa Toolbar)
		 * 在Firefox中得到的是：User-Agent=Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.7.10) Gecko/20050717 Firefox/1.0.6
		 * 在Chrome中得到的是：User-Agent=Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1
		 */
		String agent = request.getHeader("USER-AGENT");
		try {
			filename = filename == null ? "export" : filename;
			if (agent != null && (-1 != agent.indexOf("MSIE"))) {
//				filename = new String(filename.getBytes("ISO-8859-1"), "UTF-8");//Server.xml中不配置useBodyEncodingForURI="true"或者URIEncoding="UTF-8"等信息时使用
				String newFileName = URLEncoder.encode(filename, "UTF-8");
				newFileName = StringUtils.replace(newFileName, "+", "%20");
				if (newFileName.length() > 150) {
//					newFileName = new String(filename.getBytes("GB2312"), "ISO8859-1");
					newFileName = StringUtils.replace(newFileName, " ", "%20");
				}
				return newFileName;
			}
			
			if (agent != null && (-1 != agent.indexOf("Firefox"))){
//				filename = new String(filename.getBytes("ISO-8859-1"), "UTF-8");//Server.xml中不配置useBodyEncodingForURI="true"或者URIEncoding="UTF-8"等信息时使用
				return MimeUtility.encodeText(filename, "UTF-8", "B");
			}
			
			if(agent != null && (-1 != agent.indexOf("Chrome"))){
//				filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");//Server.xml中不配置useBodyEncodingForURI="true"或者URIEncoding="UTF-8"等信息时删除
				return filename;
			}
			return filename;
		} catch (Exception ex) {
			return filename;
		}
	}
	/**
	 * 转换成datatable的json列表数据
	 * @param model
	 * @param pageData
	 * @return
	 */
	public Model toPageModel(Model model, PageData pageData){
		model.addAttribute(pageData);
		model.addAttribute("iTotalRecords", pageData.getPagination().getTotalCount());
		model.addAttribute("iTotalDisplayRecords",  pageData.getPagination().getTotalCount());
		return model;
	}
	
	/**
	 * 删除操作  
	 * @param service
	 * @param entityName
	 * @param ids
	 * @param isLogic 是否逻辑删除
	 */
	public void delete(BaseService service,String entityName,String ids,boolean isLogic){
		if(ids != null && ids.length() > 0){
			String[] idArray = ids.split(",");
			for (String idStr : idArray) {
				if(isLogic){
					// 逻辑删除
					service.batchExecute("update "+entityName+" set "+Constant.LOGIC_DELETE_FIELD+" = 1 where id = ?", Integer.parseInt(idStr));
				}else{
					// 真删除
					service.batchExecute("delete from "+entityName+"  where id = ?", Integer.parseInt(idStr));
				}
			}
		}
	}
	
	public void setLogicDelete(HttpServletRequest request, boolean isLogic) {
		if(isLogic){
			request.setAttribute("filter_EQB_isDel_OR_ISB_isDel", "false_OR_null");
		}
	}
}
