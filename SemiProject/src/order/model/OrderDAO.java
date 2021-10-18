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

import util.paging.Pagination;

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
	    	  
	    	  String sql = "select b.basket_no, v.prod_img_url, v.prod_exp, v.prod_price, v.discount_price, b.goods_qy, v.prod_stock, v.prod_code, v.prod_name "
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
	            basket.put("prod_name", rs.getString(9));
	            
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
	    		  
	    		  String sql = "select b.basket_no, v.prod_img_url, v.prod_exp, v.prod_price, v.discount_price, b.goods_qy, v.prod_stock, v.prod_name "
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
		            basket.put("prod_name", rs.getString(8));
		            
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
	    		  
	    		  String sql = "select prod_img_url, prod_exp, prod_price, discount_price, prod_stock, prod_name "
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
		            product.put("prod_name", rs.getString(6));
		            
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
		}

		@Override
		public List<Map<String, Object>> getOrderSetleList(Pagination pg) throws SQLException {
			
			List<Map<String, Object>> orderSetleList = new ArrayList<>();
			
			String userid = pg.getUserid();
		    String status = pg.getSearchType();
		    String fromDate = pg.getFromDate();
		    String toDate = pg.getToDate();
						
			try {
				conn = ds.getConnection();
				String sql = "select order_dt, PROD_IMG_URL, PROD_EXP, GOODS_QY, TOT_AMOUNT, status, prod_code "
						   + "from "
						   + "    ( "
						   + "    select rownum as RNUM, t.* "
						   + "    from "
					   	   + "        ( "
						   + "        select o.order_dt, v.PROD_IMG_URL, v.PROD_EXP, o.GOODS_QY, o.TOT_AMOUNT, o.status, v.prod_code "
						   + "        from ORDER_SETLE o, VIEW_PRODONEDETAIL v "
						   + "        where o.fk_user_id = ? "
						   + "        and o.fk_prod_code = v.prod_code ";
				if(status != null) {
					   sql += "and status = ? ";
				}
				if(fromDate != null && toDate != null) {
			    	   sql += "and o.order_dt between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD') ";
			    }	   
					   sql += "        order by order_dt desc "
						   + "        ) t "
						   + "    where rownum <= ? "
						   + "    ) "
						   + "where ? <= RNUM";
				
				pstmt = conn.prepareStatement(sql);
				
		
				int currPageNo = pg.getCurrPageNo();
				int sizePerPage = pg.getSizePerPage();
							
				pstmt.setString(1, userid);
				// 검색타입이 존재하는 경우
				if(status != null) {
					pstmt.setString(2, status);
					// 검색 기한이 존재하는 경우
					if(fromDate != null && toDate != null) {
						pstmt.setString(3, fromDate);
						pstmt.setString(4, toDate);
						pstmt.setInt(5, currPageNo * sizePerPage );
						pstmt.setInt(6, pg.getStartList() );
				    } else {
				    	pstmt.setInt(3, currPageNo * sizePerPage );
						pstmt.setInt(4, pg.getStartList() );
				    }
				} else { // 검색타입이 없는 경우
					// 검색타입은 없지만 검색기간은 있는 경우
					if(fromDate != null && toDate != null) {
						pstmt.setString(2, fromDate);
						pstmt.setString(3, toDate);
						pstmt.setInt(4, currPageNo * sizePerPage );
						pstmt.setInt(5, pg.getStartList() );
				    } else {
				    	pstmt.setInt(2, currPageNo * sizePerPage );
						pstmt.setInt(3, pg.getStartList() );
				    }
				}
		
							
				rs = pstmt.executeQuery();					
				while(rs.next()) {
					Map<String, Object> order = new HashMap<>();
					order.put("order_dt", rs.getDate(1));
					order.put("prod_img_url", rs.getString(2));
					order.put("prod_exp", rs.getString(3));
					order.put("goods_qy", rs.getInt(4));
					order.put("tot_amount", rs.getInt(5));
					order.put("status", rs.getString(6));
					order.put("prod_code", rs.getString(7));
					
					orderSetleList.add(order);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return orderSetleList;
		}

		@Override
		public int getOrderSetleListCount(Pagination pg) throws SQLException {
			
			int result = 0;
		    String userid = pg.getUserid();
		    String status = pg.getSearchType();
		    String fromDate = pg.getFromDate();
		    String toDate = pg.getToDate();
			
			try {
				conn = ds.getConnection();
				String sql = "select count(*)  "
						   + "from ORDER_SETLE o, VIEW_PRODONEDETAIL v "
						   + "where o.fk_user_id = ? ";
				if(status != null) {
					   sql += "and status = ? ";
				}					  
					   sql += "and o.fk_prod_code = v.prod_code ";
					   
			    if(fromDate != null && toDate != null) {
			    	   sql += "and o.order_dt between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD') ";
			    }
						   
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, userid);
				
				// 검색타입이 존재하는 경우
				if(status != null) {
					pstmt.setString(2, status);
					// 검색 기한이 존재하는 경우
					if(fromDate != null && toDate != null) {
						pstmt.setString(3, fromDate);
						pstmt.setString(4, toDate);
				    } 
				} else { // 검색타입이 없는 경우
					// 검색타입은 없지만 검색기간은 있는 경우
					if(fromDate != null && toDate != null) {
						pstmt.setString(2, fromDate);
						pstmt.setString(3, toDate);
				    }
				}
									
				rs = pstmt.executeQuery();
				rs.next();
				result = rs.getInt(1);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return result;
		}

}
