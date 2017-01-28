<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="Utils.*"%>
<%@page import="net.sf.json.*"%>
<%

Connection conn = DButil.getConnection();
Statement stmt = conn.createStatement();
	 ResultSet rs = stmt.executeQuery("select * from temperaturedata");
	 LinkedList<TemperatureEntity> temperatureEntityList=new LinkedList<TemperatureEntity>();
	   while(rs.next()){
		   TemperatureEntity temperatureEntity=new TemperatureEntity();
		   temperatureEntity.setId(rs.getInt("id"));
		   temperatureEntity.setX_point(rs.getDouble("x_point"));
		   temperatureEntity.setY_point(rs.getDouble("y_point"));
		   temperatureEntity.setValue(rs.getDouble("value"));
		   temperatureEntityList.add(temperatureEntity);
	   }
	   String json = JSONArray.fromObject(temperatureEntityList).toString();   
		out.println(json);

%>
