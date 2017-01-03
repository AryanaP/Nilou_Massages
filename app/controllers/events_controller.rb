class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_event, only: [:edit, :update, :destroy]

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

  def edit
    authorize @event
  end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
    authorize @event
  end

  def destroy
    if @event.destroy
      redirect_to events_path
    end
    authorize @event
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :date, :home, :resume, photos: [])
  end

end

