class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :date_time, presence: true
  validates :location, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
