package main.service;

public interface MemberService {

	
	//회원 등록 처리(save)
	public String insertMember(MemberVO vo) throws Exception;
	
	//중복아이디 체크
	public int selectMemberIdCheck(String userid) throws Exception;
}
