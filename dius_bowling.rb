require 'pry'

class BowlingGame
  def initialize
    #@range = (0..10).to_a
    @frames = 10
    @pins = 10
    @frame_score = 0
    @frame_score_array = []
    @rolls = 0
    @rolls_allow = {normal: 2, tenth: 3}
    @previous_bowl_type = 'normal'
  end

  def bowling
    # repeat same process for 9 times
    9.times do |x|
      frame
    end

    # 10th frame
    tenth_frame
    @frame_score_array
  end

  def roll_bowl pins_left
    roll_num = (0..pins_left).to_a.sample
  end

  def roll_as_strike first_roll
    @frame_score_array << first_roll
  end

  # def is_strike? size
  #   return false if size != 1
  #   true
  # end

  def is_previous_bowl_strike?
    return true if @previous_bowl_type == "strike"
    false
  end

  def roll_as_normal first_roll
    #roll again
    frame_score = []
    second_roll = roll_bowl @pins-first_roll
    frame_score << second_roll << first_roll
  end

  # each frame set
  def frame
    roll_rounds = 'start'
    # number of pins standing
    pins_standing = @pins
    pins_down = roll_bowl pins_standing
    pins_down = 10
    while roll_rounds != 'finish'
      if @frame_score_array.size == 9
        binding.pry
      end
      # if first roll and pins down is 10, enter strike mode
      if @rolls < 1 && pins_down == 10
        #binding.pry
        roll_as_strike pins_down
        roll_rounds = 'finish'
      else
        #binding.pry
        @rolls +=1
        roll_result = roll_as_normal pins_down
        @frame_score_array << roll_result
        roll_rounds = 'finish'
      end
    end
    @rolls = 0
    p "rolling finish"
  end


end


bowl = BowlingGame.new
result = bowl.bowling
p result

bowl.score
#binding.pry
