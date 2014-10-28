package id.co.skyforce.basicjsf.controller;

import id.co.skyforce.basicjsf.HibernateUtil;
import id.co.skyforce.basicjsf.domain.Category;
import id.co.skyforce.basicjsf.domain.Product;
import id.co.skyforce.basicjsf.domain.Supplier;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import org.hibernate.Session;
import org.hibernate.Transaction;


@ManagedBean
public class ProductController {

	private Long productId;
	private String name;
	private BigDecimal price;
	private Integer stock;
	private String description;
	private Category category;
	private Supplier supplier;
	private Long categoryId;
	private Long supplierId;
	
	private List<Category> categories;
	private List<Supplier> suppliers;
	public ProductController() {
		String id = FacesContext.getCurrentInstance()
				.getExternalContext()
				.getRequestParameterMap().get("id");
		Session session = HibernateUtil.openSession();
		Transaction trx = session.beginTransaction();
		if(id!=null){
			productId = Long.valueOf(id);
			
			Product pro = (Product) session.get(Product.class, productId);
			
			name = pro.getName();
			price = pro.getPrice();
			stock = pro.getStock();
			description = pro.getDescription();
			categoryId = pro.getCategory().getId();
			supplierId = pro.getSupplier().getId();
			
			
			
			
		}
		categories = session.createQuery("from Category").list();
		suppliers = session.createQuery("from Supplier").list();
		trx.commit();
		session.close();
	}
	

	
	public List<Supplier> getSuppliers() {
		return suppliers;
	}



	public void setSuppliers(List<Supplier> suppliers) {
		this.suppliers = suppliers;
	}



	public List<Category> getCategories() {
		return categories;
	}




	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}




	public String save(){
		Session session = HibernateUtil.openSession();
		Transaction trx = session.beginTransaction();
		Category kat = (Category) session.get(Category.class, categoryId);
		Supplier sup = (Supplier) session.get(Supplier.class, supplierId);
		Product pro = new Product(name, price, stock, description);
		pro.setId(productId);
		pro.setCategory(kat);
		pro.setSupplier(sup);
		session.saveOrUpdate(pro);
		trx.commit();
		session.close();
		
		return "list";
		
	}
	
	public void delete(){
		String id = FacesContext.getCurrentInstance()
				.getExternalContext()
				.getRequestParameterMap().get("idDelete");
		productId = Long.valueOf(id);
		Session session = HibernateUtil.openSession();
		Transaction trx = session.beginTransaction();	
		
		Product pro = (Product)session.get(Product.class, productId);
		session.delete(pro);
		trx.commit();
		session.close();
		
		ExternalContext externalContext = FacesContext.getCurrentInstance().getExternalContext();
        try {
            externalContext.redirect("list.xhtml");
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
	
	
	public Long getSupplierId() {
		return supplierId;
	}


	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}


	public Long getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}


	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Supplier getSupplier() {
		return supplier;
	}
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	
	
}
