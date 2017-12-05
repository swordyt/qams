package com.qams.response;

import org.springframework.stereotype.Repository;

@Repository
public class LoginResponse {
	private String tokinId;

	public String getTokinId() {
		return tokinId;
	}

	public void setTokinId(String tokinId) {
		this.tokinId = tokinId;
	}

}
