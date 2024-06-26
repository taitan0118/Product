package poly.com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import poly.com.entity.Report;
import poly.com.entity.Product;
import poly.com.entity.Category;


public interface ProductDAO extends JpaRepository<Product, Integer>{
//	List<Product> findByIdItem(Integer id);
	Page<Product> findBySaleBetween(double min, double max, Pageable page);
	
	Page<Product> findAllByNameLike(String keywords, Pageable page);
	
	Page<Product> findAllBySex(Boolean sex,Pageable page);

	Page<Product> findByCategory(Category category, Pageable page);
	
	
	@Query("select new Report(o.category.name, sum(o.price), count(o)) from Product o group by o.category.name order by sum(o.price) desc")
	List<Report> getInventoryByCategory();
}
