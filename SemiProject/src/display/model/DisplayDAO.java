package display.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.model.MemberVO;
import util.security.AES256;
import util.security.SecretMyKey;

public class DisplayDAO implements InterDisplayDAO {

	
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
		
	public DisplayDAO() {
		
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semioracle");
				    
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

	
	@Override
	public List<MainLogoVO> getLogoList() throws SQLException {
		
		List<MainLogoVO> logoList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			String sql = "SELECT lno, name, filename, status "
					+ "FROM tbl_main_logo ";
								
			pstmt = conn.prepareStatement(sql);
										
			rs = pstmt.executeQuery();
					
			while(rs.next()) {
				MainLogoVO logoVo = new MainLogoVO();
				logoVo.setLno(rs.getInt(1));
				logoVo.setName(rs.getString(2));
				logoVo.setFilename(rs.getString(3));
				logoVo.setStatus(rs.getString(4));
				logoList.add(logoVo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return logoList;
	}

}
