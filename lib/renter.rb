class Renter
  attr_reader :name,
              :credit_card_number

  attr_accessor :rented_boats

  def initialize(name, credit_card_number)
    @name = name
    @credit_card_number = credit_card_number
    @rented_boats = []
  end 


end