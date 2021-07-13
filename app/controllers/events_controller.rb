class EventsController < ApplicationController

  before_action :set_event, only: [:edit, :update, :destroy]

  def index
    @events = Event.search(params)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    redirect_to events_path
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path, notice: 'Событие удалено'
    else
      redirect_to events_path, alert: error_messages(@event)
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :venue_id, :starts, :ends)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
