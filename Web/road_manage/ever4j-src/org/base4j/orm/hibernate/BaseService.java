package org.base4j.orm.hibernate;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.base4j.orm.Compositor;
import org.base4j.orm.Filtration;
import org.base4j.orm.PageData;
import org.base4j.utils.ExcelUtil;
import org.base4j.utils.SortUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 * service基类.
 * 
 *
 * @param <T> 实体类类型
 */
@Transactional
public abstract class BaseService<T extends BaseEntity>{
	
	private static Logger logger = LoggerFactory.getLogger(BaseService.class);
	
	protected BaseDao<T> baseDao;

	public BaseDao<T> getBaseDao()
	{
		return baseDao;
	}

	
	public abstract void setBaseDao(BaseDao<T> baseDao);
	
	
	
	/**
	 * 排序
	 * @param tableName
	 * @param id
	 * @param sort
	 * @param afterSort
	 * @param beforeSort
	 * @param p
	 * @param sortField
	 */
	public void sort(String tableName, Integer id, Integer sort,
			Integer afterSort, Integer beforeSort, Integer p, String sortField) {
		SortUtil.sort(this, tableName, id, sort, afterSort, beforeSort, p, sortField);
	}

	/**
	 * 新增对象.
	 */
	public void save(T entity)
	{
		getBaseDao().save(entity);
	}

	/**
	 * 修改对象.
	 */
	public void update(T entity)
	{
		getBaseDao().update(entity);
	}

	/**
	 * 删除对象.
	 */
	public void delete(T entity)
	{
		getBaseDao().delete(entity);
	}

	/**
	 * 删除对象.
	 */
	public void delete(Integer id)
	{
		getBaseDao().delete(id);
	}

	/**
	 * 对象显示.
	 */
//	public void visible(Integer id)
//	{
//		getBaseDao().visible(id);
//	}

	/**
	 * 对象不显示.
	 */
//	public void unVisible(Integer id)
//	{
//		getBaseDao().unVisible(id);
//	}

	/**
	 * 按id获取对象.
	 */
	
	public T find(Integer id)
	{
		return getBaseDao().find(id);
	}

	/**
	 * 按属性查找唯一对象,匹配方式为相等.
	 */
	
	public T find(String fieldName, Object fieldValue)
	{
		return getBaseDao().find(fieldName, fieldValue);
	}

	/**
	 * 按属性查找对象列表,匹配方式为相等.
	 */
	
	public List<T> findList(String fieldName, Object fieldValue)
	{
		return getBaseDao().findList(fieldName, fieldValue);
	}

	/**
	 * 按照过滤条件对象查找对象列表.
	 */
	
	public List<T> findList(Filtration... filtrations)
	{
		return getBaseDao().findList(filtrations);
	}

	/**
	 * 按照过滤条件对象查找对象列表.
	 */
	
	public List<T> findList(List<Filtration> filtrationList)
	{
		return getBaseDao().findList(filtrationList);
	}

	/**
	 * 按照过滤条件对象查找对象列表，支持排序.
	 */
	
	public List<T> findList(Compositor compositor, Filtration... filtrations)
	{
		return getBaseDao().findList(compositor, filtrations);
	}

	/**
	 * 按照过滤条件对象查找对象列表，支持排序.
	 */
	
	public List<T> findList(Compositor compositor, List<Filtration> filtrationList)
	{
		return getBaseDao().findList(compositor, filtrationList);
	}

	/**
	 * 获取全部对象.
	 */
	
	public List<T> findAll()
	{
		return getBaseDao().findAll();
	}

	/**
	 * 获取全部对象,支持排序.
	 */
	
	public List<T> findAll(Compositor compositor)
	{
		return getBaseDao().findAll(compositor);
	}

	/**
	 * 分页查询.
	 */
	
	public PageData<T> find(PageData<T> pageData){
		return getBaseDao().find(pageData);
	}
	
	/**
	 * lin add
	 * 分页查询
	 */
	/*public PageData<T> findByPage(PageData<T> pageData, String sql, Object...values){
		return getBaseDao().findByPage(pageData, values);
	}*/

	/**
	 * 按id列表获取对象.
	 */
	
	public List<T> findListByIds(List<Integer> idList)
	{
		return getBaseDao().findListByIds(idList);
	}

	//--------------------------------------------------------------------------------------------------

	/**
	 * 按HQL查询唯一对象.
	 * @param hql "from Users where name=? and password=?"
	 * @param values 数量可变的参数,按顺序绑定.
	 * @return
	 */
	
	public T findHql(String hql, Object... values)
	{
		return getBaseDao().findHql(hql, values);
	}

	/**
	 * 按HQL查询唯一对象.
	 * @param hql "from Users where name=:name and password=:password"
	 * @param values 命名参数,按名称绑定.
	 * @return
	 */
	
	public T findHqlName(String hql, Map<String, ?> values)
	{
		return getBaseDao().findHqlName(hql, values);
	}

	/**
	 * 按HQL查询对象列表.
	 * @param hql "from Users where name=? and password=?"
	 * @param values 数量可变的参数,按顺序绑定.
	 * @return
	 */
	
	public List<T> findHqlList(String hql, Object... values)
	{
		return getBaseDao().findHqlList(hql, values);
	}

	/**
	 * 按HQL查询对象列表.
	 * @param hql "from Users where name=:name and password=:password"
	 * @param values 命名参数,按名称绑定.
	 * @return 
	 */
	
	public List<T> findHqlNameList(String hql, Map<String, ?> values)
	{
		return getBaseDao().findHqlNameList(hql, values);
	}

	/**
	 * 执行HQL进行批量修改/删除操作.
	 * @return 更新记录数.
	 */
	public int batchExecute(String hql, Object... values)
	{
		return getBaseDao().batchExecute(hql, values);
	}

	/**
	 * 执行HQL进行批量修改/删除操作.
	 * @return 更新记录数.
	 */
	public int batchExecute(String hql, Map<String, ?> values)
	{
		return getBaseDao().batchExecute(hql, values);
	}

	//--------------------------------------------------------------------------------------------------

	/**
	 * 本地SQL进行查询操作.
	 * @return 更新记录数.
	 */
	
	public List findBySql(String sql, Object...values){
		
		return getBaseDao().findBySql(sql, values);
	}
	/**
	 * 本地SQL进行查询操作.
	 * @return 更新记录数.
	 */
	
	public Object uniqueResult(String sql, Object...values){
		
		return getBaseDao().uniqueResult(sql, values);
	}
	
	/**
	 * 本地SQL进行新增/修改/删除操作.
	 * @param sql
	 * @param values
	 */
	public int executeBySql(String sql, Object...values){
		return getBaseDao().executeBySql(sql, values);
	}
	
	/**
	 * 查询个数
	 */
	public int getCountBySql(String sql, Object...values){
		return getBaseDao().getCountWithSql(sql, values);
	}
	
	@Transactional(propagation=Propagation.SUPPORTS)
	public void noTransactionalSave(T entity){
		getBaseDao().save(entity);
	} 
	
	public void batchSave(List<T> entityList){
		if(entityList != null && entityList.size() > 0){
			for (T entity : entityList) {
				save(entity);
			}
		}
	}
	
	public void batchUpdate(List<T> entityList){
		if(entityList != null && entityList.size() > 0){
			for (T entity : entityList) {
				update(entity);
			}
		}
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<T> importSave(MultipartFile file, T entity) throws Exception{
		/*HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		ServletContext application = request.getSession().getServletContext();
		int batchNum = (Integer)application.getAttribute(Constant.BATCH_NUM);*/
		
		String originName = file.getOriginalFilename();							// 取得原文件名
		String fileExt = originName.substring(originName.lastIndexOf(".") + 1); // 取得文件后缀
		
		if(fileExt.equalsIgnoreCase("xls") || fileExt.equalsIgnoreCase("xlsx")){
			InputStream is = file.getInputStream();
			//读Excel转换成对象集合
			List<T> entityList = ExcelUtil.createEntity4ReadExcel(is, entity);
			
			//保存
			/*List<T> saveList = new ArrayList<T>();
			if(entityList != null && entityList.size() > 0){
				for (int i = 0; i < entityList.size(); i++) {
					saveList.add(entityList.get(i));
					if(i != 0 && i%batchNum==0){
						batchSave(saveList);
						saveList.clear();
					}
				}
				
				if(saveList.size() > 0){
					batchSave(saveList);
					saveList.clear();
				}
			}*/
			
			return entityList;
		}else{
			throw new Exception("导入文件类型有误!");
		}
	}
	
	public HSSFWorkbook exportExcel(List<T> entitys,String sheetName,String title){
		
		if(sheetName == null){
			sheetName = "";
		}
		
		if(title == null){
			title = "";
		}
//		Server.xml中不配置useBodyEncodingForURI="true"或者URIEncoding="UTF-8"等信息时使用以下信息,否则使用以上信息
//		try {
//			if(sheetName != null){
//				sheetName = new String(sheetName.getBytes("ISO-8859-1"), "UTF-8");
//			}else{
//				sheetName = "";
//			}
//			
//			if(title != null){
//				title = new String(title.getBytes("ISO-8859-1"), "UTF-8");
//			}else{
//				title = "";
//			}
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
		
		HSSFWorkbook wb = ExcelUtil.createWorkbook(entitys, sheetName, title);
		return wb;
	}
	
	/**
	 * sql语句查询，将结果映射到任意类
	 */
	@SuppressWarnings("unchecked")
	public List<T> getpageDataBySql(List<String> fieldNameList, Class entityClass, String sql, Object...values){
		List<Object[]> list = findBySql(sql, values);
		
		return getBaseDao().converterList(entityClass, list, fieldNameList);
	}
	/**
	 * sql语句查询，将结果映射到实体类
	 */
	@SuppressWarnings("unchecked")
	public List<T> getpageDataBySql(List<String> fieldNameList, String sql, Object...values){
		List<Object[]> list = findBySql(sql, values);
		
		return getBaseDao().converterList(list, fieldNameList);
	}
}
