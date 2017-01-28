<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="Utils.*"%>
<%@page import="net.sf.json.*"%>
<%
     Connection conn = DButil.getConnection();
     Statement stmt = conn.createStatement();
     String startDate=request.getParameter("startDate");
     String endDate=request.getParameter("endDate");
     String date=request.getParameter("date");
	 ResultSet rs = stmt.executeQuery("select * from humidityhistorydata where date ='"+date+"'");
	 LinkedList<HumidityEntity> humidityEntityList=new LinkedList<HumidityEntity>();
	 while(rs.next()){
		 HumidityEntity humidityEntity=new HumidityEntity();
		 humidityEntity.setId(rs.getInt("id"));
		 humidityEntity.setPosition_id(rs.getInt("position_id"));
		 humidityEntity.setX_point(rs.getDouble("x_point"));
		 humidityEntity.setY_point(rs.getDouble("y_point"));
		 humidityEntity.setDate(rs.getString("date"));
		 humidityEntity.setValue(rs.getDouble("value"));
		 humidityEntityList.add(humidityEntity);
	 }
	 String json = JSONArray.fromObject(humidityEntityList).toString();   
	 out.println(json);

%>