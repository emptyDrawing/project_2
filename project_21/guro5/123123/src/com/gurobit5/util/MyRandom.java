package com.gurobit5.util;

import java.util.Random;

public class MyRandom {

	public MyRandom(){};
	
	public static String getRandom(int size){
		StringBuffer buf =new StringBuffer();
		Random r =new Random();
		for(int i=0;i<size;i++){
			// rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. true일 시 랜덤 한 소문자를, false 일 시 랜덤 한 숫자를 StringBuffer 에 append 한다.
			if(r.nextBoolean()){
				if(i%2==0){ buf.append((char)((int)(r.nextInt(26))+97)); }
				else{ buf.append((char)((int)(r.nextInt(26))+65)); }
			}else{
				buf.append((r.nextInt(10)));
			}
		}
		return new String(buf);
	}//GetRandom()
	
}// MyRandom
		
