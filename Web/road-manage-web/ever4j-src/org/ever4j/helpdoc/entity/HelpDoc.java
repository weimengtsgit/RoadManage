package org.ever4j.helpdoc.entity;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.base4j.orm.hibernate.BaseEntity;

import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import org.ever4j.system.entity.SysMenu;

@Entity
@Table(name="sys_help_doc")
@ClassConfig(title="帮助文档", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class HelpDoc extends BaseEntity{
	
	@FieldConfig(title="文档标题", validate="required")
    private String docTitle;
    
	@FieldConfig(title="文档内容", validate="required", maxlength=2048, isShowList=false, isShowSearch=false)
	@Lob
    private String docContent;
	
	
	@FieldConfig(title="文档描述", maxlength=250, isShowSearch=false)
	private String docDesc;
    
    @FieldConfig(title="所属菜单", validate="required", valueField="menuDesc")
	@ManyToOne
	@JoinColumn(name="sysMenu")
    private SysMenu sysMenu;

	public String getDocTitle() {
		return docTitle;
	}

	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}

	public String getDocContent() {
		return docContent;
	}

	public void setDocContent(String docContent) {
		this.docContent = docContent;
	}

	public SysMenu getSysMenu() {
		return sysMenu;
	}

	public void setSysMenu(SysMenu sysMenu) {
		this.sysMenu = sysMenu;
	}

	public String getDocDesc() {
		return docDesc;
	}

	public void setDocDesc(String docDesc) {
		this.docDesc = docDesc;
	}
}
