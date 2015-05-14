class DistrictsController < ApplicationController
  before_action :set_district, only: [:show, :edit, :update, :destroy]

  def index
    @districts = District.all
  end

  def show
    respond_with(@district)
  end

  def new
    @district = District.new
  end

  def edit
  end

  def create
    @district = District.new(district_params)
    @district.save
  end

  def update
    @district.update(district_params)
  end

  def destroy
    @district.destroy
  end

  private
    def set_district
      @district = District.find(params[:id])
    end

    def district_params
      params.require(:district).permit(:name, :description, :code, :state_id)
    end
end
