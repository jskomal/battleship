require 'pry'

class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
  end

  def place_ship(ship)
    @ship = ship
  end

  def empty?
    @ship.nil?
  end

  def fired_upon?
    return false if @ship.nil?

    @ship.health < @ship.length
  end

  def fire_upon
    @ship.hit unless fired_upon?
  end
end
