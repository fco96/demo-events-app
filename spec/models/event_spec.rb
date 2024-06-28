require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { create(:user) }
  let(:event) { build(:event, user:) }

  it 'is valid with valid attributes' do
    expect(event).to be_valid
  end

  it 'is not valid without a name' do
    event.name = nil
    expect(event).not_to be_valid
  end

  it 'is not valid without a date_time' do
    event.date_time = nil
    expect(event).not_to be_valid
  end

  it 'is not valid without a location' do
    event.location = nil
    expect(event).not_to be_valid
  end

  it 'is not valid without a capacity' do
    event.capacity = nil
    expect(event).not_to be_valid
  end

  it 'is not valid with a non-integer capacity' do
    event.capacity = 'a lot'
    expect(event).not_to be_valid
  end

  it 'is not valid with a capacity less than 1' do
    event.capacity = 0
    expect(event).not_to be_valid
  end

  it 'belongs to a user' do
    expect(event.user).to eq(user)
  end

  it 'has a default scope that orders by created_at descending' do
    event1 = create(:event, created_at: 1.day.ago, user:)
    event2 = create(:event, created_at: 2.days.ago, user:)
    expect(Event.all).to eq([event1, event2])
  end
end
