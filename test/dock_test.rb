require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/dock'
require './lib/boat'
require './lib/renter'

class DockTest < Minitest::Test
  def setup
  end

  def test_it_exists
    dock = Dock.new("The Rowing Dock", 3)
    assert_instance_of Dock, dock
  end

  def test_attributes
    dock = Dock.new("The Rowing Dock", 3)
    assert_equal "The Rowing Dock", dock.name
    assert_equal 3, dock.max_rental_time
  end

  def test_it_can_rent
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)    
    canoe = Boat.new(:canoe, 25)    
    sup_1 = Boat.new(:standup_paddle_board, 15)    
    sup_2 = Boat.new(:standup_paddle_board, 15)    
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")    
    
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    
    dock.log_hour

    assert_equal [kayak_1, kayak_2], dock.rented_boats
    assert_equal [patrick, patrick], dock.renters

    dock.rent(canoe, patrick)

    assert_equal [kayak_1, kayak_2, canoe], dock.rented_boats    
    assert_equal [patrick, patrick, patrick], dock.renters
  end


  def test_if_it_can_return_boats
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)    
    canoe = Boat.new(:canoe, 25)    
    sup_1 = Boat.new(:standup_paddle_board, 15)    
    sup_2 = Boat.new(:standup_paddle_board, 15)    
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")    
    
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    
    dock.log_hour

    assert_equal [kayak_1, kayak_2], dock.rented_boats
    assert_equal [patrick, patrick], dock.renters

    dock.rent(canoe, patrick)

    assert_equal [kayak_1, kayak_2, canoe], dock.rented_boats    
    assert_equal [patrick, patrick, patrick], dock.renters

    dock.return(kayak_1)
    
    assert_equal [patrick, patrick], dock.renters
    assert_equal [kayak_2, canoe], dock.rented_boats

  end

  def test_method
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)    
    canoe = Boat.new(:canoe, 25)    
    sup_1 = Boat.new(:standup_paddle_board, 15)    
    sup_2 = Boat.new(:standup_paddle_board, 15)    
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")    
    
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    binding.pry
  end


end 