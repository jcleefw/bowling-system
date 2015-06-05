require_relative 'utils'
require_relative 'dius_bowling'

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

describe BowlingGame do
  before do
    @game = BowlingGame.new
  end

  it 'game with no strike or spare. should return 65' do
    #           7     7     7     7    7 = 35
    #     #        6     6     6     6     6   = 30
    @game.frame_score_array = [[6, 0], [7, 0], [6, 0], [7, 0], [6, 0], [7, 0], [6, 0], [7, 0], [6, 0], [6,0,0]]
    @game.frame_sum_array = [6, 7, 6, 7, 6, 7, 6, 7, 6, 7]
    @game.score.must_equal 65
  end

  it 'games with 1 strike and 1 spare. should return 120 ' do
    @game.frame_score_array = [[6, 4], [8, 1], [9, 0], [5, 1], [3, 0], [5, 5], [2, 3], 10, [4, 5],[10, 10, 10]]
    @game.frame_sum_array = [10, 9, 9, 6, 3, 10, 5, 10, 9, 30]
    @game.score.must_equal 120
  end

  it 'perfect game. all strikes. should return 300 ' do
    #"X|X|X|X|X|X|X|X|X|X|XX"
    @game.frame_score_array = [10, 10, 10, 10, 10, 10, 10, 10, 10, [10, 10, 10]]
    @game.frame_sum_array = [10, 10, 10, 10, 10, 10, 10, 10, 10, 30]
    @game.score.must_equal 300
  end

  it 'game with all spares. should return 150' do
    #"5/|5/|5/|5/|5/|5/|5/|5/|5/|5/|5"
    @game.frame_score_array = [[5, 5], [5, 5], [5, 5], [5, 5], [5, 5], [5, 5], [5, 5],[5, 5],[5, 5],[5,5,5]]
    @game.frame_sum_array = [10, 10, 10, 10, 10, 10, 10, 10, 10, 15]
    @game.score.must_equal 150
  end

  it 'game started perfect, ended without strike at the end. should return 278' do
    "X|X|X|X|X|X|X|X|X|X|XX3"
    @game.frame_score_array = [10, 10, 10, 10, 10, 10, 10, 10, 10, [10, 7, 2]]
    @game.frame_sum_array = [10, 10, 10, 10, 10, 10, 10, 10, 10, 19]
    @game.score.must_equal 278
  end
end

