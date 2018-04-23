package wagle.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import mybatis.MybatisConnector;




public class WaglelistDBMybatis extends MybatisConnector{
	private final String namespace = "ldg.mybatis";
	private static WaglelistDBMybatis instance = new WaglelistDBMybatis();
	
	private WaglelistDBMybatis() {

	}

	public static WaglelistDBMybatis getInstance() {
		return instance;
	}

	
	SqlSession sqlSession;
	
	//와글을 오픈한다.
	public void wagleOpen(WagleDataBean wagle) {
		sqlSession = sqlSession();

		int number=sqlSession.selectOne(namespace+".getNextNumber",wagle);
		
		wagle.setWboardid(number);
					
		sqlSession.insert(namespace+".wagleOpen",wagle);
		sqlSession.commit(); 
		sqlSession.close();
		
	}
	
	//내가 오픈한 와글 갯수
	public int getWagleCount1(String email) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("email", email);
		
		int number=sqlSession.selectOne(namespace+".getWagleCount1",map);
		
		sqlSession.close();
		
		return number;
	}
	
	//내가 가입한 와글 갯수 
	public int getWagleCount2(String email) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("email", email);
		
		int number=sqlSession.selectOne(namespace+".getWagleCount2",map);
		
		sqlSession.close();
		
		return number;
	}
	
	//와글의 회원 수
	public int getWagleCount3(int wboardid) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		int number=sqlSession.selectOne(namespace+".getWagleCount3",map);
		
		sqlSession.close();
		
		return number;
	}
	
	//내가 오픈한 와글의 리스트
	public List getWagles1(String email) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("email", email);

		List li = sqlSession.selectList(namespace+".getWagles1",map);
		
		sqlSession.close();
		return li;
	}
	
	//내가 가입한 와글의 리스트 
	public List getWagles2(String email) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("email", email);

		
		List li = sqlSession.selectList(namespace+".getWagles2",map);
		sqlSession.close();
		return li;
	}
	

  	//와글 회원 구하기
 	public List getWagleMember(int wboardid) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		List li = sqlSession.selectList(namespace+".getWagleMember",map);
		sqlSession.close();
		return li;
	}
 	
 	//호스트 정보 구하기
 	public String getHost(int wboardid) {
 		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		String host = sqlSession.selectOne(namespace+".getHost",map);
		sqlSession.close();
		return host;
 	}
 	
 	public String getHostemail(int wboardid) {
 		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		String hostemail = sqlSession.selectOne(namespace+".getHostemail",map);
	
		sqlSession.close();
		return hostemail;
 	}
	
	
	//내가 오픈한 와글의 정보 수정
	public WagleDataBean getWagle(int wboardid) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		
		WagleDataBean wagle = sqlSession.selectOne(namespace+".getWagle",map);
		sqlSession.close();
		
		return wagle;
	}
	
	public WagleDataBean getWagle(int wboardid, String chk) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		if(chk.equals("wagleContent")) {
			sqlSession.update(namespace+".plusReadCount", map);
		}
		
		
		WagleDataBean wagle = sqlSession.selectOne(namespace+".getWagle",map);
		sqlSession.commit();
		sqlSession.close();
		
		return wagle;
	}
	
	public int updateWagle(WagleDataBean wagle) {
		
		sqlSession = sqlSession();
		
		//와글장이 와글을 수정한다.
		int chk = sqlSession.update(namespace+".updateWagle",wagle);
		
		//와글장이 와글명을 바꾸면 와글러한테도 와글명이 바뀐다.
		int chk2 = sqlSession.update(namespace+".updateWagle2",wagle);
		sqlSession.commit(); 
		sqlSession.close();
		
		System.out.println(chk);
		
		return chk;
	}
	
	//와글장이 와글을 삭제한다.
	 public int deleteWagle(int wboardid) throws Exception {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		
		int chk=sqlSession.delete(namespace+".deleteWagle",map);
		
		sqlSession.commit();
		sqlSession.close();
		
		return chk;
	}
	 
	 //상단바의 와글와글에서 모든 와글리스트 확인 가능 
	 public List getWaglelist() {
			sqlSession = sqlSession();
			
			List li = sqlSession.selectList(namespace+".getWaglelist");
			sqlSession.close();
			return li;
	}
	 
	 public List getWaglelist(String wname) {
			sqlSession = sqlSession();
			
			Map map = new HashMap();
			map.put("wname", wname);
			List li = sqlSession.selectList(namespace+".getWaglelistSearch", map);
			sqlSession.close();
			return li;
	}

	 public List searchWaglelist(String wcategory) {
		 	sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("wcategory", wcategory);
			
			List li = sqlSession.selectList(namespace+".searchWaglelist",map);
			sqlSession.close();
			return li;
	 }
	 
	 //원하는 와글에 가입한다. 
	 public void wagleJoin(int wboardid,String wagler,String wcategory,String wname,String wagleremail) {
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("wboardid", wboardid);
			map.put("wagler", wagler);
			map.put("wname", wname);
			map.put("wcategory", wcategory);
			map.put("wagleremail",wagleremail);


			sqlSession.insert(namespace+".wagleJoin",map);
			
			sqlSession.commit(); 
			sqlSession.close();
	}
	 
	 //원치 않는 와글에서 탈퇴한다.
	 public int wagleOut(int wboardid,String wagleremail) throws Exception {
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("wboardid", wboardid);
			map.put("wagleremail", wagleremail);
			
			int chk=sqlSession.delete(namespace+".wagleOut",map);
			
			sqlSession.commit();
			sqlSession.close();
			
			return chk;
	}
	 
	 public List imgslide() {
			sqlSession = sqlSession();
			List li = sqlSession.selectList(namespace+".imgslide");
			sqlSession.close();
			return li;
	}
	 
	//와글와글 리스트에서 내가 가입한 와글인지 아닌지 체크하여 버튼의 활성화 여부를 결정한다
	public boolean waglechk(int wboardid, String wagleremail) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("wboardid", wboardid);
		map.put("wagleremail", wagleremail);
		boolean li=true;
		Map<String,String> map2=sqlSession.selectOne(namespace+".waglechk",map);
		
		if (map2!=null) {
			//가입된 상태
			li=true;
		}else {
			//가입안된 상태
			li=false;
		}
		return li;
	}
	
	// 관리자 - 와글목록 출력 관련 =============================================
	public List getWaglelist_ad (int startRow, int endRow) {
		sqlSession= sqlSession();
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List li = sqlSession.selectList(namespace + ".getWaglelist_ad",map);
		sqlSession.close();
		return li;
	}
	
	public List getWaglelist_adWNAME (int startRow, int endRow, String wname) {
		sqlSession= sqlSession();
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("wname", wname);
		List li = sqlSession.selectList(namespace + ".getWaglelist_adWNAME",map);
		sqlSession.close();
		return li;
	}
	
	public List getWaglelist_adWHOST (int startRow, int endRow, String whost) {
		sqlSession= sqlSession();
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("whost", whost);
		List li = sqlSession.selectList(namespace + ".getWaglelist_adWHOST",map);
		sqlSession.close();
		return li;
	}
	
	
	
	// 와글 전체 목록 갯수.
	public int getWagleCount_ad() {
		int num = 0;
		sqlSession=sqlSession();
		num = sqlSession.selectOne(namespace+".getWagleCount_ad");
		sqlSession.close();
		return num;
	}
	public int getWagleCount_adWNAME(String wname) {
		int num = 0;
		sqlSession=sqlSession();
		Map map = new HashMap();
		map.put("wname", wname);
		num = sqlSession.selectOne(namespace+".getWagleCount_adWNAME", map);
		sqlSession.close();
		return num;
	}
	public int getWagleCount_adWHOST(String whost) {
		int num = 0;
		sqlSession=sqlSession();
		Map map = new HashMap();
		map.put("whost", whost);
		num = sqlSession.selectOne(namespace+".getWagleCount_adWHOST", map);
		sqlSession.close();
		return num;
	}
	// =================================================================


   public List rscript () {
      sqlSession= sqlSession();
      List li = sqlSession.selectList(namespace + ".readRScript");
      sqlSession.close();
      return li;
   }
	   
   public String getWname1(int wboardid) {
       sqlSession = sqlSession();
      Map map = new HashMap();
      map.put("wboardid", wboardid);
      
      String wname = sqlSession.selectOne(namespace+".getWname1",map);
      sqlSession.close();
      return wname;
    }
   
   // 워드클라우드
   public List wordcloud() {
		sqlSession = sqlSession();
		List li = sqlSession.selectList(namespace+".wordcloud");
		sqlSession.close();
		return li;
   }

	
	
	
}
