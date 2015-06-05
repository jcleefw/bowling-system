require_relative 'dius_bowling'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe BowlingGame do
  before do
    @game = BowlingGame.new
  end

  it 'Roll should not come back empty' do
    @game.roll.wont_equal ''
  end

  it 'roll should be a number' do
    @game.roll.must_be_kind_of Integer
  end

  it 'roll should be a within 0 - 10' do
    @game.roll.must_be_within_epsilon 0..10
  end
end