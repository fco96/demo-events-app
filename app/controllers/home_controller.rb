# frozen_string_literal: true

class HomeController < ApplicationController
  # before_action :authenticate_user!

  def index
    redirect_to events_path if user_signed_in?
  end
end
