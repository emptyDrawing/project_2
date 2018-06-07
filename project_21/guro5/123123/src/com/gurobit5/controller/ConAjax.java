package com.gurobit5.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.gurobit5.model.DaoLecRoom;
import com.gurobit5.model.DaoMember;
import com.gurobit5.model.DaoScore;



@WebServlet("/ajax.bit")
public class ConAjax extends HttpServlet{
	// try - sskim / 2018-05-24

	private BufferedReader bfr;

	private HttpServletResponse respThis;
	private HttpServletRequest reqThis;
	private String modeP;
	private String jsonP;

	private Object goRoot;
	private Object urlThis;
	private String web_id;

	private JSONArray jsonD;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ajaxInit(req,resp);
	}

	private void ajaxInit(HttpServletRequest req, HttpServletResponse resp){
		// 혹시 모를 사태를 대비합시다.
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		reqThis = req;
		respThis = resp;
		// ID 체커도 필요함
		HttpSession session = req.getSession();
		web_id=(String) session.getAttribute("web_id");
		//임시용
		if(web_id==null) web_id="임시id";
		reqThis.setAttribute("rootPath", goRoot); // 파일경로에 씀
		modeP = req.getParameter("mode");
		jsonP = req.getParameter("data");
		try {
			JSONParser jsonp = new JSONParser();
			jsonD = (JSONArray) jsonp.parse(jsonP);
			selectMode();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void selectMode() throws ClassNotFoundException, SQLException{
		if("get_room".equals(modeP)){
			this.comandGetRoom();
		}else if("set_room".equals(modeP)){
			this.comandSetRoom();
		}else if("ch_mem_t".equals(modeP)){
			this.comandChMemType();
			// 없는 ajax 요청
		}else if("ch_lec_code".equals(modeP)){
			this.comandChLecCodeForStu();
		// 없는 ajax 요청
		}else{
			
		}

	}// command()

	private void comandChLecCodeForStu() throws ClassNotFoundException, SQLException, NumberFormatException {
		// TODO Auto-generated method stub
		Iterator ite = jsonD.iterator();
		DaoScore daoScore = new DaoScore();
		DaoMember daoMember = new DaoMember();
		DaoScore score = new DaoScore();
		while(ite.hasNext()){
			JSONObject json = null;
			json = (JSONObject) ite.next();
			String id = (String) json.get("id");
			int lec_code = Integer.parseInt((String) json.get("lec_code"));
			daoMember.changeLecCode(id, lec_code);
			daoScore.initScoreAfArr(id);
		}
	}

	private void comandChMemType() throws ClassNotFoundException, SQLException {
		// sys
		Iterator ite = jsonD.iterator();
		DaoMember daoMember = new DaoMember();
		while(ite.hasNext()){
			JSONObject json = null;
			json = (JSONObject) ite.next();
			String id = (String) json.get("id");
			int mem_type = Integer.parseInt((String) json.get("memtype"));
			daoMember.changeMemTypeById(id, mem_type);
		}
	}

	private void comandSetRoom() {

	}

	private void comandGetRoom() {
		// list를 DB로 부터 받아서 처리해야됨
		DaoLecRoom daoLecRoom = new DaoLecRoom();
	}

}// ConAjax
