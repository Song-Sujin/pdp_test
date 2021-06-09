package project.penta.pdp.service;

import java.util.List;

import project.penta.pdp.model.Pdp;

// 구현해야 하는 기능들
public interface PdpService
{
	// control 화면 조회 (hadoop, zookeeper등 서비스 노출 가능성)
	public List<Pdp> getControlList() throws Exception;
	
	// service install
	public int installService(String service_name) throws Exception;
	
	// service start
	public int startService(String service_name) throws Exception;
	
	// service stop
	public int stopService(String service_name) throws Exception;
}
