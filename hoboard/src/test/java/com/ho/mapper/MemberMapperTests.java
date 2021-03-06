package com.ho.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ho.model.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {
	
	@Autowired
	private MemberMapper membermapper;
	
	/* 회원가입 
	@Test
	public void memberJoin() throws Exception{
		
		MemberVO member = new MemberVO();
		
		member.setMemberId("test");
		member.setMemberPw("test");
		member.setMemberName("test");
		member.setMemberEmail("test");
		member.setMemberAddr1("test");
		member.setMemberAddr2("test");
		member.setMemberAddr3("test");

		membermapper.memberJoin(member);
	}
	*/
	
	/* 로그인 */
	@Test
	public void memberLogin() throws Exception{
		
		MemberVO member = new MemberVO();
		member.setMemberId("admin");
		member.setMemberPw("adminddd");
		
		membermapper.memberLogin(member);
		System.out.println("결과 값: " + membermapper.memberLogin(member));
	}

}
