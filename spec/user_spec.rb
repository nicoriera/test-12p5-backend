require 'rails_helper'

RSpec.describe User, type: :model do
  let(:bike) { Bike.create!(bike_type: 'Mountain', price: 10) }

  it "is valid with valid attributes" do
    user = User.new(email: 'test@example.com', password: 'password')
    expect(user).to be_valid
  end

  it "has user role by default" do
    user = User.new(email: 'test@example.com', password: 'password')
    expect(user.role).to eq("user")
  end

  it "can have an admin role" do
    user = User.new(email: 'test@example.com', password: 'password', role: :admin)
    expect(user.role).to eq("admin")
  end

end
