package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
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
		deptService.insertDept(vo);
		return "dept/deptWrite";
	}
	
	@RequestMapping(value="/deptList.do")
	public String selectDeptList(DeptVO vo) throws Exception{
		List<?> list = deptService.selectDeptList(vo);
		
		return "dept/deptList";
	}
	
	
	@RequestMapping(value="/test.do")
	public String test() throws Exception{
		deptService.selectDept();
		return "";
	}
	
}
