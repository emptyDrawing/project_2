package com.gurobit5.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gurobit5.util.MyErrSender;

public class ConIndex extends HttpServlet{
	
	// just copy 2018-05-28 / 김수성
	// Path 관련
		private String goRoot = "./";
		private String urlThis = "/";

		// 여기서 쓸 것들
		private HttpServletRequest reqThis;
		private HttpServletResponse respThis;
		private RequestDispatcher rd;
		
		private String method_type;
		private String pageid;
		private String modeP;
		
		private String web_id; // id값
		
		
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			mymenuInit(req, resp);
		}// doGet()

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			mymenuInit(req, resp);
		}// doPost()
		
		private void mymenuInit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
			// 혹시 모를 사태를 대비합시다.
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			
			// 필드 셋팅
			this.reqThis = req;
			this.respThis = resp;

			pageid = req.getParameter("pageid");
			modeP = req.getParameter("mode"); // modeP : 파라미터로 부터 받은 mode 라는 뜻
			this.method_type = req.getMethod();

			// 경로넣어주기
			reqThis.setAttribute("rootPath", goRoot); // 파일경로에 씀
			reqThis.setAttribute("urlThis", urlThis); // a 태그등의 경로에 씀
			
			// ID 체커도 필요함
			HttpSession session = req.getSession();
			web_id=(String) session.getAttribute("web_id");
			//임시용
			if(web_id==null) web_id="임시id";
			
			// 셋팅 끝나고 pageid를 구분하는 메소드 호출합니다.
			// 여기서 대부분의 catch를 실행합니다.		
			try {
				selectPage();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}// mymenuInit()
			
		private void selectPage() throws ClassNotFoundException, SQLException, ServletException, IOException, ParseException {
			
			// 여기서 체크합니다.
			// comandCheck는 각각의 modes 배열을 확인해서 커맨드가 없으면 true를 리턴합니다.
			if("lec_con".equals(pageid)){
				if(comandCheck(lecModes)){
					// 제공하지 않는 기능 -- 2번
					MyErrSender.sendErr(2, reqThis, respThis,goRoot);
				}else{
					System.out.println("Lec_con test : false 다음 명령감");
					comandLecCon();
				}
			}else if("attend_con".equals(pageid)){
				if(	comandCheck(attendModes) ){
					// 제공하지 않는 기능 -- 2번
					MyErrSender.sendErr(2,reqThis,respThis,goRoot);
				}else{
					System.out.println("comand-check test : false 다음 명령감");
					comandAttendCon();
				}
			}else{
				// 제공하지 않는 메뉴 -- 3번
				MyErrSender.sendErr(3,reqThis,respThis,goRoot);
			}
		}// selectPage
		
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

}
