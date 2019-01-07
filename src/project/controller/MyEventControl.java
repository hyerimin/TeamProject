package project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.util.MyEventPaging;
import team.dao.MypageDAO;
import team.dao.RegDAO;
import team.vo.PartiVO;
import team.vo.RegVO;

@Controller
public class MyEventControl {

	@Autowired
	private RegDAO r_dao;
	
	@Autowired
	private MypageDAO m_dao;
	
	
	//페이징 기법을 위한 상수들
	public static final int BLOCK_LIST = 7;
	public static final int BLOCK_PAGE = 5;//한 블럭당 페이지 수
	
	int nowPage;// 현재 페이지 값
	int rowTotal; //전체 게시물 수
	String pageCode; // 페이징 처리된 HTML코드가 저장될 곳!
	
	//나중에 각자가 해결해야 할 문제(검색기능)에 필요한 변수
	String searchType, searchValue;
	
	
	
	@RequestMapping("myinEvent")
	public ModelAndView handleRequest2(HttpServletRequest request,HttpServletResponse response, PartiVO mvo) throws Exception {
	
	// 검색했다면 그 값을 알아내자.
	searchType = request.getParameter("searchType");
	searchValue = request.getParameter("searchValue");
		
	// 현재 페이지 값 얻어내기
	String c_page = request.getParameter("nowPage");
	if(c_page == null)
		nowPage = 1;
	else
		nowPage = Integer.parseInt(c_page);
	
	//총 게시물의 수를 얻어낸다.
	rowTotal = r_dao.getAll();
	
	//페이징 처리를 하는 객체 생성
	MyEventPaging page = new MyEventPaging(nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
	
	pageCode = page.getSb().toString();//페이징 HTML코드
	
	//목록을 받아오기 위해 begin과 end값을 얻어낸다.
	int begin = page.getBegin();
	int end = page.getEnd();
	
	Map<String, String> map = new HashMap<String, String>();
	map.put("begin", String.valueOf(begin));
	map.put("end", String.valueOf(end));
	map.put("searchType", searchType);
	map.put("searchValue", searchValue);
	
	RegVO[] rar = m_dao.getReg(mvo);
	
	
	System.out.println(rar.length);
	

	RegVO[] ar = r_dao.getList(map);
	int searchNum = ar.length;

			/* 만약 검색했다면 검색된 레코드 수 만큼 페이징을 다시 한다! */
			if(searchValue != null) {
			MyEventPaging page2 = new MyEventPaging(nowPage, searchNum, BLOCK_LIST, BLOCK_PAGE);
			
			pageCode = page2.getSb().toString();//페이징 HTML코드
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("list", ar);
			mv.addObject("nowPage", nowPage);
			mv.addObject("rowTotal", searchNum);
			mv.addObject("blockList", BLOCK_LIST);
			mv.addObject("blockPage", BLOCK_PAGE);
			mv.addObject("pageCode", pageCode);
			mv.setViewName("myPage_2-1");
			return mv;
			}
			
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("blockPage", BLOCK_PAGE);
		mv.addObject("pageCode", pageCode);
		mv.setViewName("myPage_2-1");
		return mv;
	}
	

	@RequestMapping("myEvent")
	public ModelAndView handleRequest(HttpServletRequest request,HttpServletResponse response) throws Exception {
	
	// 검색했다면 그 값을 알아내자.
	searchType = request.getParameter("searchType");
	searchValue = request.getParameter("searchValue");
		
	// 현재 페이지 값 얻어내기
	String c_page = request.getParameter("nowPage");
	if(c_page == null)
		nowPage = 1;
	else
		nowPage = Integer.parseInt(c_page);
	
	//총 게시물의 수를 얻어낸다.
	rowTotal = r_dao.getAll();
	
	//페이징 처리를 하는 객체 생성
	MyEventPaging page = new MyEventPaging(nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
	
	pageCode = page.getSb().toString();//페이징 HTML코드
	
	//목록을 받아오기 위해 begin과 end값을 얻어낸다.
	int begin = page.getBegin();
	int end = page.getEnd();
	
	Map<String, String> map = new HashMap<String, String>();
	map.put("begin", String.valueOf(begin));
	map.put("end", String.valueOf(end));
	map.put("searchType", searchType);
	map.put("searchValue", searchValue);
	
	RegVO[] ar = r_dao.getList(map);
	int searchNum = ar.length;
	
			/* 만약 검색했다면 검색된 레코드 수 만큼 페이징을 다시 한다! */
			if(searchValue != null) {
			MyEventPaging page2 = new MyEventPaging(nowPage, searchNum, BLOCK_LIST, BLOCK_PAGE);
			
			pageCode = page2.getSb().toString();//페이징 HTML코드
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("list", ar);
			mv.addObject("nowPage", nowPage);
			mv.addObject("rowTotal", searchNum);
			mv.addObject("blockList", BLOCK_LIST);
			mv.addObject("blockPage", BLOCK_PAGE);
			mv.addObject("pageCode", pageCode);
			mv.setViewName("myPage_2");
			return mv;
			}
			
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("blockPage", BLOCK_PAGE);
		mv.addObject("pageCode", pageCode);
		mv.setViewName("myPage_2");
		return mv;
	}
}