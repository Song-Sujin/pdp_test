package project.penta.pdp.service;

import java.util.List;

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
}
