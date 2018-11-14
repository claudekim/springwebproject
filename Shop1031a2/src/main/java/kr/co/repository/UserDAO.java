package kr.co.repository;

import java.util.Date;

import kr.co.domain.LoginDTO;
import kr.co.domain.UserVO;

public interface UserDAO {
	void updatePoint(String id, int point) throws Exception;
	UserVO idCheck(String id) throws Exception;
	void joinUs(UserVO vo) throws Exception;
	UserVO login(LoginDTO dto) throws Exception;
	void keepLogin(String id, String sessionId, Date next);
	UserVO checkUserWithSessionKey(String value);
	}
