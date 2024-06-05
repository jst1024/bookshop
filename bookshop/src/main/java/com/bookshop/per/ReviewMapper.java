package com.bookshop.per;

import java.util.List;

import com.bookshop.domain.Review;

public interface ReviewMapper {
	public List<Review> getReviewList();
	public Review getReview(int rno);
	public void insReview(Review review);
	public void upReview(Review review);
	public void delReview(int nno);
}
