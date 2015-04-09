package com.dearcom.queue.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

import com.dearcom.mall.entity.Mall;
@Entity
@Table(name="com_QueueConfigMall")
@ClassConfig(title="商场排队配置", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class QueueConfigMall extends BaseEntity{
	
	 	@FieldConfig(title="所属商场", valueField="name")
		@ManyToOne
		@JoinColumn(name="mall_id")
	    private Mall mall;
	 	
	 	@FieldConfig(title = "最多同时领取排卡的数量")
	 	private Integer maxQueueCard;

		public Mall getMall() {
			return mall;
		}

		public void setMall(Mall mall) {
			this.mall = mall;
		}

		public Integer getMaxQueueCard() {
			return maxQueueCard;
		}

		public void setMaxQueueCard(Integer maxQueueCard) {
			this.maxQueueCard = maxQueueCard;
		}
	 	
	 	
}
