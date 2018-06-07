package com.gurobit5.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.gurobit5.model.DaoMember;
import com.gurobit5.util.MyErrSender;
import com.gurobit5.util.MyRandom;

@WebServlet("/login.bit")
public class ConLogin extends HttpServlet{
	

	private String goRoot = "./";
	private String viewPath ="view/login/";

	private String[] modes = {"login", "joinChk","idChk", "pwChk", "join", "logout"};
	
	private HttpServletRequest reqThis;
	private HttpServletResponse respThis;
	private RequestDispatcher rd;
	
	private String modeP;
	private String method_type;
	private String web_id;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		loginInit(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		loginInit(req, resp);
	}
		
	private void loginInit(HttpServletRequest req, HttpServletResponse resp) {

		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		this.reqThis = req;
		this.respThis = resp;

		modeP = req.getParameter("mode");
		if(modeP==null)modeP="none";

		this.method_type = req.getMethod();
		
		// 경로넣어주기
		reqThis.setAttribute("rootPath", goRoot); // 파일경로에 씀
		
		// ID 체크 필요하면 사용.
		HttpSession session = req.getSession();
		web_id=(String) session.getAttribute("web_id");
		//임시용
		if(web_id==null) web_id="임시id";

		
		try {
			selectMode();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}// consultInit
	
	private void selectMode() throws ServletException, IOException, ClassNotFoundException, SQLException {
		if(modeP==null){ MyErrSender.sendErr(2, reqThis, respThis, goRoot); return;}
		
		if(comandCheck(modes)){
			// 제공하지 않는 기능 -- 2번
			MyErrSender.sendErr(2, reqThis, respThis, goRoot);
		}else{
			System.out.println("comandCheck : false 다음 명령감");
			if("login".equals(modeP)){
				comandLogin();
			}else if("joinChk".equals(modeP)){
				comandJoinChk();
			}else if("idChk".equals(modeP)){
				comandIdChk();
			}else if("pwChk".equals(modeP)){
				comandPwChk();
			}else if("join".equals(modeP)){
				comandJoin();
			}else if("logout".equals(modeP)){
				comandLogout();
			}
		}// if end
	}// selectMode()
	
	private boolean comandCheck(String[] modes) throws ClassNotFoundException, SQLException, ServletException, IOException {
		boolean checker_mode = true; // 없으면 true 를 리턴해서 조건을 발동 시킴.
		for(String msg : modes){
			if(modeP.equals(msg)){ 
				checker_mode=false; // 명령리스트에 있으면 false
				return checker_mode;
			}
		}// foreach 끝
		return checker_mode;
	}// comandCheck()
	
	
	private void comandLogout() throws ServletException, IOException {
		if("POST".equals(method_type)){
			HttpSession session = reqThis.getSession();
			session.removeAttribute("web_id");
			session.removeAttribute("web_name");
			session.removeAttribute("web_mem_type");
			rd = reqThis.getRequestDispatcher(goRoot+viewPath+"logout.jsp");
			rd.forward(reqThis, respThis);
		}else{
			// 허용하지 않는 method - 0번
			MyErrSender.sendErr(0, reqThis, respThis, goRoot);
		}		
	}

	private void comandJoin() throws IOException, ClassNotFoundException, SQLException, ServletException {
		//2018-05-30 재환 회원 가입 확인
		if("GET".equals(method_type)){

			rd = reqThis.getRequestDispatcher(goRoot+viewPath+"joinForm.jsp");
			rd.forward(reqThis, respThis);
					
		}else if("POST".equals(method_type)){
			// AJAX로 할꺼임
			String id=reqThis.getParameter("id");		
			String password=reqThis.getParameter("password");
			String pwchk=reqThis.getParameter("pwchk");
			String name=reqThis.getParameter("name");
			String email=reqThis.getParameter("email");
			String phoneP = reqThis.getParameter("phone");
			
			if( id==null || password==null || name == null || phoneP == null || email == null){
				respThis.getWriter().print("[필수정보가 비었습니다.]");
				return;
			}
			
			int phone=Integer.parseInt(phoneP);
			
			if(password.equals(pwchk)){
				DaoMember myjoin = new DaoMember();
				myjoin.insertJoin(id, password, name, email, phone);
				respThis.sendRedirect(goRoot+"login.bit?mode=login");
			}else{
				respThis.getWriter().print("[비밀번호/비밀번호 체크] 가 일치하지 않습니다.");
			}
			
		}else{
			// 허용하지 않는 method - 0번
			MyErrSender.sendErr(0, reqThis, respThis, goRoot);
		}
	}// comandJoin()

	private void comandJoinChk() throws IOException, ServletException, ClassNotFoundException, SQLException {
		//2018-05-30 재환 비밀번호 확인
		if("GET".equals(method_type)){
			rd = reqThis.getRequestDispatcher(goRoot+viewPath+"joinchk.jsp");
			rd.forward(reqThis, respThis);
		}else if("POST".equals(method_type)){
			rd = reqThis.getRequestDispatcher(goRoot+viewPath+"joinchk.jsp");
			rd.forward(reqThis, respThis);
		}else{
			// 허용하지 않는 method - 0번
			MyErrSender.sendErr(0, reqThis, respThis, goRoot);
		}
	}// comandPwChk
	
	private void comandPwChk() throws IOException, ServletException, ClassNotFoundException, SQLException {
		//2018-05-30 재환 비밀번호 확인
		if("GET".equals(method_type)){
			
			rd = reqThis.getRequestDispatcher(goRoot+viewPath+"pwFind.jsp");
			rd.forward(reqThis, respThis);
			
		}else if("POST".equals(method_type)){
			// AJAX로 할꺼임
			String id = reqThis.getParameter("id");
			String name = reqThis.getParameter("name");
			int phone = Integer.parseInt(reqThis.getParameter("phone"));
			
			DaoMember daoMember = new DaoMember();
			int result = daoMember.pwFind(id,name,phone);
			String findM ="없음";
			if(result==1){ 
				String newPw = MyRandom.getRandom(10);
				daoMember.pwInit(id,newPw);
				findM = daoMember.getPW(id);
			}
			reqThis.setAttribute("findM",findM);
			
			rd  = reqThis.getRequestDispatcher(goRoot+viewPath+"pwChk.jsp");
			rd.forward(reqThis, respThis);
			
		}else{
			// 허용하지 않는 method - 0번
			MyErrSender.sendErr(0, reqThis, respThis, goRoot);
		}
	}// comandPwChk

	private void comandIdChk() throws ServletException, IOException, ClassNotFoundException, SQLException {
		//2018-05-30 재환 아이디확인 
		if("GET".equals(method_type)){
			
			rd = reqThis.getRequestDispatcher(goRoot+viewPath+"idFind.jsp");
			rd.forward(reqThis, respThis);
			
		}else if("POST".equals(method_type)){
				String name = reqThis.getParameter("name");
				int phone = Integer.parseInt(reqThis.getParameter("phone"));
				DaoMember daoMember  = new DaoMember();
				String result= daoMember.idFindByName(name, phone);
				if("".equals(result)){ 
					reqThis.setAttribute("findM","없음");
				}else{
					reqThis.setAttribute("findM",result);
				}
				rd = reqThis.getRequestDispatcher(goRoot+viewPath+"idChk.jsp");
				rd.forward(reqThis, respThis);
		}else{
			// 허용하지 않는 method - 0번
			MyErrSender.sendErr(0, reqThis, respThis, goRoot);
		}
			
	}// comandIdChk

	@SuppressWarnings("unchecked")
	private void comandLogin() throws ServletException, IOException, ClassNotFoundException, SQLException {
		if("GET".equals(method_type)){
			
			rd = reqThis.getRequestDispatcher(goRoot+viewPath+"login.jsp");
			rd.forward(reqThis, respThis);
			
		}else if("POST".equals(method_type)){
			String id = reqThis.getParameter("id");
			String password = reqThis.getParameter("password");

			DaoMember daoMember  = new DaoMember();
			int result = daoMember.login(id, password);

			JSONObject obj = new org.json.simple.JSONObject();
			obj.put("result", result);
			if(result == 1){
				try {
					String name = new DaoMember().getName(id);
					int mem_type = new DaoMember().getType(id);
					obj.put("name", name);
					HttpSession session = reqThis.getSession();
					// id성공시 필요한 값들을 셋팅함.
					session.setAttribute("web_id", id);
					session.setAttribute("web_name", name);
					session.setAttribute("web_mem_type", mem_type);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			respThis.setContentType("application/x-json");
			respThis.getWriter().print(obj);

			if(result == 1){

			}
		}else{
			// 허용하지 않는 method - 0번
			MyErrSender.sendErr(0, reqThis, respThis, goRoot);
		}
	}// comandLogin()


	
}// Conlogin
