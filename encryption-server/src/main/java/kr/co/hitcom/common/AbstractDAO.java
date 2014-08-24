package kr.co.hitcom.common;

import javax.annotation.Resource;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

public class AbstractDAO extends EgovAbstractDAO {

	/* (non-Javadoc)
	 * @see egovframework.rte.psl.dataaccess.EgovAbstractDAO#setSuperSqlMapClient(com.ibatis.sqlmap.client.SqlMapClient)
	 */
	@Override
	@Resource(name="sqlMapClient")
	public void setSuperSqlMapClient(SqlMapClient sqlMapClient) {
		super.setSqlMapClient(sqlMapClient);
	}
	
}
