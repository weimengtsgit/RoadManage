package org.ever4j.mailsend.email;

/**
 * 
 * @version 1.0 , 2011-5-19
 * @author wcl
 *
 */
public class EmailAddress {
	/**
	 * 姓名
	 */
	private String name;
	
	/**
	 * 地址
	 */
	private String address;

	
	
	
	public EmailAddress(String name, String address) {
		super();
		this.name = name;
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof EmailAddress) {
			EmailAddress emailAddress = (EmailAddress) obj;
			return this.address.equals(emailAddress.getAddress());
		}else{
			return super.equals(obj);
		}
	}

	@Override
	public int hashCode() {
		return this.address.hashCode();
	}
}
