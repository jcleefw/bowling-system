# roll a bow using random to generate pins knockdown
def roll_bowl pins_left
  roll_num = (0..pins_left).to_a.sample
end

#check whether it's first roll
def is_first_roll?
  return true if @rolls == 0
end

# check whether roll is strike
def is_strike? pins_down
  return true if pins_down == 10
end

# roll ball with all 10 pins
def bowl_first_roll
  roll_bowl @pins
end

#roll ball with the remaining pin after first roll
def bowl_second_roll first_roll
  roll_bowl @pins-first_roll
end



#----------------------------------------
#   Methods for debugging
#----------------------------------------
def reset_frame_score_array
  @frame_score_array = []
  @frame_score_array = []
end


