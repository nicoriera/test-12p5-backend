class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  def cancel
    self.destroy
  end
  
end
