package BEAN;

import java.sql.Time;
import java.util.Date;

public class Classes {
	private int classID;
	public int getClassID() {
		return classID;
	}
	public void setClassID(int classID) {
		this.classID = classID;
	}
	private String className;
	private Time examTime;
	private Date examDate;
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
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
	
	
}
