package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;

@Controller
public class DeptController {
	
	@Resource(name = "deptService")
	private DeptService deptService;

	@RequestMapping(value="/deptWrite.do")
	public String deptWrite() {
		return "dept/deptWrite";
	}
	
	@RequestMapping(value="/deptWriteSave.do")
	public String InsertDept(DeptVO vo) throws Exception{
		
		String result = deptService.insertDept(vo);
		
		if(result == null) {
			System.out.println("저장성공");
		} else {
			System.out.println("저장실패");
			System.out.println(result);
		}
		return "redirect:deptList.do";
	}
	
	@RequestMapping(value="/deptList.do")
	public String selectDeptList(DeptVO vo, ModelMap model) throws Exception{
		
		List<?> list = deptService.selectDeptList(vo);
		
		model.addAttribute("resultList", list);
		
		return "dept/deptList";
	}
	
	@RequestMapping(value="/deptDetail.do")
	public String deptDetail(String deptno, ModelMap model) throws Exception{
		
		DeptVO vo = deptService.selectDeptDetail(deptno);
		
		model.addAttribute("deptVO", vo);
		
		return "dept/deptDetail";
	}
	
	@RequestMapping(value="/deptModifyWrite.do")
	public String selectDeptModify(String deptno, ModelMap model) throws Exception{
		
		DeptVO vo = deptService.selectDeptDetail(deptno);
		model.addAttribute("vo", vo);
		
		return "dept/deptModifyWrite";
	}
	
	@RequestMapping(value="deptModifySave.do")
	public String deptModifySave(DeptVO vo) throws Exception{
		
		int result = deptService.updateDeptModify(vo);
		if(result==1) {
			System.out.println("수정성공");
		} else {
			System.out.println("수정실패");
		}
		
		return "redirect:deptList.do";
	}
	
	@RequestMapping(value="deptDelete.do")
	public String deptDelete(String deptno) throws Exception{
		
		int result = deptService.deleteDept(deptno);
		if(result==1) {
			System.out.println("삭제성공");
		} else {
			System.out.println("삭제실패");
		}

		return "redirect:deptList.do";
	}
	
}
