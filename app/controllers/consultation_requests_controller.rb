class ConsultationRequestsController < ApplicationController
  def new
    @consultation_request = ConsultationRequest.new
  end
  def index
    @consultation_requests = ConsultationRequest.all
  end

  def create
    @consultation_request = ConsultationRequest.new(consultation_request_params)
    if @consultation_request.save
      redirect_to root_path, notice: 'Your consultation request has been submitted successfully.'
    else
      render :new
    end
  end

  private

  def consultation_request_params
    params.require(:consultation_request).permit(:name, :email, :phone, :project_type, :consultant, :preferred_date, :message)
  end
end
