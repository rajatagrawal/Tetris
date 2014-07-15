module Tetris
  class Player
    attr_accessor :shape, :next_shape, :score, :number

    def self.next_number
      @last_number ||= -1
      @last_number += 1
    end

    def initialize
      @score = 0
      @shape = nil
      @next_shape = nil
      @number = self.class.next_number
    end

    def increase_score(score)
      @score += score
    end
  end
end
