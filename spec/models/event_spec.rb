# frozen_string_literal: true

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

  describe 'Testing scopes' do
    let!(:upcoming_event) { create(:event, date_time: 1.day.from_now) }
    let!(:past_event) { create(:event, date_time: 1.day.ago) }
    describe '.upcoming' do
      it 'returns events with a date_time in the future' do
        expect(Event.upcoming).to include(upcoming_event)
        expect(Event.upcoming).not_to include(past_event)
      end
    end

    describe '.past' do
      it 'returns events with a date_time in the past' do
        expect(Event.past).to include(past_event)
        expect(Event.past).not_to include(upcoming_event)
      end
    end
  end
end
