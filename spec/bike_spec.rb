require 'rails_helper'

RSpec.describe Bike, type: :model do
    it 'is valid with valid attributes' do
        bike = Bike.new(bike_type: 'Bike', price: 1000)
        expect(bike).to be_valid
    end
    end