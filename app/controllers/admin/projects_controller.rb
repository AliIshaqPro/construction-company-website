# app/controllers/admin/projects_controller.rb
class Admin::ProjectsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_project, only: [:show, :edit, :update, :destroy] # Set project for actions that require it

  def index
    @projects = Project.all  # Fetch all projects from the database
  end

  def show
    @project = Project.find(params[:id])  # Find the client by ID
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to admin_projects_path, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def edit
    # @project is set in the set_project method
  end

  def update
    if @project.update(project_params)
      redirect_to admin_projects_path, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to admin_projects_path, notice: 'Project was successfully deleted.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to admin_projects_path, alert: 'Project not found.'
  end

  def project_params
    params.require(:project).permit(:title, :description, :image)
  end
end
