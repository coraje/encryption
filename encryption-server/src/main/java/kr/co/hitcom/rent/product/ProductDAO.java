package kr.co.hitcom.rent.product;

public interface ProductDAO {

	Long productRegistration(ProductVO productVO);

	void productDelete(Long id);

	ProductVO getProduct(Long id);

	void productModify(ProductVO productVO);

	void insertOption(ProductVO pVO);

}
