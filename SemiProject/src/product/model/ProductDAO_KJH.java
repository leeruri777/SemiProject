package product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductDAO_KJH implements InterProductDAO_KJH {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 기본 생성자
	public ProductDAO_KJH() {
		
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

	//////////////////////////////////////////////////////////////////////////////////////
	
	// 존재하는 카테고리를 모두 받아오는 메소드
	@Override
	public List<SortVO> AllSort() throws SQLException {
		
		List<SortVO> sortList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select sort_code, sort_name from tbl_sort order by sort_code ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				SortVO sort = new SortVO();
				
				sort.setSort_code(rs.getInt(1));
				sort.setSort_name(rs.getString(2));
				
				sortList.add(sort);
				
			}// end of while------------------------------------------------
			
		} finally {
			close();
		}
		
		return sortList;
	
	}// end of public HashMap<String, SortVO> AllCategory()-------------------------------

	//////////////////////////////////////////////////////////////////////////////////////
	
	// 존재하는 모든 상품을 받아오는 메소드
	@Override
	public List<ProductVO> AllProduct() throws SQLException {
		
		List<ProductVO> prodList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select fk_prod_code, prod_name from tbl_prod_info order by fk_prod_code ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductVO prod = new ProductVO();
				
				prod.setProd_code(rs.getString(1));
				prod.setProd_name(rs.getString(2));
				
				prodList.add(prod);
				
			}// end of while------------------------------------------------
			
		} finally {
			close();
		}
		
		return prodList;
		
	}// end of public List<ProductVO> AllProduct()----------------------------------------

	//////////////////////////////////////////////////////////////////////////////////////
	
	// 상품등록하기
	@Override
	public int insertProd(Map<String, Object> paraMap) throws SQLException {
		
		int result = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = "";
			
			int sort_code = 0;
			
			// 신규 카테고리 일 경우 카테고리 테이블에 insert
			if(paraMap.get("sort_name") != null) {
				
				sql = " select seq_sort_code.nextval from dual ";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				sort_code = rs.getInt(1);
				
				sql = " insert into tbl_sort(sort_code, sort_name) "
					+ " values(?, ?) ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, sort_code);
				pstmt.setString(2, (String)paraMap.get("sort_name"));
				
				result = pstmt.executeUpdate();
				
			}
			
			// 상품 테이블에 insert
			sql = " select seq_prod_code.nextval from dual ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			int seq_prod_code = rs.getInt(1);
			
			ProductVO prod = (ProductVO)paraMap.get("prod");
			
			sql = " insert into tbl_prod(prod_code,fk_sort_code) values(?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			String prod_code = "";
			
			if(sort_code == 0) {
				sort_code = prod.getSort_code();
			}
			
			prod_code = sort_code + "-" + seq_prod_code;
			
			
			pstmt.setString(1, prod_code);
			pstmt.setInt(2, sort_code);
			
			result = pstmt.executeUpdate();
			
			// 상품상세테이블에 insert
			sql = " insert into tbl_prod_info(fk_prod_code,prod_name,prod_price,prod_ice,prod_plus,prod_select,prod_sale";
			
			String holder = "?,?,?,?,?,?,?";
			
			if(prod.getDiscount_price() != -9999) {
				sql += " ,discount_price ";
				holder += ",?";
			}
			
			if(prod.getProd_exp() != "") {
				sql += " ,prod_exp ";
				holder += ",?";
			}
			
			sql += " ) values(" + holder + ")";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, prod_code);
			pstmt.setString(2, prod.getProd_name());
			pstmt.setInt(3, prod.getProd_price());
			pstmt.setInt(4, prod.getProd_ice());
			pstmt.setInt(5, prod.getProd_plus());
			pstmt.setInt(6, prod.getProd_select());
			pstmt.setInt(7, prod.getProd_sale());
			
			boolean addFlag = false;
			
			if(prod.getDiscount_price() != -9999) {
				pstmt.setInt(8, prod.getDiscount_price());
				addFlag = true;
			}
			
			if(prod.getProd_exp() != "" && addFlag) {
				pstmt.setString(9, prod.getProd_exp());
			}
			
			else if(prod.getProd_exp() != "" && !addFlag) {
				pstmt.setString(8, prod.getProd_exp());
			}
			
			result = pstmt.executeUpdate();
			
			// 타이틀 이미지 테이블에 insert			
			for(String titleimg : (ArrayList<String>)paraMap.get("titleimglist")) {
				
				sql = " insert into tbl_prod_img(prod_img_code,fk_prod_code,prod_img_url) "
					+ " values (seq_prod_img_code.nextval,?,?) ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, prod_code);
				pstmt.setString(2, titleimg);
				
				result = pstmt.executeUpdate();
				
			}
			
			// 상세 이미지 테이블에 insert			
			for(String detailimg : (ArrayList<String>)paraMap.get("detailimglist")) {
				
				sql = " insert into tbl_prod_img_detail(prod_img_detail_code,fk_prod_code,prod_img_detail_url) "
					+ " values (seq_prod_img_detail_code.nextval,?,?) ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, prod_code);
				pstmt.setString(2, detailimg);
				
				result = pstmt.executeUpdate();
				
			}
			
			// 재고 테이블에 insert
			sql = " insert into tbl_stock(fk_prod_code, prod_stock) values (?,?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, prod_code);
			pstmt.setInt(2, prod.getProd_stock());
			
			result = pstmt.executeUpdate();
			
			// 추가상품이 있을 경우 추가상품 테이블에 insert
			if(paraMap.get("prod_plus_list") != null) {
				
				for(String prod_plus_code : (ArrayList<String>)paraMap.get("prod_plus_list")) {
					
					sql = " insert into tbl_prod_plus(plus_code,fk_prod_code,fk_prod_plus_code) "
						+ " values (seq_plus_code.nextval,?,?) ";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, prod_code);
					pstmt.setString(2, prod_plus_code);
					
					result = pstmt.executeUpdate();
					
				}
				
			}
			
			// 골라담기상품이 있을 경우 추가상품 테이블에 insert
			if(paraMap.get("prod_select_list") != null) {
				
				for(String prod_select_code : (ArrayList<String>)paraMap.get("prod_select_list")) {
					
					sql = " insert into tbl_prod_select(select_code,fk_prod_code,fk_prod_select_code) "
						+ " values (seq_select_code.nextval,?,?) ";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, prod_code);
					pstmt.setString(2, prod_select_code);
					
					result = pstmt.executeUpdate();
					
				}
				
			}
			
			
		} finally {
			close();
		}
		
		return result;
		
	}

	//////////////////////////////////////////////////////////////////////////////////////////
	
   // 상품 리스트
   @Override
   public List<HashMap<String, Object>> productList(String sort_code) throws SQLException {
      
      List<HashMap<String, Object>> productList = new ArrayList<>();
            
      try {
         
         conn = ds.getConnection();
         
         // System.out.println("제발점~");
         
          String sql = "select prod_code, prod_name, prod_exp, prod_price, prod_img_url "+
                "    from "+
                "    ( "+
                "        select prod_code, prod_name, prod_exp, prod_price "+
                "        from "+
                "        ( "+
                "            select prod_code "+
                "            from tbl_prod "+
                "            where fk_sort_code = ? "+
                "        ) M "+
                "        join tbl_prod_info I "+
                "        on M.prod_code = I.fk_prod_code "+
                "        where prod_sale != 0 "+
                "        order by fk_prod_code desc "+
                "    ) A "+
                "    join "+
                "    ( "+
                "    select distinct fk_prod_code, first_value(prod_img_url) over(partition by fk_prod_code order by prod_img_code) AS prod_img_url "+
                "    from tbl_prod_img "+
                "    ) G "+
                "    on A.prod_code = G.fk_prod_code ";
          
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, sort_code);
                
                rs = pstmt.executeQuery();
                
                while(rs.next()) {   
                   
                   HashMap<String, Object> prodmap = new HashMap<>();
                   ProductVO pvo = new ProductVO();
                   
                   pvo.setProd_code(rs.getString(1));
                   pvo.setProd_name(rs.getString(2));
                   pvo.setProd_exp(rs.getString(3));
                   pvo.setProd_price(rs.getInt(4));
                   
                   prodmap.put("pvo", pvo);
                   
                   ImageVO ivo = new ImageVO();
                   ivo.setProd_img_url(rs.getString(5));
                   
                   prodmap.put("ivo", ivo);
                   
                   productList.add(prodmap);
                   
                }
          
         
      } finally {
         close();
      }
      
      return productList;
   }// end of public List<HashMap<String, Object>> productList(String sort_code) throws SQLException {}------------------------------------------------------------
   
   //////////////////////////////////////////////////////////////////////////////////////////
   
   // 광고(배너) 이미지 (카테고리 메인화면 top_image)
   @Override
   public String adimg(String sort_code) throws SQLException {
      
      String adimg = "";
      
      try {
         
         conn = ds.getConnection();
         
         String sql = " select ad_img_url " + 
               " from tbl_prod_ad " +
               " where fk_sort_code = ? ";
         
         pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, sort_code);
          
          rs = pstmt.executeQuery();
          
          if(rs.next()) {
             adimg = rs.getString(1);
          }
         
      } finally {
         close();
      }
      
      return adimg;
   }

   //////////////////////////////////////////////////////////////////////////////////////////
   
   // 카테고리 이름(중간 카테고리 이름설정)
   @Override
   public String categoryName(String sort_code) throws SQLException {
      
      String categoryName = "";
      
      try {
         
         conn = ds.getConnection();
         
         String sql = " select sort_name " + 
               " from tbl_sort " + 
               " where sort_code = ? ";
         
         pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, sort_code);
          
          rs = pstmt.executeQuery();
          
          if(rs.next()) {
             categoryName = rs.getString(1);
          }
         
      } finally {
         close();
      }
      
      
      return categoryName;
   }

   /////////////////////////////////////////////////////////////////////////////////////////
   
   // 상품 상세페이지 내용 select
   @Override
   public Map<String, Object> getProdDetail(String prod_code) throws SQLException {
	   
	   Map<String, Object> prodMap = new HashMap<>();
	   
	   try {
		   
		   conn = ds.getConnection();
		   
		   // 상품 정보 가져오기(tbl_prod, tbl_prod_info, tbl_stock)
		   String sql = " select A.sort_code, A.prod_code, prod_name, prod_exp, prod_price, prod_ice, prod_plus, prod_select, discount_price, prod_stock, A.sort_name " + 
				   		" from " + 
				   		" ( " + 
				   		"     select P.sort_name, P.sort_code, P.prod_code, prod_name, prod_exp, prod_price, prod_ice, prod_plus, prod_select, nvl(discount_price,-9999) AS discount_price " + 
				   		"     from tbl_prod_info I " + 
				   		"         JOIN " + 
				   		"             ( " + 
				   		"                 select sort_name, fk_sort_code AS sort_code, prod_code " + 
				   		"                 from tbl_prod N JOIN tbl_sort M ON N.fk_sort_code = M.sort_code " + 
				   		"                 where prod_code = ? " + 
				   		"             ) P " + 
				   		"         ON P.prod_code = I.fk_prod_code " + 
				   		"     where prod_sale = 1 " + 
				   		" )A  JOIN tbl_stock S " + 
				   		"     ON A.prod_code = S.fk_prod_code ";
		   
		   pstmt = conn.prepareStatement(sql);
		   
		   pstmt.setString(1, prod_code);
		   
		   rs = pstmt.executeQuery();
		   
		   if(rs.next()) {
			   
			   ProductVO pvo = new ProductVO();
			   
			   pvo.setSort_code(rs.getInt(1));
			   pvo.setProd_code(rs.getString(2));
			   pvo.setProd_name(rs.getString(3));
			   pvo.setProd_exp(rs.getString(4));
			   pvo.setProd_price(rs.getInt(5));
			   pvo.setProd_ice(rs.getInt(6));
			   pvo.setProd_plus(rs.getInt(7));
			   pvo.setProd_select(rs.getInt(8));
			   pvo.setDiscount_price(rs.getInt(9));
			   pvo.setProd_stock(rs.getInt(10));
			   pvo.setSort_name(rs.getString(11));
			   
			   prodMap.put("pvo", pvo);
			   
			   // 타이틀 이미지 가져오기			   
			   sql = " select prod_img_url from tbl_prod_img where fk_prod_code = ? order by prod_img_code ";
			   
			   pstmt = conn.prepareStatement(sql);
			   
			   pstmt.setString(1, prod_code);
			   
			   rs = pstmt.executeQuery();
			   
			   List<String> titleImgList = new ArrayList<String>();
			   
			   while(rs.next()) {				   
				   titleImgList.add(rs.getString(1));				   
			   }
			   
			   prodMap.put("titleImgList", titleImgList);
			   
			   // 상세 이미지 가져오기			   
			   sql = " select prod_img_detail_url from tbl_prod_img_detail where fk_prod_code = ? order by prod_img_detail_code ";
			   
			   pstmt = conn.prepareStatement(sql);
			   
			   pstmt.setString(1, prod_code);
			   
			   rs = pstmt.executeQuery();
			   
			   List<String> detailImgList = new ArrayList<>();
			   
			   while(rs.next()) {				   
				   detailImgList.add(rs.getString(1));				   
			   }
			   
			   prodMap.put("detailImgList", detailImgList);
			   
			   // 추가구성상품이 있을 경우 추가구성상품 목록 가져오기
			   if(pvo.getProd_plus() == 1) {
				   
				   sql = " select I.fk_prod_code, prod_name, prod_price, discount_price, prod_stock, prod_img_url " + 
				   		 " from " + 
				   		 "     ( " + 
				   		 "         select A.fk_prod_code, prod_name, prod_price, nvl(discount_price,-9999) AS discount_price, prod_stock " + 
				   		 "         from tbl_prod_info A JOIN tbl_stock S ON A.fk_prod_code = S.fk_prod_code " + 
				   		 "         where A.fk_prod_code in ( " + 
				   		 "                                     select fk_prod_plus_code AS prod_plus_code " + 
				   		 "                                     from tbl_prod_plus " + 
				   		 "                                     where fk_prod_code = ? " + 
				   		 "                                  ) and prod_sale = 1 " + 
				   		 "      ) I " + 
				   		 " JOIN ( " + 
				   		 "        select distinct first_value(prod_img_url) over(partition by fk_prod_code order by prod_img_code) AS prod_img_url " + 
				   		 "             , fk_prod_code " + 
				   		 "        from tbl_prod_img " + 
				   		 "       ) T " + 
				   		 " ON I.fk_prod_code = T.fk_prod_code order by 1 ";
				   
				   pstmt = conn.prepareStatement(sql);
				   
				   pstmt.setString(1, prod_code);
				   
				   rs = pstmt.executeQuery();
				   
				   List<ProductVO_KJH> plusList = new ArrayList<>();
				   
				   while(rs.next()) {
					   
					   ProductVO_KJH plusvo = new ProductVO_KJH();
					   
					   plusvo.setProd_code(rs.getString(1));
					   plusvo.setProd_name(rs.getString(2));
					   plusvo.setProd_price(rs.getInt(3));
					   plusvo.setDiscount_price(rs.getInt(4));
					   plusvo.setProd_stock(rs.getInt(5));
					   
					   ImageVO imgvo = new ImageVO();
					   
					   imgvo.setProd_img_url(rs.getString(6));
					   
					   plusvo.setImgvo(imgvo);
					   
					   plusList.add(plusvo);					   
					   
				   }// end of while---------------------------
				   
				   prodMap.put("plusList", plusList);
				   
			   }  
			   
			   // 골라담기 상품일 경우 골라담기구성상품 목록 가져오기
			   if(pvo.getProd_select() != 0) {
					   
				   sql = " select I.fk_prod_code, prod_name, prod_price, discount_price, prod_stock, prod_img_url " + 
				   		 " from " + 
				   		 "     ( " + 
				   		 "         select A.fk_prod_code, prod_name, prod_price, nvl(discount_price,-9999) AS discount_price, prod_stock " + 
				   		 "         from tbl_prod_info A JOIN tbl_stock S ON A.fk_prod_code = S.fk_prod_code " + 
				   		 "         where A.fk_prod_code in ( " + 
				   		 "                                     select fk_prod_select_code AS prod_select_code " + 
				   		 "                                     from tbl_prod_select " + 
				   		 "                                     where fk_prod_code = ? " + 
				   		 "                                  ) AND prod_sale = 1 " + 
				   		 "      ) I " + 
				   		 " JOIN ( " + 
				   		 "        select distinct first_value(prod_img_url) over(partition by fk_prod_code order by prod_img_code) AS prod_img_url " + 
				   		 "             , fk_prod_code " + 
				   		 "        from tbl_prod_img " + 
				   		 "       ) T " + 
				   		 " ON I.fk_prod_code = T.fk_prod_code order by 1 ";
				   
				   pstmt = conn.prepareStatement(sql);
				   
				   pstmt.setString(1, prod_code);
				   
				   rs = pstmt.executeQuery();
				   
				   List<ProductVO_KJH> selectList = new ArrayList<>();
				   
				   while(rs.next()) {
					   
					   ProductVO_KJH selectvo = new ProductVO_KJH();
					   
					   selectvo.setProd_code(rs.getString(1));
					   selectvo.setProd_name(rs.getString(2));
					   selectvo.setProd_price(rs.getInt(3));
					   selectvo.setDiscount_price(rs.getInt(4));
					   selectvo.setProd_stock(rs.getInt(5));
					   
					   ImageVO imgvo = new ImageVO();
					   
					   imgvo.setProd_img_url(rs.getString(6));
					   
					   selectvo.setImgvo(imgvo);
					   
					   selectList.add(selectvo);					   
					   
				   }// end of while---------------------------
				   
				   prodMap.put("selectList", selectList);
				   			   
			   }	
			   
		   }
		   	
	   } finally {
		   close();
	   }	
	   
	   return prodMap;
	   
   }
   
   //////////////////////////////////////////////////////////////////////////////////////////
   
   // 카테고리와 배너 받아오기
   @Override
   public List<Map<String, Object>> allBanner() throws SQLException {
	   
	   List<Map<String, Object>> bannerList = new ArrayList<>(); 
	   
	   try {
		   
		   conn = ds.getConnection();
		   
		   String sql = " select sort_code, sort_name, nvl(ad_img_url, -9999) " + 
				   		" from tbl_sort S LEFT JOIN tbl_prod_ad A " + 
				   		" ON S.sort_code = A.fk_sort_code "+
				   		" order by sort_code ";
		   
		   pstmt = conn.prepareStatement(sql);
		   
		   rs = pstmt.executeQuery();
		   
		   while(rs.next()) {
			   
			   Map<String, Object> bannerMap = new HashMap<>();
			   
			   SortVO sort = new SortVO();
			   
			   sort.setSort_code(rs.getInt(1));
			   sort.setSort_name(rs.getString(2));
			   
			   bannerMap.put("sort", sort);			   
			   bannerMap.put("img", rs.getString(3));
			   
			   bannerList.add(bannerMap);
			   
		   }
		   		   
	   } finally {
		close();
	   }
	   
	   return bannerList;
   }

	
   /////////////////////////////////////////////////////////////////////////////////////////////////
   
   // 신규배너등록
   @Override	
   public int insertBanner(Map<String, String> paraMap) throws SQLException {
	
	   int result = 0;
		
	   try {
		
		   conn = ds.getConnection();
		   
		   String sql = " insert into tbl_prod_ad(fk_sort_code, ad_img_url) " + 
		   				" values(?, ?) ";
		   
		   pstmt = conn.prepareStatement(sql);
		   
		   pstmt.setString(1, paraMap.get("sort_code"));
		   pstmt.setString(2, paraMap.get("ad_img_url"));
		   
		   result = pstmt.executeUpdate();		   
		   
	   } finally {
		   close();
	   }
	   
	   return result;
	
   }

   ////////////////////////////////////////////////////////////////////////////////
   
   // 배너삭제
	@Override
	public int deleteBanner(String this_sort_code) throws SQLException {
		
		int result = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " delete from tbl_prod_ad where fk_sort_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, this_sort_code);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;
		
	}
	
	//////////////////////////////////////////////////////////////////////////
	
	// 배너수정
	@Override
	public int updateBanner(String this_sort_code, String ad_img_url_pick) throws SQLException {
		
		int result = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " update tbl_prod_ad set ad_img_url = ? where fk_sort_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ad_img_url_pick);
			pstmt.setString(2, this_sort_code);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;
		
	}

}
