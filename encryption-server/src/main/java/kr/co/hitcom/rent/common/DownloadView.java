package kr.co.hitcom.rent.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {

	public DownloadView() {
		setContentType("application/x-msdownload");
	}

	@SuppressWarnings("unchecked")
	protected void renderMergedOutputModel(Map model,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			// TODO Auto-generated method stub
			File file = (File) model.get("downloadFile");
			String convName1 = java.net.URLEncoder.encode(file.getName(), "UTF-8");
			response.setContentType(getContentType());
			response.setContentLength((int) file.length());
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + convName1 + "\";");
			response.setHeader("Content-Transfer-Encoding", "binary");

			OutputStream out = response.getOutputStream();
			FileInputStream fis = null;
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			if (fis != null) {
				try {
					fis.close();
					out.close();
				} catch (IOException ex) {
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			logger.debug("### 파일다운로드 취소 ###");
		}

	}
}
