package wagle.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.MybatisConnector;



public class ReviewMyBatis extends MybatisConnector {
	private final String namespace = "review.mybatis";
	
	private static ReviewMyBatis instance = new ReviewMyBatis();
	
	public ReviewMyBatis() {
		
	}
	
	public static ReviewMyBatis getInstance() {
		return instance;
	}
	SqlSession sqlSession;
	
	public void insertArticle(BoardDataBean article) {		
		sqlSession = sqlSession();
		int number = sqlSession.selectOne(namespace+".getNextNumber",article);
		article.setNum(number);
		sqlSession.insert(namespace+".insertReview",article);
		sqlSession.commit();
		sqlSession.close();
		
	}
	public List getArticles(int startRow,int endRow,String boardid) {
		sqlSession = sqlSession();
		
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("boardid", boardid);
		
		List li = sqlSession.selectList(namespace+".getArticles",map);
		sqlSession.close();
		
		return li;
	}
	public int getArticleCount(String boardid) {
		int x=0;
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("boardid", boardid);
		x = sqlSession.selectOne(namespace+".getArticleCount",map);
		sqlSession.close();
		return x;
	}
	public int deleteArticle(int num) throws Exception {
		int x = -1;
		Map map = new HashMap();
		map.put("num", num);
		sqlSession = sqlSession();
		x = sqlSession.delete(namespace+".deleteArticle",map);
		sqlSession.commit();
		sqlSession.close();
		return x;
	}
	public int updateArticle(BoardDataBean article) throws Exception {
		sqlSession = sqlSession();
		int chk = sqlSession.update(namespace+".updateArticle",article);
		sqlSession.commit();
		sqlSession.close();
		return chk;
	}
}
