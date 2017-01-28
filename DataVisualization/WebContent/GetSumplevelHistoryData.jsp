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
	 ResultSet rs = stmt.executeQuery("select * from sumplevelhistorydata where date ='"+date+"'");
	 LinkedList<SumplevelEntity> SumplevelEntityList=new LinkedList<SumplevelEntity>();
	 while(rs.next()){
		 SumplevelEntity sumplevelEntity=new SumplevelEntity();
		 sumplevelEntity.setId(rs.getInt("id"));
		 sumplevelEntity.setPosition_id(rs.getInt("position_id"));
		 sumplevelEntity.setX_point(rs.getDouble("x_point"));
		 sumplevelEntity.setY_point(rs.getDouble("y_point"));
		 sumplevelEntity.setDate(rs.getString("date"));
		 sumplevelEntity.setValue(rs.getDouble("value"));
		 SumplevelEntityList.add(sumplevelEntity);
	 }
	 String json = JSONArray.fromObject(SumplevelEntityList).toString();   
	 out.println(json);

%>