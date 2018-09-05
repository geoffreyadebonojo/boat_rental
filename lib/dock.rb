class Dock
  attr_reader :name,
              :max_rental_time,
              :rented_boats,
              :renters

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @renters = []
    @revenue = 0
  end 

  def rent(boat, renter)
    if @renters.include?(renter)
      renter.rented_boats << boat
    elsif
      @renters << renter
    end
  end

  def log_hour
    
  end

  def return(boat)
    index = @rented_boats.index(boat)
    renter = @renters[index]
    # binding.pry
    @rented_boats.delete(boat)
    @renters.delete(renter)
  end


end