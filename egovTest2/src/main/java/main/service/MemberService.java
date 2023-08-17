package main.service;

public interface MemberService {

	
	//회원 등록 처리(save)
	public String insertMember(MemberVO vo) throws Exception;
	
	//중복아이디 체크
	public int selectMemberIdCheck(String userid) throws Exception;
	
	//로그인 데이터 확인
	public int selectMemberCount(MemberVO vo) throws Exception;
	
	//회원 정보 불러오기
	public MemberVO selectMember(String userid) throws Exception;
	
	//회원 정보 수정
	public int updateMember(MemberVO vo) throws Exception;
	
	//비밀번호 수정
	public int updatePass(MemberVO vo) throws Exception;
	
	
}
