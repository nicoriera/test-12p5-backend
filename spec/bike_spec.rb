require 'rails_helper'

RSpec.describe Bike, type: :model do
 

  it "is not valid without a bike_type" do
    bike = Bike.new(bike_type: nil)
    expect(bike).to_not be_valid
  end

  it "is not valid without a price" do
    bike = Bike.new(price: nil)
    expect(bike).to_not be_valid
  end

  it "is valid with valid attributes" do
    bike = Bike.new(bike_type: 'Mountain', price: 10)
    expect(bike).to be_valid
  end

 
end
