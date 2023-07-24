class SubscriptionsController < ApplicationController

  def create
    bike = Bike.find(params[:bike_id])
    start_date = params[:start_date]
    end_date = params[:end_date]

    if current_user.subscribe(bike, start_date, end_date)
        redirect_to subscriptions_path, notice: "You have successfully subscribed to #{bike.name}"
    else
        render :new
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    
    if @subscription.cancel
        redirect_to subscriptions_path, notice: "You have successfully cancelled your subscription"
        else
        redirect_to subscriptions_path, alert: "There was an error cancelling your subscription"
        end
    else
        render :edit
    end
  end
end