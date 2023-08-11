package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;

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
		

		int total = boardService.selectBoardTotal(vo);
		int totalPage = total/10 +1;
		
		System.out.println(totalPage);
		
		List<?> list = boardService.selectBoardList(vo);
		model.addAttribute("resultList", list);
		
		return "board/boardList";
	}
	
}