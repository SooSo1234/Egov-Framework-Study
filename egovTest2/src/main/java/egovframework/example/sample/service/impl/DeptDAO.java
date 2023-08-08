package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DeptVO;

@Repository("deptDAO")
public class DeptDAO extends EgovAbstractDAO {

	public String insertDept(DeptVO vo) throws Exception {
		return (String) insert("deptDAO.insertDept", vo);
	}
	
	public List<?> selectDeptList(DeptVO vo) {
		return list("deptDAO.selectDeptList",vo);
	}
	
	
	
	public String selecttest() throws Exception {
		return (String) select("deptDAO.select");
	}

}
