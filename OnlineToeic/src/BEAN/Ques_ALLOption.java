package BEAN;

public class Ques_ALLOption {
	private int questionID;
	private String contentQues;
	private int optionID;
	private String contentOp;
	private boolean isAnswer;
	public int getQuestionID() {
		return questionID;
	}
	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}
	public String getContentQues() {
		return contentQues;
	}
	public void setContentQues(String contentQues) {
		this.contentQues = contentQues;
	}
	public int getOptionID() {
		return optionID;
	}
	public void setOptionID(int optionID) {
		this.optionID = optionID;
	}
	public String getContentOp() {
		return contentOp;
	}
	public void setContentOp(String contentOp) {
		this.contentOp = contentOp;
	}
	public boolean isAnswer() {
		return isAnswer;
	}
	public void setAnswer(boolean isAnswer) {
		this.isAnswer = isAnswer;
	}
	
}
