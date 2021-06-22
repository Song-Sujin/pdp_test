package project.penta.pdp.model;

import lombok.Data;

@Data
public class Pdp
{
	// 서비스명
	private String service_name;
	//private String service_status;
	
	// 설치여부
	private String install_ny;
	
	// 실행여부
	private String start_ny;
	
	// 로그인
	private String id, pw;
	
	// 결과값
	private String result_txt;

}
