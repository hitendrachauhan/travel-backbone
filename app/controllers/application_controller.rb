class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "home"
  before_action :states_list


  def after_sign_in_path_for(resource)
    admins_home_path
  end

  def after_sign_out_path_for(resource)
    home_path
  end

  def states_list
    @indian_states = State.all
  end
end
