class ReviewsController < ApplicationController
    # GET /reviews/new
    def new
      @review = Review.new
    end
  
    # POST /reviews
    def create
      @review = Review.new(review_params)
  
      # Check if the entered PIN code matches the predefined PIN code
      if params[:review][:pin_code] == '2269'
        if @review.save
          redirect_to reviews_path, notice: 'Review submitted successfully.'
        else
          redirect_to reviews_path, alert: 'There was an error submitting your review. Please try again.'
        end
      else
        flash[:alert] = "Incorrect Pin Code. You are not authorized to give a review. Please contact us for access."
        redirect_to root_path
      end
    end
  
    # DELETE /reviews/:id
    def destroy
      @review = Review.find_by(id: params[:id])
      if params[:pin_code] == '2269188' # Validate the PIN code
        if @review
          @review.image.purge_later if @review.image.attached?
          @review.destroy
          redirect_to reviews_path, notice: 'Review was successfully deleted.'
        else
          redirect_to reviews_path, alert: 'Review not found.'
        end
      else
        flash[:alert] = "Incorrect Pin Code. You are not authorized to delete this review."
        redirect_to reviews_path
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:name, :content, :image)
    end
  end
  