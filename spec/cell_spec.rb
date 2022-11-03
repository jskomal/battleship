require './lib/cell'
require './lib/ship'

RSpec.describe Cell do
  before do
    @cell = Cell.new('B4')
  end

  it 'exists' do
    expect(@cell).to be_instance_of(Cell)
  end

  it 'has a coordinate' do
    expect(@cell.coordinate).to eq('B4')
  end

  it 'may contain a ship' do
    expect(@cell.ship).to eq(nil)
  end

  it 'should be empty by default' do
    expect(@cell.empty?).to eq(true)
  end

  it 'should be able to place a ship in a cell' do
    @cell.place_ship
    expect(@cell.ship).to be_instance_of(Ship)
    expect(@cell.empty?).to eq(false)
  end

  it 'should be able to be fired upon' do
    crusier = Ship.new('Crusier', 3)
    @cell.place_ship(crusier)
    expect(@cell.fired_upon?).to eq(false)
    @cell.fire_upon
    expect(@cell.ship.health).to eq(2)
    expect(@cell.fired_upon?).to eq(true)
  end
end
