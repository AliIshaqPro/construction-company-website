class ReviewsController < ApplicationController
    def create
      @review = Review.new(review_params)
      if @review.save
        redirect_to reviews_path, notice: 'Review submitted successfully!'
      else
        redirect_to reviews_path, alert: 'Failed to submit review.'
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:name, :content, :image)
    end
  end
  