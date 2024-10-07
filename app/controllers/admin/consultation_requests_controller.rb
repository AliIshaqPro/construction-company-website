class Admin::ConsultationRequestsController < ApplicationController
  before_action :authenticate_admin! # Ensure you have authentication set up

  def index
    @consultation_requests = ConsultationRequest.all
  end
end
