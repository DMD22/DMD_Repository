<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="Utils.*"%>
<%@page import="net.sf.json.*"%>
<%

Connection conn = DButil.getConnection();
Statement stmt = conn.createStatement();
	 ResultSet rs = stmt.executeQuery("select * from humiditydata");
	 LinkedList<HumidityEntity> humidityEntityList=new LinkedList<HumidityEntity>();
	   while(rs.next()){
		   HumidityEntity humidityEntity=new HumidityEntity();
		   humidityEntity.setId(rs.getInt("id"));
		   humidityEntity.setX_point(rs.getDouble("x_point"));
		   humidityEntity.setY_point(rs.getDouble("y_point"));
		   humidityEntity.setValue(rs.getDouble("value"));
		   humidityEntityList.add(humidityEntity);
	   }
	   String json = JSONArray.fromObject(humidityEntityList).toString();   
		out.println(json);

%>
