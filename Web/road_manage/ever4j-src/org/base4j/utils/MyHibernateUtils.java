package org.base4j.utils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.impl.CriteriaImpl;
import org.hibernate.transform.ResultTransformer;
import org.base4j.orm.Compositor;
import org.base4j.orm.Compositor.CompositorType;
import org.base4j.orm.Filtration;
import org.base4j.orm.Filtration.MatchType;
import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseEntity;
import org.springframework.util.Assert;

/**
 * hibernate工具类
 * 
 * 
 * 
 */
public class MyHibernateUtils {
	/**
	 * 根据Criterion条件创建Criteria.
	 */
	public static Criteria createCriteria(Session session,
			Class<? extends BaseEntity> entityClass, Criterion... criterions) {
		Criteria criteria = session.createCriteria(entityClass);
		for (Criterion criterion : criterions) {
			criteria.add(criterion);

		}
		return criteria;
	}

	/**
	 * 根据查询HQL与参数列表创建Query对象.
	 */
	public static Query createQuery(Session session, String hql,
			Object... values) {
		Assert.hasText(hql, "hql不能为空");
		Query query = session.createQuery(hql);

		for (int i = 0; i < values.length; i++) {
			query.setParameter(i, values[i]);
		}

		return query;
	}

	/**
	 * 根据查询HQL与参数列表创建Query对象.
	 */
	public static Query createQuery(Session session, String hql,
			Map<String, ?> values) {
		Assert.hasText(hql, "hql不能为空");
		Query query = session.createQuery(hql);
		if (values != null) {
			query.setProperties(values);
		}
		return query;
	}

	/**
	 * 创建Criterion
	 */
	private static Criterion createCriterion(String fieldName,
			Object fieldValue, MatchType matchType) {
		Criterion criterion = null;
		Assert.hasText(fieldName, "fieldName不能为空");
		switch (matchType) {
		case EQ: // =
			criterion = Restrictions.eq(fieldName, fieldValue);
			break;
		case LIKE: // like
			criterion = Restrictions.like(fieldName, (String) fieldValue,
					MatchMode.ANYWHERE);
			break;
		case LT: // <
			criterion = Restrictions.lt(fieldName, fieldValue);
			break;
		case LE: // <=
			criterion = Restrictions.le(fieldName, fieldValue);
			break;
		case GT: // >
			criterion = Restrictions.gt(fieldName, fieldValue);
			break;
		case GE: // >=
			criterion = Restrictions.ge(fieldName, fieldValue);
			break;
		}
		return criterion;
	}

	/**
	 * 执行count查询获得本次Criteria查询所能获得的对象总数.
	 */
	@SuppressWarnings("unchecked")
	private static long countCriteriaResult(Criteria criteria) {
		CriteriaImpl impl = (CriteriaImpl) criteria;

		// 先把Projection、ResultTransformer、OrderBy取出来,清空三者后再执行Count操作
		Projection projection = impl.getProjection();
		ResultTransformer resultTransformer = impl.getResultTransformer();

		List<CriteriaImpl.OrderEntry> orderEntries = null;
		orderEntries = (List) ReflectionUtils.getFieldValue(impl,
				"orderEntries");
		ReflectionUtils.setFieldValue(impl, "orderEntries", new ArrayList());

		// 执行Count查询
		long totalCount = (Long) criteria.setProjection(Projections.rowCount())
				.uniqueResult();

		// 将之前的Projection,ResultTransformer和OrderBy条件重新设回去
		criteria.setProjection(projection);

		if (projection == null) {
			criteria.setResultTransformer(CriteriaSpecification.ROOT_ENTITY);
		}
		if (resultTransformer != null) {
			criteria.setResultTransformer(resultTransformer);
		}

		ReflectionUtils.setFieldValue(impl, "orderEntries", orderEntries);

		return totalCount;
	}

	/**
	 * 设置排序参数到Criteria对象
	 */
//	public static Criteria setCompositorParameter(Criteria criteria,
//			Compositor compositor) {
//
//		if (compositor != null) {
//			String fieldName = compositor.getFieldName();
//			String[] names = fieldName.split("\\.");
//			String name = names[names.length - 1];
//			CompositorType compositorType = compositor.getCompositorType();
//
//			Order order = null;
//			switch (compositorType) {
//			case asc:
//				order = (GBKOrder.asc(name));
//
//				break;
//			case desc:
//				order = (GBKOrder.desc(name));
//				break;
//			}
//
//			switch (names.length) {
//			case 1:
//				criteria.addOrder(order);
//				break;
//			case 2:
//				criteria.createAlias(names[0], names[0],
//						CriteriaSpecification.LEFT_JOIN).addOrder(order);
//				break;
//			case 3:
//				criteria.createCriteria(names[0]).createCriteria(names[1])
//						.addOrder(order);
//				break;
//			case 4:
//				criteria.createCriteria(names[0]).createCriteria(names[1])
//						.createCriteria(names[2]).addOrder(order);
//				break;
//
//			default:
//				break;
//			}
//
//		}
//
//		return criteria;
//	}

	/**
	 * 设置过滤条件到Criteria对象
	 * 
	 * @param compositor
	 */
	public static Criteria setFiltrationParameter(Class<? extends BaseEntity> entityClass,Criteria criteria,
			Compositor compositor, Filtration... filtrations) {
		CompositorType compositorType = null;
		Order order = null;
		if (compositor != null) {
			compositorType = compositor.getCompositorType();
			String fieldName = compositor.getFieldName();
			String[] names = fieldName.split("\\.");
			String name = names[names.length - 1];
			switch (compositorType) {
			case asc:
				order = (GBKOrder.asc(name));

				break;
			case desc:
				order = (GBKOrder.desc(name));
				break;
			}
		}
		boolean sorted=false;

		if (filtrations.length > 0) {
			List<Criterion> criterions = new ArrayList<Criterion>();
			for (Filtration filtration : filtrations) {
				Criterion criterion = null;

				if (!filtration.isMultiFilter()) {
					String name = filtration.getFieldName();
					if (name.indexOf(".") == -1) {
						criterion = createCriterion(filtration.getFieldName(),
								filtration.getFieldValue(),
								filtration.getMatchType());
						criterions.add(criterion);
						criteria.add(criterion);
						
					} else {
						String[] names = name.split("\\.");
						criterion = createCriterion(names[names.length - 1],
								filtration.getFieldValue(),
								filtration.getMatchType());
						switch (names.length) {
						case 2:
							if (compositor != null
									&& compositor.getFieldName().startsWith(names[0]+".")) {

								criteria.createCriteria(names[0])
										.add(criterion).addOrder(order);
								sorted=true;
								
							} else {
								criteria.createCriteria(names[0])
										.add(criterion);
							}
							break;
						case 3:
							criteria.createCriteria(names[0])
									.createCriteria(names[1]).add(criterion);
							break;
						case 4:
							criteria.createCriteria(names[0])
									.createCriteria(names[1])
									.createCriteria(names[2]).add(criterion);
							break;

						default:
							break;
						}
					}

				} else {
					// 包含多个属性需要比较的情况,进行or处理.
					Disjunction disjunction = Restrictions.disjunction();
					for (int i = 0; i < filtration.getFieldNames().length; i++) {
						Criterion c = createCriterion(filtration.getFieldNames()[i],
								filtration.getFieldValues()[i],
								filtration.getMatchTypes()[i]);
						disjunction.add(c);
					}
					criteria.add(disjunction);
				}
			}
		} 
		{
			if (!sorted&&compositor != null) {
				compositorType = compositor.getCompositorType();
				String fieldName = compositor.getFieldName();
				String[] names = fieldName.split("\\.");
				String name = names[names.length - 1];
				
				
				
				switch (compositorType) {
				case asc:
					order = (Order.asc(fieldName));

					break;
				case desc:
					order = (Order.desc(fieldName));
					break;
				}
				
				// 
				if(names.length>1 || isStringType(entityClass,name)){
					
					switch (compositorType) {
					case asc:
						order = (GBKOrder.asc(fieldName));
						
						break;
					case desc:
						order = (GBKOrder.desc(fieldName));
						break;
					}
					
				}
				
				switch (names.length) {
				case 1:
					criteria.addOrder(order);
					break;
				case 2:
					criteria.createAlias(names[0], names[0],
							CriteriaSpecification.LEFT_JOIN).addOrder(order);
					break;
				case 3:
					criteria.createCriteria(names[0]).createCriteria(names[1])
							.addOrder(order);
					break;
				case 4:
					criteria.createCriteria(names[0]).createCriteria(names[1])
							.createCriteria(names[2]).addOrder(order);
					break;

				default:
					break;
				}
			}
		}

		return criteria;
	}

	private static boolean isStringType(
			Class<? extends BaseEntity> entityClass, String name) {
		
		try {
			Field f = org.springframework.util.ReflectionUtils.findField(entityClass, name);
			if(f!=null && f.getType().equals(String.class)){
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	

	/**
	 * 设置过滤条件到Criteria对象
	 * 
	 * @param compositor
	 */
	public static Criteria setFiltrationParameter(Criteria criteria, Compositor compositor,
			List<Filtration> filtrationList,Class<? extends BaseEntity> entityClass) {
		if (filtrationList != null) {
			// Filtration[] filtrations = (Filtration[])
			// filtrationList.toArray();
			Filtration[] filtrations = new Filtration[filtrationList.size()];
			for (int i = 0; i < filtrationList.size(); i++) {
				filtrations[i] = filtrationList.get(i);
			}
			return setFiltrationParameter(entityClass,criteria, compositor, filtrations);
		} else {
			return criteria;
		}
	}

	/**
	 * 设置分页参数到Criteria对象
	 */
	public static Criteria setParameter(Criteria criteria, PageData<?> pageData,Class<? extends BaseEntity> entityClass) {
		// 第一步：设置查询条件
		setFiltrationParameter(criteria, pageData.getCompositor(),pageData.getFiltrations(),entityClass	);
		// 第二步：读取记录总数
		if (pageData.getPagination().isReadTotalCount()) {
			long totalCount = countCriteriaResult(criteria);
			pageData.getPagination().setTotalCount(totalCount);
		}

		// 第三步：设置查询范围
		criteria.setFirstResult(pageData.getPagination()
				.getCurrentlyPageFirstResoultIndex());
		criteria.setMaxResults(pageData.getPagination().getPageSize());

		return criteria;
	}

	public static List find(Session session, String sql, Object... values) {
		Assert.hasText(sql, "sql不能为空");
		SQLQuery query = session.createSQLQuery(sql);
		for (int i = 0; i < values.length; i++) {
			query.setParameter(i, values[i]);
		}
		return query.list();
	}
	
	public static int execute(Session session, String sql, Object... values) {
		Assert.hasText(sql, "sql不能为空");
		SQLQuery query = session.createSQLQuery(sql);
		for (int i = 0; i < values.length; i++) {
			query.setParameter(i, values[i]);
		}
		
		return query.executeUpdate();
	}
}
