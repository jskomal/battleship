class Ship
  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def sunk?
    @health.zero?
  end

  def hit
    # if 0 health don't reduce
    return if @health.zero?

    @health -= 1
  end
end
