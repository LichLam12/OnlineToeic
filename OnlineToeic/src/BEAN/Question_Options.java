package BEAN;

public class Question_Options {
	private int ques_op_ID;
	private int questionID;
	private int optionID;
	private boolean isAnswer;
	public int getQues_op_ID() {
		return ques_op_ID;
	}
	public void setQues_op_ID(int ques_op_ID) {
		this.ques_op_ID = ques_op_ID;
	}
	public int getQuestionID() {
		return questionID;
	}
	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}
	public int getOptionID() {
		return optionID;
	}
	public void setOptionID(int optionID) {
		this.optionID = optionID;
	}
	public boolean isAnswer() {
		return isAnswer;
	}
	public void setAnswer(boolean isAnswer) {
		this.isAnswer = isAnswer;
	}
	
}
