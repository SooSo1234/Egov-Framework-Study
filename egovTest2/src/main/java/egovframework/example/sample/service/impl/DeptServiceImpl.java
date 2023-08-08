package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;

@Service("deptService")
public class DeptServiceImpl extends EgovAbstractServiceImpl implements DeptService{

	@Resource(name = "deptDAO")
	private DeptDAO deptDAO;
	
	@Override
	public String insertDept(DeptVO vo) throws Exception {
		String result = deptDAO.insertDept(vo);
		
		if(result == null) {
			System.out.println("저장성공");
		} else {
			System.out.println("저장실패");
			System.out.println(result);
		}
		
		return "";
	}
	
	@Override
	public String selectDept() throws Exception {
		String result = deptDAO.selecttest();
		System.out.println(result);
		return null;
	}

	@Override
	public List<?> selectDeptList(DeptVO vo) throws Exception {
		
		return deptDAO.selectDeptList(vo);
	}

}
