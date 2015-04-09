package org.ever4j.system.pojo;

import java.util.List;

/**
 * 排序菜单对象
 * @author Administrator
 *
 */
public class OderMenu {

	private Integer parentId;
	
	private Integer moveId;
	
	private List<OderChildMenu> childrens;

	public List<OderChildMenu> getChildrens() {
		return childrens;
	}

	public void setChildrens(List<OderChildMenu> childrens) {
		this.childrens = childrens;
	}

	@Override
	public String toString() {
		return "OderMenu [parentId=" + parentId + ", moveId=" + moveId + ", childrens=" + childrens + "]";
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getMoveId() {
		return moveId;
	}

	public void setMoveId(Integer moveId) {
		this.moveId = moveId;
	}
}
