require_relative 'dius_bowling'
require_relative 'utils'

puts "Welcome to DiUS bowling Club."
puts "Are your ready to roll?"
puts "To start rolling process, press enter"
puts "Or quit game using 'q'"
input = ''
input = gets.chomp.downcase

while input != 'q'
  bowl = BowlingGame.new

  puts "Rolls result: "
  print result = bowl.roll
  puts ''
  puts "Bowl Score: "
  puts bowl.score

  puts "Another round? press enter. or 'q' to quit"
  input = gets.chomp.downcase
end