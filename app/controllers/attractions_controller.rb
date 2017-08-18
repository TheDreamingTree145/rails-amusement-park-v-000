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
    if current_user.not_enough_tickets(@attraction) && current_user.not_tall_enough(@attraction)
      redirect_to current_user, alert: "You are not tall enough to ride the #{@attraction.name}. You do not have enough tickets to ride the #{@attraction.name}"
    elsif current_user.not_tall_enough(@attraction)
      redirect_to current_user, alert: "You are not tall enough to ride the #{@attraction.name}"
    elsif
      current_user.not_enough_tickets(@attraction)
      redirect_to current_user, alert: "You do not have enough tickets to ride the #{@attraction.name}"
    else
      current_user.go_on_ride(@attraction)
      redirect_to current_user, alert: "Thanks for riding the #{@attraction.name}!"
    end
  end

  def edit
    
  end

  def update
    @attraction.update(attraction_params)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
