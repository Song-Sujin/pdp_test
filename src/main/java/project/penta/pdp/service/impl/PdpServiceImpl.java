package project.penta.pdp.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import project.penta.pdp.model.Pdp;
import project.penta.pdp.service.PdpService;

@Service
@Slf4j
public class PdpServiceImpl implements PdpService
{
	@Autowired
	SqlSession sqlSession;
	
	// control 화면 조회 (hadoop, zookeeper등 서비스 노출 가능성)
	@Override
	public List<Pdp> getControlList() throws Exception
	{
		List<Pdp> result = null;
		
		
		return result;
	}

	// service install
	@Override
	public int installService(Pdp input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

	// service start
	@Override
	public int startService(Pdp input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

	// service stop
	@Override
	public int stopService(Pdp input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

}
