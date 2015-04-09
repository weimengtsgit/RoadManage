package org.ever4j.utils;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.ever4j.system.entity.SysMenu;

/**
 * 实现对SysMenuList的排序
 * @author Administrator
 *
 */
public class MenuComparator implements Comparator<SysMenu>{

	@Override
	public int compare(SysMenu menu1, SysMenu menu2) {
		
		if(menu1 != null && menu2 != null){
			return menu1.getMenuSeq().compareTo(menu2.getMenuSeq());
		}
		
		return 0;
	}
	
	public static List<SysMenu> sysMenuOrder(List<SysMenu> menus){
		
		return traverseMenu(menus);
	}
	
	public static List<SysMenu> traverseMenu(List<SysMenu> menus){
		if(menus != null && menus.size() > 0){
			MenuComparator comparator = new MenuComparator();
			Collections.sort(menus, comparator);
			
			for (SysMenu sysMenu : menus) {
				if(sysMenu != null){
//					traverseMenu(sysMenu.getMenus());
				}
			}
		}
		
		return menus;
	}
}
