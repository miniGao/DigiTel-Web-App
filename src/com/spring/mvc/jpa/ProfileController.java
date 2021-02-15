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
public class ProfileController {
	private static EntityManagerFactory factory;
	private static EntityManager em;
	
	@RequestMapping(value = "/profile-page", method = RequestMethod.GET)
    public ModelAndView getProfilePage(HttpServletRequest request, HttpServletResponse response) {
		String custId = request.getParameter("custId");
		factory = Persistence.createEntityManagerFactory("Li_COMP303_Assignment2");
		em = factory.createEntityManager();
		DataModeler dataModeler = new DataModeler();
		
		try {
			em.getTransaction().begin();
			Customer customer = em.find(Customer.class, Integer.parseInt(custId));
			dataModeler.setCustomer(customer);
			em.close();
		}catch(Exception e) {
			System.out.println("error");
		}
        return new ModelAndView("user-profile", "dataModeler", dataModeler);
    }
	
	@RequestMapping(value="/update-profile", method=RequestMethod.POST)
	public ModelAndView updateProfile(HttpServletRequest request, HttpServletResponse response) {
		String custId = request.getParameter("custId");
		String password = request.getParameter("password");
		String userName = request.getParameter("userName");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String address = request.getParameter("address");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String postalCode = request.getParameter("postalCode");
		String country = request.getParameter("country");

		factory = Persistence.createEntityManagerFactory("Li_COMP303_Assignment2");
		em = factory.createEntityManager();
		DataModeler dataModeler = new DataModeler();
		
		try {
			em.getTransaction().begin();
			Customer customer = em.find(Customer.class, Integer.parseInt(custId));
			customer.setPassword(password);
			customer.setUserName(userName);
			customer.setFirstname(firstname);
			customer.setLastname(lastname);
			customer.setAddress(address);
			customer.setCity(city);
			customer.setProvince(province);
			customer.setPostalCode(postalCode);
			customer.setCountry(country);
			dataModeler.setCustomer(customer);
			em.persist(customer);
			em.getTransaction().commit();
			em.close();
			
		} catch (NumberFormatException e) {
			dataModeler.setMessage("Invalid User Id format.");
			return new ModelAndView("user-profile", "dataModeler", dataModeler);
		}catch (Exception e) {
			dataModeler.setMessage(e.getMessage());
			return new ModelAndView("user-profile", "dataModeler", dataModeler);
		}
		dataModeler.setInfo("User Profile Updated Successfully.");
		return new ModelAndView("user-profile", "dataModeler", dataModeler);
	}
}
