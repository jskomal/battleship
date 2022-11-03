require './lib/ship'

RSpec.describe Ship do
  before do
    @ship = Ship.new('Cruiser', 3)
  end

  it 'exists' do
    expect(@ship).to be_instance_of(Ship)
  end

  it 'has a name' do
    expect(@ship.name).to eq('Cruiser')
  end

  it 'has a length' do
    expect(@ship.length).to eq(3)
  end

  it 'has health' do
    expect(@ship.health).to eq(3)
  end

  it 'is not sunk by default' do
    expect(@ship.sunk?).to eq(false)
  end

  it 'should have a hit method to reduce its health' do
    @ship.hit
    expect(@ship.health).to eq(2)
    @ship.hit
    expect(@ship.health).to eq(1)
    expect(@ship.sunk?).to eq(false)
    @ship.hit
    expect(@ship.health).to eq(0)
    expect(@ship.sunk?).to eq(true)
  end
end
