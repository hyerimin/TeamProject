package project.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import project.util.FileUploadUtil;
import project.util.MyPaging;
import team.dao.BoardDAO;
import team.dao.UserDAO;
import team.vo.BoardVO;

@Controller
public class MyBoardControl {
	

	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;

	@Autowired
	private BoardDAO f_dao;

	
	//페이징 기법을 위한 상수들
	public static final int BLOCK_LIST = 7;
	public static final int BLOCK_PAGE = 5;//한 블럭당 페이지 수
	
	int nowPage;// 현재 페이지 값
	int rowTotal; //전체 게시물 수
	String pageCode; // 페이징 처리된 HTML코드가 저장될 곳!
	
	//나중에 각자가 해결해야 할 문제(검색기능)에 필요한 변수
	String searchType;
	String searchValue;
	
	String boardType; //게시판 선택하기
	
	@RequestMapping(value="myBoard", method=RequestMethod.GET)
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 선택한 게시판을 알아낸다.
		boardType = request.getParameter("boardType");

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
		rowTotal = f_dao.getAll(boardType);

		//페이징 처리를 하는 객체 생성
		MyPaging page = new MyPaging(nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE, boardType);
		
		pageCode = page.getSb().toString();//페이징 HTML코드
		
		//목록을 받아오기 위해 begin과 end값을 얻어낸다.
		int begin = page.getBegin();
		int end = page.getEnd();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("boardType", boardType);
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);

		BoardVO[] ar = f_dao.getList(map);
		int searchNum = ar.length;
		
		/* 만약 검색했다면 검색된 레코드 수 만큼 페이징을 다시 한다! */
		if(searchValue != null) {
			//페이징 처리를 하는 객체 생성
			MyPaging page2 = new MyPaging(nowPage, searchNum, BLOCK_LIST, BLOCK_PAGE, boardType);
			
			pageCode = page2.getSb().toString();//페이징 HTML코드
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("list", ar);
			mv.addObject("nowPage", nowPage);
			mv.addObject("rowTotal", searchNum);
			mv.addObject("blockList", BLOCK_LIST);
			mv.addObject("pageCode", pageCode);
			mv.setViewName("myPage_3");
			return mv;
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ar);
		mv.addObject("nowPage", nowPage);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("pageCode", pageCode);
		mv.setViewName("myPage_3");
		return mv;
	}

}
