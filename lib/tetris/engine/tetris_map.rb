module Tetris
  module Engine
    class TetrisMap

      attr_accessor :map, :unit_side
      attr_accessor :height, :width

      def initialize(height, width, unit_side)
        @height = height
        @width = width
        @unit_side = unit_side
        initialize_tetris_map
      end

      private

      def initialize_tetris_map
        @map = Array.new(@width + 1) do |index|
          if index != 0
            Array.new(@height + 1) do |height_index|
              if height_index != 0
                'none'
              end
            end
          end
        end
      end
    end
  end
end
