package kr.co.hitcom.rent.product;

import org.springframework.stereotype.Repository;

@Repository("productDAO")
public interface ProductService {

	Long productRegistration(ProductVO productVO);

	void productDelete(Long id);

	ProductVO getProduct(Long id);

	void productModify(ProductVO productVO);

	void insertOption(ProductVO pVO);

}
