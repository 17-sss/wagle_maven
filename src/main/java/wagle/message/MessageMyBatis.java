package wagle.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.MybatisConnector;


public class MessageMyBatis extends  MybatisConnector {
	private final String namespace = "message.mybatis";
	
private static MessageMyBatis instance = new MessageMyBatis();
	
	public MessageMyBatis() {
		
	}
	
	public static MessageMyBatis getInstance() {
		return instance;
	}
	SqlSession sqlSession;
	
	public void insertArticle(MessageDataBean article) {
		sqlSession = sqlSession();
		System.out.println("**************************************************");
		int number = sqlSession.selectOne(namespace+".getNextNumber",article);
		System.out.println("======"+number);
		article.setNum(number);
		System.out.println(article);
		sqlSession.insert(namespace+".sendMessage",article);
		
		number = sqlSession.selectOne(namespace+".getNextNumber",article);
		article.setNum(number);
		sqlSession.insert(namespace+".sendMessage2",article);
		sqlSession.commit();
		sqlSession.close();
	}
	public List listArticle(String name,int startRow,int endRow,String my) {
	    sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("name", name);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List li=null;
		if(my=="se") {
			li = sqlSession.selectList(namespace+".messagelist3",map);
		}else if(my=="my") {
			li = sqlSession.selectList(namespace+".messagelist2",map);
		}
		else {
			li = sqlSession.selectList(namespace+".messagelist",map);	
		}
		sqlSession.commit();
		sqlSession.close();
		return li;
	}
	public int deleteArticle(int numint)  throws Exception{
		sqlSession = sqlSession();
		int x = -1;
		
		Map map = new HashMap();
		map.put("numint", numint);
		x = sqlSession.delete(namespace+".deleteArticle",map);
		
		sqlSession.commit();
		sqlSession.close();
		return x;
		
	}
	public MessageDataBean updateConfirm(int num) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("num", num);
		
		sqlSession.update(namespace+".updateConfirm",map);
		
		MessageDataBean article = sqlSession.selectOne(namespace+".getArticle",map);
		sqlSession.commit();
		sqlSession.close();	
		
		return article;
		
	}
	public int count(String name) {
		int x = -1;
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("name", name);
		
		x = sqlSession.selectOne(namespace+".count",map);
		System.out.println(x);
		sqlSession.commit();
		sqlSession.close();	
		
		return x;
	}
	public List orderby(String name,int startRow,int endRow,String my) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("name", name);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List li=null;
		if(my=="se") {
			li = sqlSession.selectList(namespace+".orderby3",map);
		}else if(my=="my") {
			li = sqlSession.selectList(namespace+".orderby2",map);
		}
		else {
			li = sqlSession.selectList(namespace+".orderby1",map);	
		}
		
		sqlSession.commit();
		sqlSession.close();
		return li;
	}
}
