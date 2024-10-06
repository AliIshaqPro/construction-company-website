class HomeController < ApplicationController
    def home
        @clients = Client.all  # Fetch all clients
        @projects = Project.all  # Fetch all projects
    end
    def new
        @feedback = Feedback.new
    end
    
end