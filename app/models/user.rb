class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  has_many :subscriptions
  
  def set_default_role
    self.role ||= :user
  end

  def subscribe(bike, start_date, end_date)
    Subscription.create(bike: bike, start_date: start_date, end_date: end_date)
  end
end
