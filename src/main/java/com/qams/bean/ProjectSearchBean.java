package com.qams.bean;

import org.springframework.stereotype.Repository;

@Repository
public class ProjectSearchBean {
	private String search;
	private int offset;
	private int limit;

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

}
