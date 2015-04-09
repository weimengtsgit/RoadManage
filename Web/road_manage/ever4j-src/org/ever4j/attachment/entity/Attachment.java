package org.ever4j.attachment.entity;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.base4j.orm.hibernate.BaseEntity;

import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="sys_Attachment")
@ClassConfig(title="附件信息", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class Attachment extends BaseEntity{
	
	@FieldConfig(title="附件名称")
    private String attachName;
    
	@FieldConfig(title="附件描述",maxlength=200)
    private String attachDes;
    
	@FieldConfig(title="附件ID")
    private String attachId;
    
	@FieldConfig(title="附件资源")
    private String attachUri;
	
	public String getAttachName() {
		return attachName;
	}

	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}

	public String getAttachDes() {
		return attachDes;
	}

	public void setAttachDes(String attachDes) {
		this.attachDes = attachDes;
	}

	public String getAttachId() {
		return attachId;
	}

	public void setAttachId(String attachId) {
		this.attachId = attachId;
	}

	public String getAttachUri() {
		return attachUri;
	}

	public void setAttachUri(String attachUri) {
		this.attachUri = attachUri;
	}
}
