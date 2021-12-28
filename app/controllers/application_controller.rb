class ApplicationController < ActionController::Base
  
  include Pagy::Backend

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    render 'error' # Assuming you have a template named 'record_not_found'
  end
end
