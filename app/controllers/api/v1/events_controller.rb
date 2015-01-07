class API::V1::EventsController < ApplicationController
  def index
    @events = Event.all
    render json: @events, status: :ok
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event, status: :created
    else
      render @event.errors, status: :unprocessable_entity
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      raise "#{@event.name}"
      head :no_content
    else
      render @event.errors, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.permit(:name, :property)
  end
end
