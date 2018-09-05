class Dock
  attr_reader :name,
              :max_rental_time,
              :rented_boats,
              :renters
              
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rented_boats = []
    @revenue = 0
    @renters = []
  end 

  def rent(boat, renter)
    @rented_boats <<  boat
    @renters << renter
  end

  def log_hour
    @rented_boats.each do |boat|
      @revenue += boat.price_per_hour
    end
  end


end