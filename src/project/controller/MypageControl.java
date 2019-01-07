package project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import team.dao.MypageDAO;
import team.dao.UserDAO;
import team.vo.UserVO;

@Controller
public class MypageControl {
	
	@Autowired
	private HttpSession session;	
	
	@Autowired
	private UserDAO user_dao;
	
	//페이징 기법을 위한 상수들
	public static final int BLOCK_LIST = 7;
	public static final int BLOCK_PAGE = 5;//한 블럭당 페이지 수
	
	int nowPage;// 현재 페이지 값
	int rowTotal; //전체 게시물 수
	String pageCode; // 페이징 처리된 HTML코드가 저장될 곳!
	
	//나중에 각자가 해결해야 할 문제(검색기능)에 필요한 변수
	String searchType, searchValue;
	
	@RequestMapping("myedit")
	public ModelAndView myedit(UserVO uvo) {
		UserVO vo = user_dao.getBbs(uvo);
		
		ModelAndView mv = new ModelAndView();
		
		
		mv.addObject("vo", vo);
		mv.setViewName("myPage_1-1");
		
		return mv;
	}
	
	
	//회원정보수정 클릭시 나오게하는 페이지 1 
	@RequestMapping("myInfo")
	public ModelAndView myInfo(UserVO uvo) {
		UserVO vo = user_dao.getBbs(uvo);

		session.setAttribute("vo", vo);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", vo);
		
		System.out.println(vo);
		mv.setViewName("myPage_1");
		
		return mv;
	}
	
	
	// 수정 완료 후 저장하면서 돌아갈때. 3
	@RequestMapping(value="/myedit",
			method=RequestMethod.POST)
	public ModelAndView medit(UserVO vo) throws Exception {

		//MyBatis환경을 이용하여 vo의 정보를 DB에 저장한다.
		boolean chk = user_dao.editBbs(vo);
		
		ModelAndView mv = new ModelAndView();

		mv.setViewName("redirect:/myInfo?u_id="+vo.getU_id());
		return mv;
	}

	//회원 탈퇴
	@RequestMapping("deluser")
	public ModelAndView userDel(String u_id, String u_pwd, String content ) {
		ModelAndView mv= new ModelAndView();		
		
		System.out.println(u_id);
		System.out.println(u_pwd);
		
		boolean result = user_dao.checkpw(u_id, u_pwd);
		System.out.println(result);
		if(result) {
			
			user_dao.userdel(u_id);
			session.removeAttribute("lvo");
			
			mv.setViewName("redirect:/index");
			
			return mv;
		} else {
			mv.addObject("message", "비밀번호 일치하지 않습니다.");
			mv.setViewName("myPage_4");
			return mv ;
		}
	}
	@RequestMapping("signout")
	public String mypage4() {
		return "myPage_4";
	}
    @RequestMapping(value="/check_email2", method=RequestMethod.POST)
    @ResponseBody
    public Map<String, Integer> email_Check2(String u_email){
		
		Map<String, Integer> map = new HashMap<>();		
		int count = user_dao.email_Check(u_email);			
	
		map.put("count", count);
		
		return map;
	}
	
}
