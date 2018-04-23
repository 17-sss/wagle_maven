package wagle.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import wagle.board.RScriptDataBean;
import wagle.board.WagleDataBean;
import wagle.board.WaglelistDBMybatis;
import wagle.review.BoardDataBean;
import wagle.review.ReviewMyBatis;


@Controller
@RequestMapping("/board")
public class BoardController{
   String wboardid="1";
   String pageNum="1";

   
   WaglelistDBMybatis dbWagle = wagle.board.WaglelistDBMybatis.getInstance();
   ReviewMyBatis dbReview = ReviewMyBatis.getInstance();
   
   @ModelAttribute
   public void addAttributes(String wboardid,String pageNum) {
      if (wboardid!=null) {
         this.wboardid = wboardid;
         
      if (pageNum!=null  && pageNum !="" ) {
         this.pageNum = pageNum;
      }
      }
      
   

   }
   
   //메인 페이지
   @RequestMapping("/index")
   public String index(Model model) {
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      Date mTime = new Date ();
      String today = sdf.format(mTime);
      
      int number=5;
      List imgslide=dbWagle.imgslide();
      List wordcloud=dbWagle.wordcloud();
      model.addAttribute("imgslide",imgslide);
      model.addAttribute("wordcloud",wordcloud);
      model.addAttribute("number",number);
      model.addAttribute("today",today);
      
      System.out.println(imgslide);
      
      return "boardindex";
   }
   
   // 마이페이지-그룹리스트
   @RequestMapping("/mylist")
   public String mylist(HttpServletRequest req,Model model) throws Throwable {
      
      int count = 0;

      List mylist = null;
      
      HttpSession session=req.getSession();
      String email=(String)session.getAttribute("sessionEmail");
      
      count = dbWagle.getWagleCount1(email);
      if (count >0){
         mylist = dbWagle.getWagles1(email);
         }
      
      model.addAttribute("mylist",mylist);
      model.addAttribute("count", count);

      int count2 = 0;

      List mylist2 = null;
      
      count2 = dbWagle.getWagleCount2(email);
      if (count2 >0){
         mylist2 = dbWagle.getWagles2(email);
         }
      
      model.addAttribute("mylist2",mylist2);
      model.addAttribute("count2", count2);
      
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      Date mTime = new Date ();
      String today = sdf.format(mTime);
      
      model.addAttribute("today", today);
      
      return "/board/mylist";
   }

   // 와글와글
   @RequestMapping("/waglelist")
   public String waglelist(HttpServletRequest req, Model model,String wcategory, String search) throws Throwable {

      
      List waglelist = null;
      List searchwaglelist = null;
      HttpSession session=req.getSession();
      
      
      String name=(String)session.getAttribute("name");
      
      waglelist = dbWagle.getWaglelist();
      
      
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      Date mTime = new Date ();
      String today = sdf.format(mTime);
      System.out.println(wcategory);
      
      // wname 기준으로만 검색가능 =================================================
      if (search != null) {
    	  waglelist = dbWagle.getWaglelist("%" + search + "%");
    	  System.out.println("============\n검색: "+search+"\n============");
      } 
      // ====================================================================
      
      
      if (wcategory==null || wcategory.equals("전체")) {
         
         model.addAttribute("waglelist",waglelist);
      }
      
      if (wcategory!=null) {
         searchwaglelist = dbWagle.searchWaglelist(wcategory);
         model.addAttribute("searchwaglelist",searchwaglelist);
         System.out.println(searchwaglelist);
      }
      
      model.addAttribute("today",today);
      model.addAttribute("wcategory",wcategory);
      model.addAttribute("search", search);
      
      return "/board/waglelist";
   }
   
   // 오픈와글
   @RequestMapping("/wagleOpen")
   public ModelAndView wagleOpen(HttpServletRequest request, WagleDataBean wagle) throws Throwable {
      
     HttpSession  session = request.getSession();
      String whost=(String)session.getAttribute("name");
      String whostemail = (String)session.getAttribute("sessionEmail");
      RScript(request);
      
      ModelAndView mv = new ModelAndView();
      
      mv.addObject("whost", whost);
      mv.addObject("whostemail",whostemail);
      mv.setViewName("/board/wagleOpen");
     
      
      return mv;
   }
   
   @RequestMapping("/wagleOpenPro")
   public String wagleOpenPro(MultipartHttpServletRequest request, WagleDataBean wagle,Model model) throws Throwable {
      
      ModelAndView mv = new ModelAndView();
      MultipartFile multi = request.getFile("uploadfile");
      String filename = multi.getOriginalFilename();
      System.out.println("filename:["+filename+"]");
      if (filename != null && !filename.equals("")) {
         String uploadPath = request.getRealPath("/")+"wagleimg";
         System.out.println(uploadPath);
         FileCopyUtils.copy(multi.getInputStream(),new FileOutputStream(uploadPath+"/"+multi.getOriginalFilename()));
         
         wagle.setFilename(filename);
         wagle.setFilesize((int)multi.getSize());
         
      }else {
         wagle.setFilename("");
         wagle.setFilesize(0);
      }

      dbWagle.wagleOpen(wagle);
      
      String ctype=".jpg";
      
      int chk=0;
      
      // 이미지 확장자 체크
      if (filename!=null) {
      ctype= filename.substring(filename.lastIndexOf(".")+1);
      
      if (!(ctype.equalsIgnoreCase("jpg")||ctype.equalsIgnoreCase("jpeg")||ctype.equalsIgnoreCase("png")||ctype.equalsIgnoreCase("gif"))) {
         chk=1;
         model.addAttribute("chk", chk);
         return  "/board/typechk";
         }
      }
      
      model.addAttribute("chk", chk);
      return "/board/typechk";
   }
   
   
   //업데이트 와글
   @RequestMapping("/wagleUpdate")
   public String wagleUpdate(int wboardid,Model mv) throws Throwable {

       WagleDataBean wagle = dbWagle.getWagle(wboardid); 
       int all = dbWagle.getWagleCount3(wboardid);
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
       Date mTime = new Date ();
       String today = sdf.format(mTime);
       
       mv.addAttribute("wagle", wagle);
       mv.addAttribute("all", all);
       mv.addAttribute("today", today);
       
    return  "/board/wagleUpdate"; 
   }
   
   
   @RequestMapping("/wagleUpdatePro")
   public String wagleUpdatePro(MultipartHttpServletRequest request,String name,int size, int wboardid,WagleDataBean wagle,Model model) throws Throwable {
      ModelAndView mv = new ModelAndView();
      
      MultipartFile multi = request.getFile("uploadfile");
      String filename = multi.getOriginalFilename();
      System.out.println("filename:["+filename+"]");
      if (filename != null && !filename.equals("")) {
         String uploadPath = request.getRealPath("/")+"wagleimg";
         System.out.println(uploadPath);
         FileCopyUtils.copy(multi.getInputStream(),new FileOutputStream(uploadPath+"/"+multi.getOriginalFilename()));
         
         wagle.setFilename(filename);
         wagle.setFilesize((int)multi.getSize());
         
      }else {
         wagle.setFilename(name);
         wagle.setFilesize(size);
      }
      
      
      int chk=dbWagle.updateWagle(wagle); 
      model.addAttribute("wagle",wagle);
      
      
      if (chk==1) {

         return "/board/wagleUpdatePro";
      }
          return  null;  
   }
   
   //와글 삭제
   @RequestMapping("/wagleDelete")
   public ModelAndView wagleDelete(int wboardid)  throws Throwable { 
          
      ModelAndView mv = new ModelAndView();

      int check=dbWagle.deleteWagle(wboardid);
      mv.addObject("wboardid",wboardid);
      mv.addObject("check",check);
      mv.setViewName("/board/wagleDelete");
      
      return  mv;
      }
   
   
   //와글 내용 확인
   @RequestMapping("/wagleContent")
   public String wagleContent(HttpServletRequest req,int wboardid,Model mv)  throws Throwable {
      
   
      WagleDataBean wagle = dbWagle.getWagle(wboardid, "wagleContent");
      
      HttpSession session=req.getSession();
      String wagleremail=(String)session.getAttribute("sessionEmail");
      
      if (wagleremail==null) {
         wagleremail="nosession";
      }
   
      Boolean chk=dbWagle.waglechk(wboardid, wagleremail);
      
      int all=dbWagle.getWagleCount3(wboardid);
      
      mv.addAttribute("chk", chk);
      mv.addAttribute("wagle", wagle);
      mv.addAttribute("all",all);
      mv.addAttribute("wagleremail", wagleremail);
      
      
   
      int pageSize =10;
      int currentPage = Integer.parseInt(pageNum);
      int startRow = (currentPage - 1)*pageSize+1;
      int count = 0;
      int endRow = currentPage*pageSize;
      int number = 0;
      List articleList = null;

   
      String boardid = String.valueOf(wboardid);

      count = dbReview.getArticleCount(boardid);
      
      if(count > 0) {
         articleList = dbReview.getArticles(startRow, endRow, boardid);
      }
      number = count -(currentPage-1)*pageSize;
      
      int bottomLine =3; 
      
      int pageCount = count/pageSize +(count%pageSize == 0 ? 0 : 1);
      int startPage = 1 +(currentPage -1) /bottomLine*bottomLine;
      int endPage = startPage + bottomLine -1;

      
      if (endPage > pageCount) endPage = pageCount;
      
      mv.addAttribute("count", count);
      mv.addAttribute("boardid", boardid);
      mv.addAttribute("count", count);
      mv.addAttribute("articleList", articleList);
      mv.addAttribute("currentPage", currentPage);
      mv.addAttribute("startPage", startPage);
      mv.addAttribute("bottomLine", bottomLine);
      mv.addAttribute("endPage", endPage);
      mv.addAttribute("pageCount", pageCount);
   
      
      return "/board/wagleContent";
   }
   
   
   //와글에 가입
   @RequestMapping("/wagleJoin")
   public String wagleJoin(HttpServletRequest req,
          String wname,int wboardid,String wcategory)  throws Throwable {

      HttpSession session=req.getSession();
      String wagler=(String)session.getAttribute("name");
      String wagleremail=(String)session.getAttribute("sessionEmail");
      
      dbWagle.wagleJoin(wboardid,wagler,wcategory,wname,wagleremail);

      return "/board/wagleJoin";
            
   }
   
   //와글에서 탈퇴
   @RequestMapping("/wagleOut")
   public String wagleOut(HttpServletRequest req,
         int wboardid,Model mv)  throws Throwable {

   
      HttpSession session=req.getSession();
      String wagleremail=(String)session.getAttribute("sessionEmail");
      int chk=1;
      dbWagle.wagleOut(wboardid,wagleremail);
      mv.addAttribute("chk", chk);
      
      
      return "/board/wagleOut";
   }
   
   //와글에서 강제 삭제
   @RequestMapping("/wagleOut2")
   public String wagleOut2(HttpServletRequest req,
         int wboardid,String wagleremail,Model mv)  throws Throwable {

      int chk=2;
      dbWagle.wagleOut(wboardid,wagleremail);
      mv.addAttribute("chk",chk);

      
      return "/board/wagleOut";
   }
   
   // FAQ
   @RequestMapping("/faqlist")
   public String faqlist() throws Throwable {
      return "/board/faqlist";
   }
   
   
   //리뷰 작성
   @RequestMapping("/reviewinsert")
   public String reviewinsert(BoardDataBean article) throws Throwable {
   
      dbReview.insertArticle(article);
   
      return "redirect:mylist";
   }
   
   //리뷰 삭제
   @RequestMapping("/reviewdelete")
   public String reviewdelete(BoardDataBean article,int num,int boardid) throws Throwable {

      dbReview.deleteArticle(num);
      
      return "redirect:wagleContent?wboardid="+boardid;
   }
   
   //리뷰 업데이트
   @RequestMapping("/reviewupdate")
   public String reviewupdate(BoardDataBean article,int boardid) throws Throwable {
      

      dbReview.updateArticle(article);
      
      
      return "redirect:wagleContent?wboardid="+boardid;
   }
   
   
   //Rscript
   public String RScript(HttpServletRequest request)  throws Throwable { 
      
      String path="";
      String imgname="";
      
      request.setCharacterEncoding("euc-kr");
      System.out.println(request.getMethod());
      
      path=request.getServletContext().getRealPath("/");
      
      if(request.getParameter("imgname")!=null)
         imgname=request.getParameter("imgname");
      else
         imgname="noname01.jpg";
      makecsv();
      path=path.replace("\\", "/");
      System.out.println(path);
      
      System.out.println("3232323232end");
         imgname=RserveService.getInstance().RScript(imgname, path);
      System.out.println("================end");
      
      request.setAttribute("imgname", imgname);
            
      return  "/board/RScript"; 
         } 
   
   public void makecsv() { 
      PrintStream ps=null;
      FileOutputStream fos=null;
      List<RScriptDataBean> li = dbWagle.rscript();
      System.out.println("a:  "+li);
      try {
         fos=new FileOutputStream("c:\\r_temp\\r_test1.csv");
         ps=new PrintStream(fos);
         Iterator it=li.iterator();
         while(it.hasNext()) {
            RScriptDataBean et=(RScriptDataBean)it.next();
            System.out.println(et.toString());
            ps.print(et.toString()+"\r\n");
         }ps.flush();
         ps.close();
      }catch(FileNotFoundException e) {
         e.printStackTrace();
      }
   } 


}
      