class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :check_admin, only: [:index, :destroy]

    def index
        @users = policy_scope(User)
    end

    def show
        @subscriptions = Subscription.where(user_id: @user.id)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to users_path, notice: "User created successfully"
        else
            render :new
        end
    end

    def update
        if @user.update(user_params)
            redirect_to users_path, notice: "User updated successfully"
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to users_path, notice: "User deleted successfully"
    end

    private

    def set_user
        if params[:id].to_i.to_s == params[:id]
          @user = User.find(params[:id])
        else
          redirect_to root_path, alert: "User not found"
        end
      end
      

    def check_admin
        redirect_to users_path, notice: "You are not authorized to perform this action" unless current_user.admin?
    end

    def authenticate_user!
        redirect_to new_user_session_path, notice: "You must be logged in to perform this action" unless user_signed_in?
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
    end

end
