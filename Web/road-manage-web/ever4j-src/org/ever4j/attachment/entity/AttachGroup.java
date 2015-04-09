package org.ever4j.attachment.entity;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.base4j.orm.hibernate.BaseEntity;

import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="sys_attach_group")
@ClassConfig(title="附件组", isShowMenu=false)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class AttachGroup extends BaseEntity{
	
    @FieldConfig(title="附件")
    @ManyToMany(cascade=CascadeType.ALL,targetEntity=Attachment.class)
	@JoinTable(name="sys_attachGroup_attachment")
    private List<Attachment> attachments;

	public List<Attachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}
    
}
