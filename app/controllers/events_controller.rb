# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[edit update destroy]
  before_action :authenticate_user!

  def index
    @upcomming_events = current_user.events.upcoming.order(date_time: :asc)
    @past_events = current_user.events.past.order(date_time: :desc)
  end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path, notice: I18n.t('events.created')
    else
      render :new, status: :internal_server_error
    end
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: I18n.t('events.updated')
    else
      render :edit, status: :internal_server_error
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: I18n.t('events.destroyed')
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :date_time, :location, :capacity, :user_id)
  end
end
