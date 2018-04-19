package wagle.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	
	WaglelistDBMybatis dbWagle = wagle.board.WaglelistDBMybatis.getInstance();
	MemberDBMybatis dbMember = MemberDBMybatis.getInstance();
	
	@RequestMapping("/GroupChat")
	public String GroupChat(String name, String group, Model model,int wboardid,HttpServletRequest req) {
		
		
		HttpSession session = req.getSession();
		name =  (String) session.getAttribute("name");
		
		if (group == null) group = "그룹";
		if (name == null) name = "이름없음";
	
		
		System.out.println("세션이름: " + name + "\n세션그룹명: " + group);
		
		List member=dbWagle.getWagleMember(wboardid);
		String host=dbWagle.getHost(wboardid);

		
		model.addAttribute("name", name);
		model.addAttribute("group", group);
		model.addAttribute("member",member);
		model.addAttribute("host",host);
		
		return "websocketGroup";
	}
	@RequestMapping("/upload")
	public String upload(MultipartHttpServletRequest request) throws IOException{
			MultipartFile multi = request.getFile("file");
			String filename = multi.getOriginalFilename();
			String uploadPath = request.getRealPath("/") + "img";
			System.out.println(uploadPath);
			if (filename != null && !filename.equals("")) {
		
			FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(
					uploadPath + "/" + multi.getOriginalFilename()));
			} else {
			
			}
		return "redirect:GroupChat";
	}
}
