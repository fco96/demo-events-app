# frozen_string_literal: true

class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :user, uniqueness: { scope: :event, message: 'member can only be registered one time' }
end
