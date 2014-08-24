package kr.co.hitcom.common;

import java.io.Serializable;


public class PagingVO extends BaseVO implements Serializable {
	
	/** serialVersionUID. */
	private static final long serialVersionUID = 12317295105563210L;

	/** 현재 페이지 번호. */
	private int curPage = 1;
	
	/** 한 페이지당 표시할 Row 수. */
	private int rowSize;
	
	/** The group size. */
	private int groupSize;
	
	/** The start row. */
	private int startRow;
	
	/** The end row. */
	private int endRow;
	
	/** 총 Row 수. */
	private int totalRow;
	
	/** 페이징 적용 여부. */
	private String pagingYN = "Y";

    /**
	 * Gets the cur page.
	 *
	 * @return the cur page
	 */
	public int getCurPage() {
		return this.curPage;
	}

	/**
	 * Sets the cur page.
	 *
	 * @param page the new cur page
	 */
	public void setCurPage(int page) {
		if(page <= 0) {
			this.curPage = 1;
			return;
		}
		
		this.curPage = page;
	}
	
	/**
	 * Gets the row size.
	 *
	 * @return the row size
	 */
	public int getRowSize() {
		return this.rowSize;
	}

	/**
	 * Sets the row size.
	 *
	 * @param rowSize the new row size
	 */
	public void setRowSize(int rowSize) {
		this.rowSize = rowSize;
	}
	
	/**
	 * Gets the group size.
	 *
	 * @return the group size
	 */
	public int getGroupSize() {
		return groupSize;
	}

	/**
	 * Sets the group size.
	 *
	 * @param groupSize the new group size
	 */
	public void setGroupSize(int groupSize) {
		this.groupSize = groupSize;
	}

	/**
	 * Gets the start row.
	 *
	 * @return the start row
	 */
	public int getStartRow() {
		if("N".equals(pagingYN)) {
			return 0;
		}
		
		this.startRow = (curPage * rowSize) - rowSize + 1; 
		return startRow; 
	}

	/**
	 * Gets the end row.
	 *
	 * @return the end row
	 */
	public int getEndRow() {
		if("N".equals(pagingYN)) {
			return 0;
		}
		
		this.endRow = (curPage * rowSize);
		return endRow;
	}

	/**
	 * Gets the total row.
	 *
	 * @return the total row
	 */
	public int getTotalRow() {
		return this.totalRow;
	}

	/**
	 * Sets the total row.
	 *
	 * @param totalRow the new total row
	 */
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	/**
	 * Gets the paging yn.
	 *
	 * @return the paging yn
	 */
	public String getPagingYN() {
		return pagingYN;
	}

	/**
	 * Sets the paging yn.
	 *
	 * @param pagingYN the new paging yn
	 */
	public void setPagingYN(String pagingYN) {
		this.pagingYN = pagingYN;
	}
	
}
