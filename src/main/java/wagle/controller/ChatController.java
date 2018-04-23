package wagle.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import wagle.board.WaglelistDBMybatis;
import wagle.members.MemberDBMybatis;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	MemberDBMybatis dbMember = MemberDBMybatis.getInstance();
	WaglelistDBMybatis dbWagle = WaglelistDBMybatis.getInstance();
	
	@RequestMapping("/GroupChat")
	public String GroupChat(String name, String group, int wboardid,Model model, HttpServletRequest req) {
		
		  group = dbWagle.getWname1(wboardid);
	      HttpSession session = req.getSession();
	      session.setAttribute("group", group);
	      group = (String) session.getAttribute("group");
	      name =  (String) session.getAttribute("name");

	    String host=dbWagle.getHost(wboardid);
		List member=dbWagle.getWagleMember(wboardid);
		
		if (group == null) group = "그룹없어";
		if (name == null) name = "이름없음";
		
		System.out.println("세션이름: " + name + "\n세션그룹명: " + group);
		
		model.addAttribute("host",host);
		model.addAttribute("member",member);
		
		model.addAttribute("name", name);
		model.addAttribute("group", group);
		
		return "websocketGroup";
	}
	@RequestMapping("/upload")
	public String upload(MultipartHttpServletRequest request) throws IOException{
		System.out.println("upload======================");
		MultipartFile multi = request.getFile("upload_file");
		
		if (multi!=null) {
			String filename = multi.getOriginalFilename();
			String uploadPath = request.getRealPath("/") + "img";
			System.out.println(uploadPath);
			if (filename != null && !filename.equals("")) {
		
			FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(
					uploadPath + "/" + multi.getOriginalFilename()));
			} else {
			
			}
		}
		return "form";
	}
}
