package egovframework.example.sample.service;

import java.util.List;

public interface DeptService {

	public String insertDept(DeptVO vo) throws Exception;
	public List<?> selectDeptList(DeptVO vo) throws Exception;
	public DeptVO selectDeptDetail(String deptno) throws Exception;
	public int updateDeptModify(DeptVO vo) throws Exception;
	public int deleteDept(String deptno) throws Exception;
}
