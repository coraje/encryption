package kr.co.hitcom.util.postcd;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "post")
@XmlAccessorType(XmlAccessType.NONE)
public class Post {

	@XmlElement(name = "itemlist")
//	@JsonProperty("itemlist")
	private ItemWrap itemWrap;

//	@JsonProperty("itemlist")
	public ItemWrap getItemWrap() {
		return itemWrap;
	}

	public void setItemWrap(ItemWrap itemWrap) {
		this.itemWrap = itemWrap;
	}

}
