package org.ever4j.utils;

import java.io.IOException;
import java.util.Date;

import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.DeserializationContext;
import org.codehaus.jackson.map.JsonDeserializer;

public class CustomDateDeSerializer extends JsonDeserializer<Date>{

	@Override
	public Date deserialize(JsonParser jp, DeserializationContext dc)
			throws IOException, JsonProcessingException {
		 String str = jp.getText();
         
         Date date = TimeUtil.parseDate(str);
         
         return date;
	}

}