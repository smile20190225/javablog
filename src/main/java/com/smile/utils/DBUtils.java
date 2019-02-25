package com.smile.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DBUtils {

	//通过标识名来创建相应连接池
	static ComboPooledDataSource  dataSource = new ComboPooledDataSource("mysql");
	
	public static Connection getConnection() {
		try {
			return dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static ComboPooledDataSource getDataSource(){
	    return dataSource;
    }
	
	public static void close(Connection conn, PreparedStatement pst, ResultSet rs) {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		 if(pst!=null){  
             try {  
                 pst.close();  
             } catch (SQLException e) {  
            	 e.printStackTrace();
                 //logger.error("Exception in C3p0Utils!", e);
                 //throw new MyError("数据库连接关闭出错!", e);    
             }  
         }  
   
         if(conn!=null){  
             try {  
                 conn.close();  
             } catch (SQLException e) { 
            	 e.printStackTrace();
                // logger.error("Exception in C3p0Utils!", e);
                // throw new MyError("数据库连接关闭出错!", e);    
             }  
         }  
		
	}

	
	
}
