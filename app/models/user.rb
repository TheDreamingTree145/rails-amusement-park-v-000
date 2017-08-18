class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    if happiness < nausea
      "sad"
    else
      "happy"
    end
  end

  def go_on_ride(attraction)
    self.tickets = self.tickets - attraction.tickets
    self.nausea = self.nausea + attraction.nausea_rating
    self.happiness = self.happiness + attraction.happiness_rating
    self.save
  end

  def not_tall_enough(attraction)
    self.height < attraction.min_height
  end

  def not_enough_tickets(attraction)
    self.tickets < attraction.tickets
  end

end
