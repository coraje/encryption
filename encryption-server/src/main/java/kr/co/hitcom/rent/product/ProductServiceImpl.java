package kr.co.hitcom.rent.product;

import javax.annotation.Resource;

import kr.co.hitcom.rent.notice.NoticeDAO;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("productService")
public class ProductServiceImpl extends AbstractServiceImpl implements ProductService{

	/** The qna dao. */
	@Resource(name="productDAO")
	private ProductDAO productDAO;
	
	@Override
	public Long productRegistration(ProductVO productVO) {
		// TODO Auto-generated method stub
		return productDAO.productRegistration(productVO);
	}

	@Override
	public void productDelete(Long id) {
		// TODO Auto-generated method stub
		productDAO.productDelete(id);
	}

	@Override
	public ProductVO getProduct(Long id) {
		// TODO Auto-generated method stub
		return productDAO.getProduct(id);
	}

	@Override
	public void productModify(ProductVO productVO) {
		// TODO Auto-generated method stub
		productDAO.productModify(productVO);
		
	}

	@Override
	public void insertOption(ProductVO pVO) {
		// TODO Auto-generated method stub
		productDAO.insertOption(pVO);
	}

}
