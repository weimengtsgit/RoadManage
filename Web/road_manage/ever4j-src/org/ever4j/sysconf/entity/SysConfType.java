package org.ever4j.sysconf.entity;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.base4j.orm.hibernate.BaseEntity;

import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name="sys_conf_type")
@ClassConfig(title="配置类型", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class SysConfType extends BaseEntity{
	
	@FieldConfig(title="配置名称")
    private String confName;
	
	@FieldConfig(title="配置标识")
	private String confKey;
    
	@FieldConfig(title="配置描述",maxlength=200)
    private String confDes;

	@Transient
	private List<SysConfIitem> list = new ArrayList<SysConfIitem>();
	
	public String getConfName() {
		return confName;
	}

	public void setConfName(String confName) {
		this.confName = confName;
	}

	public String getConfDes() {
		return confDes;
	}

	public void setConfDes(String confDes) {
		this.confDes = confDes;
	}

	public List<SysConfIitem> getList() {
		return list;
	}

	public void setList(List<SysConfIitem> list) {
		this.list = list;
	}

	public String getConfKey() {
		return confKey;
	}

	public void setConfKey(String confKey) {
		this.confKey = confKey;
	}
}
