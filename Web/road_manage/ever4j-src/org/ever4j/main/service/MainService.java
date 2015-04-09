package org.ever4j.main.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;

import org.ever4j.system.entity.SysUser;
import org.ever4j.system.pojo.MainMenuPojo;

@Service
public class MainService extends BaseService<SysUser> {
	
	@Override
	@Resource(name="sysUserDao")
	public void setBaseDao(BaseDao<SysUser> baseDao){
		this.baseDao = baseDao;
	}
	
	/**
	 * 查询当前用户拥有的目录和链接(按钮除外)
	 * @param curUser
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<MainMenuPojo> findMenuInfo(SysUser curUser){
		Integer suerId = curUser.getId();
		String sql = null;
		List<Object> objs = null;
		// 超级管理员拥有所有权限
		if("1".equals(curUser.getUserType())){
			sql = "SELECT m.id, m.menu_desc, m.menu_name, m.menu_type,m.parent_id, m.external, m.target ,m.icon ,m.summary ,m.enabled FROM sys_menu m where  m.visible != '0' and m.menu_type!='3' order by m.menu_seq";
			objs = this.baseDao.findBySql(sql);
		}
		// 其他管理员
		else{
			sql = "SELECT m.id, m.menu_desc, m.menu_name, m.menu_type,m.parent_id, m.external, m.target ,m.icon  ,m.summary ,m.enabled FROM sys_user u, sys_role r,sys_menu_role mr, sys_menu m where m.visible != '0' and  m.menu_type!='3'  and u.id = ? and u.user_role=r.id and r.id=mr.role_id and mr.menu_id=m.id order by m.menu_seq";
			objs = this.baseDao.findBySql(sql, suerId);
		}

		List<MainMenuPojo> menuLists = new ArrayList<MainMenuPojo>();
		if(objs != null && objs.size() > 0){
			
			for (Object obj : objs) {
				if(obj != null){
					Object[] strs = (Object[])obj;
					Integer id = (Integer)strs[0];
					String menuDesc = (String)strs[1];
					String menuName = (String)strs[2];
					String menuType = (String)strs[3];
					Integer parentId = strs[4] == null ? null : (Integer)strs[4];
					Integer external = strs[5] == null ? 2 : (Integer)strs[5];
					String target = strs[6] == null ? "" : (String)strs[6];
					String icon = (String)strs[7];
					String  summary  = (String)strs[8];
					String  enabled  = (String)strs[9];
					
					MainMenuPojo targetMenu = new MainMenuPojo(id, menuDesc, menuName, menuType, parentId, external,target,icon,summary,enabled);
					menuLists.add(targetMenu);
				}
			}
		}
		return menuLists;
	}
	
	/**
	 * 获得当前用户的导航菜单
	 * @param userOwnMenuList
	 * @return
	 */
	public List<MainMenuPojo> findNavMenu(List<MainMenuPojo> userOwnMenuList){
		List<MainMenuPojo> navMenus = new ArrayList<MainMenuPojo>();
		
		if(userOwnMenuList != null && userOwnMenuList.size() > 0){
			for (MainMenuPojo ownMenu : userOwnMenuList) {
				if(ownMenu != null){
				
					Integer pid = ownMenu.getPid();
					if(pid == null){
						navMenus.add(ownMenu);
					}
				}
			}
		}
		return navMenus;
	}
	
	
	
	/***************菜单Tree的创建过程*****************/
//	/**
//	 * 获得当前用户的所有菜单
//	 * @param curUser
//	 * @return
//	 */
//	public List<SysMenu> findMenuInfo(SysUser curUser){
//		
//		List<SysMenu> userOwnMenuList = new ArrayList<SysMenu>();
//		Set<SysMenu> userOwnMenuSet = new HashSet<SysMenu>();
//		
//		//获得当前用户角色
//		List<SysRole> curUserRoles = curUser.getRoles();
//		if(curUserRoles != null && curUserRoles.size() > 0){
//			for (SysRole sysRole : curUserRoles) {
//				if(sysRole != null){
//
//					//获得角色的菜单
//					List<SysMenu> curUserMenus = sysRole.getMenus();
//					if(curUserMenus != null && curUserMenus.size() > 0){
//						for (SysMenu sysMenu : curUserMenus) {
//							if(sysMenu != null && userOwnMenuSet.add(sysMenu)){
//								userOwnMenuList.add(sysMenu);
//							}
//						}
//					}
//				}
//			}
//		 }
//		
//		return userOwnMenuList;
//	}
//	
//	/**
//	 * 获得导航菜单
//	 * @param userOwnMenuSet
//	 * @return
//	 */
//	public List<SysMenu> findNavMenu(List<SysMenu> userOwnMenuList){
//		List<SysMenu> navMenu = new ArrayList<SysMenu>();
//		
//		if(userOwnMenuList != null && userOwnMenuList.size() > 0){
//			Iterator<SysMenu> userOwnMenuSetI = userOwnMenuList.iterator();
//			
//			while(userOwnMenuSetI.hasNext()){
//				
//				SysMenu ownNavMenu = userOwnMenuSetI.next();
//				if(ownNavMenu != null){
//					SysMenu parentMenu = ownNavMenu.getParentId();
//					if(parentMenu == null){
//
//						navMenu.add(ownNavMenu);
//					}
//				}
//			}
//		}
//		
//		return navMenu;
//	}
//	
//	/**
//	 * 通过导航菜单获得treeMenu
//	 * @return
//	 */
//	public List<MainMenuPojo> createTreeMenuSet(String account){
//		
//		
//		SysUser curUser = findSysUserByAccount(account);			//查询当前用户
//		List<SysMenu> userOwnMenuList = findMenuInfo(curUser);		//查询当前用户所有的菜单
//		List<SysMenu> navMenu = findNavMenu(userOwnMenuList);		//查询当前用户所有的导航菜单
//		MenuComparator.sysMenuOrder(navMenu);						//排序
//		List<MainMenuPojo> treeMenus = new ArrayList<MainMenuPojo>();//创建树集合
//		
//		return traverseMenu(navMenu, userOwnMenuList, treeMenus);
//	}
//	
//	public List<MainMenuPojo> traverseMenu(List<SysMenu> navMenu, List<SysMenu> userOwnMenuList, List<MainMenuPojo> treeMenus){
//		
//		Iterator<SysMenu> sysMenuI = navMenu.iterator();
//		while(sysMenuI.hasNext()){
//			SysMenu curMenu = sysMenuI.next();
//			Integer curMenuId = curMenu.getId();
//			
//			if(curMenu.getMenuType().equals("1")){//菜单
//				if(curMenu.getParentId() == null || curMenu.getParentId().getId() == null){//导航
//					MainMenuPojo curMenuPojo = createMenuPojo(curMenu.getId(), curMenu.getMenuDesc());
//					treeMenus.add(curMenuPojo);
//					
//					traverseMenu(curMenu.getMenus(), userOwnMenuList, treeMenus);
//				}else{
//
//					//寻找自己有的资源菜单
//					for (SysMenu sysMenu : userOwnMenuList) {
//						if(curMenuId == sysMenu.getId()){
//							
//							Integer id = curMenu.getParentId().getId();
//							MainMenuPojo targetMenuPojo = findTreeMenuPojoById(treeMenus, id);
//							if(targetMenuPojo != null){
//								List<MainMenuPojo> targetChildMenus = targetMenuPojo.getMenus();
//								MainMenuPojo curMenuPojo = createMenuPojo(curMenu.getId(), curMenu.getMenuDesc());
//								targetChildMenus.add(curMenuPojo);
//							}
//							traverseMenu(curMenu.getMenus(), userOwnMenuList, treeMenus);
//						}
//					}
//				}
//			}else if(curMenu.getMenuType().equals("2")){//链接
//				//寻找自己有的资源菜单
//				for (SysMenu sysMenu : userOwnMenuList) {
//					if(curMenuId == sysMenu.getId()){
//						
//						Integer id = curMenu.getParentId().getId();
//						MainMenuPojo targetMenuPojo = findTreeMenuPojoById(treeMenus, id);
//						if(targetMenuPojo != null){
//							List<MainMenuPojo> targetChildMenus = targetMenuPojo.getMenus();
//							MainMenuPojo curMenuPojo = createMenuLinkPojo(curMenu.getId(), curMenu.getMenuDesc(), curMenu.getMenuName());
//							targetChildMenus.add(curMenuPojo);
//						}
//					}
//				}
//			}//按钮
//		}
//		
//		return treeMenus;
//	}
//	
//	/**
//	 * 创建菜单对象
//	 * @param id
//	 * @param menuDesc
//	 * @return
//	 */
//	public MainMenuPojo createMenuPojo(Integer id, String menuDesc){
//		MainMenuPojo curMainMenuPojo = new MainMenuPojo();
//		List<MainMenuPojo> menus = new ArrayList<MainMenuPojo>();
//		
//		curMainMenuPojo.setId(id);
//		curMainMenuPojo.setMenuDesc(menuDesc);
//		curMainMenuPojo.setMenuName("");
//		curMainMenuPojo.setMenuRel("");
//		curMainMenuPojo.setMenuType("1");
//		curMainMenuPojo.setDispaly("1");
//		curMainMenuPojo.setMenus(menus);
//		
//		return curMainMenuPojo;
//	}
//	
//	/**
//	 * 创建链接对象
//	 * @param id
//	 * @param menuDesc
//	 * @param menuName
//	 * @return
//	 */
//	public MainMenuPojo createMenuLinkPojo(Integer id, String menuDesc, String menuName){
//		MainMenuPojo curMainMenuPojo = new MainMenuPojo();
//		List<MainMenuPojo> menus = new ArrayList<MainMenuPojo>();
//		curMainMenuPojo.setId(id);
//		curMainMenuPojo.setMenuDesc(menuDesc);
//		curMainMenuPojo.setMenuName(menuName);
//		curMainMenuPojo.setMenuRel((menuName.replaceAll("/", "_")).toUpperCase());
//		curMainMenuPojo.setMenuType("2");
//		curMainMenuPojo.setDispaly("1");
//		curMainMenuPojo.setMenus(menus);
//		return curMainMenuPojo;
//	}
//	
//	/**
//	 * 迭代查询自己创建的数
//	 * @param treeMenus
//	 * @param id
//	 * @return
//	 */
//	public MainMenuPojo findTreeMenuPojoById(List<MainMenuPojo> treeMenus, Integer id){
//		List<MainMenuPojo> targetList = new ArrayList<MainMenuPojo>();
//		List<MainMenuPojo> targetMenuPojos = traverseTreeMenu(treeMenus, id, targetList);
//		
//		if(targetMenuPojos.size() > 0){
//			return targetMenuPojos.get(0);
//		}
//		
//		return null;
//	}
//	
//	public List<MainMenuPojo> traverseTreeMenu(List<MainMenuPojo> treeMenus, Integer id, List<MainMenuPojo> targetList){
//		if(treeMenus != null && treeMenus.size() > 0){
//			for (MainMenuPojo mainMenuPojo : treeMenus) {
//				Integer curId = mainMenuPojo.getId();
//				if(curId == id){
//					targetList.add(mainMenuPojo);
//				}else{
//					if(mainMenuPojo.getMenuType().equals("1")){
//						traverseTreeMenu(mainMenuPojo.getMenus(), id, targetList);
//					}
//				}
//			}
//		}
//		return targetList;
//	}
}

