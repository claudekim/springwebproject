package kr.co.domain;

import java.io.Serializable;

public class LoginDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	private String id;
	private String pw;
	private boolean useCookie;

	public LoginDTO() {
		
	}

	public LoginDTO(String id, String pw, boolean useCookie) {
		super();
		this.id = id;
		this.pw = pw;
		this.useCookie = useCookie;
	}

	public boolean isUseCookie() {
		return useCookie;
	}

	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	@Override
	public String toString() {
		return "LoginDTO [id=" + id + "]";
	}
	
}
