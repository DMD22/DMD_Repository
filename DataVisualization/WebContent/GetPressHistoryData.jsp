<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	 ResultSet rs = stmt.executeQuery("select * from presshistorydata where date ='"+date+"'");
	 LinkedList<PressEntity> pressEntityList=new LinkedList<PressEntity>();
	 while(rs.next()){
		 PressEntity pressEntity=new PressEntity();
		 pressEntity.setId(rs.getInt("id"));
		 pressEntity.setPosition_id(rs.getInt("position_id"));
		 pressEntity.setX_point(rs.getDouble("x_point"));
		 pressEntity.setY_point(rs.getDouble("y_point"));
		 pressEntity.setDate(rs.getString("date"));
		 pressEntity.setValue(rs.getInt("value"));
		 pressEntityList.add(pressEntity);
	 }
	 String json = JSONArray.fromObject(pressEntityList).toString();   
	 out.println(json);

%>