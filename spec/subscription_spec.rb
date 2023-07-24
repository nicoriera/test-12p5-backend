require 'rails_helper'

RSpec.describe Subscription, type: :model do

    it 'is valid with valid attributes' do
        subscription = Subscription.new(start_date: Date.today, end_date: Date.today + 1.month, user_id: 1, bike_id: 1)
        expect(subscription).to be_valid
    end
    end