package com.wcpdoc.exam.core.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 试题实体
 * 
 * v1.0 zhanghc 2017-05-07 14:56:29
 */
@Entity
@Table(name = "EXM_QUESTION")
public class Question {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Integer id;
	@Column(name = "TYPE")
	private Integer type;
	@Column(name = "DIFFICULTY")
	private Integer difficulty;
	@Column(name = "TITLE")
	private String title;
	@Column(name = "OPTION_A")
	private String optionA;
	@Column(name = "OPTION_B")
	private String optionB;
	@Column(name = "OPTION_C")
	private String optionC;
	@Column(name = "OPTION_D")
	private String optionD;
	@Column(name = "OPTION_E")
	private String optionE;
	@Column(name = "OPTION_F")
	private String optionF;
	@Column(name = "OPTION_G")
	private String optionG;
	@Column(name = "ANSWER")
	private String answer;
	@Column(name = "ANALYSIS")
	private String analysis;
	@Column(name = "STATE")
	private Integer state;
	@Column(name = "UPDATE_USER_ID")
	private Integer updateUserId;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@Column(name = "UPDATE_TIME")
	private Date updateTime;
	@Column(name = "QUESTION_TYPE_ID")
	private Integer questionTypeId;
	@Column(name = "SCORE")
	private BigDecimal score;
	@Column(name = "SCORE_OPTIONS")
	private String scoreOptions;
	@Column(name = "VER")
	private Integer ver;
	@Column(name = "SRC_ID")
	private Integer srcId;
	@Column(name = "NO")
	private Integer no;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/** 1：单选；2：多选；3：填空；4：判断；5：问答 */
	public Integer getType() {
		return type;
	}

	/** 1：单选；2：多选；3：填空；4：判断；5：问答 */
	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(Integer difficulty) {
		this.difficulty = difficulty;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOptionA() {
		return optionA;
	}

	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}

	public String getOptionB() {
		return optionB;
	}

	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}

	public String getOptionC() {
		return optionC;
	}

	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}

	public String getOptionD() {
		return optionD;
	}

	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}

	public String getOptionE() {
		return optionE;
	}

	public void setOptionE(String optionE) {
		this.optionE = optionE;
	}

	public String getOptionF() {
		return optionF;
	}

	public void setOptionF(String optionF) {
		this.optionF = optionF;
	}

	public String getOptionG() {
		return optionG;
	}

	public void setOptionG(String optionG) {
		this.optionG = optionG;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAnalysis() {
		return analysis;
	}

	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}

	/** 0：删除；1：启用；2：禁用 */
	public Integer getState() {
		return state;
	}

	/** 0：删除；1：启用；2：禁用 */
	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(Integer updateUserId) {
		this.updateUserId = updateUserId;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getQuestionTypeId() {
		return questionTypeId;
	}

	public void setQuestionTypeId(Integer questionTypeId) {
		this.questionTypeId = questionTypeId;
	}

	public Integer getVer() {
		return ver;
	}

	public void setVer(Integer ver) {
		this.ver = ver;
	}

	public Integer getSrcId() {
		return srcId;
	}

	public void setSrcId(Integer srcId) {
		this.srcId = srcId;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public BigDecimal getScore() {
		return score;
	}

	public void setScore(BigDecimal score) {
		this.score = score;
	}

	public String getScoreOptions() {
		return scoreOptions;
	}

	public void setScoreOptions(String scoreOptions) {
		this.scoreOptions = scoreOptions;
	}
}
