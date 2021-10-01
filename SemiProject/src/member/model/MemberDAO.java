package member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;

public class MemberDAO implements InterMemberDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
	
	public MemberDAO() {
		
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semioracle");
		    
			aes = new AES256(SecretMyKey.KEY); // AES256 암호화 객체 생성
				    
		} catch(NamingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private void close() {
		
	      try {
	         if(rs != null)    {rs.close();    rs=null;}
	         if(pstmt != null) {pstmt.close(); pstmt=null;}
	         if(conn != null)  {conn.close();  conn=null;}
	      } catch(SQLException e) {
	         e.printStackTrace();
	      }
	   }

	public boolean idDuplicateCheck(String userid) throws SQLException {
		
		boolean isExist = false;
		try {
			conn = ds.getConnection();
			String sql = "select userid"
					+ " from tbl_member"
					+ " where userid = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			isExist = rs.next();
			
		} finally {
			close();
		}
		
		return isExist;
	}

	@Override
	public int registerMember(MemberVO member) throws SQLException {
		
		int n = 0;
		try {
			conn = ds.getConnection();
			String sql = "insert into tbl_member(userid, pwd, name, email, mobile, gender, birthday) "     
	                  + "values(?, ?, ?, ?, ?, ?, ?)"; 
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUserid());
			pstmt.setString(2, Sha256.encrypt(member.getPwd())); // 암호를 SHA256 알고리즘으로 단방향 암호화 시킨다. 
			pstmt.setString(3, member.getName());
			pstmt.setString(4, aes.encrypt(member.getEmail()));
			pstmt.setString(5, aes.encrypt(member.getMobile()));
	
			pstmt.setString(6, member.getGender());
			pstmt.setString(7, member.getBirthday());
			
			n = pstmt.executeUpdate();
			
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		} finally {
			close();
		}	
		return n;
	}

	@Override
	public boolean emailDuplicateCheck(String email) throws SQLException {
		
		boolean isExist = false;
		try {
			conn = ds.getConnection();
			String sql = "select email"
					+ " from tbl_member"
					+ " where email = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aes.encrypt(email));
			rs = pstmt.executeQuery();
			
			isExist = rs.next();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return isExist;
	}

	@Override
	public MemberVO selectOneMember(Map<String, String> paraMap) throws SQLException {
		
		MemberVO member = null;
		try {
			conn = ds.getConnection();
			String sql = "SELECT userid, name, email, mobile, gender"+
					", birthyyyy, birthmm, birthdd, point, registerday, pwdchangegap"+
					", NVL(lastlogingap, trunc(months_between(sysdate, registerday)) ) AS lastlogingap, grade "+
					"FROM "+
					"("+
					"select userid, name, email, mobile, gender"+
					", substr(birthday,1,4) AS birthyyyy, substr(birthday,6,2) AS birthmm, substr(birthday,9) AS birthdd"+
					", point, to_char(registerday, 'yyyy-mm-dd') AS registerday"+
					", trunc( months_between(sysdate, lastpwdchangedate) ) AS pwdchangegap, grade "+
					"from tbl_member "+
					"where status = 1 and userid = ? and pwd = ?"+
					") M "+
					"CROSS JOIN "+
					"("+
					"select trunc( months_between(sysdate, max(logindate) ) ) AS lastlogingap "+
					"from tbl_loginhistory "+
					"where fk_userid = ?"+
					") H";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, Sha256.encrypt(paraMap.get("pwd")));
			pstmt.setString(3, paraMap.get("userid"));
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberVO();
				
				member.setUserid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setEmail(aes.decrypt(rs.getString(3)));
				member.setMobile( aes.decrypt(rs.getString(4)) ); // 복호화 
	            member.setGender(rs.getString(5));
	            
	            member.setBirthday(rs.getString(6) + rs.getString(7) + rs.getString(8));
	            member.setPoint(rs.getInt(9));
	            member.setRegisterday(rs.getString(10));
	            member.setGrade(rs.getInt(13));
	            
	            if(rs.getInt(11) >= 3) {
	            	// 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지났으면 true
	                // 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지나지 않았으면 false
	            	member.setRequirePwdChange(true); // 로그인시 암호를 변경해라는 alert 를 띄우도록 할때 사용한다.
	            } else {
	            	member.setRequirePwdChange(false);
	            }
	            
	            if(rs.getInt(12) >= 12) {
	            	// 마지막으로 로그인 한 날짜시간이 현재시각으로 부터 1년이 지났으면 휴면으로 지정
	            	member.setIdle(1);
	            	
	            	sql = "update tbl_member set idle = 1 "
	            		+ "where userid = ? ";
	            	
	            	pstmt = conn.prepareStatement(sql);
	            	pstmt.setString(1, paraMap.get("userid"));
	            	
	            	pstmt.executeUpdate();
	            }
	            // === tbl_loginhistory(로그인기록) 테이블에 insert 하기 === //
	            if(member.getIdle() != 1) {
	            	
	            	sql = "insert into tbl_loginhistory(fk_userid, clientip) "
	            		+ "values(?, ?) ";
	            	pstmt = conn.prepareStatement(sql);
	            	pstmt.setString(1, paraMap.get("userid"));
	            	pstmt.setString(2, paraMap.get("clientip"));
	            	
	            	pstmt.executeUpdate();
	            }
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return member;
	}

	@Override
	public List<MemberVO> getMemberList() throws SQLException {
		
		List<MemberVO> memberList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			String sql = "select userid, name, email, mobile, gender, birthday, point"
					+ " from tbl_member"
					+ " where grade = 0 ";
			
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MemberVO member = new MemberVO();
				member.setUserid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setEmail(aes.decrypt(rs.getString(3)) );
				member.setMobile(aes.decrypt(rs.getString(4)) );
				member.setGender(rs.getString(5));
				member.setBirthday(rs.getString(6));
				member.setPoint(rs.getInt(7));
				
				memberList.add(member);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return memberList;
	}

	@Override
	public int updateMember(MemberVO member) throws SQLException {
		
		int n = 0;
		try {
			conn = ds.getConnection();
			String sql = "update tbl_member set pwd = ?, email = ?, mobile = ?, lastpwdchangedate = sysdate "
						+ "where userid = ?";
			
			pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, Sha256.encrypt(member.getPwd()) );
	        pstmt.setString(2, aes.encrypt(member.getEmail()) );
	        pstmt.setString(3, aes.encrypt(member.getMobile()) );
	        pstmt.setString(4, member.getUserid() );
			
			n = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	

}
