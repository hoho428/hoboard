package com.ho.model;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int hno;
	
	private String title;
	
	private String content;
	
	private String writer;
	
	private Date regdate;
	
	private Date uddate;
	
	private int bview;
	
	private int ranking;
	
	public int getRanking() {
		return ranking;
	}

	public void setRanking(int ranking) {
		this.ranking = ranking;
	}

	public int getHno() {
		return hno;
	}

	public void setHno(int hno) {
		this.hno = hno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getUddate() {
		return uddate;
	}

	public void setUddate(Date uddate) {
		this.uddate = uddate;
	}
	
	public void setBview() {
		this.bview = bview;
	}
	
	public int getBview() {
		return bview;
	}

	@Override
	public String toString() {
		return "BoardVO [hno=" + hno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", uddate=" + uddate + ", bview=" + bview + ", ranking=" + ranking + "]";
	}

}
