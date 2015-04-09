package org.base4j.utils;

import java.io.InputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFCellUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.util.CellRangeAddress;
import org.base4j.orm.hibernate.BaseEntity;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import org.ever4j.main.constant.Constant;
import org.ever4j.main.tags.EnumValuePojo;

public class ExcelUtil<T extends BaseEntity> {

	private static Map<Integer, String> fieldMap = new HashMap<Integer, String>();
 	
    public static <T> List<T> createEntity4ReadExcel(InputStream is, T entity) throws Exception{
    	List<T> entityList = null;
    	
    	try {
			Workbook wb = WorkbookFactory.create(is);
			Sheet sheet = wb.getSheetAt(0);
			entityList = createEntity4readSheet(sheet, entity);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("处理异常!");
		} 
		
		return entityList;
	}
    
    @SuppressWarnings("unchecked")
	private static <T> List<T> createEntity4readSheet(Sheet sheet, T entity) throws Exception{
    	List<T> entityList = new ArrayList<T>();

    	int rowNum = sheet.getLastRowNum();	// 得到总行数
       
        for (int i = 1; i <= rowNum; i++) { // 正文内容应该从第二行开始,第一行为表头的标题
            Row row = sheet.getRow(i);
            int colNum = row.getLastCellNum();//row.getPhysicalNumberOfCells();
            
            if(i == 1){						// 创建位置与字段名称对应关系
            	for(int j = 1; j < colNum; j++){
            		String fieldDesc = getStringCellValue(row.getCell((short) j));
            		if(StringUtils.isNotEmpty(fieldDesc)){
            			String fieldName = ReflectionUtils.getDeclaredFieldName(entity, fieldDesc);
            			fieldMap.put(Integer.valueOf(j), fieldName);
            		}else{
            			continue;
            		}
            	}
            }else{							//创建对象并给对象赋值
            	T curEntity = (T) entity.getClass().newInstance();
            	for(int j = 1; j < colNum; j++){
            		String fieldValue = getStringCellValue(row.getCell((short) j));
            		try{
            			ReflectionUtils.setFieldValueByType(curEntity, fieldMap.get(Integer.valueOf(j)), fieldValue);
            		}catch (Exception e) {
            			e.printStackTrace();
            		}
            	}
            	entityList.add(curEntity);
            }
        }
        
        return entityList;
    }
    
    private static String getStringCellValue(Cell cell) {
    	if (cell == null) {
            return "";
        }
    	
        String strCell = "";
        switch (cell.getCellType()) {
        case Cell.CELL_TYPE_STRING:	 // 字符串 
            strCell = cell.getStringCellValue();
            break;
        case Cell.CELL_TYPE_NUMERIC: // 数字  
//            if (HSSFDateUtil.isCellDateFormatted(cell)) {时间列改为文本,按文本读取
//            	double d = cell.getNumericCellValue();
//            	Date date = HSSFDateUtil.getJavaDate(d);
//            	if(date != null){
//            		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            		strCell = sFormat.format(date);
//            	}else{
//            		strCell = "";
//            	}
//            }else{
            	strCell = cell.getNumericCellValue() + "";
//            }
            
            break;
        case Cell.CELL_TYPE_BOOLEAN: // Boolean 
            strCell = String.valueOf(cell.getBooleanCellValue());
            break;
        case Cell.CELL_TYPE_FORMULA: // 公式  
        	strCell = cell.getCellFormula();
            break; 
        case Cell.CELL_TYPE_BLANK:   // 空值 
            strCell = "";
            break;
        case Cell.CELL_TYPE_ERROR:   // 故障 
        	strCell = "";
            break;  
        default:
            strCell = "";
            break;
        }
        if (strCell == null) {
            return "";
        }
        return strCell;
    }
    
    public static <T> HSSFWorkbook createWorkbook(List<T> entitys, String sheetName, String title){
    	try{
    		int defaultColumnWidth = 20;//默认宽度
    		
    		short titleFontSize = 16;	//表头字体大小
    		short fontSize = 12;		//其他字体大小
    		
    		int titleHeightSize = 410;	//表头行高
    		int heightSize = 290;		//其他行高
    		
    		HSSFWorkbook wb = new HSSFWorkbook();
    		HSSFSheet sheet = createSheet(wb, sheetName, defaultColumnWidth);
    		Font titleFont = createFont(wb, Font.BOLDWEIGHT_BOLD, titleFontSize);
    		CellStyle titleStyle = createBorderCellStyle(wb, titleFont);
    		Font font = createFont(wb, Font.BOLDWEIGHT_NORMAL, fontSize);
    		CellStyle style = createBorderCellStyle(wb, font);
    		
    		if(entitys != null && entitys.size() > 0){
    			T curEntity = entitys.get(0);
    			int lastRowNum = entitys.size();
    			List<FieldObj> showFields = ReflectionUtils.getShowFields(curEntity);
    			int lastCellNum = showFields == null ? 1 : showFields.size()+1;
    			
    			for(int rowNum = 0; rowNum < lastRowNum; rowNum ++){
        			if(rowNum == 0){
        				
        				//创建表头
        				HSSFRow row = createRow(sheet, rowNum, titleHeightSize);
        				HSSFCell cell = createCell(row, rowNum, titleStyle);
        				cell.setCellValue(title);
        				
        				CellRangeAddress ca = mergeCell(sheet, 0, 0, 0, lastCellNum-1);
        				setRegionStyle(sheet, ca, titleStyle);

        				//标题
        				HSSFRow titleRow = createRow(sheet, rowNum+1, heightSize);
        				for(int cellNum = 0; cellNum < lastCellNum; cellNum ++){
        					HSSFCell titleCell = createCell(titleRow, cellNum, style);
        					
        					if(cellNum == 0){//序号
        						titleCell.setCellValue("序号");
        					}else {
        						titleCell.setCellValue(showFields.get(cellNum-1).getFieldTitle());
        					}
        				}
        			}
        			
        			T entity = entitys.get(rowNum);
        			HSSFRow row = createRow(sheet, rowNum+2, heightSize);//创建内容
        			for(int cellNum = 0; cellNum < lastCellNum; cellNum ++){
        				HSSFCell cell = createCell(row, cellNum, style);
        				if(cellNum == 0){//序号
        					cell.setCellValue(rowNum+1);
        				}else{
        					FieldObj fieldObj = showFields.get(cellNum-1);
        					String fieldType = fieldObj.getFieldType();
        					Object fieldValueObj = ReflectionUtils.getFieldValue(entity, fieldObj.getFieldName());//获得值
        					if(fieldValueObj != null){
        						if(fieldType.endsWith("String")){//判断枚举
        							String enumTypeName = fieldObj.getFieldEnumType();
        							if(StringUtils.isNotEmpty(enumTypeName)){
        								HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        								ServletContext application = request.getSession().getServletContext();
        								Map<String, List<EnumValuePojo>> enumMap = (Map<String, List<EnumValuePojo>>) application.getAttribute(Constant.ENUM);
        								
        								
        								List<EnumValuePojo> EnumValuePojos = enumMap.get(enumTypeName);
        								if(EnumValuePojos != null && EnumValuePojos.size() > 0){
        									for (EnumValuePojo enumValuePojo : EnumValuePojos) {
        										if(enumValuePojo != null && ((String)fieldValueObj).equals(enumValuePojo.getEnumKey())){
        											cell.setCellValue(enumValuePojo.getEnumVal());
        										}
        									}
        								}
        							}else{
        								cell.setCellValue((String)fieldValueObj);
        							}
            					}else if(fieldType.equals("short") || fieldType.endsWith("Short")){
            						cell.setCellValue((Short)fieldValueObj);
            					}else if(fieldType.equals("int") || fieldType.endsWith("Integer")){
            						cell.setCellValue((Integer)fieldValueObj);
            					}else if(fieldType.equals("long") || fieldType.endsWith("Long")){
            						cell.setCellValue((Long)fieldValueObj);
            					}else if(fieldType.equals("float") || fieldType.endsWith("Float")){
            						BigDecimal bd = new BigDecimal(((Float)fieldValueObj).toString());
            						double d = bd.doubleValue();
            						cell.setCellValue(d);
            					}else if(fieldType.equals("double") || fieldType.endsWith("Double")){
            						cell.setCellValue((Double)fieldValueObj);
            					}else if(fieldType.equals("char") || fieldType.endsWith("Character")){
            						cell.setCellValue(((Character)fieldValueObj).toString());
            					}else if(fieldType.equals("boolean") || fieldType.endsWith("Boolean")){
            						cell.setCellValue((Boolean)fieldValueObj);
            					}else if(fieldType.endsWith("Date")){
            						cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format((Date)fieldValueObj));
            					}
//            					else{manytoone
//            						cell.setCellValue((String)fieldValueObj);
//            					}
        					}
        				}
        			}
        		}
    		}
    		return wb;
    	}catch (Exception e) {
    		e.printStackTrace();
    		return null;
    	}
    }
    
    /**
	 * 功能：创建HSSFSheet工作簿
	 * @param 	wb	HSSFWorkbook
	 * @param 	sheetName	String
	 * @return	HSSFSheet
	 */
	public static HSSFSheet createSheet(HSSFWorkbook wb,String sheetName, int defaultColumnWidth){
		HSSFSheet sheet=wb.createSheet(sheetName);
		sheet.setDefaultColumnWidth(defaultColumnWidth);
		return sheet;
	}
	
	/**
	 * 功能：创建HSSFRow
	 * @param 	sheet	HSSFSheet
	 * @param 	rowNum	int
	 * @param 	height	int
	 * @return	HSSFRow
	 */
	public static HSSFRow createRow(HSSFSheet sheet,int rowNum,int height){
		HSSFRow row=sheet.createRow(rowNum);
		row.setHeight((short)height);
		return row;
	}
	
	/**
	 * 功能：创建CELL
	 * @param 	row		HSSFRow	
	 * @param 	cellNum	int
	 * @param 	style	HSSFStyle
	 * @return	HSSFCell
	 */
	public static HSSFCell createCell(HSSFRow row,int cellNum,CellStyle style){
		HSSFCell cell=row.createCell(cellNum);
		cell.setCellStyle(style);
		return cell;
	}
	
	/**
	 * 功能：创建带边框的CellStyle样式
	 * @param 	wb				HSSFWorkbook	
	 * @param 	backgroundColor	背景色	
	 * @param 	foregroundColor	前置色
	 * @param	font			字体
	 * @return	CellStyle
	 */
	public static CellStyle createBorderCellStyle(HSSFWorkbook wb,Font font){
		CellStyle cs=wb.createCellStyle();
		cs.setAlignment(CellStyle.ALIGN_CENTER);
		cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		
		cs.setBorderLeft(CellStyle.BORDER_THIN);
		cs.setBorderRight(CellStyle.BORDER_THIN);
		cs.setBorderTop(CellStyle.BORDER_THIN);
		cs.setBorderBottom(CellStyle.BORDER_THIN);
		
		cs.setFont(font);
		return cs;
	}
	
	/**
	 * 功能：合并单元格
	 * @param 	sheet		HSSFSheet
	 * @param 	firstRow	int
	 * @param 	lastRow		int
	 * @param 	firstColumn	int
	 * @param 	lastColumn	int
	 * @return	int			合并区域号码
	 */
	public static CellRangeAddress mergeCell(HSSFSheet sheet,int firstRow,int lastRow,int firstColumn,int lastColumn){
		CellRangeAddress ca = new CellRangeAddress(firstRow,lastRow,firstColumn,lastColumn);
		sheet.addMergedRegion(ca);
		return ca;
	}
	
	/**
	 * 设置合并单元格的边框样式
	 * @param	sheet	HSSFSheet	
	 * @param 	ca		CellRangAddress
	 * @param 	style	CellStyle
	 */
	public static void setRegionStyle(HSSFSheet sheet, CellRangeAddress ca,CellStyle style) {  
	    for (int i = ca.getFirstRow(); i <= ca.getLastRow(); i++) {  
	        HSSFRow row = HSSFCellUtil.getRow(i, sheet);  
	        for (int j = ca.getFirstColumn(); j <= ca.getLastColumn(); j++) {  
	            HSSFCell cell = HSSFCellUtil.getCell(row, j);  
	            cell.setCellStyle(style);  
	        }  
	    }  
	}  
	
	/**
	 * 功能：创建字体
	 * @param 	wb			HSSFWorkbook	
	 * @param 	boldweight	short
	 * @param 	color		short
	 * @return	Font	
	 */
	public static Font createFont(HSSFWorkbook wb,short boldweight,short size){
		Font font=wb.createFont();
		font.setFontName("宋体");
		font.setBoldweight(boldweight);
		font.setFontHeightInPoints(size);
		return font;
	}
}
