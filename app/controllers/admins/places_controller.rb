class Admins::PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  layout "admin"
  respond_to :html

  def index
    if params[:district_id]
      @place = Place.find(params[:district_id])
      @places = @district.places
    else  
      @places = Place.all
    end 
  end

  def show
    respond_with(@place)
  end

  def new
    @states = State.all
    @place = Place.new
  end

  def edit
  end

  def create
    @place = Place.new(place_params)
    respond_to do |format|
      if @place.save
        #format.html { redirect_to admins_places_path, notice: 'place was successfully created.' }
        format.json { render :show, status: :created, location: admins_places_path }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to admins_places_path, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: admins_places_path }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to admins_places_path, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:name, :description, :image, :state_id, :code, :id)
    end
end
