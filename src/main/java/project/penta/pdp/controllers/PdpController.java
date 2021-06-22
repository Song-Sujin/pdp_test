package project.penta.pdp.controllers;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import project.penta.pdp.helper.WebHelper;
import project.penta.pdp.model.Pdp;
import project.penta.pdp.service.PdpService;

@Slf4j
@Controller
public class PdpController
{
	@Autowired
	WebHelper webHelper;

	@Autowired
	PdpService pdpService;

	// "/프로젝트이름"에 해당하는 ContextPath 변수 주입
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value = "/welcome.do", method = RequestMethod.GET)
	public ModelAndView welcome(Model model)
	{

		return new ModelAndView("home");

	}

	// control 페이지
	@RequestMapping(value = "/control.do", method = RequestMethod.GET)
	public ModelAndView control(Model model, HttpServletRequest request)
	{
		Pdp service = null;

		try
		{
			String service_name = request.getParameter("service_name");

			System.out.println(service_name);

			Pdp input = new Pdp();
			input.setService_name(service_name);

			service = pdpService.getService(input);
		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("service", service);

		return new ModelAndView("control");
	}

	// service install
	@ResponseBody
	@RequestMapping(value = "/install.do", method = RequestMethod.GET)
	public List<Pdp> install(Model model, HttpServletRequest request)
	{
		int updateny = 0;
		int updateresult = 0;

		List<Pdp> services = null;

		try
		{
			// request로 넘어온 service_name
			String service_name = request.getParameter("service_name");

			// 1. ansible 스크립트 실행
			String result_txt = "";
			
			switch (service_name) {
			case "os" :
				result_txt = pdpService.osInstall();
				break;
			case "postgres" :
				result_txt = pdpService.postgresInstall();
				break;
			case "hadoop" : 
				result_txt = pdpService.hadoopInstall();
				System.out.println("inside hadoop switch");
				break;
			case "hive" :
				result_txt = pdpService.hiveInstall();
				break;
			default :
				System.out.println("default");
				result_txt = null;
				break;
			}
			
			System.out.println("after switch : " + result_txt);

			// 2. 스크립트 수행 후 db update 실행
			if (result_txt != null)
			{
				// start_ny를 y로 update
				// request로 넘어온 service_name을 input에 담아서 넘기기
				Pdp input = new Pdp();
				input.setService_name(service_name);
				input.setResult_txt(result_txt); // hadoop의 결과
				
				// install_ny값 y로 update하기
				updateny = pdpService.installService(input);
				// resultTxt값 update하기
				updateresult = pdpService.updateResult(input);
				
				// 변경 이후 모든 서비스 정보 받아오기
				services = pdpService.getControlList();
				
				System.out.println("services checkaaa : " + services);
			}

		} catch (IOException e)
		{
			e.printStackTrace();
		} catch (InterruptedException e)
		{
			e.printStackTrace();
		} catch (Exception e)
		{
			return null;
		}

		return services;
	}

	// service start
	@ResponseBody
	@RequestMapping(value = "/start.do", method = RequestMethod.GET)
	public List<Pdp> start(Model model, HttpServletRequest request)
	{
		int updateny = 0;
		int updateresult = 0;

		List<Pdp> services = null;

		try
		{
			// request로 넘어온 service_name
			String service_name = request.getParameter("service_name");

			// 1. ansible 스크립트 실행
			String result_txt = "";
			
			switch (service_name) {
			case "os" :
				result_txt = pdpService.osInstall();
				break;
			case "postgres" :
				result_txt = pdpService.postgresInstall();
				break;
			case "hadoop" : 
				result_txt = pdpService.hadoopInstall();
				break;
			case "hive" :
				result_txt = pdpService.hiveInstall();
				break;
			default :
				System.out.println("default");
				result_txt = null;
				break;
			}

			// 2. 스크립트 수행 후 db update 실행
			if (result_txt != null)
			{
				// start_ny를 y로 update
				// request로 넘어온 service_name을 input에 담아서 넘기기
				Pdp input = new Pdp();
				input.setService_name(service_name);
				input.setResult_txt(result_txt); // hadoop의 결과
				
				// start_ny값 y로 update하기
				updateny = pdpService.startService(input);
				// resultTxt값 update하기
				updateresult = pdpService.updateResult(input);
				
				// 변경 이후 모든 서비스 정보 받아오기
				services = pdpService.getControlList();
				
				// 받아온 정보에서 하둡 찾기
				/*
				for(int i=0;i<services.size();i++) {
					
					// 받아온 전체 리스트중 선택한 service_name이랑 일치할 경우
					if(services.get(i).getService_name().equals(service_name)) {
						// 그 서비스의 resultTxt에 넣기
						services.get(i).setResult_txt(result_txt);
					}
				}
				*/
				
				
				System.out.println("services checkaaa : " + services);
			}

		} catch (IOException e)
		{
			e.printStackTrace();
		} catch (InterruptedException e)
		{
			e.printStackTrace();
		} catch (Exception e)
		{
			return null;
		}
		
		return services;
	}

	// service stop
	@ResponseBody
	@RequestMapping(value = "/stop.do", method = RequestMethod.GET)
	public List<Pdp> stop(Model model, HttpServletRequest request)
	{
		int result = 0;

		List<Pdp> services = null;

		try
		{
			// 받아온 서비스
			String service_name = request.getParameter("service_name");

			// 1. start 스크립트 실행

			// 2. 성공시 start_ny를 n으로 변경

			Pdp input = new Pdp();
			input.setService_name(service_name);

			result = pdpService.stopService(input); // update문으로 ny상태값 변경

			services = pdpService.getControlList(); // 변경 이후 모든 서비스 정보 받아오기

		} catch (Exception e)
		{
			return null;
		}

		return services;
	}

	// ---------------------------------------------------------------------------

	// login 버튼 클릭 시 login 처리
	@RequestMapping(value = "/login_ok.do", method = RequestMethod.POST)
	public ModelAndView login_ok(Model model, HttpServletRequest request, HttpServletResponse response)
	{
		Pdp member = null;

		// 세션 객체에 넣어서 로그인 처리하기
		HttpSession session = request.getSession();

		try
		{
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");

			Pdp input = new Pdp();
			input.setId(id);
			input.setPw(pw);

			// 여기서 return된 member는 로그인 성공된 정보
			member = pdpService.login(input, response);

			// 세션에 로그인 성공한 정보 넣어두기
			session.setAttribute("member", member);

		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("member", member);

		return new ModelAndView("installer0");
	}

	// temp페이지에서 installer0페이지로 이동
	@RequestMapping(value = "/login_ok_tmp.do", method = RequestMethod.GET)
	public ModelAndView login_ok_tmp(Model model, HttpServletRequest request, HttpServletResponse response)
	{
		Pdp member = null;

		// 세션 객체에 넣어서 로그인 처리하기
		HttpSession session = request.getSession();

		try
		{
			String id = "penta";
			String pw = "bigdata99";

			Pdp input = new Pdp();
			input.setId(id);
			input.setPw(pw);

			// 여기서 return된 member는 로그인 성공된 정보
			member = pdpService.login(input, response);

			// 세션에 로그인 성공한 정보 넣어두기
			session.setAttribute("member", member);

		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("member", member);

		return new ModelAndView("installer0");
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session, HttpServletResponse response)
	{

		try
		{
			// 세션 삭제
			session.invalidate();

		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		return new ModelAndView("home");

	}

	// installer0 -> installer1
	@RequestMapping(value = "/installer0.do", method = RequestMethod.POST)
	public ModelAndView installer0(Model model)
	{
		Pdp member = null;

		try
		{

		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("member", member);

		return new ModelAndView("installer1");
	}

	// installer1 -> installer2
	@RequestMapping(value = "/installer1.do", method = RequestMethod.POST)
	public ModelAndView installer1(Model model)
	{
		Pdp member = null;

		try
		{

		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("member", member);

		return new ModelAndView("installer2");
	}

	// installer2 -> installer3
	@RequestMapping(value = "/installer2.do", method = RequestMethod.POST)
	public ModelAndView installer2(Model model)
	{
		Pdp member = null;

		try
		{

		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("member", member);

		return new ModelAndView("installer3");
	}

	// installer3 -> installer4
	@RequestMapping(value = "/installer3.do", method = RequestMethod.POST)
	public ModelAndView installer3(Model model)
	{
		Pdp member = null;

		try
		{

		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("member", member);

		return new ModelAndView("installer4");
	}

	// installer4 -> installer5
	@RequestMapping(value = "/installer4.do", method = RequestMethod.POST)
	public ModelAndView installer4(Model model)
	{
		Pdp member = null;

		try
		{

		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("member", member);

		return new ModelAndView("installer5");
	}

	// installer5 -> installer6
	@RequestMapping(value = "/installer5.do", method = RequestMethod.POST)
	public ModelAndView installer5(Model model)
	{
		Pdp member = null;

		try
		{

		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("member", member);

		return new ModelAndView("installer6");
	}

	// installer6 -> installer7
	@RequestMapping(value = "/installer6.do", method = RequestMethod.POST)
	public ModelAndView installer6(Model model)
	{
		Pdp member = null;

		try
		{

		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("member", member);

		return new ModelAndView("installer7");
	}

	// installer7 -> installer8
	@RequestMapping(value = "/installer7.do", method = RequestMethod.POST)
	public ModelAndView installer7(Model model)
	{
		Pdp member = null;

		try
		{

		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("member", member);

		return new ModelAndView("installer8");
	}

	// installer8 -> installer9
	@RequestMapping(value = "/installer8.do", method = RequestMethod.POST)
	public ModelAndView installer8(Model model)
	{
		Pdp member = null;

		try
		{

		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("member", member);

		return new ModelAndView("installer9");
	}

	// installer9 -> dashboard
	@RequestMapping(value = "/installer9.do", method = RequestMethod.POST)
	public ModelAndView installer9(Model model)
	{
		List<Pdp> services = null;

		try
		{
			services = pdpService.getControlList();
		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("services", services);

		return new ModelAndView("dashboard");
	}

	// temp 페이지에서 dashboard 페이지로 이동
	@RequestMapping(value = "/dashboard.do", method = RequestMethod.GET)
	public ModelAndView dashboard(Model model, HttpServletRequest request, HttpServletResponse response)
	{
		Pdp member = null;
		List<Pdp> services = null;

		// 세션 객체에 넣어서 로그인 처리하기
		HttpSession session = request.getSession();

		try
		{
			String id = "penta";
			String pw = "bigdata99";

			Pdp input = new Pdp();
			input.setId(id);
			input.setPw(pw);

			// 여기서 return된 member는 로그인 성공된 정보
			member = pdpService.login(input, response);

			services = pdpService.getControlList();

			// 세션에 로그인 성공한 정보 넣어두기
			session.setAttribute("member", member);

		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("services", services);
		model.addAttribute("member", member);

		return new ModelAndView("dashboard");
	}

	// temp 페이지에서 control 페이지로 이동
	@RequestMapping(value = "/control_tmp.do", method = RequestMethod.GET)
	public ModelAndView control_tmp(Model model, HttpServletRequest request, HttpServletResponse response)
	{
		Pdp member = null;
		Pdp service = null;
		// 세션 객체에 넣어서 로그인 처리하기
		HttpSession session = request.getSession();

		try
		{
			String id = "penta";
			String pw = "bigdata99";
			String service_name = "hadoop";

			Pdp input = new Pdp();
			input.setId(id);
			input.setPw(pw);
			input.setService_name(service_name);

			// 여기서 return된 member는 로그인 성공된 정보
			member = pdpService.login(input, response);

			service = pdpService.getService(input);

			// 세션에 로그인 성공한 정보 넣어두기
			session.setAttribute("member", member);

		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("service", service);
		model.addAttribute("member", member);

		return new ModelAndView("control");
	}

}
