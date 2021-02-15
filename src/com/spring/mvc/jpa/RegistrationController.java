package com.spring.mvc.jpa;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.RollbackException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegistrationController {
	private static EntityManagerFactory factory;
	private static EntityManager em;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
    public ModelAndView register() {
        return new ModelAndView("registration");
    }
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) {
		
		String custId = request.getParameter("custId");
		String password = request.getParameter("password");
		String userName = request.getParameter("userName");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String state_province = request.getParameter("state_province");
		String city = request.getParameter("city");
		String postalCode = request.getParameter("postalCode");
		String country = request.getParameter("country");

		factory = Persistence.createEntityManagerFactory("Li_COMP303_Assignment2");
		em = factory.createEntityManager();
		Customer customer = new Customer();
		DataModeler dataModeler = new DataModeler();
		
		try {
			em.getTransaction().begin();
			customer.setCustId(Integer.parseInt(custId));
			customer.setPassword(password);
			customer.setUserName(userName);
			customer.setFirstname(firstname);
			customer.setLastname(lastname);
			customer.setAddress(String.format("%s %s", address1, address2));
			customer.setCity(city);
			customer.setProvince(state_province);
			customer.setPostalCode(postalCode);
			customer.setCountry(country);
			dataModeler.setCustomer(customer);
			em.persist(customer);
			em.getTransaction().commit();
			em.close();
			
		} catch (NumberFormatException e) {
			dataModeler.setMessage("Invalid User Id format.");
			return new ModelAndView("registration", "dataModeler", dataModeler);
		}catch (RollbackException e) {
			dataModeler.setMessage("The User Id already exists. Please change to another one");
			return new ModelAndView("registration", "dataModeler", dataModeler);
		}
		catch (Exception e) {
			dataModeler.setMessage(e.getMessage());
			return new ModelAndView("registration", "dataModeler", dataModeler);
		}
		return new ModelAndView("user-home", "customer", dataModeler.getCustomer());
	}
}
