package main.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.MemberService;
import main.service.MemberVO;

@Controller
public class MemberController {

	@Resource(name="memberService")
	private MemberService memberService;
	
	/*
	 * @Resource(name="memberService") private MemberService memberService;
	 */
	@RequestMapping("/memberWrite.do")
	public String memberWrite(){
		
		return "member/memberWrite";
	}
	
	@RequestMapping("/memberWriteSave.do")
	@ResponseBody
	public String memberWriteSave(MemberVO vo) throws Exception{
		
		String message="";
		String result = memberService.insertMember(vo);
		
		if(result == null) {
			System.out.println("저장성공");
			message="ok";
		} else {
			System.out.println("저장실패");
		}
		
		return message;
	}
	
	@RequestMapping("/idcheck.do")
	@ResponseBody
	public String selectMemberIdCheck(String userid) throws Exception{
		
		String message="";
		int result = memberService.selectMemberIdCheck(userid);
		if(result == 0) {
			message="ok";
		}
		
		return message;
	}
	
	@RequestMapping("/post1.do")
	public String post1() {
		return "member/post1";
	}
	

	
	
	
}
