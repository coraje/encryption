package kr.co.hitcom.util.postcd;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

@XmlAccessorType(XmlAccessType.NONE)
public class ItemWrap {
	
	@XmlElement(name = "item")
//	@JsonProperty("item")
	private List<Item> itemList;

//	@JsonProperty("item")
	public List<Item> getItemList() {
		return itemList;
	}

	public void setItemList(List<Item> itemList) {
		this.itemList = itemList;
	}
}
