package com.ho.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ho.model.BoardVO;
import com.ho.model.Criteria;
import com.ho.model.PageMakerDTO;
import com.ho.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService bservice;
	
	/* 게시판 목록 페이지 접속 */
	@GetMapping("/list")
	public void boardListGET(Model model, Criteria cri) {
		
		log.info("게시판 목록 페이지 진입(페이징 적용)");
		
		model.addAttribute("list", bservice.getListPaging(cri));
		
		int total = bservice.getTotal(cri);
		
		PageMakerDTO pageMake = new PageMakerDTO(total, cri);
		
		model.addAttribute("pageMaker", pageMake);
		
	}
	
	/* 게시판 등록 페이지 접속 */
	@GetMapping("/enroll")
	public void boardEnrollGET(BoardVO board) {
		
		log.info("게시판 등록 페이지 진입");
		
	}
	
	/* 게시판 등록 */
	@PostMapping("/enroll")
	public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr) {
		
		log.info("BoardVO : " + board);
		
		bservice.enroll(board);
		
		rttr.addFlashAttribute("result", "enroll success");
		
		return "redirect:/board/list";
	
	}
	
	/* 게시판 조회 */
	@GetMapping("/get")
	public void boardGetPageGET(int hno, Model model, Criteria cri) {
		

		bservice.updateView(hno);
		
		model.addAttribute("pageInfo", bservice.getPage(hno));
		
		model.addAttribute("cri", cri);
		
	}
	
	/* 수정 페이지 이동 */
	@GetMapping("/modify")
	public void boardModifyGET(int hno, Model model, Criteria cri) {
		
		model.addAttribute("pageInfo", bservice.getPage(hno));
		
		model.addAttribute("cri", cri);
		
	}
	
	/* 페이지 수정 */
	 @PostMapping("/modify")
	    public String boardModifyPOST(BoardVO board, RedirectAttributes rttr) {
	        
	        bservice.modify(board);
	        
	        rttr.addFlashAttribute("result", "modify success");
	        
	        return "redirect:/board/list";
	        
	  }
	 
	 /* 페이지 삭제 */
	 @PostMapping("/delete")
	 public String boardDeletePOST(int hno, RedirectAttributes rttr) {
		 
		 bservice.delete(hno);
		 
		 rttr.addFlashAttribute("result", "delete success");
		 
		 return "redirect:/board/list";
		 
	 }
	
}
