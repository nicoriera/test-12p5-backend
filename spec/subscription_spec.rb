require 'rails_helper'

RSpec.describe Subscription, type: :model do

    it 'is valid with valid attributes' do
        subscription = Subscription.new(start_date: Date.today, end_date: Date.today + 1.month, user_id: 1, bike_id: 1, period: "one_month")
        expect(subscription).to be_valid
    end
end

RSpec.describe Subscription, type: :model do
  describe "#period_matches_dates" do
    context "when start date, end date, and period are all present and valid" do
      let(:subscription) { Subscription.new(start_date: Date.today, end_date: Date.today + 1.month, period: 1) }

      it "does not add an error to the subscription" do
        subscription.period_matches_dates
        expect(subscription.errors).to be_empty
      end
    end

    context "when end date does not match start date plus period months" do
      let(:subscription) { Subscription.new(start_date: Date.today, end_date: Date.today + 2.months, period: 1) }

      it "adds an error to the subscription" do
        subscription.period_matches_dates
        expect(subscription.errors[:period]).to include("does not match start and end dates")
      end
    end

    context "when start date is missing" do
      let(:subscription) { Subscription.new(end_date: Date.today + 1.month, period: 1) }

      it "does not add an error to the subscription" do
        subscription.period_matches_dates
        expect(subscription.errors).to be_empty
      end
    end

    context "when end date is missing" do
      let(:subscription) { Subscription.new(start_date: Date.today, period: 1) }

      it "does not add an error to the subscription" do
        subscription.period_matches_dates
        expect(subscription.errors).to be_empty
      end
    end

    context "when period is missing" do
      let(:subscription) { Subscription.new(start_date: Date.today, end_date: Date.today + 1.month) }

      it "does not add an error to the subscription" do
        subscription.period_matches_dates
        expect(subscription.errors).to be_empty
      end
    end
  end
end