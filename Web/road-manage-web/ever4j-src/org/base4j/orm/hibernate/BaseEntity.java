package org.base4j.orm.hibernate;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * entity基类.
 * 
 *
 */
@MappedSuperclass
public class BaseEntity
{
	@Id
	//主键自动生成策略：数据库自动增长
	@GeneratedValue
	//主键
	protected Integer id;
	
//	//是否显示
//	@Column()
//	protected boolean visible = true;
	
	//插入时间
//	@Temporal(TemporalType.TIMESTAMP )
//	@Column(updatable=false,columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
//	protected Date createTime;
	
	/*//创建人
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(updatable=false)
	protected SysUser insertUser;*/
	
	//最后一次修改时间
//	@Temporal(TemporalType.TIMESTAMP)
//	@Column()
//	protected Date lastUpdateTime;
//	
	/*//最后一次修改人
	@ManyToOne(fetch=FetchType.LAZY)
	protected SysUser lastUpdateUser;*/

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

//	public boolean isVisible()
//	{
//		return visible;
//	}
//
//	public void setVisible(boolean visible)
//	{
//		this.visible = visible;
//	}

//	public Date getCreateTime()
//	{
//		return createTime;
//	}
//
//	public void setCreateTime(Date createTime)
//	{
//		this.createTime = createTime;
//	}

//	public Date getLastUpdateTime()
//	{
//		return lastUpdateTime;
//	}
//
//	public void setLastUpdateTime(Date lastUpdateTime)
//	{
//		this.lastUpdateTime = lastUpdateTime;
//	}


	/**
	 * 是否是新对象
	 * @return
	 */
	@JsonIgnore
	public boolean isNew()
	{
		return (this.id == null);
	}

}
