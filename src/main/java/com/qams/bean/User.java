package com.qams.bean;

import org.springframework.stereotype.Repository;

@Repository
public class User {
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
