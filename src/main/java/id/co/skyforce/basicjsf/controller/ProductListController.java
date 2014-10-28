package id.co.skyforce.basicjsf.controller;

import id.co.skyforce.basicjsf.HibernateUtil;
import id.co.skyforce.basicjsf.domain.Product;

import java.util.List;

import javax.faces.bean.ManagedBean;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

@ManagedBean
public class ProductListController {
	
	private List<Product> products;

	public ProductListController() {
		Session session = HibernateUtil.openSession();
		Transaction trx = session.beginTransaction();
		
		products = session.createQuery("from Product").list();
		
		for (Product pro : products) {
			Hibernate.initialize(pro.getCategory().getId());
			Hibernate.initialize(pro.getSupplier()); //untuk manggil lazy fetch type
		}
		trx.commit();
		session.close();
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
	
	
	

}
