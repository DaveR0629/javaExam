package com.javaexam.repositorys;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.javaexam.models.Review;

@Repository
public interface ReviewRepository extends CrudRepository<Review, Long> {
	@Query(value = "SELECT * FROM reviews WHERE user_id = ?1 AND tv_show_id = ?2", nativeQuery = true)
	List<Review> matchingReviews(Long user_id, Long tv_show_id);

	@Query(value = "SELECT * FROM reviews ORDER BY rating DESC", nativeQuery = true)
	List<Review> descRev();

	@Query(value = "SELECT * FROM reviews ORDER BY rating ASC", nativeQuery = true)
	List<Review> ascRev();
}
