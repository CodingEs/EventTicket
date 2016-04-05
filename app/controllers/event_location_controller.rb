class EventLocationController < ApplicationController
  def index
    @locations = EventLocation.order(:name).all
  end

  def show
    @location = EventLocation.find(params[:id])
    @events = @location.events
  end

  def new
    @location = EventLocation.new
  end

  def create
    @location = EventLocation.new(location_params)
    if @location.save
      redirect_to :action => 'index'
    else
      render 'new'
    end
  end

  def edit
    @location = EventLocation.find(params[:id])
  end

  def update
    @location = EventLocation.find(params[:id])
    if @location.update(location_params)
      redirect_to @location
    else
      render 'edit'
    end
  end

  def destroy
    @location = EventLocation.find(params[:id])
    @location.destroy
    redirect_to :action => 'index'
  end

  private

  def location_params
    params.require(:location).permit(:name, :available_seats, :description)
  end

end
