class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from ActiveRecord::RecordNotFound do
    render_404
  end 

  def render_404
    respond_to do |type|
      type.html { render :template => "#{RAILS_ROOT}/app/views/error/404", :layout => "application", :status => "404 Not Found" }
      type.all  { render :nothing  => true, :status => "404 Not Found" }
    end
  end
  
end
