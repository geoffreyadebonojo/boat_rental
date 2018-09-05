class Dock
  attr_reader :name,
              :max_rental_time,
              :renters

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @renters = []
    @revenue = 0
  end 

  def rent(boat, renter)
    renter.rented_boats << boat
    @renters << renter
  end

  def log_hour
    renters = @renters.uniq
    all = renters.each do |renter|
      renter.rented_boats.each do |boat|
        boat.hours_rented += 1
      end
    end
    all
  end

  def return(boat)
    index = @rented_boats.index(boat)
    renter = @renters[index]
    # binding.pry
    @rented_boats.delete(boat)
    @renters.delete(renter)
  end


end