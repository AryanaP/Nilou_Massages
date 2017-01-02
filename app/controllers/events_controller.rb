class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_price, only: [:edit, :update, :destroy]

  def index
    @events = policy_scope(Event).order(date: :desc)
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
    authorize @event
  end

  # def edit
  #   authorize @price
  # end

  # def update
  #   if @price.update(price_params)
  #     redirect_to prices_path
  #   else
  #     render :edit
  #   end
  #   authorize @price
  # end

  # def destroy
  #   @price.destroy
  #   authorize @price
  # end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :date)
  end

end

