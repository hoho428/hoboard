package com.ho.mapper;

import java.util.List;

import com.ho.model.BoardVO;
import com.ho.model.Criteria;

public interface BoardMapper {
	
	/* 게시판 등록 */
	public void enroll(BoardVO board);
	
	/* 게시판 목록 */
	public List<BoardVO> getList();
	
	/* 게시판 조회 */
	public BoardVO getPage(int hno);
	
	/* 게시판 수정 */
	public int modify(BoardVO board);
	
	/* 게시판 삭제 */
	public int delete(int hno);
	
	/* 게시판 목록(페이징 적용) */
	public List<BoardVO> getListPaging(Criteria cri);
	
	/* 게시판 총 개수 */
	public int getTotal(Criteria cri);
	
	/* 게시판 조회수 */
	public int updateView(int hno);
	
	/* 조회수 순위 */
	public List<BoardVO> viewrank();

}
