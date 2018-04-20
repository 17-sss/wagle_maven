package wagle.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import wagle.members.MemberDBMybatis;
import wagle.members.MemberDataBean;
import wagle.message.MessageMyBatis;

@Controller
@RequestMapping("/member")
public class MemberController {

	MemberDBMybatis dbMember = MemberDBMybatis.getInstance();
	MessageMyBatis dbMessage = MessageMyBatis.getInstance();
	
	// 회원가입 폼
	@RequestMapping("/joinForm")
	public ModelAndView joinForm(MemberDataBean member)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("num", member.getNum());
		mv.setViewName("joinForm");
		return mv;
	}
	
	//회원가입 pro
	@RequestMapping("/joinPro")
	public String joinPro(MemberDataBean member,String email,Model model)throws Throwable {	
		/*member = new MemberDataBean();  --> 새로 객체를 받아오면 null만 들어온다!!*/
		boolean result = false;
		result=dbMember.confirmId(email);
		model.addAttribute("result",result);
		
		
		if(!result) {
			dbMember.insertMember(member);
			return "joinPro";
		}else {
			return "joinPro";
		}
		
	}
	
	
	
	//이메일 중복확인
	@RequestMapping("/confirmId")
	public String confirmId(String email,Model model) {
		boolean result = false;
		result=dbMember.confirmId(email);
		
		model.addAttribute("result",result);
		model.addAttribute("email",email);
		
		
		return "confirmId";
	
	}
	
	//로그인
	@RequestMapping("/login")
    public String login(HttpServletRequest request)
  		  throws Throwable { 
		
		MessageMyBatis dbPro = MessageMyBatis.getInstance();
		
		String sessionEmail = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String sessionPwd = request.getParameter("pwd");
		
		int pwcheck = dbMember.login(sessionEmail, pwd);	
		
		HttpSession session = request.getSession();
		
		request.setAttribute("pwcheck", pwcheck);
		
		
		if (pwcheck==-1) {
			return "loginPro";
		}else if (pwcheck==0) {
			return "loginPro";
		}else{
			session = request.getSession();
			session.setAttribute("sessionEmail", sessionEmail);	
			session.setAttribute("sessionPwd", sessionPwd);	
			MemberDataBean user = dbMember.getUser2(sessionEmail, pwcheck);
			System.out.println("zzzz여기까지는됨");
			int count1 = dbPro.count(sessionEmail);
			session.setAttribute("name", user.getName());//name받아오기
			session.setAttribute("count1", count1);
			return "redirect:/index";
	   }		
}  

	   
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}
	
	//비밀번호 찾기
	@RequestMapping("/findPwd")
	public String findPwd(Model model, MemberDataBean member) {
		
		model.addAttribute(member);
		return "findPwd";
	}
	
	@RequestMapping("/findPro")
	public String findPro(Model model, String email, String pwdQ, String pwdA, MemberDataBean member) {
		if (email == null) {email = " ";}
		if (email.equals("admin")) {email = "접근불가";}
		if (pwdQ == null) {pwdQ = " ";}
		if (pwdA == null) {pwdA = " ";}
		
		System.out.println("========findPro========\n이메일: "+ email 
				+ "\n비번 질문: " + pwdQ + "\n비번 답: " + pwdA + "\n=======================");
		
		int chk = dbMember.getUser3(email, pwdQ, pwdA); // chk 용도
		member = dbMember.getUser(email, "findPro"); // 데이터 받아오는 용도
		model.addAttribute("member", member);
		model.addAttribute("chk", chk);
		
		if (chk==1){ 
			System.out.println(email+" 회원님의 비밀번호는 "
					+member.getPwd()+ "입니다."+"\n=======================");
			return "findPro";
		}else{ 
			return "findPro";
		}
	}
	
	
	//update
	@RequestMapping("/updateForm")
	public String updateForm(Model model, HttpServletRequest request)
			throws Exception{
		String sessionEmail = request.getParameter("email");
		
		HttpSession session = request.getSession();	
				
		MemberDataBean member = dbMember.getUser(sessionEmail, "update");
		model.addAttribute("member", member);
		
		return "updateForm";
	} 
	
	@RequestMapping("/updatePro")
	public String updatePro(MemberDataBean member,Model mv)
			throws Exception {

		dbMember.updateMember(member);
		int chk= dbMember.updateMember(member); 
		mv.addAttribute("member", member);
		mv.addAttribute("chk", chk);
		
		if (chk==1){ 
			return "updatePro";
		}else{ 
			return "updatePro";
		}
	}
	
	@RequestMapping(value="deleteForm")
	public String deleteForm(MemberDataBean member, Model mv, HttpServletRequest request)  throws Throwable { 
		HttpSession session = request.getSession();
		String sessionEmail = (String)session.getAttribute("email");  //로그인된 본인 아이디에 해당하는 패스워드로 delete하기 위해 필요
		String sessionPwd = (String)session.getAttribute("pwd"); // [관리자] 뷰에서 세션pwd 비교
		//sessionEmail = request.getParameter("email");	//admin으로 delete하기위해 필요
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		
		mv.addAttribute("sessionEmail", sessionEmail);
		mv.addAttribute("sessionPwd", sessionPwd);
		mv.addAttribute("email", email);
		mv.addAttribute("pwd", pwd);
		
		return  "deleteForm"; 
	} 
	
	@RequestMapping(value="deletePro")
	public String deletePro(MemberDataBean member, Model mv, HttpServletRequest request)  throws Throwable { 
		HttpSession session = request.getSession();
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		dbMember = MemberDBMybatis.getInstance();
		
		int check=0;
		
		if (!session.getAttribute("sessionEmail").equals("admin")) {
			check = dbMember.deleteMember(email, pwd, (String) session.getAttribute("sessionEmail"));
		} else if (session.getAttribute("sessionEmail").equals("admin")) {
			check = dbMember.deleteMember(email, null, (String) session.getAttribute("sessionEmail"));
		}
		
		mv.addAttribute("check", check);
		
		if(check==1 && !session.getAttribute("sessionEmail").equals("admin")) {
			session.invalidate();
		}
		
		
		
		return "deletePro";
		
	}
	
}
