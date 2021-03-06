/*DB 연결을 빼놓은 클래스*/
package db;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManager{
	String driver="org.mariadb.jdbc.Driver";
	String url="jdbc:mariadb://localhost:3306/db1202";
	String user="root";
	String password="1234";

	//접속 객체 얻기
	public Connection getConnection(){
		Connection con=null; //return 위해서
		try{
			Class.forName(driver);//드라이버 로드
			System.out.println("드라이버 로드 성공");

			//접속시도
			con = DriverManager.getConnection(url,user,password);
			
		}catch(ClassNotFoundException e){
			e.printStackTrace();
			System.out.println("드라이버 로드 실패");
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("드라이버 로드 실패");
		}

		return con;
	}

	//자원해제
	public void release(Connection con){//쿼리문 수행 안했을때
		if(con!=null){
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	public void release(Connection con,PreparedStatement pstmt){//DML용
		if(pstmt!=null){
			try{
				pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();				
			}
		}
		if(con!=null){
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	public void release(Connection con,PreparedStatement pstmt,ResultSet rs){//select용
		if(rs!=null){
			try{
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(pstmt!=null){
			try{
				pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(con!=null){
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}		
	}
}
