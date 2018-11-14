package kr.co.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {
	private static Map<String, MediaType> mediaMap;
	
	//인스턴스초기화 {}
	//스타틱은 스타틱{} 이캐해주면 초기화
	static {
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG",MediaType.IMAGE_JPEG);
		mediaMap.put("PNG",MediaType.IMAGE_PNG);
		mediaMap.put("GIF",MediaType.IMAGE_GIF);
	}
	
	public static MediaType getMediaType(String type) {
		String upper=type.toUpperCase();
		
		return mediaMap.get(upper);
	}
	
	
	
	

}
