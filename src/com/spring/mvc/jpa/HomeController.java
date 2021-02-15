package com.spring.mvc.jpa;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	private static EntityManagerFactory factory;
	private static EntityManager em;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView home(HttpServletRequest request, HttpServletResponse response) {
		String custId = request.getParameter("custId");
		factory = Persistence.createEntityManagerFactory("Li_COMP303_Assignment2");
		em = factory.createEntityManager();
		DataModeler dataModeler = new DataModeler();
		
		try {
			em.getTransaction().begin();
			Customer customer = em.find(Customer.class, Integer.parseInt(custId));
			dataModeler.setCustomer(customer);
			em.close();
			
		} catch (NumberFormatException e) {
			dataModeler.setMessage("Invalid User Id format.");
			return new ModelAndView("user-home", "customer", dataModeler.getCustomer());
		}catch (Exception e) {
			dataModeler.setMessage(e.getMessage());
			return new ModelAndView("user-home", "customer", dataModeler.getCustomer());
		}
		
		return new ModelAndView("user-home", "customer", dataModeler.getCustomer());
    }
}
