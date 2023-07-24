class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subscription, only: [:destroy]

  def index
    @subscriptions = policy_scope(Subscription)
  end

  def new
    @subscription = Subscription.new
    @bikes = Bike.all
    authorize @subscription
  end

  def create
    @subscription = current_user.subscriptions.build(subscription_params)
    @bikes = Bike.all
    authorize @subscription
    if @subscription.save
        redirect_to subscriptions_path, notice: "You have successfully subscribed"
    else
      flash[:alert] = "There was an error creating your subscription"
      redirect_to new_subscription_path
    end 
  end

def destroy
  @subscription = Subscription.find(params[:id])
  authorize @subscription

  if @subscription.cancel
      redirect_to subscriptions_path, notice: "You have successfully cancelled your subscription"
  else
      redirect_to subscriptions_path, alert: "There was an error cancelling your subscription"
  end
end


  private

  def subscription_params
    params.require(:subscription).permit(:start_date, :end_date, :bike_id, :period)
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, notice: "You must be logged in to subscribe"
    end
  end

  def set_subscription
    @subscription = Subscription.find(params[:id])
    unless current_user == @subscription.user || current_user.admin?
      redirect_to subscriptions_path, alert: "You are not authorized to cancel this subscription"
    end
  end
end
