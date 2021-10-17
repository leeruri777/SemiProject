package order.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		// ++++++++++++++++++++ 커넥션 풀 가져오기 ++++++++++++++++++++ //
		try {
			
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semioracle");
		 /*   
		    if(ds == null) 
		    	System.out.println("아이구 null이네~~~~");
		    else
		    	System.out.println("휴 null이 아니네~~~~");
		 */
		    
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
	
	// 장바구니 테이블  insert
	   @Override
	   public int insertBasket(Map<String, Object> paraMap) throws SQLException {
	      
	      int result = 0;
	      
	      try {
	         
	         conn = ds.getConnection();
	                  
	         String[] arrProd_code = (String[]) paraMap.get("arrProd_code");
	         String[] goods_qyAmount = (String[]) paraMap.get("goods_qyAmount");
	         String userid = (String) paraMap.get("userid");
	         
	         for(int i=0; i<arrProd_code.length; i++) {            

	            String sql = " insert into tbl_basket(BASKET_NO, FK_USER_ID, FK_PROD_CODE, GOODS_QY) " + 
	                      " values(BASKET_NO.nextval, ?, ?, ?) ";
	            
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setString(1, userid);
	            pstmt.setString(2, arrProd_code[i]);
	            pstmt.setString(3, goods_qyAmount[i]);
	            
	            result = pstmt.executeUpdate();            
	            
	         }
	         
	      } catch (Exception e){
	    	  e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return result;
	      
	   }

	@Override
	public List<Map<String, Object>> getBasketList(String userid) throws SQLException {
		
		List<Map<String, Object>> basketList = new ArrayList<>();
	      
	      try {
	    	  
	    	  conn = ds.getConnection();
	    	  
	    	  String sql = "select b.basket_no, v.prod_img_url, v.prod_exp, v.prod_price, v.discount_price, b.goods_qy, v.prod_stock, v.prod_code "
	    		  	  	+ "from view_prodonedetail v, tbl_basket b "
	    	  			+ "where b.fk_user_id=? and b.fk_prod_code = v.prod_code";	                
	    	 
	    	  pstmt = conn.prepareStatement(sql);
	            
	          pstmt.setString(1, userid);
	    	  rs = pstmt.executeQuery();
	          
	    	  while(rs.next()) {
	        	Map<String, Object> basket = new HashMap<>();	        	
	            basket.put("basket_no", rs.getInt(1));
	            basket.put("prod_img_url", rs.getString(2));
	            basket.put("prod_exp", rs.getString(3));	            
	            basket.put("prod_price", rs.getInt(4));
	            basket.put("discount_price", rs.getInt(5));
	            basket.put("goods_qy", rs.getInt(6));
	            basket.put("prod_stock", rs.getInt(7));
	            basket.put("prod_code", rs.getString(8));
	            
	            basketList.add(basket);
	         }
	         
	      } catch (Exception e){
	    	  e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return basketList;
	}

	// 재고 가져오기
	@Override
	public int getProdStock(String prod_code) throws SQLException {
	
		int prod_stock = 0;
	      
	      try {
	         
 	          conn = ds.getConnection();
	            
              String sql = "SELECT prod_stock " 
                        + "FROM view_prodonedetail WHERE prod_code = ? ";
             
              pstmt = conn.prepareStatement(sql);
             
              pstmt.setString(1, prod_code);
       
            
              rs = pstmt.executeQuery();            
	          while(rs.next()) {
	         	 prod_stock = rs.getInt(1);
	          }
	        
	         
	         
	       } catch (Exception e){
		    	  e.printStackTrace();
		   } finally {
	          close();
	       }
	      
	       return prod_stock;
	}

	@Override
	public int deleteBasket(int basket_no) throws SQLException {
		
		int result = 0;
	      
	      try {
	         
	         conn = ds.getConnection();
	                  
	              
            String sql = "DELETE FROM tbl_basket " 
                       + "WHERE basket_no = ? ";
           
            pstmt = conn.prepareStatement(sql);         
            pstmt.setInt(1, basket_no);
      
         
            result = pstmt.executeUpdate();            
	                 
	      } catch (Exception e){
	    	  e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return result;
	}

	@Override
	public int updateBasket(Map<String, Object> paraMap) throws SQLException {
		
		int result = 0;
	      
	      try {
	         
	         conn = ds.getConnection();
	                  
	         String[] basket_no_arr = (String[]) paraMap.get("basket_no_arr");
	         String[] goods_qy_arr = (String[]) paraMap.get("goods_qy_arr");
	         String userid = (String) paraMap.get("userid");
	         
	         for(int i=0; i<basket_no_arr.length; i++) {            

	            String sql = "UPDATE tbl_basket SET GOODS_QY = ? " 
	            		   + "WHERE BASKET_NO = ? and FK_USER_ID = ? ";
	                      	            
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setInt(1, Integer.parseInt(goods_qy_arr[i]));
	            pstmt.setInt(2, Integer.parseInt(basket_no_arr[i]));	            
	            pstmt.setString(3, userid);
	            
	            result = result + pstmt.executeUpdate();            
	            
	         }
	         
	      } catch (Exception e){
	    	  e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return result;
	}

	@Override
	public List<Map<String, Object>> getBasketByBno(String[] basket_no_arr, String userid) throws SQLException {
		
		List<Map<String, Object>> basketList = new ArrayList<>();
	      
	      try {
	    	  
	    	  conn = ds.getConnection();
	    	  
	    	  for(int i=0; i<basket_no_arr.length; i++) {
	    		  
	    		  String sql = "select b.basket_no, v.prod_img_url, v.prod_exp, v.prod_price, v.discount_price, b.goods_qy, v.prod_stock, v.prod_code "
		    		  	     + "from view_prodonedetail v, tbl_basket b "
		    	  			 + "where b.basket_no = ? and b.fk_user_id = ? and b.fk_prod_code = v.prod_code";	               
		    	 
		    	  pstmt = conn.prepareStatement(sql);
		            
		          pstmt.setInt(1, Integer.parseInt(basket_no_arr[i]));
		          pstmt.setString(2, userid);
		    	  rs = pstmt.executeQuery();
		          
		    	  while(rs.next()) {
		        	Map<String, Object> basket = new HashMap<>();	        	
		            basket.put("basket_no", rs.getInt(1));
		            basket.put("prod_img_url", rs.getString(2));
		            basket.put("prod_exp", rs.getString(3));	            
		            basket.put("prod_price", rs.getInt(4));
		            basket.put("discount_price", rs.getInt(5));
		            basket.put("goods_qy", rs.getInt(6));
		            basket.put("prod_stock", rs.getInt(7));
		            basket.put("prod_code", rs.getString(8));
		            
		            basketList.add(basket);
		         }
		    	  
	    	  }
	    	           
	      } catch (Exception e){
	    	  e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return basketList;
	}

	@Override
	public List<Map<String, Object>> getProdInfoByPno(String[] arrProd_code, String[] goods_qyAmount) throws SQLException {
		
		List<Map<String, Object>> prodList = new ArrayList<>();
	      
	      try {
	    	  
	    	  conn = ds.getConnection();
	    	  
	    	  for(int i=0; i<arrProd_code.length; i++) {
	    		  
	    		  String sql = "select prod_img_url, prod_exp, prod_price, discount_price, prod_stock "
	    		  			 + "from view_prodonedetail "
	    		  			 + "where prod_code = ? ";             
		    	 
		    	  pstmt = conn.prepareStatement(sql);
		            
		          pstmt.setString(1, arrProd_code[i]);
		    	  rs = pstmt.executeQuery();
		          
		    	  while(rs.next()) {
		    		  
		        	Map<String, Object> product = new HashMap<>();	        	
		            product.put("prod_img_url", rs.getString(1));
		            product.put("prod_exp", rs.getString(2));	            
		            product.put("prod_price", rs.getInt(3));
		            product.put("discount_price", rs.getInt(4));
		            product.put("prod_stock", rs.getInt(5));
		            product.put("goods_qy", Integer.parseInt(goods_qyAmount[i]));
		            
		            prodList.add(product);
		         }
		    	  
	    	  }
	    	           
	      } catch (Exception e){
	    	  e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return prodList;
	}

	@Override
	public int updateBasketByProdCode(Map<String, Object> paraMap) throws SQLException {
		
		  int result = 0;
	      
	      try {
	         
	         conn = ds.getConnection();
	                  
	         String[] prod_code_arr = (String[]) paraMap.get("prod_code_arr");
	         String[] goods_qy_arr = (String[]) paraMap.get("goods_qy_arr");
	         String userid = (String) paraMap.get("userid");
	         
	         for(int i=0; i<prod_code_arr.length; i++) {            

	            String sql = "UPDATE tbl_basket SET GOODS_QY = GOODS_QY + ? " 
	            		   + "WHERE FK_PROD_CODE = ? and FK_USER_ID = ? ";
	                      	            
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setInt(1, Integer.parseInt(goods_qy_arr[i]));
	            pstmt.setString(2, prod_code_arr[i]);	            
	            pstmt.setString(3, userid);
	            
	            result = result + pstmt.executeUpdate();            
	            
	         }
	         
	      } catch (Exception e){
	    	  e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return result;
	      
	}

}
