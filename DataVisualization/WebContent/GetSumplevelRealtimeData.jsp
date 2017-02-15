<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="Utils.*"%>
<%@page import="net.sf.json.*"%>
<%

Connection conn = DButil.getConnection();
Statement stmt = conn.createStatement();
String flag=request.getParameter("flag");
if(flag.equals("center")){
	String id=request.getParameter("id");
	ResultSet rs = stmt.executeQuery("select * from sumpleveldata where position_id='"+id+"'");
	 LinkedList<SumplevelEntity> sumplevelEntityList=new LinkedList<SumplevelEntity>();
	   while(rs.next()){
		   SumplevelEntity sumplevelEntity=new SumplevelEntity();
		   sumplevelEntity.setId(rs.getInt("id"));
		   sumplevelEntity.setX_point(rs.getDouble("x_point"));
		   sumplevelEntity.setY_point(rs.getDouble("y_point"));
		   sumplevelEntity.setValue(rs.getDouble("value"));
		   sumplevelEntityList.add(sumplevelEntity);
	   }
	   String json = JSONArray.fromObject(sumplevelEntityList).toString();   
		out.println(json);
}
else{
	ResultSet rs = stmt.executeQuery("select * from sumpleveldata");
	 LinkedList<SumplevelEntity> sumplevelEntityList=new LinkedList<SumplevelEntity>();
	   while(rs.next()){
		   SumplevelEntity sumplevelEntity=new SumplevelEntity();
		   sumplevelEntity.setId(rs.getInt("id"));
		   sumplevelEntity.setX_point(rs.getDouble("x_point"));
		   sumplevelEntity.setY_point(rs.getDouble("y_point"));
		   sumplevelEntity.setValue(rs.getDouble("value"));
		   sumplevelEntityList.add(sumplevelEntity);
	   }
	   String json = JSONArray.fromObject(sumplevelEntityList).toString();   
		out.println(json);
}
	 

%>
