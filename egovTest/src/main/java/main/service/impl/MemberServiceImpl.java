package main.service.impl;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import main.service.MemberService;
import main.service.MemberVO;

@Service("memberService")
public class MemberServiceImpl  extends EgovAbstractServiceImpl implements MemberService{
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;

	@Override
	public String insertMember(MemberVO vo) throws Exception {
		return memberDAO.insertMember(vo);
	}

	@Override
	public int selectMemberIdCheck(String userid) throws Exception {
		return memberDAO.selectMemberIdCheck(userid);
	}

	@Override
	public int selectMemberCount(MemberVO vo) throws Exception {
		return memberDAO.selectMemberCount(vo);
	}

	@Override
	public MemberVO selectMember(String userid) throws Exception {
		return memberDAO.selectMember(userid);
	}

	@Override
	public int updateMember(MemberVO vo) throws Exception {
		return memberDAO.updateMember(vo);
	}

	@Override
	public int updatePass(MemberVO vo) throws Exception {
		return memberDAO.updatePass(vo);
	}

}
