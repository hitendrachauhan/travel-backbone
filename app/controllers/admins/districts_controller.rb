class Admins::DistrictsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_district, only: [:show, :edit, :update, :destroy]
  layout "admin"

  def index
    @districts = District.all
  end

  def show
    respond_with(@district)
  end

  def new
    @states = State.all
    @district = District.new
  end

  def edit
  end

  def create
    @district = District.new(district_params)
    respond_to do |format|
      if @district.save
        format.html { redirect_to @district, notice: 'District was successfully created.' }
        format.json { render :show, status: :created, location: @district }
      else
        format.html { render :new }
        format.json { render json: @district.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @district.update(district_params)
        format.html { redirect_to @district, notice: 'District was successfully updated.' }
        format.json { render :show, status: :ok, location: @district }
      else
        format.html { render :edit }
        format.json { render json: @district.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @district.destroy
    respond_to do |format|
      format.html { redirect_to @district, notice: 'District was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_district
      @district = District.find(params[:id])
    end

    def district_params
      params.require(:district).permit(:name, :description, :code, :state_id)
    end
end
