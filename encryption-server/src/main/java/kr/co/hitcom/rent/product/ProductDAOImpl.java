package kr.co.hitcom.rent.product;

import kr.co.hitcom.common.AbstractDAO;
import kr.co.hitcom.rent.notice.NoticeVO;

import org.springframework.stereotype.Repository;
@Repository("productDAO")
public class ProductDAOImpl extends AbstractDAO implements ProductDAO{

	@Override
	public Long productRegistration(ProductVO productVO) {
		// TODO Auto-generated method stub
		Object obj = this.insert("Product.insertProduct", productVO);
		logger.debug(obj);
		
		//마지막 product_id 
		Long product_id = (Long) getSqlMapClientTemplate().queryForObject("Product.selectLastProductId");
		
		return product_id;
	}

	@Override
	public void productDelete(Long id) {
		// TODO Auto-generated method stub
		this.delete("Product.deleteProduct", id);
	}

	@Override
	public ProductVO getProduct(Long id) {
		// TODO Auto-generated method stub
		ProductVO productVO= (ProductVO) this.getSqlMapClientTemplate().queryForObject("Product.selectProduct", id); 
		return productVO;
	}

	@Override
	public void productModify(ProductVO productVO) {
		Object obj = this.update("Product.updateProduct", productVO);
		logger.debug(obj);
		
	}

	@Override
	public void insertOption(ProductVO pVO) {
		// TODO Auto-generated method stub
		Object obj = this.insert("Product.insertOption", pVO);
		logger.debug(obj);
	}
	
	
}
