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
	
	// 하나의 서비스의 정보 조회
	@Override
	public Pdp getService(Pdp input) throws Exception
	{
		Pdp result = null;
		
		try
		{
			result = sqlSession.selectOne("PdpMapper.selectItem", input);
			
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
	public int installService(Pdp input) throws Exception
	{
		int result = 0;
		
		try
		{
			result = sqlSession.update("PdpMapper.install", input);
			
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
	public int startService(Pdp input) throws Exception
	{
		int result = 0;
		
		try
		{
			result = sqlSession.update("PdpMapper.start", input);
			
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

	// service stop
	@Override
	public int stopService(Pdp input) throws Exception
	{
		int result = 0;
		
		try
		{
			result = sqlSession.update("PdpMapper.stop", input);
			
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

	@Override
	public Pdp login(Pdp input) throws Exception
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int installer0(Pdp input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int installer1(Pdp input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int installer2(Pdp input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int installer3(Pdp input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int installer4(Pdp input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int installer5(Pdp input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int installer6(Pdp input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int installer7(Pdp input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int installer8(Pdp input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int installer9(Pdp input) throws Exception
	{
		// TODO Auto-generated method stub
		return 0;
	}


	

}
