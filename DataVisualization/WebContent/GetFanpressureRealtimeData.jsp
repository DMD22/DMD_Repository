<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="Utils.*"%>
<%@page import="net.sf.json.*"%>
<%

Connection conn = DButil.getConnection();
Statement stmt = conn.createStatement();
	 ResultSet rs = stmt.executeQuery("select * from fanpressuredata");
	 LinkedList<FanpressureEntity> FanpressureEntityList=new LinkedList<FanpressureEntity>();
	   while(rs.next()){
		   FanpressureEntity fanpressureEntity=new FanpressureEntity();
		   fanpressureEntity.setId(rs.getInt("id"));
		   fanpressureEntity.setX_point(rs.getDouble("x_point"));
		   fanpressureEntity.setY_point(rs.getDouble("y_point"));
		   fanpressureEntity.setValue(rs.getDouble("value"));
		   FanpressureEntityList.add(fanpressureEntity);
	   }
	   String json = JSONArray.fromObject(FanpressureEntityList).toString();   
		out.println(json);

%>
