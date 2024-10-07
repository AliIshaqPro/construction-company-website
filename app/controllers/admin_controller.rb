class AdminController < ApplicationController
    before_action :authenticate_admin!  # Ensure only authenticated admins can access these actions
  
    # Projects Actions
    def index
      @projects = Project.all
      @clients = Client.all
      @feedbacks = Feedback.all
      @consultation_requests = ConsultationRequest.all
      @subscriptions = Subscription.all
    end
    
    # Projects CRUD
    def new_project
      @project = Project.new
    end
  
    def create_project
      @project = Project.new(project_params)
      if @project.save
        redirect_to admin_index_path, notice: 'Project was successfully created.'
      else
        render :new_project
      end
    end
  
    def edit_project
      @project = Project.find(params[:id])
    end
  
    def update_project
      @project = Project.find(params[:id])
      if @project.update(project_params)
        redirect_to admin_index_path, notice: 'Project was successfully updated.'
      else
        render :edit_project
      end
    end
  
    def destroy_project
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to admin_index_path, notice: 'Project was successfully deleted.'
    end
  
    # Clients CRUD
    def new_client
      @client = Client.new
    end
  
    def create_client
      @client = Client.new(client_params)
      if @client.save
        redirect_to admin_index_path, notice: 'Client was successfully created.'
      else
        render :new_client
      end
    end
  
    def edit_client
      @client = Client.find(params[:id])
    end
  
    def update_client
      @client = Client.find(params[:id])
      if @client.update(client_params)
        redirect_to admin_index_path, notice: 'Client was successfully updated.'
      else
        render :edit_client
      end
    end
  
    def destroy_client
      @client = Client.find(params[:id])
      @client.destroy
      redirect_to admin_index_path, notice: 'Client was successfully deleted.'
    end
  
    # Feedback CRUD
    def new_feedback
      @feedback = Feedback.new
    end
  
    def create_feedback
      @feedback = Feedback.new(feedback_params)
      if @feedback.save
        redirect_to admin_index_path, notice: 'Feedback was successfully created.'
      else
        render :new_feedback
      end
    end
  
    def edit_feedback
      @feedback = Feedback.find(params[:id])
    end
  
    def update_feedback
      @feedback = Feedback.find(params[:id])
      if @feedback.update(feedback_params)
        redirect_to admin_index_path, notice: 'Feedback was successfully updated.'
      else
        render :edit_feedback
      end
    end
  
    def destroy_feedback
      @feedback = Feedback.find(params[:id])
      @feedback.destroy
      redirect_to admin_index_path, notice: 'Feedback was successfully deleted.'
    end
  
    private
  
    def project_params
      params.require(:project).permit(:title, :description, :image)
    end
  
    def client_params
      params.require(:client).permit(:name, :company, :image)
    end
  
    def feedback_params
      params.require(:feedback).permit(:client_id, :content, :rating)
    end
  end
  