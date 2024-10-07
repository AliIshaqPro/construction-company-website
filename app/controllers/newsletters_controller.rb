# app/controllers/newsletters_controller.rb
class NewslettersController < ApplicationController
    def create
      @subscription = Subscription.new(subscription_params)
  
      if @subscription.save
        flash[:notice] = "Thank you for subscribing! You'll receive updates soon."
        redirect_to root_path # Redirect to the homepage or another page
      else
        flash[:alert] = "There was an error subscribing. Please try again."
        redirect_to root_path
      end
    end
  
    private
  
    def subscription_params
      params.require(:subscription).permit(:email)
    end
  end
  