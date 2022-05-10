package domain;

import java.util.Date;

public class BoardVO {

	private int num;
	private String title;
	private String content;
	private String writer;
	private Date writerDate;
	


	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public Date getWriterDate() {
		return writerDate;
	}
	public void setWriterDate(Date writerDate) {
		this.writerDate = writerDate;
	}
	
	
}
