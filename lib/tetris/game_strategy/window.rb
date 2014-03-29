require_relative '../shape/block.rb'
require_relative '../shape/square.rb'

module Tetris
  module GameStrategy
    module Window
      attr_accessor :window
      attr_accessor :unit_length
      attr_accessor :height, :width
      attr_accessor :shapes, :tetris_map

      def initialize(window, config={})
        @window = window
        @unit_length = config[:unit_length] || 10
        @width = config[:width] || 10
        @height = config[:height] || 10
        @shapes = []
        initialize_tetris_map
      end

      private

      def initialize_tetris_map
        @tetris_map = {}
        (1..height).each do |n|
          @tetris_map[n] = Array.new(width, true)
        end
      end
    end
  end
end
