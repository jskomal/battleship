require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

RSpec.describe Board do
  before do
    @board = Board.new
  end

  it 'exists' do
    expect(@board).to be_instance_of(Board)
  end

  it 'holds 16 cells' do
    expect(@board.cells.length).to eq(16)
    expect(@board.cells['A1']).to be_instance_of(Cell)
    expect(@board.cells['D4']).to be_instance_of(Cell)
  end

  it 'has a method to validate coordinates' do
    expect(@board.valid_coordinate?('A1')).to eq(true)
    expect(@board.valid_coordinate?('B2')).to eq(true)
    expect(@board.valid_coordinate?('C3')).to eq(true)
    expect(@board.valid_coordinate?('D4')).to eq(true)
    expect(@board.valid_coordinate?('E1')).to eq(false)
    expect(@board.valid_coordinate?('A22')).to eq(false)
  end

  it 'has a method to validate placement' do
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    expect(@board.valid_placement?(cruiser, %w[A1])).to eq(false)
    expect(@board.valid_placement?(cruiser, %w[A1 Z33])).to eq(false)
    expect(@board.valid_placement?(cruiser, %w[X100 Z33 B12])).to eq(false)
    expect(@board.valid_placement?(cruiser, %w[A1 A2])).to eq(false)
    expect(@board.valid_placement?(submarine, %w[A2 A3 A4])).to eq(false)
    expect(@board.valid_placement?(cruiser, %w[A1 A2 A4])).to eq(false)
    expect(@board.valid_placement?(submarine, %w[A1 C1])).to eq(false)
    expect(@board.valid_placement?(cruiser, %w[A3 A2 A1])).to eq(false)
    expect(@board.valid_placement?(submarine, %w[C1 B1])).to eq(false)
    expect(@board.valid_placement?(cruiser, %w[A1 B2 C3])).to eq(false)
    expect(@board.valid_placement?(submarine, %w[C2 D3])).to eq(false)
    expect(@board.valid_placement?(submarine, %w[A1 A2])).to eq(false)
    expect(@board.valid_placement?(cruiser, %w[B1 C1 D1])).to eq(false)
    # expect(@board.valid_placement?(submarine, %w[A1 A2])).to eq(true)
    # expect(@board.valid_placement?(cruiser, %w[B1 C1 D1])).to eq(true)
  end
end
