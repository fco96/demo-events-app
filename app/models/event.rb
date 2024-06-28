# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  scope :upcoming, -> { where(date_time: Time.now.utc..) }
  scope :past, -> { where(date_time: ...Time.now.utc) }

  validates :name, presence: true
  validates :date_time, presence: true
  validates :location, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
