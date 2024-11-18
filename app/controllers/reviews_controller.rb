class ReviewsController < ApplicationController
    # GET /reviews
    def new
      @review = Review.new
    end
  
    # POST /reviews
    def create
      @review = Review.new(review_params)
  
      # Check if the entered PIN code matches the predefined PIN code
      if params[:review][:pin_code] == '2269'
        # Save the review if the pin code is correct
        if @review.save
          redirect_to reviews_path, notice: 'Review submitted successfully.'
        else
          redirect_to reviews_path, alert: 'There was an error submitting your review.'
        end
      else
        # If the PIN code is incorrect, show a flash message
        flash[:alert] = "Incorrect Pin Code. You are not authorized to give a review. Please contact us for access."
        redirect_to root_path
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:name, :content, :image)
    end
  end
  