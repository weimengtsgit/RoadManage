package org.ever4j.system.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.ever4j.main.constant.Constant;
import org.ever4j.system.entity.SysMenu;
import org.ever4j.system.entity.SysUser;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysMenuService extends BaseService<SysMenu> {
	@Override
	@Resource(name="sysMenuDao")
	public void setBaseDao(BaseDao<SysMenu> baseDao){
		this.baseDao = baseDao;
	}
	
	/**
	 * 给菜单添加权限标示符
	 * @param sysMenu
	 * @return
	 */
	public void grantedAuthority(SysMenu sysMenu){
		if(!"1".equals(sysMenu.getMenuType())){//菜单链接
			String menuName = sysMenu.getMenuName();
			if(menuName != null && !menuName.trim().equals("")){
				String curMenuName = menuName;
				if(menuName.startsWith("/") && menuName.length() > 1){
					curMenuName =  menuName.substring(1);
				}
				if(menuName.indexOf("?") != -1){
					curMenuName =  menuName.substring(0,menuName.indexOf("?"));
				}
				sysMenu.setAuthorityName(Constant.AUTH_PREFIX+curMenuName.replaceAll("/", "_").toUpperCase());
			}
		}
	}
	
	/**
	 * 根据seq获得菜单集合
	 * @param type "":所有菜单,1:不是目录，2:不是链接，3：不是按钮
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SysMenu> menuListOrderSeq(String type,SysUser user){
		StringBuilder sql = null;
		if(user==null || user.getUserType().equals("1")){
			
			sql = new StringBuilder("SELECT m.id, m.menu_desc, m.menu_name, m.menu_type,m.parent_id,m.menu_seq FROM sys_menu m  where m.visible=1 ");
		}else{
			sql = new StringBuilder("SELECT m.id, m.menu_desc, m.menu_name, m.menu_type,m.parent_id,m.menu_seq FROM sys_menu m ,sys_menu_role mr where m.id=mr.menu_id and m.visible=1 and mr.role_id ="+user.getUserRole().getId().toString()+" ");
			
		}
		if(type !=null && !type.equals("")){
			sql.append(" and m.menu_type !='"+type+"'");
		}
		sql.append(" order by m.parent_id, m.menu_seq");
		
		List<Object> objs = this.findBySql(sql.toString());
		List<SysMenu> menuLists = new ArrayList<SysMenu>();
		if(objs != null && objs.size() > 0){
			
			for (Object obj : objs) {
				if(obj != null){
					Object[] strs = (Object[])obj;
					Integer id = (Integer)strs[0];
					String menuDesc = (String)strs[1];
					String menuName = (String)strs[2];
					String menuType = (String)strs[3];
					Integer parentId = strs[4] == null ? null : (Integer)strs[4];
					Integer menuSeq = strs[5] == null ? 0 : (Integer)strs[5];
					
					SysMenu curSysMenu = null;
					if(parentId == null){
						curSysMenu = new SysMenu(id, menuDesc, menuType, menuName, menuSeq, "", "1", null);
					}else{
						SysMenu parentMenu = new SysMenu();
						parentMenu.setId(parentId);
						curSysMenu = new SysMenu(id, menuDesc, menuType, menuName, menuSeq, "", "1", parentMenu);
					}
					
					menuLists.add(curSysMenu);
				}
			}
		}
		return menuLists;
	}
}
