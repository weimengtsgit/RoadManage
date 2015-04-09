package org.base4j.utils;

public class FieldObj {

	private String fieldTitle;

	private String fieldName;

	private String fieldType;
	
	private String fieldEnumType;
	
	public FieldObj() {
		super();
	}
	
	public FieldObj(String fieldTitle, String fieldName, String fieldType, String fieldEnumType) {
		super();
		this.fieldTitle = fieldTitle;
		this.fieldName = fieldName;
		this.fieldType = fieldType;
		this.fieldEnumType = fieldEnumType;
	}

	public String getFieldTitle() {
		return fieldTitle;
	}

	public void setFieldTitle(String fieldTitle) {
		this.fieldTitle = fieldTitle;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	public String getFieldEnumType() {
		return fieldEnumType;
	}

	public void setFieldEnumType(String fieldEnumType) {
		this.fieldEnumType = fieldEnumType;
	}
}
