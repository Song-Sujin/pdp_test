package project.penta.pdp.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import project.penta.pdp.model.Pdp;

// 구현해야 하는 기능들
public interface PdpService
{
	// control 화면 조회 (hadoop, zookeeper등 서비스 노출 가능성)
	public List<Pdp> getControlList() throws Exception;
	
	// 하나의 서비스의 정보 조회
	public Pdp getService(Pdp input) throws Exception;
	
	// service install
	public int installService(Pdp input) throws Exception;
	
	// service start
	public int startService(Pdp input) throws Exception;
	
	// service stop
	public int stopService(Pdp input) throws Exception;
	
	// -------------------------------------------------------
	
	// login
	public Pdp login(Pdp input, HttpServletResponse response) throws Exception;
	
	// os install
	public String osInstall() throws Exception;
	
	// postgres install
	public String postgresInstall() throws Exception;
	
	// hadoop install
	public String hadoopInstall() throws Exception;
	
	// hive install
	public String hiveInstall() throws Exception;
	
	
	
	
	
	
	
	
	// installer0
	public int installer0(Pdp input) throws Exception;
	
	// installer1
	public int installer1(Pdp input) throws Exception;
	
	// installer2
	public int installer2(Pdp input) throws Exception;
	
	// installer3
	public int installer3(Pdp input) throws Exception;
	
	// installer4
	public int installer4(Pdp input) throws Exception;
	
	// installer5
	public int installer5(Pdp input) throws Exception;
	
	// installer6
	public int installer6(Pdp input) throws Exception;
	
	// installer7
	public int installer7(Pdp input) throws Exception;
	
	// installer8
	public int installer8(Pdp input) throws Exception;
	
	// installer9
	public int installer9(Pdp input) throws Exception;

	public int updateResult(Pdp input) throws Exception;
	
	
	
}
