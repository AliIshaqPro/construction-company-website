class HomeController < ApplicationController
    def home
        @clients = Client.all  # Fetch all clients
        @projects = Project.all  # Fetch all projects
        @consultation_request = ConsultationRequest.new
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
        @consultation_request = ConsultationRequest.new
    end
    def appointment
        @consultation_request = ConsultationRequest.new
      end
    def new
        @feedback = Feedback.new
    end
    def faq
        @faqs = Faq.all
    end
    def servicedetails
        @faqs = Faq.all
    end
end