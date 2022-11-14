require 'pry'
class Board
  attr_reader :cells

  def initialize(height = 4, width = 4)
    @height = height
    @width = width
    @width_range = 1..width
    @height_range = 'A'..('A'.ord + height - 1).chr
    @cells = generate_cells
  end

  def generate_cells
    result = {}
    @width_range.each do |number|
      @height_range.each do |letter|
        coordinate = letter + number.to_s
        result[coordinate] = Cell.new(coordinate)
      end
    end
    result
  end

  def valid_coordinate?(coordinate)
    letters = coordinate.match(/[a-zA-Z]+/).to_s
    numbers = coordinate.match(/\d+/).to_s
    return false if letters.length > 1 || numbers.length > 1

    @height_range.include?(coordinate[0]) && @width_range.include?(coordinate[1].to_i)
  end

  def valid_placement?(ship, coordinates)
    return false if coordinates.length < 2
    return false unless coordinates.all? { |coordinate| valid_coordinate?(coordinate) }
    return false if ship.length != coordinates.length

    vertical_result = vertical_valid(coordinates) if coordinates.map { |coordinate| coordinate[0] }.uniq.size == 1
    horizontal_result = horizontal_valid(coordinates) if coordinates.map { |coordinate| coordinate[1] }.uniq.size == 1
    vertical_result == true || horizontal_result == true ? true : false
  end

  def vertical_valid(coordinates)
    coordinates.each_index do |i|
      break if i == coordinates.length - 1

      number = coordinates[i][1].to_i
      return false if (number + 1) != coordinates[i + 1][1].to_i

      puts "#{number} #{i}"
      binding.pry
    end

    true
  end

  def horizontal_valid(coordinates); end
end
