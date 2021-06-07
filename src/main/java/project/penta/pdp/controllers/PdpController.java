package project.penta.pdp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PdpController
{
	// "/프로젝트이름"에 해당하는 ContextPath 변수 주입
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	// control 페이지
	@RequestMapping(value="/control.do", method=RequestMethod.GET)
	public ModelAndView control(Model model)
	{
		return new ModelAndView("control");
	}
	
	// service install
	
	// service start
	
	// service stop
	

}
