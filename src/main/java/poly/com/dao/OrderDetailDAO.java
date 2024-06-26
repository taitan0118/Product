package poly.com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import poly.com.entity.OrderDetail;
import poly.com.entity.Report;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{
	
	@Query("select new Report(o.category.name, sum(o.price), count(o)) from Product o group by o.category.name order by sum(o.price) desc")
	List<Report> getInventoryByCategory();
}
