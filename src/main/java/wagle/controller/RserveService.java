package wagle.controller;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;

public class RserveService {

   private static RserveService instance=new RserveService();
   public static void main(String[] args) {
      
   }

   public static RserveService getInstance() {
      return instance;
   }
   //Rscript.jsp에서 연결되는 메소드
   public String RScript(String imgname,String path) throws REXPMismatchException, REngineException{
      RConnection c = new RConnection();
      String imgpath=path+"img"+"/"+imgname;
      System.out.println(imgpath);
   System.out.println("png('"+imgpath+"',width=400,height=400)");
         c.parseAndEval("png('"+imgpath+"',width=400,height=400)");
         System.out.println("setwd('c:/r_temp')");
         c.parseAndEval("setwd('c:/r_temp')");
         System.out.println("data1<-read.csv(\"r_test1.csv\",header=T)");
         c.parseAndEval("data1<-read.csv(\"r_test1.csv\",header=T)");
         
         System.out.println("barplot(as.matrix(data1[1:7,2:7]),main=paste(\"연령별 카테고리별 인기있는 와글 가입현황\"),ylab=\"회원수\",beside=T,col=rainbow(8),ylim=c(0,20))");
         c.parseAndEval("barplot(as.matrix(data1[1:7,2:7]),main=paste(\"연령별 카테고리별 인기있는 와글 가입현황\"),ylab=\"회원수\",beside=T,col=rainbow(8),ylim=c(0,20))");
         System.out.println("abline(h=seq(0,20,10),lty=3,lwd=0.2)");
         c.parseAndEval("abline(h=seq(0,20,10),lty=3,lwd=0.2)");
         System.out.println("name<-data1$X");
         c.parseAndEval("name<-data1$X");
         
         
         
         System.out.println("dev.off()");
         c.parseAndEval("dev.off()");
         c.close();
      
         return imgname;
      
   }
   
}