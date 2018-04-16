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
		
		model.addAttribute("userinfo",userinfo);
		
		return "/message/sendmessageForm";
	}
	@RequestMapping("sendPro")
	public String sendPro(HttpServletRequest request,MessageDataBean article) throws Throwable {

		dbPro.insertArticle(article);
	
		HttpSession session = request.getSession();
		
		String name =(String)session.getAttribute("name");
		
		int count = dbPro.count(name);
		
		session.setAttribute("count", count);
		
	
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
		String name =  (String)session.getAttribute("name");
		
		messagelist = dbPro.listArticle(name, startRow, endRow, "re");

		model.addAttribute("messagelist", messagelist);
		model.addAttribute("group",group);
		return "/message/messagelist";
	}
	@RequestMapping("messagelist2")
	public String messagelist2(MessageDataBean article,Model model,HttpServletRequest request) throws Throwable {
		String group ="2";
		int pageSize = 10;
		System.out.println("messagelist2");
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
		String name =  (String)session.getAttribute("name");
		
		messagelist = dbPro.listArticle(name, startRow, endRow, "se");

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
	String name =  (String)session.getAttribute("name");
	
	messagelist = dbPro.listArticle(name, startRow, endRow, "my");
     
	model.addAttribute("messagelist", messagelist);
	model.addAttribute("group",group);
	
	return "/message/messagelist";
	}
	@RequestMapping("messagedelete")
	public String messagedelete(HttpServletRequest request,HttpServletRequest req)  throws Throwable {
			HttpSession session = request.getSession();
		
			String name =(String)session.getAttribute("name");
	
			
			String num[]=req.getParameterValues("check");
			int numint[] = new int[10];
			
			for(int i=0;i<num.length;i++) {
			
				numint[i] = Integer.parseInt(num[i]);	
			}
			
			
			for(int i=0;i<num.length;i++) {
				dbPro.deleteArticle(numint[i]);
			
			}
			int count = dbPro.count(name);
			
			session.setAttribute("count", count);	
				
			 return  "/message/messagelist"; 
			}
	@RequestMapping("cmessagedelete")
	public String cmessagedelete(HttpServletRequest request,MessageDataBean article)  throws Throwable {
			HttpSession session = request.getSession();
		
			String name =(String)session.getAttribute("name");
		
			
		
			int num = article.getNum();
		
			
			dbPro.deleteArticle(num);
			
			int count = dbPro.count(name);
			
			session.setAttribute("count", count);
				
			 return  "/message/messagelist"; 
			}
	@RequestMapping("messagecontent")
	public String messagecontent(HttpServletRequest request,MessageDataBean article,MemberDataBean user,Model model)  throws Throwable { 
			
			String group = request.getParameter("group");
			
			HttpSession session = request.getSession();
			
			String name =(String)session.getAttribute("name");
			
			int num = article.getNum();
			article = dbPro.updateConfirm(num);
			
			int count = dbPro.count(name);
			
			session.setAttribute("count", count);
			
			
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
		String name =  (String)session.getAttribute("name");
		
		messagelist = dbPro.orderby(name, startRow, endRow,"re");
			
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
		String name =  (String)session.getAttribute("name");
		
		messagelist = dbPro.orderby(name, startRow, endRow,"se");
		
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
		String name =  (String)session.getAttribute("name");
		System.out.println(name);
		messagelist = dbPro.orderby(name, startRow, endRow,"my");
		
		model.addAttribute("messagelist", messagelist);
		model.addAttribute("group", group);	
		return "/message/messagelist";
	}
	
}
