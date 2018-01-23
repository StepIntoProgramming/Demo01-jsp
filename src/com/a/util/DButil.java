package com.a.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.a.bean.Person;

public class DButil {

	List<Person> list = new ArrayList<Person>();
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public Connection connection(){
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/mydatabase?serverTimezone=UTC&useSSL=false", "root", "root");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	public List<Person> selectMess(String sql,Object... params){
		Connection conn = this.connection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Person> personList = new ArrayList<Person>();
		try {
			pstmt = conn.prepareStatement(sql);
			this.setPstmt(pstmt, params);
			rs = pstmt.executeQuery();
			personList = this.resultSet(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.close(rs, pstmt, conn);
		}
		return personList;
	}
	public int updateMess(String sql,Object... params){
		Connection conn = this.connection();
		PreparedStatement pstmt = null;
		int rows = -1;
		try {
			pstmt = conn.prepareStatement(sql);
			this.setPstmt(pstmt, params);
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.close(null, pstmt, conn);
		}
		return rows;
	}
	public void setPstmt(PreparedStatement pstmt,Object... params) throws SQLException{
		for (int i = 0; i < params.length; i++) {
			pstmt.setObject(i+1, params[i]);
		}
	}
	public List<Person> resultSet(ResultSet rs) throws SQLException{
		List<Person> personList = new ArrayList<Person>();
		while(rs.next()){
			Person person = new Person();
			person.setId(rs.getInt("id"));
			person.setAge(rs.getInt("age"));
			person.setName(rs.getString("name"));
			person.setSex(rs.getString("sex"));
			person.setLoc(rs.getString("location"));
			personList.add(person);
		}
		return personList;
	}
	public void close(ResultSet rs,Statement st,Connection conn){
		try {
			if(rs != null){
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(st != null){
				st.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(conn != null){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
