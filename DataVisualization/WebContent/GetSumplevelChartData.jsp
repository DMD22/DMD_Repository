<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="Utils.*"%>
<%@page import="net.sf.json.*"%>
<%
	Connection conn = DButil.getConnection();
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	if (request.getParameter("flag").equals("id")) {
		String start = request.getParameter("start");
		String total = request.getParameter("total");
		int m=(int)Integer.parseInt(start);
		int n=(int)Integer.parseInt(total);
		int x=n-m+1;
		int y;
		if(m==0){
			y=0;
		}else{
			y=m-1;
		}
		String id = request.getParameter("id");
// 		ResultSet rs = stmt.executeQuery("select * from temperaturehistorydata where position_id='" + id
// 		+ "' limit " + start + "," + total);
        ResultSet rs=stmt.executeQuery("select top "+x+" * from sumplevelhistorydata where position_id='"+id+"' and id not in(select top "+y+" id from sumplevelhistorydata)");
		LinkedList<SumplevelEntity> sumplevelEntityList = new LinkedList<SumplevelEntity>();
		while (rs.next()) {
	SumplevelEntity sumplevelEntity = new SumplevelEntity();
	sumplevelEntity.setDate(rs.getString("date"));
	sumplevelEntity.setValue(rs.getDouble("value"));
	sumplevelEntityList.add(sumplevelEntity);
		}
		String json = JSONArray.fromObject(sumplevelEntityList).toString();
		out.println(json);
	}else if(request.getParameter("flag").equals("address")){
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		String address = request.getParameter("select_address");
		ResultSet rs = stmt.executeQuery("select * from sumplevelhistorydata where address='" + address
		+ "' and date>='"+startdate+"' and date<='"+enddate+"'");
		LinkedList<SumplevelEntity> sumplevelEntityList = new LinkedList<SumplevelEntity>();
		float num=0;
		int count=0;
		String date_temp=startdate;
		DecimalFormat ft=new DecimalFormat("0.0");    
		while (rs.next()) {
			String date = rs.getString("date");
			double value = rs.getDouble("value");
			String id = rs.getString("position_id");
			if (date.equals(date_temp)) {
				num += value;
				count++;
				System.out.println(date + "--" + id);
			} else {
				SumplevelEntity sumplevelEntity = new SumplevelEntity();
				sumplevelEntity.setDate(date_temp);
				sumplevelEntity.setValue(Double.parseDouble(ft.format(num / count)));
				System.out.println(num + "--" + count);
				sumplevelEntityList.add(sumplevelEntity);
				num = 0;
				count = 0;
				num += value;
				count++;
				date_temp = date;
			}
			if(rs.isLast()){
				SumplevelEntity sumplevelEntity = new SumplevelEntity();
				sumplevelEntity.setDate(date_temp);
				sumplevelEntity.setValue(Double.parseDouble(ft.format(num / count)));
				System.out.println(num + "--" + count);
				sumplevelEntityList.add(sumplevelEntity);
			}
		}
		String json = JSONArray.fromObject(sumplevelEntityList).toString();
		out.println(json);
	}
%>