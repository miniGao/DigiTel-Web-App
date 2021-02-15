package com.spring.mvc.jpa;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SigninController {
	private static EntityManagerFactory factory;
	private static EntityManager em;
	
	@RequestMapping(value="/sign-in", method=RequestMethod.POST)
	public ModelAndView signIn(HttpServletRequest request, HttpServletResponse response) {
		
		String custId = request.getParameter("custId");
		String password = request.getParameter("password");
		Customer customer;

		try {
			factory = Persistence.createEntityManagerFactory("Li_COMP303_Assignment2");
			em = factory.createEntityManager();
		} catch (Exception e) {
			return new ModelAndView("retry-login", "message", "Server connection error.");
		}

		try {
			Query query = em.createQuery("select e from Customer e where e.custId =" + custId);
			customer = (Customer)query.getSingleResult();
			em.close();
		} catch (Exception e) {
			return new ModelAndView("retry-login", "message", "Wrong User Id/Password, please try again.");
		}
		
		if(password.equals(customer.getPassword())) {
			return new ModelAndView("user-home", "customer", customer);
		}
		else {
			return new ModelAndView("retry-login", "message", "Wrong User Id/Password, please try again.");
		}
	}
}
