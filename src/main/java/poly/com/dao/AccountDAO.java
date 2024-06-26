package poly.com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import poly.com.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String>{

}
