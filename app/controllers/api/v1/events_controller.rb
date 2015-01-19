class API::V1::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @events = Event.all
    render json: @events, status: :ok
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end

  def create
    website = Website.find_by(address: request.env['HTTP_ORIGIN'])
    not_found if website.nil? or !website.verified

    @event = Event.new(event_params)
    @event.website = website
    if @event.save
      render json: @event, status: :created
    else
      render @event.errors, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :meta)
  end
end
