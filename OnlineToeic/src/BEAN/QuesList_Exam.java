package BEAN;
import java.sql.Time;
import java.util.Date;
public class QuesList_Exam {
	private int examID;
	private String examName;
	private int classID;
	private String className;
	private Time examTime;
	private Date examDate;
	private int questionID;
	private String contentques;
	private int optionID;
	private String contentop;
	private boolean isAnswer;
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
	public int getClassID() {
		return classID;
	}
	public void setClassID(int classID) {
		this.classID = classID;
	}
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
	public int getQuestionID() {
		return questionID;
	}
	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}
	public String getContentques() {
		return contentques;
	}
	public void setContentques(String contentques) {
		this.contentques = contentques;
	}
	public int getOptionID() {
		return optionID;
	}
	public void setOptionID(int optionID) {
		this.optionID = optionID;
	}
	public String getContentop() {
		return contentop;
	}
	public void setContentop(String contentop) {
		this.contentop = contentop;
	}
	public boolean isAnswer() {
		return isAnswer;
	}
	public void setAnswer(boolean isAnswer) {
		this.isAnswer = isAnswer;
	}
	
	
	
	
}
