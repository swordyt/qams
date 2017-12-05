package com.qams.response;

import org.springframework.stereotype.Repository;

@Repository
public class ListResponse {
	public Object rows;
	public Long total;

	public Object getRows() {
		return rows;
	}

	public void setRows(Object rows) {
		this.rows = rows;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

}
