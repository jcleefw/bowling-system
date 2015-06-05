require 'pry'

def refresh
  p 'refreshing'
  load 'dius_bowling.rb'
end

refresh
bowl = BowlingGame.new
result = bowl.bowling
bowl.score


# p result




binding.pry