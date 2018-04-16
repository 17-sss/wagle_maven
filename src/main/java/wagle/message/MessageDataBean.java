package wagle.message;

import java.util.Date;

public class MessageDataBean {
	private int num;
	private String confirm;
	private String userinfo;
	private String sendmessage;
	private String receivemessage;
	private Date regdate;
	private String userinfo2;
	
	
	public String getUserinfo2() {
		return userinfo2;
	}
	public void setUserinfo2(String userinfo2) {
		this.userinfo2 = userinfo2;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getUserinfo() {
		return userinfo;
	}
	public void setUserinfo(String userinfo) {
		this.userinfo = userinfo;
	}
	public String getSendmessage() {
		return sendmessage;
	}
	public void setSendmessage(String sendmessage) {
		this.sendmessage = sendmessage;
	}
	public String getReceivemessage() {
		return receivemessage;
	}
	public void setReceivemessage(String receivemessage) {
		this.receivemessage = receivemessage;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "MessageDataBean [num=" + num + ", confirm=" + confirm + ", userinfo=" + userinfo + ", sendmessage="
				+ sendmessage + ", receivemessage=" + receivemessage + ", regdate=" + regdate + ", userinfo2="
				+ userinfo2 + "]";
	}
	
	
	
}
