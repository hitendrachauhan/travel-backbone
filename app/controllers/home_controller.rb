class HomeController < ApplicationController
  def index
    @state = params[:state] || @indian_states.first.name
  end
end
