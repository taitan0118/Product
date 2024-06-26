package poly.com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.com.entity.Order;

public interface OrderDAO extends JpaRepository<Order, Long>{

}
