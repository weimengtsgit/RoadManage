package org.ever4j.utils;

import java.util.Comparator;

import org.ever4j.main.tags.EnumValuePojo;

public class EnumValueComparator implements Comparator<EnumValuePojo>{

	@Override
	public int compare(EnumValuePojo ev1, EnumValuePojo ev2) {
		
		if(ev1 != null && ev2 != null){
			
			return ev1.getEnumSeq().compareTo(ev2.getEnumSeq());
		}
		return 0;
	}
}
