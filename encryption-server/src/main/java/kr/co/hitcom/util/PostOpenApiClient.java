package kr.co.hitcom.util;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import kr.co.hitcom.util.postcd.Item;
import kr.co.hitcom.util.postcd.ItemWrap;
import kr.co.hitcom.util.postcd.Post;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("postService")
public class PostOpenApiClient extends AbstractServiceImpl {

	HttpURLConnection conn = null;
	
	@Value("#{config['post.openapi.endpoint']}")
	private String postcardOpenApiEndPoint;
	
	@Value("#{config['post.openapi.key']}")
	private String postcardOpenApiKey;
	
	public Post query(String query) {
		
		Post returnPost = new Post();
		ItemWrap itemWrap = new ItemWrap();
		List<Item> itemList = new ArrayList<Item>();
		
		String apiurl = postcardOpenApiEndPoint + "?regkey=" + postcardOpenApiKey + "&target=post&query=";

		try {
			apiurl += URLEncoder.encode(query, "EUC-KR");

			URL url = new URL(apiurl);
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestProperty("accept-language", "ko");
			SAXBuilder builder = new SAXBuilder();
			Document doc = builder.build(conn.getInputStream());
			Element itemlist = doc.getRootElement().getChild("itemlist");
			List list = itemlist.getChildren();
			for (int i = 0; i < list.size(); i++) {
				Element item = (Element) list.get(i);
				Item itemObj = new Item();
				itemObj.setAddress(item.getChildText("address"));
				itemObj.setPostcd(item.getChildText("postcd"));
				itemList.add(itemObj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.disconnect();
			} catch (Exception e) {
			}
		}
		
		
		itemWrap.setItemList(itemList);
		returnPost.setItemWrap(itemWrap);
		
		return returnPost;
		
	}
}
