class HomeController < ApplicationController
    def home
        @clients = Client.all  # Fetch all clients
        @projects = Project.all  # Fetch all projects
        @consultation_request = ConsultationRequest.new
        @sliders = Slider.all
        @reviews = Review.all
        @gallery = Gallery.new
        @galleries = Gallery.all # Fetch all existing gallery entries
    end
    # In your controller (e.g., HomeController)
    def reviews
      @reviews = Review.all
      @review = Review.new # For the form
    end
  


    def ourwork
        @gallery = Gallery.new
        @galleries = Gallery.all # Fetch all existing gallery entries
      end
    
      def create_gallery
        @gallery = Gallery.new(gallery_params)
        
        if @gallery.save
          redirect_to ourwork_path, notice: 'Images uploaded successfully!'
        else
          render :ourwork
        end
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
    private

  def gallery_params
    params.require(:gallery).permit(images: [])
  end
end