package project.penta.pdp.service.impl;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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

	// 로그인
	@Override
	public Pdp login(Pdp input, HttpServletResponse response) throws Exception
	{
		Pdp result = null;
		int checkid = 0;
		
		try
		{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			checkid = sqlSession.selectOne("PdpMapper.checkid", input);		// id의 개수 반환
			
			// id가 존재하지 않을 때
			if(checkid == 0) {
				out.println("<script>");
				out.println("alert('등록된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			} else {	// id가 존재할 때
				
				result = sqlSession.selectOne("PdpMapper.login", input);	// 해당하는 id의 id와 pw반환
				
				// 실제 pw가 입력한 pw와 일치하지 않을 경우
				if(!result.getPw().equals(input.getPw())) {
					out.println("<script>");
					out.println("alert('비밀번호가 다릅니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
					return null;
				} else {
					return result;
				}
			}
			
		} catch (NullPointerException e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e)
		{
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
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
