require 'tetris/engine/constants'

module Tetris
  class Player

    attr_reader :score, :number, :color
    attr_accessor :shape, :next_shape

    @@next_number = 0

    def initialize
      @score = 0
      @shape = nil
      @next_shape = nil
      @number = player_number
      @color = Engine::Constants::SHAPE_COLORS[@number]
    end

    def increase_score(score)
      @score += score
    end

    def self.no_of_players
      @@next_number
    end

    private

    def player_number
      @@next_number += 1
    end
  end
end
