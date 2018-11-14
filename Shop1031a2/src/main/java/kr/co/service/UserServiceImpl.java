package kr.co.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.LoginDTO;
import kr.co.domain.UserVO;
import kr.co.repository.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;
	
	

	@Override
	public void keepLogin(String mid, String sessionId, Date next) {
		// TODO Auto-generated method stub
		dao.keepLogin(mid, sessionId, next);
	}

	@Override
	public UserVO checkUserWithSessionKey(String value) {
		// TODO Auto-generated method stub
		return dao.checkUserWithSessionKey(value);
	}
	
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(dto);
	}

	@Override
	public UserVO idCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.idCheck(id);
	}
	@Override
	public void joinUs(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.joinUs(vo);
	}
	

}
