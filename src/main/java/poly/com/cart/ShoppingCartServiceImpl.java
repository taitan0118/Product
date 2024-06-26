package poly.com.cart;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import jakarta.annotation.PostConstruct;
import poly.com.dao.ProductDAO;
import poly.com.entity.Product;

@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {

	@Autowired
	ProductDAO proDao;

	Map<Integer, Product> map = new HashMap<>();

	
	@Override
	public Product add(Product item) {
		
		// TODO Auto-generated method stub
		Product product = map.get(item.getId());
		if(product == null) {
			map.put(item.getId(), item);
		}else {
			product.setQuantity(product.getQuantity() + 1);
		}
		return null;
	}

	@Override
	public Product update(Integer id, int sl) {
		// TODO Auto-generated method stub
		Set set = map.keySet();
		for (Object key : set) {
			if (map.get(key).getId() == id) {
				map.get(key).setQuantity(sl);
				map.replace((Integer) key, map.get(key));
				return map.get(key);
			}
		}
		return null;
	}

	@Override
	public void remove(Integer id) {
		// TODO Auto-generated method stub
		Set set = map.keySet();
		for (Object key : set) {
			if (map.get(key).getId() == id) {
				map.remove(key);

				break;
			}
		}
	}

	@Override
	public void clear() {
		// TODO Auto-generated method stub
		map.clear();
	}

	@Override
	public Collection<Product> getItems() {
		// TODO Auto-generated method stub
		return map.values();
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		int count = 0;
		Set set = map.keySet();
		for (Object key : set) {
			count += map.get(key).getQuantity();
		}
		return count;
	}

	@Override
	public double getAmount() {
		// TODO Auto-generated method stub
		int amount = 0;
		Set set = map.keySet();
		for (Object key : set) {
			amount += (map.get(key).getQuantity() * map.get(key).getSale());
		}
		return amount;
	}

}
