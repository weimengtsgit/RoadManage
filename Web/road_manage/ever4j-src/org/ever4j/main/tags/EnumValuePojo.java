package org.ever4j.main.tags;

/**
 * 枚举值对象
 * @author Administrator
 *
 */
public class EnumValuePojo {

	/**
	 * 枚举-键
	 */
	private String enumKey;
	
	/**
	 * 枚举-值
	 */
	private String enumVal;
	
	/**
	 * 序列
	 */
	private Integer enumSeq;

	public EnumValuePojo() {
		super();
	}
	
	public EnumValuePojo(String enumKey, String enumVal, Integer enumSeq) {
		super();
		this.enumKey = enumKey;
		this.enumVal = enumVal;
		this.enumSeq = enumSeq;
	}

	public String getEnumKey() {
		return enumKey;
	}

	public void setEnumKey(String enumKey) {
		this.enumKey = enumKey;
	}

	public String getEnumVal() {
		return enumVal;
	}

	public void setEnumVal(String enumVal) {
		this.enumVal = enumVal;
	}

	public Integer getEnumSeq() {
		return enumSeq;
	}

	public void setEnumSeq(Integer enumSeq) {
		this.enumSeq = enumSeq;
	}
	
}
