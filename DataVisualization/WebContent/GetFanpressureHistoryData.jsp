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
	 ResultSet rs = stmt.executeQuery("select * from fanpressurehistorydata where date ='"+date+"'");
	 LinkedList<FanpressureEntity> fanpressureEntityList=new LinkedList<FanpressureEntity>();
	 while(rs.next()){
		 FanpressureEntity fanpressureEntity=new FanpressureEntity();
		 fanpressureEntity.setId(rs.getInt("id"));
		 fanpressureEntity.setPosition_id(rs.getInt("position_id"));
		 fanpressureEntity.setX_point(rs.getDouble("x_point"));
		 fanpressureEntity.setY_point(rs.getDouble("y_point"));
		 fanpressureEntity.setDate(rs.getString("date"));
		 fanpressureEntity.setValue(rs.getDouble("value"));
		 fanpressureEntityList.add(fanpressureEntity);
	 }
	 String json = JSONArray.fromObject(fanpressureEntityList).toString();   
	 out.println(json);

%>