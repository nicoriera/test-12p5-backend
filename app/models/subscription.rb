class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  enum period: { one_month: 1, six_months: 6, twelve_months: 12 }

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def cancel
    self.destroy
  end
  
end
