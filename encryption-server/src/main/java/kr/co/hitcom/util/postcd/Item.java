package kr.co.hitcom.util.postcd;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

//@JsonPropertyOrder( {"address", "postcd"} )
@XmlAccessorType(XmlAccessType.NONE)
//@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
public class Item implements Serializable {

	private static final long serialVersionUID = -8340027636001714464L;

	@XmlElement(name = "address")
//	@JsonProperty("address")
	private String address;
	
	@XmlElement(name = "postcd")
//	@JsonProperty("postcd")
	private String postcd;

//	@JsonProperty("address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

//	@JsonProperty("postcd")
	public String getPostcd() {
		return postcd;
	}

	public void setPostcd(String postcd) {
		this.postcd = postcd;
	}
}
