<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="Utils.*"%>
<%@page import="net.sf.json.*"%>
<%

Connection conn = DButil.getConnection();
Statement stmt = conn.createStatement();
	 ResultSet rs = stmt.executeQuery("select * from gasconcentrationdata");
	 LinkedList<GasconcentrationEntity> gasconcentrationEntityList=new LinkedList<GasconcentrationEntity>();
	   while(rs.next()){
		   GasconcentrationEntity gasconcentrationEntity=new GasconcentrationEntity();
		   gasconcentrationEntity.setId(rs.getInt("id"));
		   gasconcentrationEntity.setX_point(rs.getDouble("x_point"));
		   gasconcentrationEntity.setY_point(rs.getDouble("y_point"));
		   gasconcentrationEntity.setValue(rs.getDouble("value"));
		   gasconcentrationEntityList.add(gasconcentrationEntity);
	   }
	   String json = JSONArray.fromObject(gasconcentrationEntityList).toString();   
		out.println(json);

%>
