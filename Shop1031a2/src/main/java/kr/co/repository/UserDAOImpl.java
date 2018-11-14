package kr.co.repository;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.LoginDTO;
import kr.co.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSession session;
	
	private final String NS="us.e.r";
 
	@Override
	public void updatePoint(String id, int point) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map=
				new HashMap<String, Object>();
		map.put("id",id);
		map.put("point",point);
		
		session.update(NS+".updatePoint",map);
	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return 	session.selectOne(NS+".login",dto);
	}

	@Override
	public void keepLogin(String mid, String sessionId, Date next) {
		// TODO Auto-generated method stub
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("mid",mid);
		map.put("sessionId",sessionId);
		map.put("next",next);
		session.update(NS+".keepLogin",map);
		
	}

	@Override
	public UserVO checkUserWithSessionKey(String value) {

	
		return 	session.selectOne(NS+".checkUserWithSessionKey",value);
	}

	@Override
	public UserVO idCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return 	session.selectOne(NS+".idCheck",id);
	}
	@Override
	public void joinUs(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(NS+".joinUs",vo);
	}

}
