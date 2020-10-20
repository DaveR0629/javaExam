package com.javaexam.repositorys;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.javaexam.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	Optional<User> findByUserName(String userName);

}
