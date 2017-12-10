package com.uncc.internship;

import java.util.List;
import java.util.Map;

import org.jboss.security.auth.spi.Users.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.uncc.internship.form.InternshipDetailsReportForm;
import com.uncc.internship.form.LoginForm;
import com.uncc.internship.model.IntershipStudentView;
import com.uncc.internship.service.InternshipService;
import com.uncc.internship.service.LoginService;

@Controller
public class InternshipController {
	@Autowired
	public InternshipService internshipService;
	
	private static final Logger logger = LoggerFactory.getLogger(InternshipController.class);
	
	
	
	@RequestMapping(value = " /internshipdetails/{description}", method=RequestMethod.GET)
    public ModelAndView listInternshipDetails(@PathVariable("description")String description, Model model) {
		List internshipDetail=internshipService.getIntershipDetails(description);
            int id = 2323;  // Currently passing static values for testing
            model.addAttribute("internshipDetail", internshipDetail);
            ModelAndView modelinternDetail = new ModelAndView("internshipdetail","internshipDetail",internshipDetail);
			
           
			 logger.info(modelinternDetail.getViewName());
		     return modelinternDetail;
            
        }
	
	
}
