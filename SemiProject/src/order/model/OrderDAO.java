package order.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrderDAO implements InterOrderDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 기본 생성자
	public OrderDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semioracle");
		
		    
		} catch (NamingException e) {
			e.printStackTrace();
		} 
		
	}
	
	//////////////////////////////////////////////////////////////////////////////////////
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기 
	private void close() {
		try {
			
			if(rs != null)    {rs.close();    rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(conn != null)  {conn.close();  conn=null;}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

	

	//////////////////////////////////////////////////////////////////////////////////////
	
	
	//주문목록 테이블에 insert하는 메소드
	@Override
	public int insertOrderSetle(OrderSetleVO ovo) throws SQLException {
		int n = 0;
		
		try {
	         conn = ds.getConnection();
	         
	         String sql = " insert into order_setle(order_no, fk_user_id , user_name " + 
	         			  "                       , fk_prod_code, prod_name, prod_price  " + 
	         			  "                       , goods_qy, dscnt_amount , tot_amount " + 
	         			  "                       , order_dt, user_req, payment_type) " +  
	                      " values(order_no.nextval,?,?,?,?,?,?,?,?,default,?,?)";
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, ovo.getFk_user_id()); 
	         pstmt.setString(2, ovo.getUser_name());
	         pstmt.setString(3, ovo.getFk_prod_code());
	         pstmt.setString(4, ovo.getProd_name());
	         pstmt.setInt(5, ovo.getProd_price());
	         pstmt.setInt(6, ovo.getGoods_qy());
	         pstmt.setInt(7, ovo.getDscnt_amount());
	         pstmt.setInt(8, ovo.getTot_amount());
	         pstmt.setString(9, ovo.getOrder_dt());
	         pstmt.setString(10, ovo.getUser_req());
	         pstmt.setString(11, ovo.getPayment_type());
	         
	         n = pstmt.executeUpdate();
	         
	      } finally {
	         close();
	      }
	      
		
		return n;
	}// end of public int insertOrderSetle(OrderSetleVO ovo)----------------------

	
	
	
	
	
	
	
	
	
	
	

}
