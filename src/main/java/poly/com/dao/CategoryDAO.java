package poly.com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.com.entity.Category;
import poly.com.entity.Report;

public interface CategoryDAO extends JpaRepository<Category, String>{
	List<Category> findByName(String name);
}
