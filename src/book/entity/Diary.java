package book.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "tab_diary")
public class Diary {
	@Id
	@GeneratedValue(generator = "diaryId")
	@GenericGenerator(name = "diaryId", strategy = "native")
	private int diaryId;// 日志id
	private String loginInTime;// 登陆时间
	private String loginOutTime;// 登出时间
	@Column(name = "diaryInfo", columnDefinition = "TEXT", nullable = true)
	private String diaryInfo;// 日志信息

	

	public int getDiaryId() {
		return diaryId;
	}

	public void setDiaryId(int diaryId) {
		this.diaryId = diaryId;
	}

	public String getLoginInTime() {
		return loginInTime;
	}

	public void setLoginInTime(String loginInTime) {
		this.loginInTime = loginInTime;
	}

	public String getLoginOutTime() {
		return loginOutTime;
	}

	public void setLoginOutTime(String loginOutTime) {
		this.loginOutTime = loginOutTime;
	}

	public String getDiaryInfo() {
		return diaryInfo;
	}

	public void setDiaryInfo(String diaryInfo) {
		this.diaryInfo = diaryInfo;
	}

	@Override
	public String toString() {
		return "Diary [diaryId=" + diaryId + ", loginInTime=" + loginInTime + ", loginOutTime=" + loginOutTime
				+ ", diaryInfo=" + diaryInfo + "]";
	}

}
