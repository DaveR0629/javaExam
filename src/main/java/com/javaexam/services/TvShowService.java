package com.javaexam.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.javaexam.models.Review;
import com.javaexam.models.TvShow;
import com.javaexam.repositorys.ReviewRepository;
import com.javaexam.repositorys.TvShowRepository;

@Service
public class TvShowService {

	private static TvShowRepository showRepo;
	private static ReviewRepository revRepo;

	public TvShowService(TvShowRepository showRepo, ReviewRepository revRepo) {
		this.showRepo = showRepo;
		this.revRepo = revRepo;
	}

	public TvShow create(TvShow newTvShow) {
		return showRepo.save(newTvShow);
	}

	public Review create(Review newReview) {
		List<Review> matchingReviews = revRepo.matchingReviews(newReview.getUser().getId(),
				newReview.getTvShow().getId());
		if (matchingReviews.size() > 0) {
			return null;
		}
		newReview.setId(null);
		return revRepo.save(newReview);
	}

	public List<TvShow> getTvShow() {
		return (List<TvShow>) showRepo.findAll();
	}

	public TvShow getTvShow(Long id) {
		Optional<TvShow> show = showRepo.findById(id);
		return show.isPresent() ? show.get() : null;
	}

	public TvShow saveTvShow(TvShow show) {
		return showRepo.save(show);
	}

	public List<Review> descRev() {
		return revRepo.descRev();
	}

	public List<Review> ascRev() {
		return revRepo.ascRev();
	}

	public TvShow update(TvShow toUpdate, Long id) {
		return showRepo.save(toUpdate);
	}

	public void destory(TvShow toDelete, Long id) {
		showRepo.delete(toDelete);
	}

}
