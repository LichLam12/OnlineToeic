package DAODB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Examination;
import BEAN.QuesList_Exam;
import BEAN.Ques_ALLOption;

public class ExamPageDAO {
	public static List<QuesList_Exam> DisplayQuesList_Exam(int examID,String className,Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<QuesList_Exam> list = new ArrayList<QuesList_Exam>();

		String sql = "select examination.examID,className,examination.examTime,examination.examDate,\r\n" + 
				"			question.questionID,question.content as contentques,classID,\r\n" + 
				"				options.optionID,options.content as contentop,isAnswer,examination.examName\r\n" + 
				"				from examination,class,examdetails,question,options,question_options\r\n" + 
				"				where examination.examID=examdetails.examID and examination.examID=class.examID and\r\n" + 
				"				examdetails.questionID=question.questionID and question_options.questionID=question.questionID and\r\n" + 
				"				question_options.optionID=options.optionID\r\n" + 
				"				and examination.examID='"+examID+"' and className='"+className+"' group by options.optionID,class.classID,examination.examTime,examination.examDate,question.questionID,examination.examName";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();
			
				
			while (rs.next()) {
				QuesList_Exam mp = new QuesList_Exam();
				java.util.Date date1 = new java.util.Date();

				mp.setExamID(rs.getInt("examID"));
				mp.setExamName(rs.getNString("examName"));
				mp.setExamTime(rs.getTime("examTime"));
				
				
				date1.setDate(rs.getDate("examDate").getDate());
				date1.setMonth(rs.getDate("examDate").getMonth());
				date1.setYear(rs.getDate("examDate").getYear());
				date1.setHours(rs.getTime("examTime").getHours());
				date1.setMinutes(rs.getTime("examTime").getMinutes());
				date1.setSeconds(rs.getTime("examTime").getSeconds());
				mp.setExamDate(date1);
				//java.sql.Date sqlDate = new java.sql.Date(date1.getDay());
				mp.setClassID(rs.getInt("classID"));
				mp.setClassName(rs.getNString("className"));
				mp.setQuestionID(rs.getInt("questionID"));
				mp.setContentques(rs.getNString("contentques"));
				mp.setOptionID(rs.getInt("optionID"));
				mp.setContentop(rs.getNString("contentop"));
				mp.setAnswer(rs.getBoolean("isAnswer"));
				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
	
	
	public static List<Ques_ALLOption> DisplayQues_ALLOption(int questionID,Connection conn) {
		// Lấy ra kết nối tới cơ sở dữ liệu.

		List<Ques_ALLOption> list = new ArrayList<Ques_ALLOption>();

		String sql = "select question.questionID as questionID,question.content as contentQues,\r\n" + 
				"options.optionID as optionID,options.content as contentOp,isAnswer\r\n" + 
				" from question_options,question,options where question_options.questionID=question.questionID\r\n" + 
				" and question_options.optionID=options.optionID and question_options.questionID='"+questionID+"'";

		try {
			// Tạo một đối tượng PreparedStatement.
			PreparedStatement psmt = conn.prepareCall(sql);

			ResultSet rs = psmt.executeQuery();
			
				
			while (rs.next()) {
				Ques_ALLOption mp = new Ques_ALLOption();
				java.util.Date date1 = new java.util.Date();

				mp.setQuestionID(rs.getInt("questionID"));
				mp.setContentQues(rs.getNString("contentQues"));
				mp.setOptionID(rs.getInt("optionID"));
				mp.setContentOp(rs.getNString("contentOp"));
				mp.setAnswer(rs.getBoolean("isAnswer"));
			
				list.add(mp);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}
}
