class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @subscriptions = Subscription.all

  end

  def new
    @subscription = Subscription.new
  end

  def create
   
    @subscription = current_user.subscriptions.build(subscription_params)
    if @subscription.save
        redirect_to subscriptions_path, notice: "You have successfully subscribed"
    else
        render :new
    end 
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    
    if @subscription.cancel
        redirect_to subscriptions_path, notice: "You have successfully cancelled your subscription"
    else
        redirect_to subscriptions_path, alert: "There was an error cancelling your subscription"
    end
        render :edit
  end

  private

  def subscription_params
    params.require(:subscription).permit(:start_date, :end_date, :bike_id, :period)
  end


end
