class Bike < ApplicationRecord
    has_many :subscriptions

    validates :bike_type, presence: true
    validates :price, presence: true
   
end
