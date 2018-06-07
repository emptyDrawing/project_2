package com.gurobit5.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gurobit5.model.entity.DtoScore;
import com.gurobit5.util.MyOracle;

public class DaoScore {
	// try - sskim / 2018-05-24
	// try - hyunjung/2018-05-23
	// modify - hyunjung/2018-05-29
	// modify - hyunjung/2018-05-30

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public DaoScore() throws ClassNotFoundException, SQLException {
	}
	//학생 전체의 성적 보기
	public ArrayList<DtoScore> selectAll(String id) throws ClassNotFoundException, SQLException{
		String sql="select * from score "
				+ "where lec_code=(select lec_code from member where id=?) "
				+ "order by name"; 
		ArrayList<DtoScore> list = new ArrayList<DtoScore>();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				DtoScore dtoScore = new DtoScore();
				dtoScore.setId(rs.getString("id"));
				dtoScore.setName(rs.getString("name"));
				dtoScore.setJava(rs.getInt("java"));
				dtoScore.setWeb(rs.getInt("web"));
				dtoScore.setDb(rs.getInt("db"));
				dtoScore.setTot(rs.getInt("tot"));
				list.add(dtoScore);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}//selectAll


	//학생 한명의 성적 보기
	public DtoScore selectOne(String id) throws ClassNotFoundException, SQLException{	
		String sql="select A.name, A.java, A.web, A.db, A.tot,"
				+ "(select B.class_name from lec_info B where A.lec_code=B.lec_code ) as class_name "
				+ "from score A where id=?";
		DtoScore dtoScore = new DtoScore();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				dtoScore.setClass_name(rs.getString("class_name"));
				dtoScore.setName(rs.getString("name"));
				dtoScore.setJava(rs.getInt("java"));
				dtoScore.setWeb(rs.getInt("web"));
				dtoScore.setDb(rs.getInt("db"));
				dtoScore.setTot(rs.getInt("tot"));
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return dtoScore;
	}//selectOne


	//학생 전체의 성적 보기
	public List<DtoScore> selectAllStu() throws ClassNotFoundException, SQLException{
		String sql="select * from score order by name"; 
		List<DtoScore> list = new ArrayList<DtoScore>();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				DtoScore dtoScore = new DtoScore();
				dtoScore.setName(rs.getString("name"));
				dtoScore.setJava(rs.getInt("java"));
				dtoScore.setWeb(rs.getInt("web"));
				dtoScore.setDb(rs.getInt("db"));
				dtoScore.setTot(rs.getInt("tot"));
				list.add(dtoScore);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}//selectAll

	public void sellectAlltoCnt(){

	}

	// 강의배정 후 학생성적 리셋 김수성 추가
	public int initScoreAfArr(String id) throws  ClassNotFoundException{
		
		String sql1 = "select count(*) from score where id = ?";
		
		String sql2 = "INSERT INTO SCORE VALUES (?,"
				+ " (SELECT NAME FROM MEMBER WHERE ID = ?), 0, 0, 0, 0,"
				+ " (SELECT LEC_CODE FROM MEMBER WHERE ID = ?))";

		String sql3 = "UPDATE SCORE SET"
				+ " JAVA = 0, WEB= 0, DB=0, TOT=0,"
				+ " LEC_CODE=(SELECT LEC_CODE FROM MEMBER WHERE ID = ?)"
				+ " WHERE ID = ?";
		
		int result = 0;
		try{
			conn = MyOracle.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
			}
			if(result==1){
				pstmt = conn.prepareStatement(sql3);
				pstmt.setString(1, id);
				pstmt.setString(2, id);
				System.out.println(id);
				System.out.println(sql3);
			}else{
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, id);
				pstmt.setString(2, id);
				pstmt.setString(3, id);
				System.out.println(id);
				System.out.println(sql2);
			}
			result = pstmt.executeUpdate();
			conn.commit();
			System.out.println("2번됩니까?:"+result);
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				System.out.println("배정후 성적초기화 도중 에러");
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null){
					conn.setAutoCommit(true);
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}



	//수정페이지를 위한 학생 성적리스트 
	public ArrayList<DtoScore> editList(String id, String[] arr) throws ClassNotFoundException, SQLException {
		String sql="select * from score "
				+ "where lec_code=(select lec_code from member where id=?) "
				+ "order by name"; 
		ArrayList<DtoScore> list = new ArrayList<DtoScore>();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				DtoScore dtoScore = new DtoScore();
				dtoScore.setId(rs.getString("id"));
				dtoScore.setName(rs.getString("name"));
				dtoScore.setJava(rs.getInt("java"));
				dtoScore.setWeb(rs.getInt("web"));
				dtoScore.setDb(rs.getInt("db"));
				dtoScore.setTot(rs.getInt("tot"));
				for(String msg:arr){
					if((rs.getString("id")).equals(msg)){
						dtoScore.setCheck(true);
					}
				}
				list.add(dtoScore);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}

	//학생 성적 수정(입력)
	public void update(String id, int java, int web, int db, int tot) throws ClassNotFoundException, SQLException {
		//성적은 기본값이 0으로 입력되어 있음, 그래서 처음 입력할때도 update로
		String sql="update score set java=?, web=?, db=?, tot=? where id=?";

		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, java);
			pstmt.setInt(2, web);
			pstmt.setInt(3, db);
			pstmt.setInt(4, tot);
			pstmt.setString(5, id);
			pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}

	}//update()




}
