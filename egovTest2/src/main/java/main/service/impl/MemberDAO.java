package main.service.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import main.service.MemberVO;

@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO {

	public String insertMember(MemberVO vo) {
		return (String) insert("memberDAO.insertMember", vo);
	}

	public int selectMemberIdCheck(String userid) {
		return (int) select("memberDAO.selectMemberIdCheck", userid);
	}

	public int selectMemberCount(MemberVO vo) {
		return (int) select("memberDAO.selectMemberCount",vo);
	}

	public MemberVO selectMember(String userid) {
		return (MemberVO) select("memberDAO.selectMember",userid);
	}

	public int updateMember(MemberVO vo) {
		return (int) update("memberDAO.updateMember",vo);
	}

	public int updatePass(MemberVO vo) {
		return (int) update("memberDAO.updatePass",vo);
	}

}
