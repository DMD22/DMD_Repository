package Utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//连接数据�??
public class DButil {
	

	public  static Connection getConnection(){
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://192.168.109.207;DatabaseName=CoalMineDB2";
		String user = "sde";
		String password = "sde";
//		String url = "jdbc:sqlserver://127.0.0.1;DatabaseName=supermap";
//		String user = "sa";
//		String password = "19940123";
		Connection conn=null;
		try {
			
			Class.forName(driver);
			conn=DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	public static void closeConnection(Connection con) {

		if (con != null) {
			try {
				con.close();
				// 记录数据库连接数
				System.out.println("关闭数据库连�?");
			} catch (SQLException e) {
				System.out.println("关闭数据库发生异�?");
			}
		}
	}

	public static void closeStatement(PreparedStatement pstmt) {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void closeResultSet(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args){
		getConnection();
	}
}
