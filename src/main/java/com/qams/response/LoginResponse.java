package com.qams.response;

import org.springframework.stereotype.Repository;

@Repository
public class LoginResponse {
	private String tokinId;
	private String name;
	private Integer userId;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getUserid() {
		return userId;
	}

	public void setUserid(Integer userid) {
		this.userId = userid;
	}

	public String getTokinId() {
		return tokinId;
	}

	public void setTokinId(String tokinId) {
		this.tokinId = tokinId;
	}

}
