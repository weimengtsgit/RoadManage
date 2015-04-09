package org.base4j.orm.hibernate;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.base4j.orm.Compositor;
import org.base4j.orm.Filtration;
import org.base4j.orm.PageData;
import org.base4j.utils.HibernateUtils;
import org.base4j.utils.ReflectionUtils;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.Assert;

/**
 * dao基类.
 * 		1：该类封装了最常见数据库操作的方法，你可以继承该类，添加自己喜欢的方法
 * 		2：当你有多个sessionFactory时，你也可以在你的子类中重写setSessionFactory()方法
 * 
 *
 * @param <T> 实体类类型
 */
@SuppressWarnings("unchecked")
public class BaseDao<T extends BaseEntity>
{
	protected Logger logger = LoggerFactory.getLogger(getClass());

	protected SessionFactory sessionFactory;

	protected Class<T> entityClass;

	/**
	 * 构造方法
	 */
	public BaseDao()
	{
		this.entityClass = ReflectionUtils.getSuperClassGenricType(getClass());
	}

	/**
	 * 采用@Resource(name="xxx")按名称注入SessionFactory, 当有多个SesionFactory的时候Override本函数.
	 */
	@Resource
	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}

	/**
	 * 取得Session.
	 */
	public Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}

	//--------------------------------------------------------------------------------------------------

	/**
	 * 新增对象.
	 */
	public void save(T entity)
	{
		Assert.notNull(entity, "entity不能为空");
//		entity.setCreateTime(new Date());//插入时间
//		entity.setInsertUser(SessionUtil.getCurrentUser());
		getSession().save(entity);
		logger.debug("save entity: {}", entity);
	}

	/**
	 * 修改对象.
	 */
	public void update(T entity)
	{
		Assert.notNull(entity, "entity不能为空");
//		entity.setLastUpdateTime(new Date());//最后一次修改时间
//		entity.setLastUpdateUser(SessionUtil.getCurrentUser());
		getSession().update(entity);
		logger.debug("update entity: {}", entity);
	}

	/**
	 * 删除对象.
	 */
	public void delete(T entity)
	{
		Assert.notNull(entity, "entity不能为空");
		getSession().delete(entity);
		logger.debug("delete entity: {}", entity);
	}

	/**
	 * 删除对象.
	 */
	public void delete(Integer id)
	{
		delete(find(id));
		logger.debug("delete entity {},id is {}", entityClass.getSimpleName(), id);
	}

	/**
	 * 对象显示.
	 */
//	public void visible(Integer id)
//	{
//		T entity = find(id);
//		Assert.notNull(entity, "entity不能为空");
//		if(!entity.isVisible())
//		{
//			entity.setVisible(true);
//			update(entity);
//			logger.debug("visible entity {},id is {}", entityClass.getSimpleName(), id);
//		}
//	}

	/**
	 * 对象不显示.
	 */
//	public void unVisible(Integer id)
//	{
//		T entity = find(id);
//		Assert.notNull(entity, "entity不能为空");
//		if(entity.isVisible())
//		{
//			entity.setVisible(false);
//			update(entity);
//			logger.debug("unVisible entity {},id is {}", entityClass.getSimpleName(), id);
//		}
//		
//	}

	/**
	 * 按id获取对象.
	 * 该id必须存在，否则请用其他的方法
	 */
	public T find(Integer id)
	{
		Assert.notNull(id, "id不能为空");
		return (T) getSession().load(entityClass, id);
	}

	/**
	 * 按属性查找唯一对象,匹配方式为相等.
	 */
	public T find(String fieldName, Object fieldValue)
	{
		Assert.hasText(fieldName, "fieldName不能为空");
		Criterion criterion = Restrictions.eq(fieldName, fieldValue);
		return (T) HibernateUtils.createCriteria(getSession(), entityClass, criterion).uniqueResult();
	}

	/**
	 * 按属性查找对象列表,匹配方式为相等.
	 */
	public List<T> findList(String fieldName, Object fieldValue)
	{
		Assert.hasText(fieldName, "fieldName不能为空");
		Criterion criterion = Restrictions.eq(fieldName, fieldValue);
		return HibernateUtils.createCriteria(getSession(), entityClass, criterion).list();
	}

	/**
	 * 按照过滤条件对象查找对象列表.
	 */
	public List<T> findList(Filtration... filtrations)
	{
		Criteria criteria = HibernateUtils.createCriteria(getSession(), entityClass);
		//设置过滤条件
		criteria = HibernateUtils.setFiltrationParameter(entityClass,criteria, null,filtrations);
		return criteria.list();
	}

	/**
	 * 按照过滤条件对象查找对象列表.
	 */
	public List<T> findList(List<Filtration> filtrationList)
	{
		Criteria criteria = HibernateUtils.createCriteria(getSession(), entityClass);
		//设置过滤条件
		criteria = HibernateUtils.setFiltrationParameter(criteria,null, filtrationList,entityClass);
		return criteria.list();
	}

	/**
	 * 按照过滤条件对象查找对象列表，支持排序.
	 */
	public List<T> findList(Compositor compositor, Filtration... filtrations)
	{
		Criteria criteria = HibernateUtils.createCriteria(getSession(), entityClass);
		//设置过滤条件
		criteria = HibernateUtils.setFiltrationParameter(entityClass,criteria,compositor, filtrations);
		//设置排序
//		criteria = HibernateUtils.setCompositorParameter(criteria, compositor);
		return criteria.list();
	}

	/**
	 * 按照过滤条件对象查找对象列表，支持排序.
	 */
	public List<T> findList(Compositor compositor, List<Filtration> filtrationList)
	{
		Criteria criteria = HibernateUtils.createCriteria(getSession(), entityClass);
		//设置过滤条件
		criteria = HibernateUtils.setFiltrationParameter(criteria, compositor,filtrationList,entityClass);
		//设置排序
//		criteria = HibernateUtils.setCompositorParameter(criteria, compositor);
		return criteria.list();
	}

	/**
	 * 获取全部对象.
	 */
	public List<T> findAll()
	{
		return findList();
	}

	/**
	 * 获取全部对象,支持排序.
	 */
	public List<T> findAll(Compositor compositor)
	{
		return findList(compositor);
	}

	/**
	 * 分页查询.
	 */
	public PageData<T> find(PageData<T> pageData)
	{
		Assert.notNull(pageData, "pageData不能为空");
		Criteria criteria = HibernateUtils.createCriteria(getSession(), entityClass);
		HibernateUtils.setParameter(criteria, pageData,entityClass);
		pageData.setResult(criteria.list());
		return pageData;
	}
	
	/**
	 * 按id列表获取对象.
	 */
	public List<T> findListByIds(List<Integer> idList)
	{
		if (idList != null && idList.size() >= 1)
		{
			Criterion criterion = Restrictions.in("id", idList);
			return HibernateUtils.createCriteria(getSession(), entityClass, criterion).list();
		} else
		{
			return null;
		}
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
		return (T) HibernateUtils.createQuery(getSession(), hql, values).uniqueResult();
	}

	/**
	 * 按HQL查询唯一对象.
	 * @param hql "from Users where name=:name and password=:password"
	 * @param values 命名参数,按名称绑定.
	 * @return
	 */
	public T findHqlName(String hql, Map<String, ?> values)
	{
		return (T) HibernateUtils.createQuery(getSession(), hql, values).uniqueResult();
	}

	/**
	 * 按HQL查询对象列表.
	 * @param hql "from Users where name=? and password=?"
	 * @param values 数量可变的参数,按顺序绑定.
	 * @return
	 */
	public List<T> findHqlList(String hql, Object... values)
	{
		return HibernateUtils.createQuery(getSession(), hql, values).list();
	}

	/**
	 * 按HQL查询对象列表.
	 * @param hql "from Users where name=:name and password=:password"
	 * @param values 命名参数,按名称绑定.
	 * @return 
	 */
	public List<T> findHqlNameList(String hql, Map<String, ?> values)
	{
		return HibernateUtils.createQuery(getSession(), hql, values).list();
	}

	/**
	 * 执行HQL进行批量修改/删除操作.
	 * @return 更新记录数.
	 */
	public int batchExecute(String hql, Object... values)
	{
		return HibernateUtils.createQuery(getSession(), hql, values).executeUpdate();
	}

	/**
	 * 执行HQL进行批量修改/删除操作.
	 * @return 更新记录数.
	 */
	public int batchExecute(String hql, Map<String, ?> values)
	{
		return HibernateUtils.createQuery(getSession(), hql, values).executeUpdate();
	}

	//--------------------------------------------------------------------------------------------------

	/**
	 * 本地SQL进行查询操作.
	 * @return 更新记录数.
	 */
	public List findBySql(String sql, Object...values)
	{
		return HibernateUtils.find(getSession(), sql, values);
	}
	/**
	 * 本地SQL进行查询操作.
	 * @return 更新记录数.
	 */
	public Object uniqueResult(String sql, Object...values)
	{
		return HibernateUtils.uniqueResult(getSession(), sql, values);
	}
	
	/**
	 * 本地SQL进行新增/修改/删除操作.
	 * @param sql
	 * @param values
	 */
	public int executeBySql(String sql, Object...values){
		return HibernateUtils.execute(getSession(), sql, values);
	}
	
	/**
	 * 查询counnt
	 */
	public int getCountWithSql(String sql, Object... values) {
		Assert.hasText(sql, "sql不能为空");
		SQLQuery query = getSession().createSQLQuery(sql);
		for (int i = 0; i < values.length; i++){
			query.setParameter(i, values[i]);
		}
		return ((BigInteger) query.uniqueResult()).intValue();
	}
	
	/**
	 * 将list的值赋给对象
	 */
	public List<T> converterList(Class entityClass, List<Object[]> list, List<String> fieldNameList){
		//组装数据
		Map<String, Object> map = new HashMap<String, Object>();
		List<T> lists = new ArrayList<T>();
		if(list != null && list.size() > 0){  //遍历记录
			for (Object[] objArray : list) {
				try {
					//在这里新建对象，然后对其赋值
					T entity = (T) entityClass.newInstance();
					for (int i=0; i<fieldNameList.size(); i++)	 {
						map.put(fieldNameList.get(i), objArray[i]);
					}
					//利用Field.set(entity, fieldName)，对实体类赋值
					intiEntityFieldValue(entity, map);
					lists.add(entity);
				} catch (InstantiationException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		}
		return lists;
	}
	
	/**
	 * 将list的值赋给对象
	 */
	public List<T> converterList(List<Object[]> list, List<String> fieldNameList){
		//组装数据
		Map<String, Object> map = new HashMap<String, Object>();
		List<T> lists = new ArrayList<T>();
		if(list != null && list.size() > 0){  //遍历记录
			for (Object[] objArray : list) {
				try {
					//在这里新建对象，然后对其赋值
					T entity = (T) entityClass.newInstance();
					for (int i=0; i<fieldNameList.size(); i++)	 {
						map.put(fieldNameList.get(i), objArray[i]);
					}
					//利用Field.set(entity, fieldName)，对实体类赋值
					intiEntityFieldValue(entity, map);
					lists.add(entity);
				} catch (InstantiationException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		}
		return lists;
	}
	
	/**
	 * 利用反射，给对象赋值
	 * @return 
	 */
	public T intiEntityFieldValue(T entity, Map<String, Object> map){
		Set<String> keys = map.keySet();
		Iterator<String> keysI = keys.iterator();
		while(keysI.hasNext()){
			String fieldName = keysI.next();
			Field field = ReflectionUtils.getDeclaredField(entity, fieldName);
			if (field == null){
				throw new IllegalArgumentException("Could not find field [" + fieldName + "] on target [" + entity + "]");
			}
			ReflectionUtils.makeAccessible(field);
			initField(field, entity, map.get(fieldName));
		}
		return null;
	}
	
	/**
	 * 初始化字段
	 */
	public T initField(Field field, T entity, Object fieldValue){
		try{
			String type = field.getType().toString();//得到此属性的类型
			if(type.endsWith("String")){//判断枚举
				field.set(entity, String.valueOf(fieldValue));
			}else if(type.equals("short") || type.endsWith("Short")){
				field.set(entity, (Short)fieldValue);
			}else if(type.equals("int") || type.endsWith("Integer")){
				if(fieldValue instanceof BigDecimal){
					field.set(entity, ((BigDecimal)fieldValue).intValue());
				}else if(fieldValue instanceof BigInteger){
					field.set(entity, ((BigInteger)fieldValue).intValue());
				}else{
					field.set(entity, ((Integer)fieldValue).intValue());
				}
			}else if(type.equals("long") || type.endsWith("Long")){
				field.set(entity, ((Long)(fieldValue)).longValue());
			}else if(type.equals("float") || type.endsWith("Float")){
				field.set(entity, ((Float)(fieldValue)).floatValue());
			}else if(type.equals("double") || type.endsWith("Double")){
				field.set(entity, ((Double)(fieldValue)).doubleValue());
			}else if(type.equals("boolean") || type.endsWith("Boolean")){
				field.set(entity, ((Boolean)(fieldValue)).booleanValue());
			}else if(type.endsWith("Date")){
				field.set(entity, new Date(Long.parseLong(fieldValue.toString())));
			}
			
		} catch (IllegalAccessException e){
			logger.error("不可能抛出的异常:{}", e.getMessage());
		}
		return null;
	}

}
