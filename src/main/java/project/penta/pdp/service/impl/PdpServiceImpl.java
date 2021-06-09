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
		
		try
		{
			result = sqlSession.selectList("PdpMapper.selectList");
			if(result == null)
				throw new NullPointerException("result=null");
			
		} catch (NullPointerException e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	// service install
	@Override
	public int installService(String service_name) throws Exception
	{
		int result = 0;
		
		try
		{
			result = sqlSession.update("PdpMapper.install", service_name);
			
			if(result == 0)
				throw new NullPointerException("result=0");
		} catch (NullPointerException e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	// service start
	@Override
	public int startService(String service_name) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

	// service stop
	@Override
	public int stopService(String service_name) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

}
