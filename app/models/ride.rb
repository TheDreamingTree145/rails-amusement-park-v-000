class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if user.not_enough_tickets(attraction) && user.not_tall_enough(attraction)
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.not_tall_enough(attraction)
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif
      user.not_enough_tickets(attraction)
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      user.go_on_ride(attraction)
      nil
    end
  end

end
