package poly.com.cart;

import java.util.Collection;

import poly.com.entity.Product;


public interface ShoppingCartService {
	
	Product add(Product item);
	
	Product update(Integer id, int qty);
	
	void remove(Integer id);
	
	void clear();
	
	Collection<Product> getItems();
	
	int getCount();
	
	double getAmount();
	
}
