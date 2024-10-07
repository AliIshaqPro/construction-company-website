class HomeController < ApplicationController
    def home
        @clients = Client.all  # Fetch all clients
        @projects = Project.all  # Fetch all projects
    end
    def about
        @clients = Client.all  # Fetch all clients
        @projects = Project.all  # Fetch all projects
    end
    def services
        @clients = Client.all  # Fetch all clients
        @projects = Project.all  # Fetch all projects
    end
    def projects
        @clients = Client.all  # Fetch all clients
        @projects = Project.all  # Fetch all projects
    end
    def contact
        @clients = Client.all  # Fetch all clients
        @projects = Project.all  # Fetch all projects
    end
    
    def new
        @feedback = Feedback.new
    end
    
end