package it.uniroma3.controller;

import it.uniroma3.model.Order;
import it.uniroma3.model.OrderLine;
import it.uniroma3.model.Product;
import it.uniroma3.model.ProductFacade;
import it.uniroma3.model.Provider;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class ProductController {

	private String name;
	private Float price;
	private String description;
	private String code;
	private Integer quantity;
	private Product product;
	private List<Product> products;
	private Map<Product, Integer> productsQuantity;

	@EJB(beanName = "pFacade")
	private ProductFacade productFacade;



	public void fixCartQuantity() {

	}
	public void confirmOrder() {
		this.productsQuantity = null;//reset for future use
	}
	public String getProductsFromSearch() {
		this.products = productFacade.getProductFromSearch(getName());
		return "products";
	}

	public String selectProduct(Product product) {
		this.product = product;
		return "product";
	}

	public String createProduct() {
		this.product = productFacade.createProduct(name, code, price, description);
		return "product";
	}

	public void saveProductProviders(List<Provider> productProviders) {
		product.setProviders(productProviders);
		productFacade.updateProduct(product);
	}

	public String saveSelectedProviderProducts(Provider provider) {
		loadAllProducts();
		List<Product> providerProducts = provider.getProducts();
		for (int i = 0; i < products.size(); i++) {
			if(providerProducts==null || providerProducts.equals(null)){
				providerProducts = new ArrayList<Product>();
			}else{
				if(productsQuantity.get(products.get(i)).intValue()==0){//must remove product
					if(providerProducts.contains(products.get(i))){
						providerProducts.remove(products.get(i));
					}
				}else{//the product is provided by this provider
					int n = 0;//quantity distributed actually
					for (int q = 0; q < provider.getProducts().size(); q++) {
						if(provider.getProducts().get(q).equals(products.get(i))){
							n++;
						}
					}
					if(productsQuantity.get(products.get(i)).intValue()>n){//must add products to provider
						for(int q = 0; q< productsQuantity.get(products.get(i)).intValue()-n;q++){
							providerProducts.add(products.get(i));
						}
					}else if(productsQuantity.get(products.get(i)).intValue()<n){//must remove products from provider
						for(int q = 0; q< n-productsQuantity.get(products.get(i)).intValue();q++){
							providerProducts.remove(products.get(i));
						}
					}
					
				}
				
			}

		}
		provider.setProducts(providerProducts);
		return "provider";
	}

	public String discardSelectedProviderProducts() {
		productsQuantity = null;
		return "provider";
	}

	public String selectProducts(Provider provider) {
		loadAllProducts();
		
		this.productsQuantity = new HashMap<Product, Integer>();
		for (int i = 0; i < products.size(); i++) {
			if (provider.getProducts() != null && !provider.getProducts().equals(null) && provider.getProducts().contains(products.get(i))) {
				int n = 0;
				for (int q = 0; q < provider.getProducts().size(); q++) {
					
					if(provider.getProducts().get(q).equals(products.get(i))){
						n++;
					}
				}
				productsQuantity.put(products.get(i), n);
			} else {
				productsQuantity.put(products.get(i), 0);
			}

		}
		return "productSelection";
	}

	public void selectProducts(Order order) {
		loadAllProducts();
		if (order == null) {//new order
			this.productsQuantity = new HashMap<Product, Integer>();
			for (int i = 0; i < products.size(); i++) {
				productsQuantity.put(products.get(i), 0);
			}
		}else{//old empty order
			List<OrderLine> orderlines = order.getOrderLines();
			if(orderlines == null || orderlines.equals(null) || orderlines.isEmpty()){
				this.productsQuantity = new HashMap<Product, Integer>();
				for (int i = 0; i < products.size(); i++) {
					productsQuantity.put(products.get(i), 0);
				}
			}else{//old order
				this.productsQuantity = new HashMap<Product, Integer>();
				List<Product> notOrdered = new ArrayList<Product>(products);
				for(int i = 0; i < orderlines.size() ; i++){
					notOrdered.remove(orderlines.get(i).getProduct());
					productsQuantity.put(orderlines.get(i).getProduct(),orderlines.get(i).getQuantity());
				}
				for(int i = 0; i<notOrdered.size() ; i++){
					productsQuantity.put(notOrdered.get(i),0);
				}
			}
		}
	}

	public String listProducts(Order order) {
		selectProducts(order);
		return "products";
	}

	public void loadAllProducts() {
		this.products = productFacade.getAllProducts();
	}

	public String getName() {
		return name;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getDescription() {
		return description;

	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Product getProduct() {
		return product;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public ProductFacade getProductFacade() {
		return productFacade;
	}

	public void setProductFacade(ProductFacade productFacade) {
		this.productFacade = productFacade;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String openNewProductPage() {
		return "newProduct";
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Map<Product, Integer> getProductsQuantity() {
		return productsQuantity;
	}

	public void setProductsQuantity(Map<Product, Integer> productsQuantity) {
		this.productsQuantity = productsQuantity;
	}

}
