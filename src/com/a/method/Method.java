package com.a.method;

import java.util.ArrayList;
import java.util.List;

import com.a.bean.Person;
import com.a.util.DButil;

public class Method {

	DButil db = new DButil();
	public List<Person> selectMessMethod(){
		List<Person> personList = new ArrayList<Person>();
		String sql = "select * from person";
		personList = db.selectMess(sql);
		return personList;
	}
	public int updateMethod(Object... params){
		String sql = "DELETE from person where id = ?";
		int rows = db.updateMess(sql, params);
		return rows;
	}
	public int insertMethod(Object... params){
		String sql = "insert into person(name,sex,age,location) values(?,?,?,?)";
		int rows = db.updateMess(sql, params);
		return rows;
	}
	public int changeMethod(String sql,Object... params){
		int rows = db.updateMess(sql, params);
		return rows;
	}
}
