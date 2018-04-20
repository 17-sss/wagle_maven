package wagle.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import wagle.members.MemberDataBean;
import wagle.message.MessageDataBean;
import wagle.message.MessageMyBatis;

@Controller
@RequestMapping("/message")
public class MessageController {

	MessageMyBatis dbPro = MessageMyBatis.getInstance();
		
	@RequestMapping("/sendmessageForm")
	public String sendmessageForm(HttpServletRequest request,Model model) {
		
		String userinfo = request.getParameter("userinfo");
		String userinfo2 = request.getParameter("userinfo2");
		
		model.addAttribute("userinfo",userinfo);
		model.addAttribute("userinfo2",userinfo2);
		
		return "/message/sendmessageForm";
	}
	@RequestMapping("sendPro")
	public String sendPro(HttpServletRequest request,MessageDataBean article) throws Throwable {

		dbPro.insertArticle(article);
	
		HttpSession session = request.getSession();
		
		String sessionEmail =(String)session.getAttribute("sessionEmail");
		
		int count1 = dbPro.count(sessionEmail);
		session.setAttribute("count1", count1);
		
	
		return "redirect:/message/messagelist2"; 
	}
	@RequestMapping("messagelist")
	public String messagelist(MessageDataBean article,Model model,HttpServletRequest request) throws Throwable {
		String group ="1";
		int pageSize = 10;

		String pageNum = "1";
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List messagelist = null;

		HttpSession session = request.getSession();
		String sessionEmail =  (String)session.getAttribute("sessionEmail");

		messagelist = dbPro.listArticle(sessionEmail, startRow, endRow, "re");
		
		int count1 = dbPro.count(sessionEmail);
		session.setAttribute("count1", count1);
		model.addAttribute("messagelist", messagelist);
		model.addAttribute("group",group);
		return "/message/messagelist";
	}
	@RequestMapping("messagelist2")
	public String messagelist2(MessageDataBean article,Model model,HttpServletRequest request) throws Throwable {
		String group ="2";
		int pageSize = 10;
		String pageNum = "1";
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List messagelist = null;

		HttpSession session = request.getSession();
		String sessionEmail =  (String)session.getAttribute("sessionEmail");
		
		messagelist = dbPro.listArticle(sessionEmail, startRow, endRow, "se");
		int count1 = dbPro.count(sessionEmail);
		session.setAttribute("count1", count1);
		model.addAttribute("messagelist", messagelist);
		model.addAttribute("group",group);
		return "/message/messagelist";
	}
	@RequestMapping("messagelist3")
	public String messagelist3(MessageDataBean article,Model model,HttpServletRequest request) throws Throwable {
	String group ="3";
	int pageSize = 10;

	String pageNum = "1";
	if (pageNum == null || pageNum == "") {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	List messagelist = null;

	HttpSession session = request.getSession();
	String sessionEmail =  (String)session.getAttribute("sessionEmail");
	
	messagelist = dbPro.listArticle(sessionEmail, startRow, endRow, "my");
	int count1 = dbPro.count(sessionEmail);
	session.setAttribute("count1", count1); 
	model.addAttribute("messagelist", messagelist);
	model.addAttribute("group",group);
	
	return "/message/messagelist";
	}
	@RequestMapping("messagedelete")
	public String messagedelete(HttpServletRequest request,HttpServletRequest req,Model model)  throws Throwable {
			HttpSession session = request.getSession();
			int pageSize = 10;

			String pageNum = "1";
			if (pageNum == null || pageNum == "") {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = currentPage * pageSize;
			int number = 0;
			List messagelist = null;
			
			//messagelist = request.getParameter("messagelist");
			String sessionEmail =(String)session.getAttribute("sessionEmail");
			
			String group = request.getParameter("group");
			
			String num[]=req.getParameterValues("check");
			int numint[] = new int[10];
			
			for(int i=0;i<num.length;i++) {
			
				numint[i] = Integer.parseInt(num[i]);	
			}
			
			
			for(int i=0;i<num.length;i++) {
				dbPro.deleteArticle(numint[i]);
			
			}
			int count1 = dbPro.count(sessionEmail);
			
			session.setAttribute("count1", count1);	
			model.addAttribute("group", group);	
			System.out.println(group+"====");
			if(group.equals("3")) {
				return  "redirect:messagelist3"; 
			}
			if(group.equals("2")) {
				return  "redirect:messagelist2"; 
			}
			if(group.equals("1")) {
				return  "redirect:messagelist"; 
			}	
			return "";
			}
	@RequestMapping("cmessagedelete")
	public String cmessagedelete(HttpServletRequest request,MessageDataBean article)  throws Throwable {
			HttpSession session = request.getSession();
		
			String sessionEmail =(String)session.getAttribute("sessionEmail");
			String group = request.getParameter("group");
			
		
			int num = article.getNum();
		
			
			dbPro.deleteArticle(num);
			
			int count1 = dbPro.count(sessionEmail);
			
			session.setAttribute("count1", count1);
			
			if(group.equals("3")) {
				return  "redirect:messagelist3"; 
			}
			if(group.equals("2")) {
				return  "redirect:messagelist2"; 
			}
			if(group.equals("1")) {
				return  "redirect:messagelist"; 
			}	
			return "";
				
			}
	@RequestMapping("messagecontent")
	public String messagecontent(HttpServletRequest request,MessageDataBean article,MemberDataBean user,Model model)  throws Throwable { 
			
			String group = request.getParameter("group");
			
			HttpSession session = request.getSession();
			
			String sessionEmail =(String)session.getAttribute("sessionEmail");
			
			int num = article.getNum();
			article = dbPro.updateConfirm(num);
			
			int count1 = dbPro.count(sessionEmail);
			
			session.setAttribute("count1", count1);
			
			
			model.addAttribute("article", article);
			model.addAttribute("group", group);
			 return  "/message/messagecontent"; 
			}
	@RequestMapping("orderby")
	public String orderby(HttpServletRequest request,Model model) {
			
		int pageSize = 10;

		String pageNum = "1";
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List messagelist = null;

		HttpSession session = request.getSession();
		String sessionEmail =  (String)session.getAttribute("sessionEmail");
		
		messagelist = dbPro.orderby(sessionEmail, startRow, endRow,"re");
			
		model.addAttribute("messagelist", messagelist);
		
		return "/message/messagelist";
	}
	@RequestMapping("orderby2")
	public String orderby2(HttpServletRequest request,Model model) {
			
		int pageSize = 10;

		String pageNum = "1";
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List messagelist = null;

		HttpSession session = request.getSession();
		String sessionEmail =  (String)session.getAttribute("sessionEmail");
		
		messagelist = dbPro.orderby(sessionEmail, startRow, endRow,"se");
		
		model.addAttribute("messagelist", messagelist);
		
		return "/message/messagelist";
	}
	@RequestMapping("orderby3")
	public String orderby3(HttpServletRequest request,Model model) {
		
		String group = request.getParameter("group");
		int pageSize = 10;

		String pageNum = "1";
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List messagelist = null;

		HttpSession session = request.getSession();
		String sessionEmail =  (String)session.getAttribute("sessionEmail");
		System.out.println(sessionEmail);
		messagelist = dbPro.orderby(sessionEmail, startRow, endRow,"my");
		
		model.addAttribute("messagelist", messagelist);
		model.addAttribute("group", group);	
		return "/message/messagelist";
	}
	
}
