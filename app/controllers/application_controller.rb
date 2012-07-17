class ApplicationController < ActionController::Base
  protect_from_forgery

  def routing
    render_404
  end

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, :with => :render_500
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    rescue_from AbstractController::ActionNotFound, :with => :render_404
    rescue_from ActionController::RoutingError, :with => :render_404
    rescue_from ActionController::UnknownController, :with => :render_404
    rescue_from ActionController::UnknownAction, :with => :render_404
  end

  def render_404
    respond_to do |type|
      type.html { render :template => "error/404", :layout => "application", :status => "404 Not Found" }
      type.all  { render :nothing  => true, :status => "404 Not Found" }
    end
  end

  def render_500
    respond_to do |type|
      type.html { render :template => "error/404", :layout => "application", :status => "500 Internal Server Error" }
      type.all  { render :nothing  => true, :status => "500 Internal Server Error" }
    end
  end

end
