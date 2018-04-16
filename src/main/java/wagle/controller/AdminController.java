package wagle.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import wagle.board.WagleDataBean;
import wagle.board.WaglelistDBMybatis;
import wagle.members.MemberDBMybatis;

@Controller
@RequestMapping("/admin")
public class AdminController {
	MemberDBMybatis dbMember = MemberDBMybatis.getInstance();
	WaglelistDBMybatis dbWagle = WaglelistDBMybatis.getInstance();
	
	// 包府磊 - 干滚格废
	@RequestMapping(value = "memberlist")
	public ModelAndView memberlist(Model model, HttpServletRequest request, String pageNum) throws Throwable {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		int pageSize = 10;
		
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		//System.out.println("+++++++++++\n"+"start: "+ startRow + "\nend: "+endRow + "\n+++++++++++");
		int count = 0;
		int number = 0;
		List memberlist = null;
		
		count = dbMember.getMemberCount();
		if (count > 0) {
			memberlist = dbMember.getMembers(startRow, endRow);
		}
		number = count - (currentPage - 1) * pageSize;

		int bottomLine = 3;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;
		
		mv.addObject("count", count);
		mv.addObject("memberlist", memberlist);
		mv.addObject("currentPage", currentPage);
		mv.addObject("startPage", startPage);
		mv.addObject("bottomLine", bottomLine);
		mv.addObject("pageCount", pageCount);
		mv.addObject("number", number);
		mv.addObject("endPage", endPage);
		
		// 流立 立辟 阜澜 (url)
		if (session.getAttribute("sessionEmail").equals("admin")) {
			// 包府磊老 版快
			mv.setViewName("memberlist");
		} else if (!session.getAttribute("sessionEmail").equals("admin")) {
			// 蜡历老 版快
			mv.setViewName("index");
		}

		return mv;
	}
	
	// 包府磊 - 弊缝包府
	@RequestMapping(value = "waglelist_ad")
	public ModelAndView waglelist_ad (Model model, HttpServletRequest request, String pageNum) {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		int pageSize = 10;
		
		if (pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		//System.out.println("+++++++++++\n"+"start: "+ startRow + "\nend: "+endRow + "\n+++++++++++");
		int count = 0;
		int number = 0;
		List waglelist = null;
		
		count = dbWagle.getWagleCount_ad();
		if (count > 0) {
			waglelist = dbWagle.getWaglelist_ad(startRow, endRow);
		}
		number = count - (currentPage - 1) * pageSize;

		int bottomLine = 3;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;

		if (endPage > pageCount)
			endPage = pageCount;
		
		mv.addObject("count", count);
		mv.addObject("waglelist", waglelist);
		mv.addObject("currentPage", currentPage);
		mv.addObject("startPage", startPage);
		mv.addObject("bottomLine", bottomLine);
		mv.addObject("pageCount", pageCount);
		mv.addObject("number", number);
		mv.addObject("endPage", endPage);
		
		
		if (session.getAttribute("sessionEmail").equals("admin")) {
			// 包府磊老 版快
			mv.setViewName("waglelist_ad");
		} else if (!session.getAttribute("sessionEmail").equals("admin")) {
			// 蜡历老 版快
			mv.setViewName("index");
		}
		
		return mv;
	}
	
	// 包府磊 - 汽 (update..? --> delete!)
	@RequestMapping("/wagleform_ad")
	public String wagleform_ad(Model model, int wboardid) throws Exception{
		
		WagleDataBean wagle = dbWagle.getWagle(wboardid);
		model.addAttribute("wagle", wagle);
		
		return "wagleform_ad";
	}
	
	// 包府磊 - 客臂 昏力 (Pro)
	@RequestMapping("/wagleDelete_ad")
	public ModelAndView wagleDelete(int wboardid)  throws Throwable { 
		ModelAndView mv = new ModelAndView();

		int check=dbWagle.deleteWagle(wboardid);
		mv.addObject("wboardid",wboardid);
		mv.addObject("check",check);
		
		mv.setViewName("wagleDelete_ad");
		
		return  mv;
	}

}
