package kr.co.hitcom.common;

import java.io.Serializable;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class BaseVO implements Serializable {
	
	private static final long serialVersionUID = -4770901546674634218L;

	/** The keyword. */
	private String keyword;
	
	/** The keyword type. */
	private String keywordType;
	
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
	public boolean equals(Object o) {
		return EqualsBuilder.reflectionEquals(this, o);
	}

	public int hashCode() {
		return HashCodeBuilder.reflectionHashCode(this);
	}
	

    /**
     * Gets the keyword.
     *
     * @return the keyword
     */
    public String getKeyword() {
        return keyword;
    }

    /**
     * Sets the keyword.
     *
     * @param keyword the new keyword
     */
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    /**
     * Gets the keyword type.
     *
     * @return the keyword type
     */
    public String getKeywordType() {
        return keywordType;
    }

    /**
     * Sets the keyword type.
     *
     * @param keywordType the new keyword type
     */
    public void setKeywordType(String keywordType) {
        this.keywordType = keywordType;
    }
	
}
