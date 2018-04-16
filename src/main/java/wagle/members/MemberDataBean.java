package wagle.members;

import java.util.Date;



public class MemberDataBean {
	private int num;
	private String email;
	private String pwd;
	private String name;
	private String gender;
	private String age;
	private String loc; 
	private Date regdate;
	private String pwdQ;
	private String pwdA;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public String getPwdQ() {
		return pwdQ;
	}
	public void setPwdQ(String pwdQ) {
		this.pwdQ = pwdQ;
	}
	public String getPwdA() {
		return pwdA;
	}
	public void setPwdA(String pwdA) {
		this.pwdA = pwdA;
	}
	
	
	@Override
	public String toString() {
		return "MemberDataBean [num=" + num + ", email=" + email + ", pwd=" + pwd + ", name=" + name + ", gender="
				+ gender + ", age=" + age + ", loc=" + loc + ", regdate=" + regdate + ", pwdQ=" + pwdQ + ", pwdA="
				+ pwdA + "]";
	}
	
	
}
