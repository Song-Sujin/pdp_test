package project.penta.pdp.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.penta.pdp.helper.WebHelper;
import project.penta.pdp.model.Pdp;
import project.penta.pdp.service.PdpService;

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
	
	// control 페이지
	@RequestMapping(value="/control.do", method=RequestMethod.GET)
	public ModelAndView control(Model model)
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
		
		System.out.println(services);
		
		return new ModelAndView("control");
	}
	
	// service install
	@ResponseBody
	@RequestMapping(value="/install.do", method=RequestMethod.GET)
	public ModelAndView install(Model model, HttpServletRequest request)
	{
		int result = 0;
		String view = null;
		
		try
		{
			// 받아온 서비스
			String service_name = request.getParameter("service_name");
			
			// 1. install 스크립트 실행?
			
			// 2. 성공시 install_ny를 y로 변경
			System.out.println(service_name);
			result = pdpService.installService(service_name); // update문으로 ny상태값 변경
			
		} catch (Exception e)
		{
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		return new ModelAndView("control.do");
	}
	
	// service start
	
	// service stop
	

}
