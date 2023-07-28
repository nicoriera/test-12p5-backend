class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :start_date, :end_date, :period, presence: true
  validate :end_date_after_start_date
  validate :period_matches_dates

  enum period: { one_month: 1, six_months: 6, twelve_months: 12 }

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def period_matches_dates
    puts start_date, end_date, period
    return if end_date.blank? || start_date.blank? || period.blank?

    period_value = self.class.periods[period]
    if end_date.to_date != (start_date + period_value.months).to_date
      errors.add(:period, "does not match start and end dates")
    end
  end
  
end
