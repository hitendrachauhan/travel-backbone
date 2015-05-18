class Admins::PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  layout "admin"
  respond_to :html

  def index
    @places = Place.all
  end

  def show
  end

  def new
    @place = Place.new
  end

  def edit
  end

  def create
    @place = Place.new(place_params)
    @place.save
  end

  def update
    @place.update(place_params)
    respond_with(@place)
  end

  def destroy
    @place.destroy
    respond_with(@place)
  end

  private
    def set_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:name, :description, :image)
    end
end
