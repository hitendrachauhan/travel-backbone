class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "home"
  before_action :states_list


  def states_list
    @indian_states = Carmen::Country.named("India").subregions.to_a.collect{ |x| x.name }
  end
end
