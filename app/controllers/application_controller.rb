class ApplicationController < ActionController::Base
  before_action :set_active_storage_url_options
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  private
  def set_active_storage_url_options
    ActiveStorage::Current.url_options = { host: request.base_url }
  end
end


 

 
 
 