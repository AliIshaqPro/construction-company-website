class ReviewsController < ApplicationController
  # GET /reviews/new
  def new
    @review = Review.new
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to reviews_path, notice: 'Review submitted successfully.'
    else
      redirect_to reviews_path, alert: 'There was an error submitting your review. Please try again.'
    end
  end

  # DELETE /reviews/:id
  def destroy
    @review = Review.find_by(id: params[:id])
    if @review
      @review.image.purge_later if @review.image.attached?
      @review.destroy
      redirect_to reviews_path, notice: 'Review was successfully deleted.'
    else
      redirect_to reviews_path, alert: 'Review not found.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :content, :image)
  end
end
