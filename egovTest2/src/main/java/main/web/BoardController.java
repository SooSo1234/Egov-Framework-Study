package main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;
import main.service.MemberService;

@Controller
public class BoardController {
	
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	
	@RequestMapping("/main.do")
	public String mainpage(BoardVO vo, ModelMap model) throws Exception {
		int unit = 5;
		
		//총 데이터 개수
		int total = boardService.selectBoardTotal(vo);
		
		int totalPage = (int) Math.ceil((double)total/unit);

		int viewPage = vo.getViewPage();
		
		if(viewPage > totalPage || viewPage<1) {
			viewPage = 1;
		}
		
		int startIndex = (viewPage-1)*unit+1; 
		int endIndex= (viewPage*unit);
		
		int startRowNo = total-((viewPage-1)*unit);
		
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		List<?> recList = boardService.selectBoardList(vo);
		List<?> hotList = boardService.selectHotBoardList(vo);
		
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("recList", recList);
		model.addAttribute("hotList", hotList);
		model.addAttribute("rowNumber", startRowNo);
		model.addAttribute("vo", vo);
		return "main";
	}
	

	@RequestMapping(value="/boardWrite.do")
	public String boardWrite() {
		
		return "board/boardWrite";
	}
	
	@RequestMapping(value="/boardWriteSave.do")
	@ResponseBody
	public String boardWriteSave(BoardVO vo) throws Exception {
		
		
		String result = boardService.insertBoard(vo);
		String message = "";
		
		if(result == null) {
			System.out.println("저장성공");
			message="ok";
		} else {
			System.out.println("저장실패");
			message="false";
		}
		
		return message;
	}
	
	@RequestMapping(value="/boardList.do")
	public String boardList(BoardVO vo, ModelMap model) throws Exception{
		
		
		int unit = 5;
		
		//총 데이터 개수
		int total = boardService.selectBoardTotal(vo);
		
		int totalPage = (int) Math.ceil((double)total/unit);

		int viewPage = vo.getViewPage();
		
		if(viewPage > totalPage || viewPage<1) {
			viewPage = 1;
		}
		
		int startIndex = (viewPage-1)*unit+1; 
		int endIndex= (viewPage*unit);
		
		int startRowNo = total-((viewPage-1)*unit);
		
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		List<?> list = boardService.selectBoardList(vo);
		
		
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("resultList", list);
		model.addAttribute("rowNumber", startRowNo);
		model.addAttribute("vo", vo);
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardDetail.do")
	public String boardDetail(BoardVO vo, ModelMap model) throws Exception{
		
		boardService.updateBoardHits(vo.getUnq());
		
		BoardVO boardVO = boardService.selectBoardDetail(vo.getUnq());
		
		String content = boardVO.getContent();
		boardVO.setContent(content.replace("\n", "<br>"));
		
		model.addAttribute("boardVO", boardVO);
		return "board/boardDetail";
	}
	
	@RequestMapping(value="/boardModifyWrite.do")
	public String selectBoardModifyWrite(BoardVO vo, ModelMap model) throws Exception{
		
		BoardVO boardVO = boardService.selectBoardDetail(vo.getUnq());
		model.addAttribute("boardVO", boardVO);
		
		return "board/boardModifyWrite";
	}
	
	@RequestMapping(value="/boardModifySave.do")
	@ResponseBody
	public String updateBoard(BoardVO vo) throws Exception{
		
		String message="";
		int count = boardService.selectBoardPass(vo);

		if(count==1) {
			int result = boardService.updateBoard(vo);
			System.out.println(result);
			message = result + "";
		} else {
			message="passError";
		}
		
		
		return message;
	}

	@RequestMapping("/passWrite.do")
	public String passWrite(int unq, ModelMap model) {
		
		model.addAttribute("unq", unq);
		
		return "board/passWrite";
	}
	
	@RequestMapping("boardDelete.do")
	@ResponseBody
	public String boardDelete(BoardVO vo) throws Exception{
		
		int result = 0;
		
		int count = boardService.selectBoardPass(vo);
		
		if(count==1) {
			result = boardService.deleteBoard(vo);
		} else {
			result = -1;
		}
		
		return result + "";
	}
	
}
