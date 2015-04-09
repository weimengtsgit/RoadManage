package org.base4j.utils;

import org.base4j.orm.hibernate.BaseService;

public class SortUtil {


	public static synchronized void sort(BaseService<?> service,
			String tableName, Integer id, Integer sort, Integer afterSort,
			Integer beforeSort, Integer p,String sortField) {
		 
		// 拖拽移动
		if(afterSort!=null && beforeSort!=null){
			// 如果beforeSort != -1 ,则表示移动到beforeSort之后
			if(beforeSort.intValue()!=-1){
				// 如果是向前移动
				if(beforeSort.intValue()>sort.intValue()){
					// 把sort<beforeSort 且 sort>当前记录sort的记录 的sort值 减1
					service.executeBySql("update "+tableName+" set "+sortField+"=("+sortField+"-1) where "+sortField+" < ? and "+sortField+" > ?", beforeSort,sort);
					// 把当前记录的sort 设置为 beforeSort-1
					service.executeBySql("update "+tableName+" set "+sortField+"=? where id = ?",beforeSort-1	,id);
					
				}else{
					// 如果是向后移动
					// 把sort>=beforeSort且 sort<当前记录sort的记录 的sort值 加1
					service.executeBySql("update "+tableName+" set "+sortField+"=("+sortField+"+1) where "+sortField+" >= ? and "+sortField+" < ?", beforeSort,sort);
					// 把当前记录的sort 设置为 beforeSort
					service.executeBySql("update "+tableName+" set "+sortField+"=? where id = ?",beforeSort	,id);
					
				}
			}else{// 如果afterSort != -1 ,则表示移动到afterSort之前
				// 如果是向前移动
				if(afterSort.intValue()>sort.intValue()){
					// 把sort<=beforeSort 且 sort>当前记录sort的记录 的sort值 减1
					service.executeBySql("update "+tableName+" set "+sortField+"=("+sortField+"-1) where "+sortField+" <= ? and "+sortField+" > ?", afterSort,sort);
					// 把当前记录的sort 设置为 afterSort
					service.executeBySql("update "+tableName+" set "+sortField+"=? where id = ?",afterSort	,id);
					
				}else{
					// 如果是向后移动
					// 把sort>afterSort且 sort<当前记录sort的记录 的sort值 加1
					service.executeBySql("update "+tableName+" set "+sortField+"=("+sortField+"+1) where "+sortField+" > ? and "+sortField+" < ?", afterSort,sort);
					// 把当前记录的sort 设置为 afterSort+1
					service.executeBySql("update "+tableName+" set "+sortField+"=? where id = ?",afterSort+1	,id);
					
				}
			}
		}else{
			switch (p.intValue()) {
				
				// 置顶
				case 1:
					// 查询出最大sort 
					Object o = service.uniqueResult("select max("+sortField+")+1 from "+tableName+"");
					service.executeBySql("update "+tableName+"  set "+sortField+" = ? where id = ?",o,id);
					
					
					break;
	
				// 置底
				case 2:
					// 查询出最大sort 
					o = service.uniqueResult("select min("+sortField+")-1 from "+tableName+"");
					service.executeBySql("update "+tableName+"  set "+sortField+" = ? where id = ?",o,id);

					break;
					
				// 前移
				case 3:
					// 查询出上一个sort 的 id
					o = service.uniqueResult("select id from "+tableName+" where "+sortField+" > ? order by "+sortField+"  limit 1",sort);
					
					// 交换值
					switchFieldValue(service,tableName,sortField,id,o);
					
					break;
					
				// 后移
				case 4:
					// 查询出上一个sort 的 id
					o = service.uniqueResult("select id from "+tableName+" where "+sortField+" < ? order by "+sortField+" desc limit 1",sort);
					
					// 交换值
					switchFieldValue(service,tableName,sortField,id,o);
					
					break;
			}
		}
		
	}

	private static void switchFieldValue(BaseService<?> service,
			String tableName, String sortField, Integer id, Object o) {
		service.executeBySql("update "+tableName+" as q1 join "+tableName+" as q2 on (q1.id=? and q2.id = ?)or(q1.id = ? and q2.id=?) set q1."+sortField+" = q2."+sortField+",q2."+sortField+"=q1."+sortField+"",id,o,o,id);
	}
	
	
	
}
