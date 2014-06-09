module Tetris
  class Player

    attr_accessor :shape, :next_shape, :score
    def initialize
      @score = 0
      @shape = nil
      @next_shape = nil
      puts 'in the player constructor'
    end

    def increase_score(score)
      @score += score
    end
  end
end
