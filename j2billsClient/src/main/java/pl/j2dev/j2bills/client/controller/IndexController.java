package pl.j2dev.j2bills.client.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("")
public class IndexController {

	@RequestMapping("/")
	public ModelAndView index() {
		return new ModelAndView("redirect:/account/");
	}
	
}
