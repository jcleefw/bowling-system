require 'pry'
require_relative 'utils'

class BowlingGame

  def initialize
    @pins = 10
    @frame_score_array = []
    @frame_sum_array = []
    @rolls = 0
  end

  #--------------------------------
  # Methods added to run scoring testing
  #--------------------------------
  def frame_score_array=(array)
    @frame_score_array = array
  end

  def frame_sum_array=(array)
    @frame_sum_array = array
  end
  #--------------------------------

  #--------------------------------
  # Operations for each frame except for 10th.
  # methods setuped to accept input manually.
  # Manual input to be implemented
  #--------------------------------
  def frame pins_down =''
    # roll ball for first time
    first_roll = bowl_first_roll

    # check to see whether it's a strike
    if is_strike? first_roll
      p "strike"

      # if yes, push value in to variables
      @frame_score_array << first_roll
      @frame_sum_array << first_roll

    else
      p "not strike"
      #p "first_roll: #{first_roll} "

      # roll for second time, with remaining pin after first roll
      second_roll = bowl_second_roll first_roll
      #p "second_roll: #{second_roll} "
      frame_score = [first_roll,second_roll]

      #push value in to variables
      @frame_score_array << frame_score
      @frame_sum_array << first_roll + second_roll
      #p @frame_score_array
    end
  end

  #--------------------------------
  # Operations for tenth frame.
  # Manual input to be implemented
  #--------------------------------
  def tenth_frame
    third_roll = 0
    frame_score = []

    # setup initial pin standing as 10
    pins_standing = @pins

    # roll ball for first time
    first_roll = roll_bowl pins_standing

    # is roll a strike
    if is_strike? first_roll

      # if yes, go for second
      second_roll = roll_bowl pins_standing

      # if second_roll is not a strike
      if !is_strike? second_roll
        # roll for third time, roll with remaining pin after second roll
        third_roll = roll_bowl pins_standing-second_roll
      else
        # roll for third time with 10
        third_roll = roll_bowl pins_standing
      end
    else
      # if first_roll is not a strike roll with remaining pin after first roll
      second_roll = roll_bowl pins_standing-first_roll

      # if first & second roll manage to knock out pin, get another roll
      if first_roll+second_roll == 10
        # roll for third time with 10
        third_roll = roll_bowl pins_standing
      end
    end
    #push value in to variables
    frame_score << first_roll << second_roll << third_roll
    @frame_score_array << frame_score
    @frame_sum_array << first_roll + second_roll + third_roll
  end

  #--------------------------------
  # Operations for score calculation
  #--------------------------------
  def score
    total = 0

    #loop through every frame scores
    @frame_score_array.each_with_index do |frame,index|

      # if frame is not an array, frame is a strike
      if !frame.kind_of? Array
        # p "not array. it's strike"
        # p index

        # sum up total of current frame plus next 2 rolls
        next_two_sum = @frame_sum_array[index..index+2].inject { |sum, n| sum+n }

        # check whethere there are any strikes after the current frame
        if next_two_sum == 30 || next_two_sum == 20
          # add & sum score from next 2 rolls into current
          @frame_sum_array[index] = @frame_sum_array[index..index+2].inject { |sum, n| sum+n }
        else
          # add & sum score from next 2 rolls into current
          @frame_sum_array[index] = @frame_sum_array[index..index+1].inject { |sum, n| sum+n }
        end
      else
        # p "not strike. might be spare."
        # if frame is a spare
        if frame.inject { |sum, n| sum+n } == 10
          # only take the score of the next roll
          @frame_sum_array[index] += @frame_score_array[index+1][0]
        end
      end
    end

    # add total
    total = @frame_sum_array.inject { |sum, n| sum+n }
  end

  #--------------------------------
  # whole bowling process.
  # for building purposes bowling process is automated.
  #--------------------------------
  def roll
    # repeat same process for 9 times for first 9 frames
    9.times do |x|
      frame
    end

    # 10th frame
    tenth_frame
    @frame_score_array
  end
end





