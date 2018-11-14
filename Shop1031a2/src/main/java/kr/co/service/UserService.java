package kr.co.service;

import java.util.Date;

import kr.co.domain.LoginDTO;
import kr.co.domain.UserVO;

public interface UserService {
	UserVO login(LoginDTO dto) throws Exception;
	UserVO idCheck(String id) throws Exception;
	void joinUs(UserVO vo) throws Exception;


	void keepLogin(String mid, String sessionId, Date next);
	UserVO checkUserWithSessionKey(String value);
}
