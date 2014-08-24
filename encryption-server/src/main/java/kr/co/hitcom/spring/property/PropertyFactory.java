package kr.co.hitcom.spring.property;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.stereotype.Component;

//@Component("propertyFactory")
public class PropertyFactory {
	
	//@Autowired
	private ReloadableResourceBundleMessageSource messageSource;
	
	/**
     * 코드에 해당하는 프로퍼티를 리턴
     *
     * @param code
     * @return
     */
    public String getProperty(String code) {
        return messageSource.getMessage(code, null, Locale.KOREA);
    }
    
    /**
     * <pre>
     * 1. 코드에 해당하는 프로퍼티를 리턴
     * 2. property 값이 없을 경우 defaultStr 을 return
     * </pre>
     *
     * @param code the code
     * @param defaultStr the default str
     * @return the property
     */
    public String getProperty(String code, String defaultStr) {
        return messageSource.getMessage(code, null, defaultStr, Locale.KOREA);
    }
    
    /**
     * <pre>
     * 파라미터가 포함된 코드에 해당하는 프로퍼티를 리턴
     * 파라미터는 *.properties 파일에 {0} , {1} 형식으로 추가하며 다음 처럼 호출함. 예) {0} 님 환영합니다.
     * String param0 = "";
     * String param1 = "";
     * PropertyFactory.getProperty("code", new String[]{param0, param1})
     * </pre>
     * 
     * @param code
     * @param params
     * @return
     */
    public String getProperty(String code, String[] params) {
        return messageSource.getMessage(code, params, Locale.KOREA);
    }
    
    /**
     * <pre>
     * 1. 파라미터가 포함된 코드에 해당하는 프로퍼티를 리턴
     * 2. property 값이 없을 경우 defaultStr 을 return
     * 파라미터는 *.properties 파일에 {0} , {1} 형식으로 추가하며 다음 처럼 호출함. 예) {0} 님 환영합니다.
     * String param0 = "";
     * String param1 = "";
     * PropertyFactory.getProperty("code", new String[]{param0, param1})
     * </pre>
     *
     * @param code the code
     * @param params the params
     * @param defaultStr the default str
     * @return the property
     */
    public String getProperty(String code, String[] params, String defaultStr) {
        return messageSource.getMessage(code, params, defaultStr, Locale.KOREA);
    }
	
}
