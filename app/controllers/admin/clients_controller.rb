# app/controllers/admin/clients_controller.rb
class Admin::ClientsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @clients = Client.all  # Fetch all clients from the database
  end

  def new
    @client = Client.new  # Initialize a new client instance
  end
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to admin_clients_path, notice: 'Client was successfully created.'
    else
      render :new
    end
  end
  
  def show
    @client = Client.find(params[:id])  # Find the client by ID
  end
  
  def edit
    @client = Client.find(params[:id])  # Find the client by ID for editing
  end
  
  def update
    @client = Client.find(params[:id])  # Find the client to update
    if @client.update(client_params)
      redirect_to admin_clients_path, notice: 'Client was successfully updated.'  # Redirect to index on success
    else
      render :edit  # Render the edit form again if update fails
    end
  end
  
  def destroy
    @client = Client.find(params[:id])  # Find the client to destroy
    @client.destroy  # Destroy the client
    redirect_to admin_clients_path, notice: 'Client was successfully destroyed.'  # Redirect to index on success
  end
  

  private

  def client_params
    params.require(:client).permit(:name, :company, :image)  # Permit the necessary parameters
  end
end
