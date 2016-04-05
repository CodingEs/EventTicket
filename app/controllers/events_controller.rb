class EventsController < ApplicationController

  def new
    @event = Event.new
    @location_id = params[:id]
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event.id)
    else
      @location_id = params[:event][:event_location_id]
      render 'fetch'
    end
  end

  def show
    @event = Event.find(params[:id])
    @total_ticket = @event.event_location.available_seats
    @ticket_sold = Order.where('event_id =?', @event.id).sum(:quantity)
    @remaining_ticket = @total_ticket - @ticket_sold
    @location = @event.event_location
  end

  def edit
     @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to event_location_path(@event.event_location_id)
  end

  def fetch
    @event = Event.new
    @location_id = params[:id]
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :ticket_price, :event_location_id)
  end

end
