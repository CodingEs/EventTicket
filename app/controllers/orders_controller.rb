class OrdersController < ApplicationController

  before_action :load_eventable, only: [:create]

  def new
    @order = Order.new
  end

  def create
    @total_ticket = @event.event_location.available_seats
    @ticket_sold = Order.where('event_id =?', @event.id).sum(:quantity)
    @remaining_ticket = @total_ticket - @ticket_sold
    @order = Order.new(order_params)
    if @remaining_ticket >= params[:order][:quantity].to_i && @order.save
      redirect_to event_path(@order.event_id)
    else
      @error = "Please check remaining ticket"
      render 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :quantity, :event_id)
  end

  def load_eventable
    @event = Event.find(params[:event_id])
  end

end
