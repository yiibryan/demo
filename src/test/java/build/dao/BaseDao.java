package build.dao;

import build.model.FieldModelBean;
import build.utils.Underline2Camel;
import org.apache.commons.lang.StringUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class BaseDao {

	/*private String url;
	private String driverName;
	private String user;
	private String passWord;*/
	
	public Connection conn = null;  
    public PreparedStatement pst = null;  
    
    public static void main(String[] args) {
    	DataBase dataBase = new DataBase();
    	dataBase.setPassWord("123456");
    	dataBase.setUserName("root");
    	dataBase.setPath("jdbc:mysql://127.0.0.1:3306/house?useUnicode=true&characterEncoding=utf-8");
    	dataBase.setDriverName("com.mysql.jdbc.Driver");;
		BaseDao baseDao = new BaseDao(dataBase, "");
		try {
			baseDao.getTables();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		baseDao.close();
	}
    
	public BaseDao(DataBase dataBase, String sql){
		String url = dataBase.getPath();
		String driverName = dataBase.getDriverName();
		String user = dataBase.getUserName();
		String passWord = dataBase.getPassWord();
		
		try {
			 Class.forName(driverName);//指定连接类型  
	         conn = DriverManager.getConnection(url, user, passWord);//获取连接  
	       //  pst = conn.prepareStatement(sql);//准备执行语句  
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void close() {  
		try {  
			if(conn!=null){
				this.conn.close();  
			}
			if(pst!=null){
				this.pst.close();  
			}
			
		} catch (SQLException e) {  
			e.printStackTrace();  
		}  
 	}
	

	/**
	 * 获取表明
	 * @throws SQLException
	 */
	 public List<String> getTables() throws SQLException {
		 List<String> list = new ArrayList<String>();
		 DatabaseMetaData dbMetData = conn.getMetaData();  
	        // mysql convertDatabaseCharsetType null  
		 ResultSet rs = dbMetData.getTables(null,  
	                convertDatabaseCharsetType("root", "mysql"), null,  
	                new String[] { "TABLE", "VIEW" });  
	  
		 while (rs.next()) {  
			 if (rs.getString(4) != null&& (rs.getString(4).equalsIgnoreCase("TABLE") || rs.getString(4).equalsIgnoreCase("VIEW"))) {  
				 String tableName = rs.getString(3).toLowerCase();  
				 System.out.println("表："+tableName);  
				 // 根据表名提前表里面信息：  
				getColumns(tableName);
		  
				 list.add(tableName);
			 }  
		 }    
		 return list;
	 }  
	 
	 /**
	  * 获取字段名
	  * @param tableName
	  * @return
	  * @throws SQLException
	  */
	 @SuppressWarnings("unused")
	public List<FieldModelBean> getColumns(String tableName) throws SQLException{
	 	Map<String,String>  tempMap = new HashMap<>();

		 List<FieldModelBean> fields = new ArrayList<FieldModelBean>();
		 DatabaseMetaData dbMetData = conn.getMetaData();  
		 //获取主键列表
		 Map<String, String> primary = new HashMap<String, String>();
		 ResultSet rs = dbMetData.getPrimaryKeys(conn.getCatalog().toUpperCase(), null, tableName);
		 while (rs.next()) {  
			 primary.put(rs.getString("COLUMN_NAME"), "");
	         System.out.println("primary:"+rs.getString("COLUMN_NAME"));  
		 }  
		 //获取字段列表
		 ResultSet colRet = dbMetData.getColumns(null, "%", tableName, "%");  
		 while (colRet.next()) {  
			 String columnName = colRet.getString("COLUMN_NAME").toLowerCase();
			 if(tempMap.containsKey(columnName)){
			 	continue;
			 }else{
				 tempMap.put(columnName,columnName);
			 }
			 String columnType = colRet.getString("TYPE_NAME").toUpperCase();
			 String fieldType="";
			 if(columnType.equals("DECIMAL")){
				 fieldType="BigDecimal";
			 }else if (columnType.equals("DATE")||columnType.equals("DATETIME")){
				 fieldType="Date";
			 }else if(columnType.equals("INT")||columnType.equals("INTEGER")){
				 fieldType="Integer";
			 }else if(columnType.equals("DOUBLE")){
				 fieldType="Double";
			 }else{
				 fieldType="String";
			 }
			 
			 int datasize = colRet.getInt("COLUMN_SIZE");  
			 int digits = colRet.getInt("DECIMAL_DIGITS");  
			 int nullable = colRet.getInt("NULLABLE");  
			 String remark = colRet.getString("REMARKS");  
			 
			 System.out.println(columnName+":"+columnType+"::"+remark);
			 String p = primary.get(columnName);
			 FieldModelBean temp ;
			 if(StringUtils.isNotBlank(p)){
				 temp = new FieldModelBean(Underline2Camel.underline2Camel(columnName, true), fieldType,columnName,remark,true);
			 }else{
				 temp = new FieldModelBean(Underline2Camel.underline2Camel(columnName, true), fieldType,columnName,remark,false);
			 }
			/* if(fieldType.equals("Date")){
				 FieldModelBean tempStr;
				 if(StringUtils.isNotBlank(p)){
					 tempStr = new FieldModelBean(Underline2Camel.underline2Camel(columnName, true)+"Str", "String",columnName,remark+"字符串",true);
				 }else{
					 tempStr = new FieldModelBean(Underline2Camel.underline2Camel(columnName, true)+"Str", "String",columnName,remark+"字符串",false);
				 }
				 fields.add(tempStr);
			 }*/
			 fields.add(temp);
		 }  
		 
		 return fields;
	 }
	 
	 /**
	  * 获取主键
	  * @param tableName
	  * @return
	  * @throws SQLException
	  */
	 public FieldModelBean getPrimaryKeys(String tableName) throws SQLException{
		 FieldModelBean bean = null;
		 DatabaseMetaData dbMetData = conn.getMetaData();  
		 ResultSet rs = dbMetData.getPrimaryKeys(conn.getCatalog().toUpperCase(), null, tableName);
		 while (rs.next()) {  
			 String columnName = rs.getString("COLUMN_NAME");
			 //String columnType = rs.getString("TYPE_NAME"); 
			// String remark = rs.getString("REMARKS");  
			 bean = new FieldModelBean(Underline2Camel.underline2Camel(columnName, true), "String",columnName,"",true);
		 }  
		 return bean;
	 }
	    
	 public static String convertDatabaseCharsetType(String in, String type) {  
		 String dbUser;  
		 if (in != null) {  
			 if (type.equals("oracle")) {  
				 dbUser = in.toUpperCase();  
			 } else if (type.equals("postgresql")) {  
				 dbUser = "public";  
			 } else if (type.equals("mysql")) {  
				 dbUser = null;  
			 } else if (type.equals("mssqlserver")) {  
				 dbUser = null;  
			 } else if (type.equals("db2")) {  
				 dbUser = in.toUpperCase();  
			 } else {  
				 dbUser = in;  
			 }  
		 } else {  
			 dbUser = "public";  
		 }  
		 return dbUser;  
	 }  
}
