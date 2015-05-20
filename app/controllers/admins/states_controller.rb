class Admins::StatesController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"

  def index
    @states = State.all
  end

  def show
    @state = State.find(params[:id])
  end

end