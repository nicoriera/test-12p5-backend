class BikesController < ApplicationController
    before_action :set_bike, only: [:show, :edit, :update, :destroy]
    # before_action :check_admin, only: [:index, :destroy]

    def index
        @bikes = Bike.all
    end

    def show
    end

    def new
        @bike = Bike.new
    end

    def create
        @bike = Bike.new(bike_params)

        if @bike.save
            redirect_to bikes_path, notice: "Bike created successfully"
        else
            render :new
        end
    end

    def update
        if @bike.update(bike_params)
            redirect_to bikes_path, notice: "Bike updated successfully"
        else
            render :edit
        end
    end

    def destroy
        @bike.destroy
        redirect_to bikes_path, notice: "Bike deleted successfully"
    end

    private

    def set_bike
        @bike = Bike.find(params[:id])
    end

    # def check_admin
    #     redirect_to bikes_path, notice: "You are not authorized to perform this action" unless current_user.admin?
    # end

    def bike_params
        params.require(:bike).permit(:bike_type, :price)
    end
end
