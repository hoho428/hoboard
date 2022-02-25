package com.ho.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ho.model.BoardVO;
import com.ho.model.Criteria;

import jline.internal.Log;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTests {
	
	@Autowired
	private BoardService service;
	
	/* 게시판 등록 테스트 
	@Test
	public void testEnroll() {
		
		BoardVO vo = new BoardVO();
		
		vo.setTitle("ㅎㅇㅎㅇ");
		vo.setContent("ㅎㅇㅎㅇ");
		vo.setWriter("ㅎㅇㅎㅇ");
		
		service.enroll(vo);
	}
	*/
	
	/* 게시판 목록 테스트 
	@Test
	public void testGetList() {
		
		for(int i = 0; i < service.getList().size(); i++) {
			
			Log.info("" + service.getList().get(i));
			
		}
		//service.getList().forEach(board -> Log.info("" + board));
	}
	*/
	
	/* 게시판 조회 테스트 
	@Test
	public void testGetPage() {
		
		int hno = 3;
		Log.info("" + service.getPage(hno));
		
	}
	*/
	
	/* 게시판 수정 테스트 
	@Test
	public void testModify() {
		
		BoardVO board = new BoardVO();
		
		board.setHno(3);
		board.setTitle("dd");
		board.setContent("dd");
		
		int result = service.modify(board);
		Log.info("result : " + result);
		
	}
	*/
	
	/* 게시판 삭제 테스트 
	@Test
	public void testDelete() {
		
		int result = service.delete(4);
		Log.info("result : " + result);
	}
	*/
	
	/* 게시판 조회(페이지 적용) 
	@Test
	public void testGetListPaging() {
		Criteria cri = new Criteria();
		List list=  service.getListPaging(cri);
		list.forEach(board -> Log.info("" + board));
		
	}
	*/
	/* 조회수 순위 */
	@Test
	public void testviewrank() {
		List list = service.viewrank();
		for(int i = 0; i < list.size(); i++) {
			Log.info("" + list.get(i));
		}
	}
	
}
