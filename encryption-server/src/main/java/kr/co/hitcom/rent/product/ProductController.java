//rent
package kr.co.hitcom.rent.product;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hitcom.rent.application.ApplicationVO;
import kr.co.hitcom.rent.member.MemberVO;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {

	@Value("#{config['product.basePath']}")
	private String PRODUCT_IMAGE_PATH;

	private String uploadFolder = "productImageUpload";

	/** Product Service. */
	@Resource(name = "productService")
	private ProductService productService;

	// 상품등록
	@RequestMapping(value = "/productRegistrationPage.lo ")
	public String productRegistrationPage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

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
		
		return "/product/productRegistrationPage.jsp";
	}

	@RequestMapping(value = "/productRegistration.lo", method = RequestMethod.POST)
	public void productRegistration(HttpServletRequest request,
			HttpServletResponse response,

			@RequestParam("product_title") String product_title,
			@RequestParam("product_content") String product_content,
			@RequestParam("product_comment") String product_comment,
			@RequestParam("product_price") String product_price,
			@RequestParam("product_date") String product_date,
			@RequestParam("main_image") MultipartFile main_image,
			@RequestParam("text_image") MultipartFile text_image,
			@RequestParam("sub_image") MultipartFile sub_image,
			@RequestParam("product_status") String product_status,
			@RequestParam("option_name") String option_name,
			@RequestParam("option_price") String option_price)
			throws Exception {

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
		
		// 폴더생성
		Date dt = new Date();
		SimpleDateFormat date_format = new SimpleDateFormat("yyyy_MM_dd");
		String datefolder = date_format.format(dt).toString() + "/";

		// 폴더생성
		File dir = new File(PRODUCT_IMAGE_PATH + uploadFolder, datefolder);
		// 존재유무 => 존재한다면 생성하지 않는다.
		if (!dir.exists()) {
			dir.mkdir();
		}

		//
		ProductVO productVO = new ProductVO();

		if (main_image.getOriginalFilename() == "") {
			String fileName = imageName();
			productVO.setProduct_mainimage_path(uploadFolder + "/" + fileName);

		} else {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HHmmss");
			String fileName = sdf.format(dt).toString() + "main_image.png";

			File file = new File(PRODUCT_IMAGE_PATH + uploadFolder + "/"
					+ datefolder + fileName);
			main_image.transferTo(file);
			productVO.setProduct_mainimage_path(uploadFolder + "/" + datefolder
					+ fileName);

		}

		if (text_image.getOriginalFilename() == "") {
			String fileName = imageName();
			productVO.setProduct_textimage_path(uploadFolder + "/" + fileName);

		} else {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HHmmss");
			String fileName = sdf.format(dt).toString() + "text_image.png";

			File file = new File(PRODUCT_IMAGE_PATH + uploadFolder + "/"
					+ datefolder + fileName);
			text_image.transferTo(file);
			productVO.setProduct_textimage_path(uploadFolder + "/" + datefolder
					+ fileName);

		}

		if (sub_image.getOriginalFilename() == "") {
			String fileName = imageName();
			productVO.setProduct_subimage_path(uploadFolder + "/" + fileName);

		} else {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HHmmss");
			String fileName = sdf.format(dt).toString() + "sub_image.png";

			File file = new File(PRODUCT_IMAGE_PATH + uploadFolder + "/"
					+ datefolder + fileName);
			sub_image.transferTo(file);
			productVO.setProduct_subimage_path(uploadFolder + "/" + datefolder
					+ fileName);

		}

		String a=product_price.split(",")[0];
		String b=product_price.split(",")[1];
		String c=a+b;
		productVO.setProduct_title(product_title);
		productVO.setProduct_content(product_content);
		productVO.setProduct_comment(product_comment);
		productVO.setProduct_date(product_date);
		productVO.setProduct_price(Integer.valueOf(c));
		productVO.setProduct_status(product_status);
		
		Long product_id = productService.productRegistration(productVO);
		
		if(!option_name.equals("")){
			String optionName[] = option_name.split(",");
			String optionPrice[] = option_price.split(",");
			
			ProductVO pVO = new ProductVO();
			pVO.setProduct_id(product_id);
	
			for (int i = 0; i < optionName.length ; i++) {
				pVO.setOption_name(optionName[i]);
				pVO.setOption_price(Integer.valueOf(optionPrice[i]));
				
				productService.insertOption(pVO);
			}
		}
		response.sendRedirect("./applicationList.do");

	}

	// 이미지를 입력안했을때 호출되는메소드
	private String imageName() {
		String imageName = "no_image.gif";
		return imageName;
	}

	// 상품삭제
	@RequestMapping(value = "/productDelete.lo")
	public void productDelete(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("product_id") String product_id) throws Exception {
		
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
		
		Long id = Long.valueOf(product_id);
		productService.productDelete(id);
		
		response.sendRedirect("./applicationList.do");
	}
	
	// 상품변경
	@RequestMapping(value = "/productModifyPage.lo")
	public String productModifyPage(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("product_id") String product_id) throws Exception {
		
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
		
		Long id = Long.valueOf(product_id);
		
		ProductVO productVO = new ProductVO();
		
		productVO = productService.getProduct(id);

		request.setAttribute("productVO", productVO);
		
		return "/product/productModifyPage.jsp";
	}
	
	@RequestMapping(value = "/productModify.lo", method = RequestMethod.POST)
	public void productModify(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("product_id") String product_id,
			@RequestParam("product_title") String product_title,
			@RequestParam("product_content") String product_content,
			@RequestParam("product_comment") String product_comment,
			@RequestParam("product_price") String product_price,
			@RequestParam("product_date") String product_date,
			@RequestParam("main_image") MultipartFile main_image,
			@RequestParam("text_image") MultipartFile text_image,
			@RequestParam("sub_image") MultipartFile sub_image,
			@RequestParam("progress") String progress,
			@RequestParam("product_status") String product_status)
			throws Exception {

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
		
		// 폴더생성
		Date dt = new Date();
		SimpleDateFormat date_format = new SimpleDateFormat("yyyy_MM_dd");
		String datefolder = date_format.format(dt).toString() + "/";

		// 폴더생성
		File dir = new File(PRODUCT_IMAGE_PATH + uploadFolder, datefolder);
		// 존재유무 => 존재한다면 생성하지 않는다.
		if (!dir.exists()) {
			dir.mkdir();
		}

		//
		ProductVO productVO = new ProductVO();

		if (main_image.getOriginalFilename() == "") {
			String fileName = imageName();
			productVO.setProduct_mainimage_path(uploadFolder + "/" + fileName);

		} else {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HHmmss");
			String fileName = sdf.format(dt).toString() + "main_image.png";

			File file = new File(PRODUCT_IMAGE_PATH + uploadFolder + "/"
					+ datefolder + fileName);
			main_image.transferTo(file);
			productVO.setProduct_mainimage_path(uploadFolder + "/" + datefolder
					+ fileName);

		}

		if (text_image.getOriginalFilename() == "") {
			String fileName = imageName();
			productVO.setProduct_textimage_path(uploadFolder + "/" + fileName);

		} else {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HHmmss");
			String fileName = sdf.format(dt).toString() + "text_image.png";

			File file = new File(PRODUCT_IMAGE_PATH + uploadFolder + "/"
					+ datefolder + fileName);
			text_image.transferTo(file);
			productVO.setProduct_textimage_path(uploadFolder + "/" + datefolder
					+ fileName);

		}
		
		if (sub_image.getOriginalFilename() == "") {
			String fileName = imageName();
			productVO.setProduct_subimage_path(uploadFolder + "/" + fileName);

		} else {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HHmmss");
			String fileName = sdf.format(dt).toString() + "sub_image.png";

			File file = new File(PRODUCT_IMAGE_PATH + uploadFolder + "/"
					+ datefolder + fileName);
			sub_image.transferTo(file);
			productVO.setProduct_subimage_path(uploadFolder + "/" + datefolder
					+ fileName);

		}
		productVO.setProduct_id(Long.valueOf(product_id));
		productVO.setProduct_title(product_title);
		productVO.setProduct_content(product_content);
		productVO.setProduct_comment(product_comment);
		productVO.setProduct_date(product_date);
		productVO.setProduct_price(Integer.valueOf(product_price));
		productVO.setProgress(progress);
		productVO.setProduct_status(product_status);

		productService.productModify(productVO);

		response.sendRedirect("./applicationList.do");

	}
	//메인페이지 이미지등록
	@RequestMapping(value = "/mainImagePage.lo ")
	public String mainImagePage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
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

		return "/product/mainImagePage.jsp";
	}

	@RequestMapping(value = "/mainImage.lo", method = RequestMethod.POST)
	public void mainImage(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("main_image") MultipartFile main_image)
			throws Exception {
		
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
		
		if (main_image.getOriginalFilename() == "") {

		} else {
			
			String fileName =  "mainPage_image.png";

			File file = new File(PRODUCT_IMAGE_PATH + uploadFolder + "/" + fileName);
			main_image.transferTo(file);
			

		}

		response.sendRedirect("./main.do");

	}
}
