package BEAN;

import java.sql.Time;
import java.util.Date;

public class Examination {
	private int examID;
	private String examName;
	private Time examTime;
	private Date examDate;
	private String contentGrName;
	private int numQues;
	
	public int getExamID() {
		return examID;
	}
	public void setExamID(int examID) {
		this.examID = examID;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public Time getExamTime() {
		return examTime;
	}
	public void setExamTime(Time examTime) {
		this.examTime = examTime;
	}
	public Date getExamDate() {
		return examDate;
	}
	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}
	public String getContentGrName() {
		return contentGrName;
	}
	public void setContentGrName(String contentGrName) {
		this.contentGrName = contentGrName;
	}
	public int getNumQues() {
		return numQues;
	}
	public void setNumQues(int numQues) {
		this.numQues = numQues;
	}
	
	
}
