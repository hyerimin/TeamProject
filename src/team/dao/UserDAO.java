package team.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import team.vo.UserVO;

@Component
public class UserDAO {

	@Qualifier("sqlSession")
	@Autowired
	SqlSessionTemplate session;
	// 회원가입 기능
	public boolean signUp(UserVO vo) {		
			
		int value = session.insert("user.signUp",vo);
			
		if ( value == 1) {
			return true;
		}
		else
			return false;		
	}	
	// 로그인 기능 메서드
	public UserVO login(UserVO vo) {				
		UserVO mvo = session.selectOne("user.login", vo);			
		return mvo;
	}
	// 아이디 중복확인
	public int checkID(String u_id) {			
		int c_id = session.selectOne("user.idcheck", u_id);				
		return c_id;
	}
	// 아이디 찾기!
	public String searchID(String u_name, String u_email) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_name", u_name);
		map.put("u_email", u_email);
		String id = session.selectOne("user.searchID", map);
				
		return id;
	}
	// 비밀번호 찾기!!
	public String searchPW(String u_id , String u_email) {
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("u_id", u_id);
		map.put("u_email", u_email);
		String pw = session.selectOne("user.searchPW",map);
		
		return pw;		
	}
	
	public Integer email_Check(String u_email) {
		
		Integer chk = session.selectOne("user.email_check",u_email);
			
		return chk;
	}
	
	/* 해당 유저데이터 가져오기 */
	 public UserVO getBbs(UserVO vo) {
		UserVO uvo = session.selectOne("user.getbbs", vo.getU_id());
		
		return uvo;
	 }
	 
	//vo를 인자로 받아 수정하는 기능
	public boolean editBbs(UserVO vo) {
		int cnt = session.update("user.edit", vo);
		
		if(cnt > 0)
			return true;
		else
			return false;
	}
	
	// 회원탈퇴
	public void userdel(String u_id) {
		session.update("user.userdel", u_id);
	}
		
	// 회원탈퇴 위한 비밀번호 체크
	public boolean checkpw(String u_id, String u_pwd) {
		
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pwd", u_pwd);
		int count = session.selectOne("user.checkpw", map);
		if(count == 1) 
			result = true;
		
		return result;
	}
			
}
