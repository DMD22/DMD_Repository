<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="Utils.*"%>
<%@page import="net.sf.json.*"%>
<%

Connection conn = DButil.getConnection();
Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from pressdata");
	LinkedList<PressEntity> pressEntityList=new LinkedList<PressEntity>();
	while(rs.next()){
		   PressEntity pressEntity=new PressEntity();
		   pressEntity.setId(rs.getInt("id"));
		   pressEntity.setX_point(rs.getDouble("x_point"));
		   pressEntity.setY_point(rs.getDouble("y_point"));
		   pressEntity.setValue_1(rs.getDouble("value_1"));
		   pressEntity.setValue_2(rs.getDouble("value_2"));
		   pressEntity.setValue_3(rs.getDouble("value_3"));
		   pressEntity.setValue_4(rs.getDouble("value_4"));
		   pressEntity.setWarning(rs.getInt("warning"));
		   pressEntityList.add(pressEntity);
	}
	String json = JSONArray.fromObject(pressEntityList).toString();   
	out.println(json);


%>
