package team.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import team.vo.PartiVO;
import team.vo.RegVO;
import team.vo.UserVO;

@Component
public class MypageDAO {
	
	@Qualifier("sqlSession")
	@Autowired
	private SqlSessionTemplate ss;
	
	// 회원탈퇴 기능
	public boolean signOut(UserVO vo) {		
			
		int value = ss.update("user.signOut",vo);
			
		if ( value == 1) {
			return true;
		}
		else
			return false;		
	}	
	 /* 해당 유저데이터 가져오기 */
	 public PartiVO getBbs10(PartiVO vo) {
		PartiVO uvo = ss.selectOne("reg.inEvent", vo.getU_name());
		
		return uvo;
	 }
	 
	 public RegVO[] getReg(PartiVO vo) {
		 RegVO[] ar= null;
		 
		 List<PartiVO> list = ss.selectList("reg.inEvent2",vo);
		 
		 ArrayList<String> alist = new ArrayList<>();
		 
		 for(PartiVO pvo : list) {
			alist.add(pvo.getR_idx());
		 }
		 
		 System.out.println("참여"+alist.size());
		 
		 //if(ar.size() ==  null){ //<<<<<<<<<<내일 해야함
		 Map<String, ArrayList<String>> map = new HashMap<String, ArrayList<String>>();
		 
		 map.put("r_idx", alist);
		 
		 List<RegVO> rlist = ss.selectList("reg.inRegt",map);
		 
			 if(rlist != null) {
				 ar = new RegVO[rlist.size()];
				 
				 rlist.toArray(ar);
			 } 
		// }
		 return ar;
	 }
	
}
