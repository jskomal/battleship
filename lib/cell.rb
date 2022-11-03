require 'pry'

class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @already_hit = false
    @ship = nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def empty?
    @ship.nil?
  end

  def fired_upon?
    @already_hit
  end

  def fire_upon
    @ship.hit unless @ship.nil? || @already_hit
    @already_hit = true
  end

  def render(bool = false)
    result = bool ? 'S' : '.'
    return 'M' if @ship.nil? && fired_upon?
    return 'X' if fired_upon? && @ship.sunk?
    return 'H' if fired_upon?

    result
  end
end
