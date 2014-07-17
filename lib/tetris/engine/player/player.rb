module Tetris
  class Player

    attr_reader :score, :number, :color
    attr_accessor :shape, :next_shape

    @@next_number = -1

    def initialize
      @score = 0
      @shape = nil
      @next_shape = nil
      @number = player_number
      @color = Engine::Constants::ShapeColors[@number]
    end

    def increase_score(score)
      @score += score
    end

    private

    def player_number
      @@next_number += 1
    end
  end
end
