package wagle.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.MybatisConnector;

public class MemberDBMybatis extends MybatisConnector{

	//mybatis namespace
		private final String namespace = "ldg.mybatis";	
		
		//Singleton : getInstance
			private static MemberDBMybatis instance = new MemberDBMybatis();
			public static MemberDBMybatis getInstance() {
				return instance;
			}
			private MemberDBMybatis() {	
			}
		//SqlSession	
			SqlSession sqlSession;
				
	    public int login(String email, String pwd) {
				      sqlSession = sqlSession();
				      Map<String,String> map = new HashMap<String,String>();
				      map.put("email", email);
				      map.put("pwd", pwd);
				      int chk=0;
				      
				      Map<String,String> map2=sqlSession.selectOne(namespace+".login", map);
				      
				      if (map2!=null && map2.containsValue(pwd)) {
				         chk=1;
				         sqlSession.close();
				         return chk;
				      }

				      if (map2!=null) {
				         chk=0;
				         sqlSession.close();
				         return chk;
				      }else {
				         chk=-1;
				         sqlSession.close();
				         return chk;
				      }
				   
				   }
		
	    //login때 name받아오는 메서드
	    public MemberDataBean getUser2(String email, int chk) { 
			sqlSession= sqlSession();
			Map map = new HashMap();
			map.put("email", email);
			
			MemberDataBean user = sqlSession.selectOne(namespace+".getUser2", map);
			
			sqlSession.commit();
			sqlSession.close();
			
			return user;
		}
	    
	    public int getUser3(String email, String pwdQ, String pwdA) { 
			int chk = 0;
	    	sqlSession= sqlSession();
			Map map = new HashMap();
			map.put("email", email);
			map.put("pwdQ", pwdQ);
			map.put("pwdA", pwdA);
			
			Map map2 = sqlSession.selectOne(namespace+".getUser3", map);
			
			if (map2 != null) {
				chk = 1;
			} else {
				chk = 0;
			}
			
			sqlSession.commit();
			sqlSession.close();
			
			return chk;
		}
	    
	    	//insert
	    public void insertMember(MemberDataBean member) {
			sqlSession = sqlSession();
			int number = sqlSession.selectOne(namespace + ".getNextNum" ,member);
			member.setNum(number);
			
			sqlSession.insert(namespace+".insertMember", member);
			sqlSession.commit();
			sqlSession.close();
		}
	    
			//아이디(우리는 이메일) 중복체크
			public boolean confirmId(String email) {
				sqlSession = sqlSession();
				boolean result = false;
				
				Map map = new HashMap();
				map.put("email", email);
				Map map2 = sqlSession.selectOne(namespace+".confirmId", map);
				
				if(map2!=null) {
					result=true;
				}
				sqlSession.close();
				return result;
			}
		    
			
			//update - getUser(chk "update")
			public MemberDataBean getUser(String email, String chk) { 
				sqlSession= sqlSession();
				Map map = new HashMap();
				map.put("email", email);
				
				MemberDataBean user = sqlSession.selectOne(namespace+".getUser", map);
				
				sqlSession.commit();
				sqlSession.close();
				
				return user;
			}	
			
			
			//update method
			public int updateMember(MemberDataBean member) {
				
				sqlSession = sqlSession();
				int chk = sqlSession.update(namespace+".updateMember", member);
				sqlSession.commit(); 
				sqlSession.close();
				
				return chk;

			}
			
			//delete
			public int deleteMember(String email, String pwd, String admin)throws Exception{
				
				sqlSession = sqlSession();
				Map map = new HashMap();
				map.put("email", email);
				map.put("pwd", pwd);
				map.put("admin", admin);
			
				int x = -1;
				
				if(admin.equals("admin")) {
					x = sqlSession.delete(namespace+".deleteMember2", map);	
					System.out.println("deletePro: 어드민입니다."); //확인완료 동작.
				}
				else {
					x = sqlSession.delete(namespace+".deleteMember", map);
					System.out.println("deletePro: 회원입니다.");
				}
				sqlSession.commit(); 
				sqlSession.close();
				return x;
			}
			
			// 회원 수 메소드
			public int getMemberCount() {
				int x = 0;
				sqlSession=sqlSession();
				x = sqlSession.selectOne(namespace+".getMemberCount");
				sqlSession.close();
				return x;
			}
			
			public int getMemberCountEmail(String email) {
				int x = 0;
				sqlSession=sqlSession();
				Map map = new HashMap();
				map.put("email", email);
				x = sqlSession.selectOne(namespace+".getMemberCountEmail", map);
				sqlSession.close();
				return x;
			}
			
			public int getMemberCountName(String name) {
				int x = 0;
				sqlSession=sqlSession();
				Map map = new HashMap();
				map.put("name", name);
				x = sqlSession.selectOne(namespace+".getMemberCountName", map);
				sqlSession.close();
				return x;
			}
			
			
						
			// 회원리스트 목록출력 메소드?
			public List getMembers(int startRow, int endRow) {
				sqlSession= sqlSession();
				Map map = new HashMap();
				map.put("startRow", startRow);
				map.put("endRow", endRow);
				List li = sqlSession.selectList(namespace + ".getMembers",map);
				sqlSession.close();
				return li;
			}
			
			public List getMembersEmail(int startRow, int endRow, String email) {
				sqlSession= sqlSession();
				Map map = new HashMap();
				map.put("startRow", startRow);
				map.put("endRow", endRow);
				map.put("email", email);
				List li = sqlSession.selectList(namespace + ".getMembersEmail",map);
				sqlSession.close();
				return li;
			}
			
			public List getMembersName(int startRow, int endRow, String name) {
				sqlSession= sqlSession();
				Map map = new HashMap();
				map.put("startRow", startRow);
				map.put("endRow", endRow);
				map.put("name", name);
				List li = sqlSession.selectList(namespace + ".getMembersName",map);
				sqlSession.close();
				return li;
			}
			
			public int getMemberCountEN(String email, String name) {
	            int x = 0;
	            sqlSession=sqlSession();
	            Map map = new HashMap();
	            map.put("email", email);
	            map.put("name", name);
	            x = sqlSession.selectOne(namespace+".getMemberCountEN", map);
	            sqlSession.close();
	            return x;
	         }

	public List getMembersEN(int startRow, int endRow, String email, String name) {
	            sqlSession= sqlSession();
	            Map map = new HashMap();
	            map.put("startRow", startRow);
	            map.put("endRow", endRow);
	            map.put("email", email);
	            map.put("name", name);
	            List li = sqlSession.selectList(namespace + ".getMembersEN",map);
	            sqlSession.close();
	            return li;
	         }


			
}
