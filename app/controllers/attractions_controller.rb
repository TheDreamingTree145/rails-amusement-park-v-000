class AttractionsController < ApplicationController
  before_action :current_user
  before_action :current_attraction, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
  end

  def new
    redirect_to current_user, alert: "Must be an Admin to create attraction" unless current_user.admin
    @attraction = Attraction.new
  end

  def create
    @attraction = current_user.attractions.create(attraction_params)
    redirect_to @attraction
  end

  def show

  end

  def ride
    @attraction = Attraction.find(params[:attraction][:id])
    @ride = Ride.create(user_id: current_user.id, attraction_id: @attraction.id)
    if @ride.take_ride == nil
      redirect_to current_user, alert: "Thanks for riding the #{@attraction.name}!"
    else
      redirect_to current_user, alert: "#{@ride.take_ride}"
    end
  end

  def edit
    redirect_to current_user, alert: "Must be an Admin to edit attraction" unless current_user.admin
  end

  def update
    @attraction.update(attraction_params)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
