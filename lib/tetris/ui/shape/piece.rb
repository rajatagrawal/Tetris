require_relative 'block'
module Tetris
  module UI
    module Shape
      class Piece
        def initialize(canvas, piece)
          @canvas = canvas
          @piece = piece
        end

        def draw
          @piece.blocks.each do |block|
            Block.new(@canvas, block).draw
          end
        end
      end
    end
  end
end
