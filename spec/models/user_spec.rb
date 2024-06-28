# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without a first name' do
    user.first_name = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without a last name' do
    user.last_name = nil
    expect(user).not_to be_valid
  end

  it 'returns the full name as a string' do
    user.first_name = 'Pan'
    user.last_name = 'Chito'
    expect(user.full_name).to eq('Pan Chito')
  end
end
