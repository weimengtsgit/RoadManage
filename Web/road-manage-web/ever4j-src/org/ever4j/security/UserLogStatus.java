package org.ever4j.security;



public class UserLogStatus {
	
	private int failTimes = 0;
	
	public boolean lockedStatus = false;//true:锁定，false：未锁定
	
	private long lockedTmie = 0;

	public UserLogStatus() {
		super();
	}

	public UserLogStatus(int failTimes, boolean lockedStatus, long lockedTmie) {
		super();
		this.failTimes = failTimes;
		this.lockedStatus = lockedStatus;
		this.lockedTmie = lockedTmie;
	}

	public int getFailTimes() {
		return failTimes;
	}

	public void setFailTimes(int failTimes) {
		this.failTimes = failTimes;
	}

	public boolean isLockedStatus() {
		return lockedStatus;
	}

	public void setLockedStatus(boolean lockedStatus) {
		this.lockedStatus = lockedStatus;
	}

	public long getLockedTmie() {
		return lockedTmie;
	}

	public void setLockedTmie(long lockedTmie) {
		this.lockedTmie = lockedTmie;
	}
}
