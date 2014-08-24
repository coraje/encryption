//rent
package kr.co.hitcom.rent.review;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hitcom.rent.member.MemberVO;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ReviewController {

	@Value("#{config['product.basePath']}")
	private String PRODUCT_IMAGE_PATH;

	private String uploadFolder = "reviewImageUpload";

	/** Review Service. */
	@Resource(name = "reviewService")
	private ReviewService reviewService;

	// 호텔 후기 게시판
	@RequestMapping(value = "/reviewList.do")
	public String reviewList(HttpServletRequest request) throws Exception {

		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startrow = (page - 1) * 10;
		int endrow = limit;

		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setStartrow(startrow);
		reviewVO.setEndrow(endrow);
		reviewVO.setProduct_status("a");

		int listcount = reviewService.reviewListCount(); // 총 리스트 수를 받아 옴
		ArrayList<ReviewVO> list = reviewService.reviewList(reviewVO); // 리스트를
																		// 받아 옴

		for (int i = 0; i < list.size(); i++) {
			reviewVO = list.get(i);
			String str = reviewVO.getReview_content();
			if (100 > str.length()) {
				reviewVO.setContent(reviewVO.getReview_content());
			} else {
				reviewVO.setContent(str.substring(0, 100));
			}
		}

		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를
		// 더해서
		// 올림
		// 처리
		// 현재 화면에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 화면에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		request.setAttribute("page", page); // 현재 페이지 번호
		request.setAttribute("maxpage", maxpage); // 최대 페이지 수
		request.setAttribute("startpage", startpage); // 현재 화면에 표시할 첫 페이지 수
		request.setAttribute("endpage", endpage); // 현재 화면에 표시할 끝 페이지 수
		request.setAttribute("listcount", listcount); // 글 개수
		request.setAttribute("list", list);

		return "/review/reviewList.jsp";
	}

	// 기차 후기 게시판
	@RequestMapping(value = "/reviewTrainList.do")
	public String reviewTrainList(HttpServletRequest request) throws Exception {

		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startrow = (page - 1) * 10;
		int endrow = limit;

		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setStartrow(startrow);
		reviewVO.setEndrow(endrow);
		reviewVO.setProduct_status("b");

		int listcount = reviewService.reviewTrainListCount(); // 총 리스트 수를 받아 옴
		ArrayList<ReviewVO> list = reviewService.reviewTrainList(reviewVO); // 리스트를
																			// 받아
																			// 옴

		for (int i = 0; i < list.size(); i++) {
			reviewVO = list.get(i);
			String str = reviewVO.getReview_content();
			if (100 > str.length()) {
				reviewVO.setContent(reviewVO.getReview_content());
			} else {
				reviewVO.setContent(str.substring(0, 100));
			}
		}

		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를
		// 더해서
		// 올림
		// 처리
		// 현재 화면에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 화면에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		request.setAttribute("page", page); // 현재 페이지 번호
		request.setAttribute("maxpage", maxpage); // 최대 페이지 수
		request.setAttribute("startpage", startpage); // 현재 화면에 표시할 첫 페이지 수
		request.setAttribute("endpage", endpage); // 현재 화면에 표시할 끝 페이지 수
		request.setAttribute("listcount", listcount); // 글 개수
		request.setAttribute("list", list);

		return "/review/reviewTrainList.jsp";
	}

	// 마을 후기 게시판
	@RequestMapping(value = "/reviewVillageList.do")
	public String reviewVillageList(HttpServletRequest request) throws Exception {

		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startrow = (page - 1) * 10;
		int endrow = limit;

		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setStartrow(startrow);
		reviewVO.setEndrow(endrow);
		reviewVO.setProduct_status("c");

		int listcount = reviewService.reviewVillageListCount(); // 총 리스트 수를 받아 옴
		ArrayList<ReviewVO> list = reviewService.reviewVillageList(reviewVO); // 리스트를
																				// 받아
																				// 옴

		for (int i = 0; i < list.size(); i++) {
			reviewVO = list.get(i);
			String str = reviewVO.getReview_content();
			if (100 > str.length()) {
				reviewVO.setContent(reviewVO.getReview_content());
			} else {
				reviewVO.setContent(str.substring(0, 100));
			}
		}

		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를
		// 더해서
		// 올림
		// 처리
		// 현재 화면에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 화면에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		request.setAttribute("page", page); // 현재 페이지 번호
		request.setAttribute("maxpage", maxpage); // 최대 페이지 수
		request.setAttribute("startpage", startpage); // 현재 화면에 표시할 첫 페이지 수
		request.setAttribute("endpage", endpage); // 현재 화면에 표시할 끝 페이지 수
		request.setAttribute("listcount", listcount); // 글 개수
		request.setAttribute("list", list);

		return "/review/reviewVillageList.jsp";
	}

	// 후기작성
	@RequestMapping(value = "/reviewRegistrationPage.lo")
	public String reviewRegistrationPage(HttpServletRequest request, @RequestParam("product_title") String product_title,
			@RequestParam("product_status") String product_status, @RequestParam("application_id") String application_id) {

		request.setAttribute("product_title", product_title);
		request.setAttribute("product_status", product_status);
		request.setAttribute("application_id", application_id);

		return "/review/reviewRegistrationPage.jsp";
	}

	@RequestMapping(value = "/reviewRegistration.lo", method = RequestMethod.POST)
	public void reviewRegistration(HttpServletRequest request, HttpServletResponse response, @RequestParam("product_title") String product_title,
			@RequestParam("product_status") String product_status, @RequestParam("review_content") String review_content,
			@RequestParam("application_id") String application_id, @RequestParam("rating") String rating,
			@RequestParam(value = "review_image", required = false) MultipartFile review_image,
			@RequestParam(value = "review_image2", required = false) MultipartFile review_image2,
			@RequestParam(value = "review_image3", required = false) MultipartFile review_image3,
			@RequestParam(value = "review_image4", required = false) MultipartFile review_image4) throws IOException {

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("SESSION_MEMBER_INFO");

		// 폴더생성
		Date dt = new Date();
		SimpleDateFormat date_format = new SimpleDateFormat("yyyy_MM_dd");
		String datefolder = date_format.format(dt).toString() + "/";

		File dir = new File(PRODUCT_IMAGE_PATH + uploadFolder, datefolder);
		// 존재유무 => 존재한다면 생성하지 않는다.
		if (!dir.exists()) {
			dir.mkdir();
		}
		// 파일이름
		String randomKey = generateData(5);
		ReviewVO reviewVO = new ReviewVO();

		if (review_image.getOriginalFilename() == "") {
			reviewVO.setImage_pass("noImage");
		} else {

			String fileName = date_format.format(dt).toString() + randomKey + "review_image.png";
			String thumbnailName = date_format.format(dt).toString() + randomKey + "Thumbnail.png";

			File file = new File(PRODUCT_IMAGE_PATH + uploadFolder + "/" + datefolder + fileName);
			review_image.transferTo(file);
			reviewVO.setImage_pass(uploadFolder + "/" + datefolder + fileName + ",");
			// 썸네일생성
			makeTHUMBNAIL(file, thumbnailName, datefolder);
			reviewVO.setThumb_nail_path(uploadFolder + "/" + datefolder + thumbnailName);

			if (review_image2.getOriginalFilename() == "") {
				reviewVO.setImage_pass(reviewVO.getImage_pass() + "noImage");
			} else {

				fileName = date_format.format(dt).toString() + randomKey + "review_image2.png";

				file = new File(PRODUCT_IMAGE_PATH + uploadFolder + "/" + datefolder + fileName);
				review_image2.transferTo(file);
				reviewVO.setImage_pass(reviewVO.getImage_pass() + uploadFolder + "/" + datefolder + fileName + ",");
				
				if (review_image3.getOriginalFilename() == "") {
					reviewVO.setImage_pass(reviewVO.getImage_pass() + "noImage");
				} else {

					fileName = date_format.format(dt).toString() + randomKey + "review_image3.png";

					file = new File(PRODUCT_IMAGE_PATH + uploadFolder + "/" + datefolder + fileName);
					review_image3.transferTo(file);
					reviewVO.setImage_pass(reviewVO.getImage_pass() + uploadFolder + "/" + datefolder + fileName + ",");
					
					if (review_image4.getOriginalFilename() == "") {
						reviewVO.setImage_pass(reviewVO.getImage_pass() + "noImage");
					} else {

						fileName = date_format.format(dt).toString() + randomKey + "review_image4.png";

						file = new File(PRODUCT_IMAGE_PATH + uploadFolder + "/" + datefolder + fileName);
						review_image4.transferTo(file);
						reviewVO.setImage_pass(reviewVO.getImage_pass() + uploadFolder + "/" + datefolder + fileName);

					}
				}

			}

		}

		reviewVO.setMember_no(memberVO.getMember_no());
		reviewVO.setReview_title(product_title);
		reviewVO.setReview_content(review_content);
		reviewVO.setReview_rating(Integer.valueOf(rating));
		reviewVO.setProduct_status(product_status);
		reviewVO.setReview_status("y");
		reviewVO.setApplication_id(Long.valueOf(application_id));

		reviewService.reviewRegistration(reviewVO);

		response.sendRedirect("./myPage.lo");
	}

	// 썸네일이미지 만들기
	private void makeTHUMBNAIL(File file, String thumbnailName, String datefolder) throws IOException {
		// 이미지 파일 읽기
		BufferedImage bi = ImageIO.read(file);
		int width = 100;
		int height = 100;
		// width, height는 원하는 thumbnail 이미지의 크기
		// aspect ratio 유지하기 위해 크기 조정
		if ((float) width / bi.getWidth() > (float) height / bi.getHeight())
			width = (int) (bi.getWidth() * ((float) height / bi.getHeight()));
		else
			height = (int) (bi.getHeight() * ((float) width / bi.getWidth()));

		BufferedImage thImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2 = thImg.createGraphics();
		g2.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
		g2.drawImage(bi, 0, 0, width, height, null);
		g2.dispose();

		ImageIO.write(thImg, "png", new File(PRODUCT_IMAGE_PATH + uploadFolder + "/" + datefolder + thumbnailName));

	}

	@RequestMapping(value = "/listMove.do")
	public String listMove(HttpServletRequest request, HttpServletResponse response, @RequestParam("status") String status) throws Exception {

		if (status.equals("a")) {
			response.sendRedirect("./reviewList.do");
			return null;
		} else if (status.equals("b")) {
			response.sendRedirect("./reviewTrainList.do");
			return null;
		} else {
			response.sendRedirect("./reviewVillageList.do");
			return null;
		}

	}

	// 검색리스트
	@RequestMapping(value = "/retrievalList.do")
	public String retrievalList(HttpServletRequest request, @RequestParam("retrieval") String retrieval) throws Exception {

		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startrow = (page - 1) * 10;
		int endrow = limit;

		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setStartrow(startrow);
		reviewVO.setEndrow(endrow);
		reviewVO.setRetrieval(retrieval);
		int listcount = reviewService.retrievalListCount(retrieval); // 총 리스트 수를
																		// 받아 옴
		ArrayList<ReviewVO> list = reviewService.retrievalList(reviewVO); // 리스트를
																			// 받아
																			// 옴

		for (int i = 0; i < list.size(); i++) {
			reviewVO = list.get(i);
			String str = reviewVO.getReview_content();
			if (100 > str.length()) {
				reviewVO.setContent(reviewVO.getReview_content());
			} else {
				reviewVO.setContent(str.substring(0, 100));
			}
		}

		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를
		// 더해서
		// 올림
		// 처리
		// 현재 화면에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 화면에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		request.setAttribute("page", page); // 현재 페이지 번호
		request.setAttribute("maxpage", maxpage); // 최대 페이지 수
		request.setAttribute("startpage", startpage); // 현재 화면에 표시할 첫 페이지 수
		request.setAttribute("endpage", endpage); // 현재 화면에 표시할 끝 페이지 수
		request.setAttribute("listcount", listcount); // 글 개수
		request.setAttribute("list", list);

		return "/review/retrievalList.jsp";
	}

	@RequestMapping(value = "/reviewDelete.lo")
	public String reviewDelete(HttpServletRequest request, HttpServletResponse response, @RequestParam("review_id") String review_id) throws Exception {

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("SESSION_MEMBER_INFO");

		if (!memberVO.getMember_id().equals("admin")) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자가 아닙니다.');");
			out.println("location.href='./loginPage.do';");
			out.println("</script>");
			out.close();
		}

		Long id = Long.valueOf(review_id);
		reviewService.reviewDelete(id);

		return reviewList(request);

	}

	// 랜덤키생성
	final String dummyString = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijlmnopqrstuvwxyz";
	final Random random = new Random();

	public String generateData(int loopCount) {
		// char 48=0 65=A 90=Z 97=a 122=z
		StringBuilder tempBuilder = new StringBuilder(100);
		int randomInt;
		char tempChar;
		for (int loop = 0; loop < loopCount; loop++) {
			randomInt = random.nextInt(61);
			tempChar = dummyString.charAt(randomInt);
			tempBuilder.append(tempChar);
		}
		// System.out.println(tempBuffer);
		return tempBuilder.toString();
	}
}
