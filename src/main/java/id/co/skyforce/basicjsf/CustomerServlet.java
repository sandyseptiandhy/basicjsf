package id.co.skyforce.basicjsf;

import id.co.skyforce.basicjsf.domain.Address;
import id.co.skyforce.basicjsf.domain.Customer;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.soap.AddressingFeature.Responses;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import id.co.skyforce.basicjsf.HibernateUtil;



public class CustomerServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pilihan = req.getParameter("action");
		
		if(pilihan.equals("create")){
		
		String firstName = req.getParameter("first_name");
		String lastName = req.getParameter("last_name");
		String email = req.getParameter("email");
		String homePhone = req.getParameter("home_phone");
		String mobilePhone = req.getParameter("mobile_phone");
		String password = req.getParameter("password");
		
		SimpleDateFormat formatter =  new SimpleDateFormat("dd-MM-yyyy");
		Date birthDate = null;
		try {
			birthDate = formatter.parse(req.getParameter("birth_date"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		String street = req.getParameter("street");
		String city = req.getParameter("city");
		String postalCode = req.getParameter("postal_code");
		
		
		Session session = HibernateUtil.openSession();
		Transaction trx = session.beginTransaction();
		Customer cus = new Customer();
		cus.setFirstName(firstName);
		cus.setLastName(lastName);
		cus.setEmail(email);
		cus.setHomePhone(homePhone);
		cus.setMobileNo(mobilePhone);
		cus.setPassword(password);
		cus.setBirthDate(birthDate);
		
		Address ad = new Address();
		ad.setStreet(street);
		ad.setCity(city);
		ad.setPostalCode(postalCode);
		cus.setAddress(ad);
		
		session.save(cus);
		trx.commit();
		session.close();
		
		req.getRequestDispatcher("success.jsp").forward(req, resp);
		} else if(pilihan.equals("update")){
			
			String idCustomer = req.getParameter("id_customer");
			Long id = Long.parseLong(idCustomer);
			
			String firstName = req.getParameter("first_name");
			String lastName = req.getParameter("last_name");
			String email = req.getParameter("email");
			String homePhone = req.getParameter("home_phone");
			String mobilePhone = req.getParameter("mobile_phone");
			String password = req.getParameter("password");
			
			SimpleDateFormat formatter =  new SimpleDateFormat("dd-mm-yyyy");
			Date birthDate = null;
			try {
				birthDate = formatter.parse(req.getParameter("birth_date"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			String street = req.getParameter("street");
			String city = req.getParameter("city");
			String postalCode = req.getParameter("postal_code");
			
			
			Session session = HibernateUtil.openSession();
			Transaction trx = session.beginTransaction();
			Customer cus = (Customer) session.get(Customer.class, id);
			cus.setFirstName(firstName);
			cus.setLastName(lastName);
			cus.setEmail(email);
			cus.setHomePhone(homePhone);
			cus.setMobileNo(mobilePhone);
			cus.setPassword(password);
			cus.setBirthDate(birthDate);
			
			cus.getAddress().setStreet(street);
			cus.getAddress().setCity(city);
			cus.getAddress().setPostalCode(postalCode);
			
			session.save(cus);

		
			trx.commit();
			session.close();
			resp.sendRedirect("list");
			
		}else if(pilihan.equals("delete")){
			String idCustomer = req.getParameter("id_customer");
			Long id = Long.parseLong(idCustomer);
			
			Session session = HibernateUtil.openSession();
			Transaction trx = session.beginTransaction();
			Customer cus = (Customer) session.get(Customer.class, id);
			session.delete(cus);
			trx.commit();
			session.close();
//			req.getRequestDispatcher("success.jsp").forward(req, resp);
			resp.sendRedirect("list");

		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Session session = HibernateUtil.openSession();
		Query query = session.createQuery("from Customer");
		List<Customer> cus = query.list();
		
		req.setAttribute("customers", cus);

		RequestDispatcher rd = req.getRequestDispatcher("list.jsp");
		rd.forward(req, resp);
		session.close();
	}
	
	
}