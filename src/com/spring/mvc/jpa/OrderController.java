package com.spring.mvc.jpa;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

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
public class OrderController {
	private static EntityManagerFactory factory;
	private static EntityManager em;
	
	// user click "Let's Start Shopping" on home page
	@RequestMapping(value="/create-order", method=RequestMethod.GET)
	public ModelAndView createOrder(HttpServletRequest request, HttpServletResponse response) {
		
		String custId = request.getParameter("custId");

		factory = Persistence.createEntityManagerFactory("Li_COMP303_Assignment2");
		em = factory.createEntityManager();
		DataModeler dataModeler = new DataModeler();
		
		try {
			em.getTransaction().begin();
			Customer customer = em.find(Customer.class, Integer.parseInt(custId));
			Query query = em.createQuery("select e from Product e");
			List<Product> productList = query.getResultList();
			dataModeler.setCustomer(customer);
			dataModeler.setProductList(productList);
			em.close();
			
		} catch (NumberFormatException e) {
			dataModeler.setMessage("Invalid User Id.");
			return new ModelAndView("user-home", "customer", dataModeler.getCustomer());
		}
		catch (Exception e) {
			dataModeler.setMessage(e.getMessage());
			return new ModelAndView("user-home", "customer", dataModeler.getCustomer());
		}
		return new ModelAndView("order-form", "dataModeler", dataModeler);
	}
	
	// user click "Order Now" on order-form page
	@RequestMapping(value="/submit-order", method=RequestMethod.POST)
	public ModelAndView submitOrder(HttpServletRequest request, HttpServletResponse response) {
		
		String custId = request.getParameter("custId");
		String productId = request.getParameter("productId");
		String quantity = request.getParameter("quantity");
		
		String creditCardNumber = request.getParameter("creditCardNumber");
		String expMonth = request.getParameter("ExpDtMonth");
		String expYear = request.getParameter("ExpDtYear");
		
		factory = Persistence.createEntityManagerFactory("Li_COMP303_Assignment2");
		em = factory.createEntityManager();
		Orders order = new Orders();
		DataModeler dataModeler = new DataModeler();
		dataModeler.setPaymentMethod("Credit Card");
		dataModeler.setCreditCardNumber(String.format("%s%s", "***", creditCardNumber.substring(creditCardNumber.length()-4, creditCardNumber.length())));
		try {
			em.getTransaction().begin();
			Customer customer = em.find(Customer.class, Integer.parseInt(custId));
			Product product = em.find(Product.class, Integer.parseInt(productId));
			dataModeler.setCustomer(customer);
			dataModeler.setProduct(product);
			Query query = em.createQuery("select e from Product e");
			List<Product> productList = query.getResultList();
			dataModeler.setProductList(productList);
			
			LocalDateTime dateTime = LocalDateTime.now();
			
			// validate credit card expiry date
			int currentYear = dateTime.getYear();
			int currentMonth = dateTime.getMonthValue();
			if((currentYear*12+currentMonth) > (Integer.parseInt(expYear)*12+Integer.parseInt(expMonth))) {
				em.close();
				dataModeler.setMessage("Sorry, Payment information is invalid. This order hasn't been placed.");
				return new ModelAndView("order-form", "dataModeler", dataModeler);
			}
			
			// generate delivery date and set order status
			Timestamp orderTimestamp = Timestamp.valueOf(dateTime);
			dateTime = dateTime.plusHours(24);
			Timestamp deliveryDate = Timestamp.valueOf(dateTime);
			String orderStatus = "Order Created";
			
			// set order information and insert to database
			order.setCustId(customer.getCustId());
			order.setDeliveryDate(deliveryDate);
			order.setOrderStatus(orderStatus);
			order.setOrderTimestamp(orderTimestamp);
			order.setProdId(product.getProductId());
			order.setQuantity(Integer.parseInt(quantity));
			dataModeler.setOrders(order);
			em.persist(order);
			em.getTransaction().commit();
			em.close();
			
		} catch (Exception e) {
			// catch other exceptions and display error message
			dataModeler.setMessage("Sorry, Transaction has been rejected. This order hasn't been placed. "+e.getMessage());
			return new ModelAndView("order-form", "dataModeler", dataModeler);
		}
		// redirect to order-summary upon successful order
		dataModeler.setInfo("Your Order has been created successfully. Thank you for shopping with Digitel.");
		return new ModelAndView("order-summary", "dataModeler", dataModeler);
	}
	
	// user click "My Orders" on dropdown menu under user name
	@RequestMapping(value="/manage-order", method=RequestMethod.GET)
	public ModelAndView manageOrder(HttpServletRequest request, HttpServletResponse response) {
		
		String custId = request.getParameter("custId");

		factory = Persistence.createEntityManagerFactory("Li_COMP303_Assignment2");
		em = factory.createEntityManager();
		DataModeler dataModeler = new DataModeler();
		
		try {
			em.getTransaction().begin();
			Query query = em.createQuery("select e from Orders e where e.custId="+custId);
			Customer customer = em.find(Customer.class, Integer.parseInt(custId));
			List<Orders> orderList = query.getResultList();
			dataModeler.setOrderList(orderList);
			if(orderList.isEmpty()) {
				dataModeler.setOrderInfo("You don't have any order.");
			}
			dataModeler.setCustomer(customer);
			em.close();
			
		} catch (NumberFormatException e) {
			dataModeler.setMessage("Invalid User Id.");
			return new ModelAndView("user-home", "customer", dataModeler.getCustomer());
		}
		catch (Exception e) {
			dataModeler.setMessage(e.getMessage());
			return new ModelAndView("user-home", "customer", dataModeler.getCustomer());
		}
		return new ModelAndView("order-management", "dataModeler", dataModeler);
	}
	
	// user click "Edit" in order management action column
	@RequestMapping(value="/edit-order", method=RequestMethod.GET)
	public ModelAndView editOrder(HttpServletRequest request, HttpServletResponse response) {
		
		String orderId = request.getParameter("orderId");

		factory = Persistence.createEntityManagerFactory("Li_COMP303_Assignment2");
		em = factory.createEntityManager();
		DataModeler dataModeler = new DataModeler();
		
		try {
			em.getTransaction().begin();
			Orders order = em.find(Orders.class, Short.parseShort(orderId));
			Customer customer = em.find(Customer.class, order.getCustId());
			Product product = em.find(Product.class, order.getProdId());
			
			// update order status for 24 hrs
			Timestamp orderTime = order.getOrderTimestamp();
			LocalDateTime confirmTime = orderTime.toLocalDateTime().plusHours(24);
			if(confirmTime.compareTo(LocalDateTime.now())<0) {
				order.setOrderStatus("Order Confirmed");
				em.persist(order);
				em.getTransaction().commit();
			}
			
			// get full list of products
			Query query = em.createQuery("select e from Product e");
			List<Product> productList = query.getResultList();
			dataModeler.setProductList(productList);
			
			// get updated list of orders
			query = em.createQuery("select e from Orders e where e.custId="+Integer.toString(order.getCustId()));
			List<Orders> orderList = query.getResultList();
			dataModeler.setOrderList(orderList);
			if(orderList.isEmpty()) {
				dataModeler.setOrderInfo("You don't have any order.");
			}
			dataModeler.setOrders(order);
			dataModeler.setCustomer(customer);
			dataModeler.setProduct(product);
			em.close();
			
		}catch (Exception e) {
			dataModeler.setMessage(String.format("Error upon getting information of Order #%s. %s", orderId, e.getMessage()));
			return new ModelAndView("order-management", "dataModeler", dataModeler);
		}
		
		return new ModelAndView("order-update", "dataModeler", dataModeler);
	}
	
	// user click "Update Order" in order-update page
	@RequestMapping(value="/update-order", method=RequestMethod.POST)
	public ModelAndView updateOrder(HttpServletRequest request, HttpServletResponse response) {
		
		String orderId = request.getParameter("orderId");
		String custId = request.getParameter("custId");
		String productId = request.getParameter("productId");
		String quantity = request.getParameter("quantity");

		factory = Persistence.createEntityManagerFactory("Li_COMP303_Assignment2");
		em = factory.createEntityManager();
		DataModeler dataModeler = new DataModeler();
		
		try {
			em.getTransaction().begin();
			Orders order = em.find(Orders.class, Short.parseShort(orderId));
			Customer customer = em.find(Customer.class, Integer.parseInt(custId));
			Product product = em.find(Product.class, Integer.parseInt(productId));

			// get full list of products
			Query query = em.createQuery("select e from Product e");
			List<Product> productList = query.getResultList();
			dataModeler.setProductList(productList);

			// check 24hr from status
			if(order.getOrderStatus().equals("Order Confirmed")) {
				// pack dataModeler
				dataModeler.setOrders(order);
				dataModeler.setCustomer(customer);
				dataModeler.setProduct(product);
				em.close();
				dataModeler.setMessage(String.format("Order #%s has been ordered more than 24 hours, no update allowed", orderId));
				return new ModelAndView("order-update", "dataModeler", dataModeler);
			}
			
			// update order
			order.setProdId(Integer.parseInt(productId));
			order.setQuantity(Integer.parseInt(quantity));
			em.persist(order);
			em.getTransaction().commit();
			
			// pack dataModeler
			dataModeler.setOrders(order);
			dataModeler.setCustomer(customer);
			dataModeler.setProduct(product);
			dataModeler.setCreditCardNumber("Hidden for updated order");
			dataModeler.setPaymentMethod("Hidden for updated order");
			em.close();
			
		}catch (Exception e) {
			dataModeler.setMessage(String.format("Error upon Updating Order #%s. %s", orderId, e.getMessage()));
			return new ModelAndView("order-update", "dataModeler", dataModeler);
		}
		dataModeler.setInfo(String.format("Your Order #%s has been updated successfully", orderId));
		return new ModelAndView("order-summary", "dataModeler", dataModeler);
	}
	
	// user click "Delete" in order management action column
	@RequestMapping(value="/delete-order", method=RequestMethod.GET)
	public ModelAndView deleteOrder(HttpServletRequest request, HttpServletResponse response) {
		
		String orderId = request.getParameter("orderId");

		factory = Persistence.createEntityManagerFactory("Li_COMP303_Assignment2");
		em = factory.createEntityManager();
		DataModeler dataModeler = new DataModeler();
		
		try {
			em.getTransaction().begin();
			Orders order = em.find(Orders.class, Short.parseShort(orderId));
			Customer customer = em.find(Customer.class, order.getCustId());
			Query query = em.createQuery("select e from Orders e where e.custId="+Integer.toString(order.getCustId()));
			dataModeler.setCustomer(customer);
			
			// update order status for 24 hrs and check 24hr from status
			Timestamp orderTime = order.getOrderTimestamp();
			LocalDateTime confirmTime = orderTime.toLocalDateTime().plusHours(24);
			if(confirmTime.compareTo(LocalDateTime.now())<0) {
				order.setOrderStatus("Order Confirmed");
				em.persist(order);
				em.getTransaction().commit();
				
				// get full list of orders
				List<Orders> orderList = query.getResultList();
				dataModeler.setOrderList(orderList);
				if(orderList.isEmpty()) {
					dataModeler.setOrderInfo("You don't have any order.");
				}
				em.close();
				dataModeler.setMessage(String.format("Order #%s has been ordered more than 24 hours, no cancellation is allowed", orderId));
				return new ModelAndView("order-management", "dataModeler", dataModeler);
			}
			
			// delete order
			em.remove(order);
			em.getTransaction().commit();
			// get updated list of orders
			List<Orders> orderList = query.getResultList();
			dataModeler.setOrderList(orderList);
			if(orderList.isEmpty()) {
				dataModeler.setOrderInfo("You don't have any order.");
			}
			em.close();
			
		}catch (Exception e) {
			dataModeler.setMessage(String.format("Error upon Deleting Order #%s. %s", orderId, e.getMessage()));
			return new ModelAndView("order-management", "dataModeler", dataModeler);
		}
		dataModeler.setInfo(String.format("Your Order #%s has been canceled successfully", orderId));
		return new ModelAndView("order-management", "dataModeler", dataModeler);
	}
}
