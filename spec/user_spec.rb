require 'rails_helper'

RSpec.describe User, type: :model do
    it 'is valid with valid attributes' do
        user = User.new(first_name: 'John', last_name: 'Doe', email: 'jogndoe@example.com', password: 'password', role: :user)
        expect(user).to be_valid
    end
end