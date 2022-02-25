package com.ho.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ho.mapper.BoardMapper;
import com.ho.model.BoardVO;
import com.ho.model.Criteria;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public void enroll(BoardVO board) {
		mapper.enroll(board);
	}
	
	@Override
	public List<BoardVO> getList(){
		
		return mapper.getList();
	
	}
	
	@Override
	public BoardVO getPage(int hno) {
		
		return mapper.getPage(hno);
		
	}
	
	@Override
	public int modify(BoardVO board) {
		
		return mapper.modify(board);
	}
	
	@Override
	public int delete(int hno) {
		return mapper.delete(hno);
	}
	
	@Override
	public List<BoardVO> getListPaging(Criteria cri){
		
		return mapper.getListPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}
	
	/* 조회수 */
	@Override
	public int updateView(int hno){
		return mapper.updateView(hno);
	}
	
	/* 조회수 순위 */
	@Override
	public List<BoardVO> viewrank(){
		return mapper.viewrank();
	}
	
}
