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
	public String install(Model model, HttpServletRequest request)
	{
		String result = "";
		
		
		
		return result;
	}
	
	// service start
	
	// service stop
	

}
