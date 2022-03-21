package ch09;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;
public class MemberDao { // DAO (Data Access Object)
//	jsp에서 DB연결안하고java에서 DB연결하고 데이터 입력/수정/삭제/조회 전달하는 객체
//  싱글톤 singleton, 디자인 패턴 하나가지고 사용, Dao는 싱글톤으로 사용
//  static 정적, 공유, 클래스(변수 또는 메서드) : 객체를 생성하지 않고 사용가능한 변수 -> 클래스변수
//	static MemberDao instance = new MemberDao(); 클래스를 로딩(사용)할 때 단 1회만 실행
	private static MemberDao instance = new MemberDao(); // instance변수는 1개
//	생성자 앞에 private잇으면 외부에서 객체 생성 못해
	private MemberDao() {}
//	getInstance() 클래스 메서드 : 객체를 생성하지 않고 클래스명.메서드명() 바로 사용 가능 
	public static MemberDao getInstance() {
		return instance;
	}
	
//	DataBase Connection Pool
	private Connection getConnection() {
		Connection conn = null; // 변수 사용범위를 늘리기 위해
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println("연결 에러 : "+e.getMessage());
		}
		return conn;	
	}
	public int insert(Member member) {
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into member1 values (?,?,?,sysdate)";
		try{pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) { System.out.println(e.getMessage());
		}finally {			
			try{if (pstmt != null) pstmt.close();
				if (conn != null)  conn.close();
			} catch (SQLException e) { }
		}
		return result;
	}
	public int check(String id, String password) { // password능 화면에서 받은 암호
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select password from member1 where id=?";
		try{pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);		
			rs = pstmt.executeQuery();
			if (rs.next()) {  // 데이터 한개 , id에 해당하는 password
				String dbPass = rs.getString(1); // 1대신 "password" dbPass는 데이터베이스에 있는 암호
				if (dbPass.equals(password)) result = 1; // id와 password가 일치
				else result = 0; // id는 있으나 password가 다름
			} else result = -1;  // 없는 id임
		}catch (Exception e) { System.out.println(e.getMessage());
		}finally {			
			try{if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null)  conn.close();
			} catch (SQLException e) {}
		}
		return result;
	}
	public String getName(String id) { // password능 화면에서 받은 암호
		String name = "";
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select name from member1 where id=?";
		try{pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);		
			rs = pstmt.executeQuery();
			if (rs.next()) {  
				name = rs.getString("name");
			} else name = "없는 사람";  // 없는 id임
		}catch (Exception e) { System.out.println(e.getMessage());
		}finally {			
			try{if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null)  conn.close();
			} catch (SQLException e) {}
		}
		return name;
	}
}